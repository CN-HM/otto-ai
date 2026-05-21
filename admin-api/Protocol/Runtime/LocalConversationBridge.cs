using System.Text.Json;
using Concentus;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using Microsoft.Extensions.DependencyInjection;

namespace AiAdmin.Protocol.Runtime;

public class LocalConversationBridge : IDeviceConversationBridge
{
    private const int HeaderSize = 16;

    private readonly DeviceConnection _device;
    private readonly string _sessionId;
    private readonly DeviceAudioParameters _audioParameters;
    private readonly int _speechIdleTimeoutMs;
    private readonly Func<string, Task> _sendMqttMessageAsync;
    private readonly Action<byte[], uint> _sendUdpAudio;
    private readonly IServiceScopeFactory _serviceScopeFactory;
    private readonly ILogger<LocalConversationBridge> _logger;
    private readonly IOpusDecoder _decoder;
    private readonly Timer _idleTimer;
    private readonly object _playbackLock = new();
    private readonly object _transcriptLock = new();
    private readonly SemaphoreSlim _recognitionMutex = new(1, 1);
    private readonly HashSet<string> _handledTranscripts = new(StringComparer.Ordinal);
    private int _closed;
    private int _bargeInInterrupting;
    private uint _nextPlaybackTimestamp;
    private volatile bool _accepting = true;
    private volatile bool _replyActive;
    private volatile bool _recognitionTriggeredReply;
    private CancellationTokenSource? _playbackCts;
    private CancellationTokenSource? _replyCts;
    private IServiceScope? _recognitionScope;
    private IAsrRecognitionSession? _recognitionSession;
    private Task? _replyTask;

    public LocalConversationBridge(
        DeviceConnection device,
        string sessionId,
        DeviceAudioParameters audioParameters,
        int speechIdleTimeoutMs,
        Func<string, Task> sendMqttMessageAsync,
        Action<byte[], uint> sendUdpAudio,
        IServiceScopeFactory serviceScopeFactory,
        ILogger<LocalConversationBridge> logger)
    {
        _device = device;
        _sessionId = sessionId;
        _audioParameters = audioParameters;
        _speechIdleTimeoutMs = Math.Max(200, speechIdleTimeoutMs);
        _sendMqttMessageAsync = sendMqttMessageAsync;
        _sendUdpAudio = sendUdpAudio;
        _serviceScopeFactory = serviceScopeFactory;
        _logger = logger;
        _decoder = OpusCodecFactory.CreateDecoder(audioParameters.SampleRate, audioParameters.Channels, TextWriter.Null);
        _idleTimer = new Timer(_ => _ = CompleteRecognitionAsync(triggerReplyFromFinal: true, CancellationToken.None), null, Timeout.Infinite, Timeout.Infinite);
    }

    public bool IsAlive => _accepting;

    public event Action? OnClosed;

    public Task SendJsonAsync(string json)
    {
        if (!_accepting || string.IsNullOrWhiteSpace(json))
            return Task.CompletedTask;

        try
        {
            using var document = JsonDocument.Parse(json);
            var root = document.RootElement;
            var type = root.TryGetProperty("type", out var typeElement) ? typeElement.GetString() : null;
            if (!string.Equals(type, "listen", StringComparison.OrdinalIgnoreCase))
                return Task.CompletedTask;

            var action = ReadString(root, "state")
                ?? ReadString(root, "status")
                ?? ReadString(root, "action")
                ?? ReadString(root, "event");
            if (IsAbortAction(action))
            {
                _ = InterruptConversationAsync(CancellationToken.None);
                return Task.CompletedTask;
            }

            if (IsStopAction(action))
                return CompleteRecognitionAsync(triggerReplyFromFinal: true, CancellationToken.None);

            if (_replyActive)
                _ = EnsureBargeInInterruptedAsync(CancellationToken.None);
        }
        catch
        {
        }

        return Task.CompletedTask;
    }

    public Task SendBinaryAsync(byte[] data)
    {
        if (!_accepting || data.Length <= HeaderSize)
            return Task.CompletedTask;

        return HandleIncomingAudioAsync(data);
    }

    public async ValueTask DisposeAsync()
    {
        if (!_accepting)
            return;

        _accepting = false;
        _idleTimer.Change(Timeout.Infinite, Timeout.Infinite);
        await InterruptConversationAsync(CancellationToken.None);
        _idleTimer.Dispose();
        _recognitionMutex.Dispose();
        if (Interlocked.Exchange(ref _closed, 1) == 0)
            OnClosed?.Invoke();
    }

    private async Task HandleIncomingAudioAsync(byte[] data)
    {
        try
        {
            if (_replyActive)
                await EnsureBargeInInterruptedAsync(CancellationToken.None);

            var pcmBytes = DecodeIncomingPcm(data);
            if (pcmBytes.Length == 0)
                return;

            await EnsureRecognitionSessionAsync(CancellationToken.None);
            var session = _recognitionSession;
            if (session == null)
                return;

            await session.SendAudioAsync(pcmBytes, CancellationToken.None);
            _idleTimer.Change(_speechIdleTimeoutMs, Timeout.Infinite);
        }
        catch (OperationCanceledException)
        {
        }
        catch (Exception ex)
        {
            _logger.LogDebug(ex, "Failed to process streaming device audio for {Mac}", _device.MacAddress);
        }
    }

    private async Task EnsureRecognitionSessionAsync(CancellationToken cancellationToken)
    {
        if (_recognitionSession != null)
            return;

        await _recognitionMutex.WaitAsync(cancellationToken);
        try
        {
            if (_recognitionSession != null)
                return;

            _recognitionScope = _serviceScopeFactory.CreateScope();
            var runtimeService = _recognitionScope.ServiceProvider.GetRequiredService<DeviceConversationRuntimeService>();
            _recognitionSession = await runtimeService.CreateRecognitionSessionAsync(new DeviceConversationTranscriptRequest
            {
                CredentialId = _device.CredentialId,
                MacAddress = _device.MacAddress,
                SessionId = _sessionId
            },
            HandleAsrEventAsync,
            cancellationToken);
            ClearHandledTranscripts();
            _recognitionTriggeredReply = false;
        }
        finally
        {
            _recognitionMutex.Release();
        }
    }

    private async Task CompleteRecognitionAsync(bool triggerReplyFromFinal, CancellationToken cancellationToken)
    {
        _idleTimer.Change(Timeout.Infinite, Timeout.Infinite);

        IAsrRecognitionSession? session;
        IServiceScope? scope;
        var recognitionTriggeredReply = _recognitionTriggeredReply;
        await _recognitionMutex.WaitAsync(cancellationToken);
        try
        {
            session = _recognitionSession;
            scope = _recognitionScope;
            _recognitionSession = null;
            _recognitionScope = null;
            _recognitionTriggeredReply = false;
        }
        finally
        {
            _recognitionMutex.Release();
        }

        if (session == null)
            return;

        try
        {
            var response = await session.CompleteAsync(cancellationToken);
            if (triggerReplyFromFinal && !recognitionTriggeredReply)
                await TriggerReplyFromTranscriptAsync(response.Transcript, cancellationToken);
        }
        finally
        {
            await session.DisposeAsync();
            scope?.Dispose();
        }
    }

    private async Task ResetRecognitionSessionAsync(CancellationToken cancellationToken)
    {
        IAsrRecognitionSession? session;
        IServiceScope? scope;
        await _recognitionMutex.WaitAsync(cancellationToken);
        try
        {
            session = _recognitionSession;
            scope = _recognitionScope;
            _recognitionSession = null;
            _recognitionScope = null;
        }
        finally
        {
            _recognitionMutex.Release();
        }

        if (session != null)
        {
            try
            {
                await session.CancelAsync(cancellationToken);
            }
            catch
            {
            }
            await session.DisposeAsync();
        }

        scope?.Dispose();
    }

    private async Task HandleAsrEventAsync(AsrRecognitionStreamEventDto asrEvent, CancellationToken cancellationToken)
    {
        if (!_accepting)
            return;

        if (string.Equals(asrEvent.EventType, "utterance_definite", StringComparison.OrdinalIgnoreCase))
        {
            _recognitionTriggeredReply = true;
            await TriggerReplyFromTranscriptAsync(asrEvent.UtteranceText, cancellationToken);
        }
    }

    private async Task EnsureBargeInInterruptedAsync(CancellationToken cancellationToken)
    {
        if (!_replyActive)
            return;
        if (Interlocked.CompareExchange(ref _bargeInInterrupting, 1, 0) != 0)
            return;

        try
        {
            await InterruptReplyForBargeInAsync(cancellationToken);
        }
        finally
        {
            Interlocked.Exchange(ref _bargeInInterrupting, 0);
        }
    }

    private async Task TriggerReplyFromTranscriptAsync(string? transcript, CancellationToken cancellationToken)
    {
        var normalizedTranscript = transcript?.Trim();
        if (string.IsNullOrWhiteSpace(normalizedTranscript))
            return;
        if (!TryAddHandledTranscript(normalizedTranscript))
            return;

        await InterruptReplyAsync(CancellationToken.None);

        var replyCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        lock (_playbackLock)
        {
            _replyCts?.Cancel();
            _replyCts = replyCts;
        }

        _replyActive = true;
        var replyTask = RunReplyAsync(normalizedTranscript, replyCts);
        _replyTask = replyTask;
    }

    private async Task RunReplyAsync(string transcript, CancellationTokenSource replyCts)
    {
        try
        {
            using var scope = _serviceScopeFactory.CreateScope();
            var runtimeService = scope.ServiceProvider.GetRequiredService<DeviceConversationRuntimeService>();
            var playbackCts = CreatePlaybackTokenSource(replyCts.Token);
            var startedPlayback = false;
            try
            {
                await runtimeService.ExecuteTranscriptStreamingAsync(new DeviceConversationTranscriptRequest
                {
                    CredentialId = _device.CredentialId,
                    MacAddress = _device.MacAddress,
                    SessionId = _sessionId,
                    Transcript = transcript
                },
                async (segment, ct) =>
                {
                    if (!startedPlayback)
                    {
                        startedPlayback = true;
                        await PublishAssistantStartAsync();
                    }

                    if (!string.IsNullOrWhiteSpace(segment.Text))
                        await PublishAssistantSentenceAsync(segment.Text);
                    await SendTtsAudioAsync(segment.TtsPcm16Le, segment.SampleRate, segment.Channels, ct);
                },
                replyCts.Token);

                if (startedPlayback)
                {
                    await _sendMqttMessageAsync(JsonSerializer.Serialize(new
                    {
                        type = "tts",
                        session_id = _sessionId,
                        state = "stop"
                    }));
                }
            }
            finally
            {
                CompletePlayback(playbackCts);
            }
        }
        catch (OperationCanceledException)
        {
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Local streaming reply pipeline failed for {Mac}", _device.MacAddress);
            try
            {
                await _sendMqttMessageAsync(JsonSerializer.Serialize(new
                {
                    type = "error",
                    session_id = _sessionId,
                    message = "Local conversation pipeline failed"
                }));
            }
            catch
            {
            }
        }
        finally
        {
            lock (_playbackLock)
            {
                if (ReferenceEquals(_replyCts, replyCts))
                    _replyCts = null;
            }

            if (_replyTask != null && _replyTask.IsCompleted)
                _replyTask = null;

            _replyActive = false;
            replyCts.Dispose();
        }
    }

    private Task PublishAssistantStartAsync()
    {
        return Task.WhenAll(
            _sendMqttMessageAsync(JsonSerializer.Serialize(new
            {
                type = "llm",
                session_id = _sessionId,
                emotion = "neutral"
            })),
            _sendMqttMessageAsync(JsonSerializer.Serialize(new
            {
                type = "tts",
                session_id = _sessionId,
                state = "start"
            })));
    }

    private Task PublishAssistantSentenceAsync(string replyText)
    {
        return _sendMqttMessageAsync(JsonSerializer.Serialize(new
        {
            type = "tts",
            session_id = _sessionId,
            state = "sentence",
            text = replyText
        }));
    }

    private async Task InterruptReplyForBargeInAsync(CancellationToken cancellationToken)
    {
        await InterruptReplyAsync(cancellationToken);
        await ResetRecognitionSessionAsync(cancellationToken);
        ClearHandledTranscripts();
    }

    private async Task InterruptReplyAsync(CancellationToken cancellationToken)
    {
        CancelPlayback();
        CancellationTokenSource? replyCts;
        lock (_playbackLock)
        {
            replyCts = _replyCts;
        }

        if (replyCts != null)
        {
            try
            {
                replyCts.Cancel();
            }
            catch
            {
            }
        }

        if (_replyTask != null)
        {
            try
            {
                await _replyTask.WaitAsync(cancellationToken);
            }
            catch
            {
            }
        }
    }

    private async Task InterruptConversationAsync(CancellationToken cancellationToken)
    {
        _idleTimer.Change(Timeout.Infinite, Timeout.Infinite);
        await InterruptReplyAsync(cancellationToken);
        await ResetRecognitionSessionAsync(cancellationToken);
        ClearHandledTranscripts();
    }

    private async Task SendTtsAudioAsync(byte[] pcm16Le, int sampleRate, int channels, CancellationToken cancellationToken)
    {
        var frames = DeviceAudioCodec.EncodePcm16LeToOpusFrames(pcm16Le,
            sampleRate,
            channels,
            _audioParameters.FrameDurationMs);
        if (frames.Count == 0)
            return;

        var baseTimestamp = GetPlaybackBaseTimestamp();
        var sentFrames = 0;
        try
        {
            for (var index = 0; index < frames.Count; index++)
            {
                cancellationToken.ThrowIfCancellationRequested();
                var (opusFrame, timestamp) = frames[index];
                _sendUdpAudio(opusFrame, baseTimestamp + timestamp);
                sentFrames++;

                if (index < frames.Count - 1)
                    await Task.Delay(_audioParameters.FrameDurationMs, cancellationToken);
            }
        }
        finally
        {
            AdvancePlaybackTimestamp(baseTimestamp, sentFrames);
        }
    }

    private byte[] DecodeIncomingPcm(byte[] data)
    {
        var opusFrame = new byte[data.Length - HeaderSize];
        Buffer.BlockCopy(data, HeaderSize, opusFrame, 0, opusFrame.Length);
        var frameBuffer = new short[_audioParameters.SamplesPerFrame * _audioParameters.Channels * 2];
        var decodedSamples = _decoder.Decode(opusFrame, frameBuffer, _audioParameters.SamplesPerFrame);
        if (decodedSamples <= 0)
            return [];

        var pcmBytes = new byte[decodedSamples * _audioParameters.Channels * sizeof(short)];
        Buffer.BlockCopy(frameBuffer, 0, pcmBytes, 0, pcmBytes.Length);
        return pcmBytes;
    }

    private bool TryAddHandledTranscript(string transcript)
    {
        lock (_transcriptLock)
        {
            return _handledTranscripts.Add(transcript);
        }
    }

    private void ClearHandledTranscripts()
    {
        lock (_transcriptLock)
        {
            _handledTranscripts.Clear();
        }
    }

    private CancellationTokenSource CreatePlaybackTokenSource(CancellationToken cancellationToken)
    {
        lock (_playbackLock)
        {
            _playbackCts?.Cancel();
            _playbackCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
            return _playbackCts;
        }
    }

    private void CompletePlayback(CancellationTokenSource playbackCts)
    {
        lock (_playbackLock)
        {
            if (ReferenceEquals(_playbackCts, playbackCts))
                _playbackCts = null;
        }

        playbackCts.Dispose();
    }

    private void CancelPlayback()
    {
        CancellationTokenSource? playbackCts;
        lock (_playbackLock)
        {
            playbackCts = _playbackCts;
        }

        if (playbackCts == null)
            return;

        try
        {
            playbackCts.Cancel();
        }
        catch
        {
        }

        _ = _sendMqttMessageAsync(JsonSerializer.Serialize(new
        {
            type = "tts",
            session_id = _sessionId,
            state = "stop"
        }));
    }

    private uint GetPlaybackBaseTimestamp()
    {
        lock (_playbackLock)
        {
            return _nextPlaybackTimestamp;
        }
    }

    private void AdvancePlaybackTimestamp(uint baseTimestamp, int sentFrames)
    {
        if (sentFrames <= 0)
            return;

        lock (_playbackLock)
        {
            var advancedTimestamp = baseTimestamp + ((uint)sentFrames * (uint)_audioParameters.FrameDurationMs);
            if (advancedTimestamp > _nextPlaybackTimestamp)
                _nextPlaybackTimestamp = advancedTimestamp;
        }
    }

    private static bool IsAbortAction(string? action)
    {
        if (string.IsNullOrWhiteSpace(action))
            return false;
        return action.Contains("abort", StringComparison.OrdinalIgnoreCase)
               || action.Contains("cancel", StringComparison.OrdinalIgnoreCase)
               || action.Contains("interrupt", StringComparison.OrdinalIgnoreCase);
    }

    private static bool IsStopAction(string? action)
    {
        if (string.IsNullOrWhiteSpace(action))
            return false;
        return action.Contains("stop", StringComparison.OrdinalIgnoreCase)
               || action.Contains("end", StringComparison.OrdinalIgnoreCase)
               || action.Contains("finish", StringComparison.OrdinalIgnoreCase)
               || action.Contains("complete", StringComparison.OrdinalIgnoreCase);
    }

    private static string? ReadString(JsonElement element, string propertyName)
    {
        if (!element.TryGetProperty(propertyName, out var value) || value.ValueKind != JsonValueKind.String)
            return null;
        var text = value.GetString()?.Trim();
        return string.IsNullOrWhiteSpace(text) ? null : text;
    }
}
