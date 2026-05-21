using System.Net.WebSockets;
using System.Text;
using System.Text.Json.Nodes;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

[ExposeServices(typeof(IExecutableTtsProviderAdapter), typeof(IReusableExecutableTtsProviderAdapter), typeof(IBidirectionalStreamingExecutableTtsProviderAdapter), typeof(DoubaoTtsProviderAdapter))]
public class DoubaoTtsProviderAdapter : ProviderAdapterBase, IReusableExecutableTtsProviderAdapter, IBidirectionalStreamingExecutableTtsProviderAdapter, ITransientDependency
{
    private const int DefaultTimeoutMs = 60000;

    public string AdapterCode => "tts_doubao_ws_v3";
    public string AdapterName => "Doubao TTS WebSocket V3 Adapter";
    public int Order => 5;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.DoubaoSpeech),
            MatchByProviderFamily(profile.ProviderFamily, "doubao_speech_ws"),
            MatchByProviderCode(profile.ProviderCode, "doubao"));
    }

    public async Task<TtsSynthesisResponseDto> SynthesizeAsync(StageExecutionContext context, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default)
    {
        await using var session = await CreateSessionAsync(context, cancellationToken);
        return await session.SynthesizeAsync(request, cancellationToken);
    }

    public Task<ITtsSynthesisSession> CreateSessionAsync(StageExecutionContext context, CancellationToken cancellationToken = default)
    {
        ITtsSynthesisSession session = new DoubaoTtsSynthesisSession(context);
        return Task.FromResult(session);
    }

    public async Task<ITtsStreamingSession> CreateStreamingSessionAsync(
        StageExecutionContext context,
        TtsSynthesisRequestDto request,
        Func<TtsSynthesisStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default)
    {
        var session = new DoubaoBidirectionalTtsStreamingSession(context, request, onEvent);
        await session.InitializeAsync(cancellationToken);
        return session;
    }

    private static Dictionary<string, string> BuildHeaders(DoubaoTtsExecutionOptions options)
    {
        var headers = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        var connectId = Guid.NewGuid().ToString("D");

        if (!string.IsNullOrWhiteSpace(options.ApiKey))
        {
            headers["X-Api-Key"] = options.ApiKey;
        }
        else if (!string.IsNullOrWhiteSpace(options.AppId) && !string.IsNullOrWhiteSpace(options.AccessToken))
        {
            headers["X-Api-App-Id"] = options.AppId;
            headers["X-Api-Access-Key"] = options.AccessToken;
        }
        else
        {
            throw new InvalidOperationException("豆包 TTS 模型配置缺少语音服务鉴权信息（appid + access_token 或 api_key）");
        }

        headers["X-Api-Resource-Id"] = options.ResourceId;
        headers["X-Api-Connect-Id"] = connectId;
        var usageReturn = options.UsageReturn;
        if (!string.IsNullOrWhiteSpace(usageReturn))
            headers["X-Control-Require-Usage-Tokens-Return"] = usageReturn;

        return headers;
    }

    private static JsonObject BuildStartSessionPayload(DoubaoTtsExecutionOptions options)
    {
        var format = NormalizeResponseFormat(options.Encoding);
        var audioParams = new JsonObject
        {
            ["format"] = format,
            ["sample_rate"] = options.SampleRate
        };

        var bitRate = options.BitRate;
        if (bitRate.HasValue)
            audioParams["bit_rate"] = bitRate.Value;

        var speechRate = options.SpeechRate;
        if (speechRate.HasValue)
            audioParams["speech_rate"] = speechRate.Value;

        var loudnessRate = options.LoudnessRate;
        if (loudnessRate.HasValue)
            audioParams["loudness_rate"] = loudnessRate.Value;

        foreach (var pair in options.AudioOptionFields)
            audioParams[pair.Key] = pair.Value?.DeepClone();

        var reqParams = new JsonObject
        {
            ["speaker"] = options.VoiceType,
            ["audio_params"] = audioParams
        };

        foreach (var pair in options.ReqParamFields)
            reqParams[pair.Key] = pair.Value?.DeepClone();

        if (options.Additions.Count > 0)
            reqParams["additions"] = options.Additions.DeepClone();

        return new JsonObject
        {
            ["user"] = new JsonObject
            {
                ["uid"] = Guid.NewGuid().ToString("N")
            },
            ["event"] = DoubaoTtsWebSocketProtocol.EventStartSession,
            ["namespace"] = "BidirectionalTTS",
            ["req_params"] = reqParams
        };
    }

    private static JsonObject BuildTaskPayload(string text)
    {
        return new JsonObject
        {
            ["event"] = DoubaoTtsWebSocketProtocol.EventTaskRequest,
            ["req_params"] = new JsonObject
            {
                ["text"] = text
            }
        };
    }

    private static async Task ExpectTtsEventAsync(ClientWebSocket socket, JsonArray rawFrames, CancellationToken cancellationToken, params int[] expectedEvents)
    {
        while (true)
        {
            var received = await ReceiveBinaryMessageAsync(socket, cancellationToken);
            if (received.IsClosed)
                throw new InvalidOperationException("豆包 TTS WebSocket 连接被远端提前关闭");

            var frame = DoubaoTtsWebSocketProtocol.ParseFrame(received.Payload);
            rawFrames.Add(ToFrameDebugJson(frame));
            if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
                throw BuildTtsError(frame);
            if (frame.EventCode.HasValue && expectedEvents.Contains(frame.EventCode.Value))
            {
                if (DoubaoTtsWebSocketProtocol.IsFailureEvent(frame.EventCode.Value))
                    throw BuildTtsError(frame);
                return;
            }
        }
    }

    private static async Task SendBinaryAsync(ClientWebSocket socket, byte[] payload, CancellationToken cancellationToken)
    {
        await socket.SendAsync(new ArraySegment<byte>(payload), WebSocketMessageType.Binary, true, cancellationToken);
    }

    private static async Task<(byte[] Payload, bool IsClosed)> ReceiveBinaryMessageAsync(ClientWebSocket socket, CancellationToken cancellationToken)
    {
        var buffer = new byte[8192];
        using var stream = new MemoryStream();

        while (true)
        {
            var result = await socket.ReceiveAsync(new ArraySegment<byte>(buffer), cancellationToken);
            if (result.MessageType == WebSocketMessageType.Close)
                return ([], true);

            if (result.Count > 0)
                stream.Write(buffer, 0, result.Count);

            if (!result.EndOfMessage)
                continue;

            if (result.MessageType == WebSocketMessageType.Text)
            {
                var text = Encoding.UTF8.GetString(stream.ToArray());
                throw new InvalidOperationException($"豆包 TTS 返回文本帧错误：{text}");
            }

            return (stream.ToArray(), false);
        }
    }

    private static InvalidOperationException BuildTtsError(DoubaoSpeechWebSocketFrame frame)
    {
        var payload = DoubaoSpeechWebSocketPayloadReader.TryParsePayloadAsJson(frame);
        var message = ExecutionJsonHelper.GetString(payload, "message", "response_meta.message", "msg")
            ?? DoubaoSpeechWebSocketPayloadReader.TryGetPayloadText(frame)
            ?? "unknown";
        var code = frame.ErrorCode
            ?? ExecutionJsonHelper.GetInt(payload, "status_code", "code")
            ?? 0;
        var hint = IsResourceSpeakerMismatch(message)
            ? "。该错误通常表示 TTS Profile 的 resource_id 与所选音色 speaker/音色编码不属于同一个火山/豆包语音资源，请重新选择同一 TTS Profile 下的音色，或修正 TTS Profile 的 resource_id。"
            : string.Empty;
        return new InvalidOperationException($"豆包 TTS 调用失败：{code} - {message}{hint}");
    }

    private static bool IsResourceSpeakerMismatch(string message)
    {
        return message.Contains("resource ID is mismatched with speaker related resource", StringComparison.OrdinalIgnoreCase)
            || (message.Contains("resource", StringComparison.OrdinalIgnoreCase)
                && message.Contains("speaker", StringComparison.OrdinalIgnoreCase)
                && message.Contains("mismatch", StringComparison.OrdinalIgnoreCase));
    }

    private static JsonObject ToFrameDebugJson(DoubaoSpeechWebSocketFrame frame)
    {
        var result = new JsonObject
        {
            ["messageType"] = frame.MessageType,
            ["messageTypeSpecificFlags"] = frame.MessageTypeSpecificFlags,
            ["eventCode"] = frame.EventCode,
            ["serializationMethod"] = frame.SerializationMethod,
            ["compressionMethod"] = frame.CompressionMethod
        };

        if (!string.IsNullOrWhiteSpace(frame.ConnectionId))
            result["connectionId"] = frame.ConnectionId;
        if (!string.IsNullOrWhiteSpace(frame.SessionId))
            result["sessionId"] = frame.SessionId;

        if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeAudioOnlyResponse)
        {
            result["audioBytes"] = frame.PayloadBytes.Length;
            return result;
        }

        if (DoubaoSpeechWebSocketPayloadReader.TryParsePayloadAsJson(frame) is { } payload)
            result["payload"] = payload;
        else if (frame.PayloadBytes.Length > 0)
            result["payloadText"] = DoubaoSpeechWebSocketPayloadReader.TryGetPayloadText(frame);

        return result;
    }

    private static int ResolveTimeoutMs(ModelInvocationProfileDto profile)
    {
        if (profile.StreamIdleTimeoutMs is > 0)
            return profile.StreamIdleTimeoutMs.Value;
        if (profile.FirstPacketTimeoutMs is > 0)
            return profile.FirstPacketTimeoutMs.Value;
        return DefaultTimeoutMs;
    }

    private static string NormalizeResponseFormat(string format)
    {
        return format.Trim().ToLowerInvariant() switch
        {
            "ogg_opus" => "ogg_opus",
            "pcm" => "pcm",
            "wav" => "wav",
            _ => "mp3"
        };
    }

    private static string GuessContentType(string format)
    {
        return format switch
        {
            "mp3" => "audio/mpeg",
            "ogg_opus" => "audio/ogg",
            "pcm" => "application/octet-stream",
            _ => "audio/wav"
        };
    }

    private sealed class DoubaoBidirectionalTtsStreamingSession : ITtsStreamingSession
    {
        private readonly StageExecutionContext _context;
        private readonly TtsSynthesisRequestDto _request;
        private readonly Func<TtsSynthesisStreamEventDto, CancellationToken, Task> _onEvent;
        private readonly SemaphoreSlim _mutex = new(1, 1);
        private readonly CancellationTokenSource _lifetimeCts = new();
        private readonly TaskCompletionSource<TtsSynthesisResponseDto> _completionSource = new(TaskCreationOptions.RunContinuationsAsynchronously);
        private readonly JsonArray _rawFrames = new();
        private ClientWebSocket? _socket;
        private string? _sessionId;
        private int _timeoutMs;
        private string? _contentType;
        private string _format = "pcm";
        private string? _currentSentenceText;
        private bool _emitSentenceTextOnNextAudioChunk;
        private bool _connectionStarted;
        private bool _sessionStarted;
        private bool _disposed;

        public DoubaoBidirectionalTtsStreamingSession(
            StageExecutionContext context,
            TtsSynthesisRequestDto request,
            Func<TtsSynthesisStreamEventDto, CancellationToken, Task> onEvent)
        {
            _context = context;
            _request = request;
            _onEvent = onEvent;
        }

        public async Task InitializeAsync(CancellationToken cancellationToken)
        {
            await _mutex.WaitAsync(cancellationToken);
            try
            {
                ThrowIfDisposed();
                var options = ResolveOptions();
                _timeoutMs = ResolveTimeoutMs(_context.InvocationProfile);
                _format = NormalizeResponseFormat(options.Encoding);
                _contentType = GuessContentType(_format);
                _socket = new ClientWebSocket();
                foreach (var header in BuildHeaders(options))
                    _socket.Options.SetRequestHeader(header.Key, header.Value);

                using var timeoutCts = CreateTimeoutToken(cancellationToken);
                await _socket.ConnectAsync(new Uri(options.WsUrl), timeoutCts.Token);
                await SendBinaryAsync(_socket,
                    DoubaoTtsWebSocketProtocol.BuildConnectionFrame(
                        DoubaoTtsWebSocketProtocol.EventStartConnection,
                        new JsonObject()),
                    timeoutCts.Token);
                await ExpectTtsEventAsync(_socket,
                    _rawFrames,
                    timeoutCts.Token,
                    DoubaoTtsWebSocketProtocol.EventConnectionStarted,
                    DoubaoTtsWebSocketProtocol.EventConnectionFailed);
                _connectionStarted = true;

                _sessionId = Guid.NewGuid().ToString("N")[..12];
                await SendBinaryAsync(_socket,
                    DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                        DoubaoTtsWebSocketProtocol.EventStartSession,
                        _sessionId,
                        BuildStartSessionPayload(options)),
                    timeoutCts.Token);
                await ExpectTtsEventAsync(_socket,
                    _rawFrames,
                    timeoutCts.Token,
                    DoubaoTtsWebSocketProtocol.EventSessionStarted,
                    DoubaoTtsWebSocketProtocol.EventSessionFailed);
                _sessionStarted = true;
                _ = Task.Run(() => ReceiveLoopAsync(_socket, _lifetimeCts.Token));
            }
            finally
            {
                _mutex.Release();
            }
        }

        public async Task SendTextAsync(string text, CancellationToken cancellationToken = default)
        {
            if (string.IsNullOrWhiteSpace(text))
                return;

            await _mutex.WaitAsync(cancellationToken);
            try
            {
                ThrowIfDisposed();
                EnsureSessionStarted();
                using var timeoutCts = CreateTimeoutToken(cancellationToken);
                await SendBinaryAsync(_socket!,
                    DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                        DoubaoTtsWebSocketProtocol.EventTaskRequest,
                        _sessionId!,
                        BuildTaskPayload(text)),
                    timeoutCts.Token);
            }
            finally
            {
                _mutex.Release();
            }
        }

        public async Task<TtsSynthesisResponseDto> CompleteAsync(CancellationToken cancellationToken = default)
        {
            await _mutex.WaitAsync(cancellationToken);
            try
            {
                ThrowIfDisposed();
                EnsureSessionStarted();
                using var timeoutCts = CreateTimeoutToken(cancellationToken);
                await SendBinaryAsync(_socket!,
                    DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                        DoubaoTtsWebSocketProtocol.EventFinishSession,
                        _sessionId!,
                        new JsonObject()),
                    timeoutCts.Token);
            }
            finally
            {
                _mutex.Release();
            }

            return await _completionSource.Task.WaitAsync(cancellationToken);
        }

        public async Task CancelAsync(CancellationToken cancellationToken = default)
        {
            await _mutex.WaitAsync(cancellationToken);
            try
            {
                if (_socket == null || !_sessionStarted)
                    return;

                using var timeoutCts = CreateTimeoutToken(cancellationToken);
                await SendBinaryAsync(_socket,
                    DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                        DoubaoTtsWebSocketProtocol.EventCancelSession,
                        _sessionId!,
                        new JsonObject()),
                    timeoutCts.Token);
            }
            finally
            {
                _mutex.Release();
            }

            _lifetimeCts.Cancel();
            _completionSource.TrySetCanceled(cancellationToken);
        }

        public async ValueTask DisposeAsync()
        {
            if (_disposed)
                return;

            _disposed = true;
            _lifetimeCts.Cancel();
            await _mutex.WaitAsync();
            try
            {
                if (_socket is not { } socket)
                    return;

                if (socket.State == WebSocketState.Open && _connectionStarted)
                {
                    try
                    {
                        using var timeoutCts = new CancellationTokenSource(_timeoutMs <= 0 ? DefaultTimeoutMs : _timeoutMs);
                        await SendBinaryAsync(socket,
                            DoubaoTtsWebSocketProtocol.BuildConnectionFrame(
                                DoubaoTtsWebSocketProtocol.EventFinishConnection,
                                new JsonObject()),
                            timeoutCts.Token);
                    }
                    catch
                    {
                    }

                    try
                    {
                        await socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "done", CancellationToken.None);
                    }
                    catch
                    {
                    }
                }

                socket.Dispose();
                _socket = null;
            }
            finally
            {
                _mutex.Release();
                _mutex.Dispose();
                _lifetimeCts.Dispose();
            }
        }

        private async Task ReceiveLoopAsync(ClientWebSocket socket, CancellationToken cancellationToken)
        {
            try
            {
                while (!cancellationToken.IsCancellationRequested)
                {
                    var received = await ReceiveBinaryMessageAsync(socket, cancellationToken);
                    if (received.IsClosed)
                        break;

                    var frame = DoubaoTtsWebSocketProtocol.ParseFrame(received.Payload);
                    _rawFrames.Add(ToFrameDebugJson(frame));

                    if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
                    {
                        _completionSource.TrySetException(BuildTtsError(frame));
                        break;
                    }

                    if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeAudioOnlyResponse
                        && frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsResponse)
                    {
                        var text = _emitSentenceTextOnNextAudioChunk ? _currentSentenceText : null;
                        _emitSentenceTextOnNextAudioChunk = false;
                        await _onEvent(new TtsSynthesisStreamEventDto
                        {
                            EventType = "audio_chunk",
                            Text = text,
                            AudioBytes = frame.PayloadBytes,
                            Format = _format,
                            ContentType = _contentType,
                            RawEventJson = ToFrameDebugJson(frame).ToJsonString()
                        }, cancellationToken);
                        continue;
                    }

                    if (frame.MessageType != DoubaoSpeechWebSocketFrameCodec.MessageTypeFullServerResponse)
                        continue;

                    if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsSentenceStart
                        || frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsSentenceEnd)
                    {
                        var payload = DoubaoSpeechWebSocketPayloadReader.TryParsePayloadAsJson(frame);
                        var sentenceText = ExecutionJsonHelper.GetString(payload, "res_params.text", "text");
                        if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsSentenceStart)
                        {
                            _currentSentenceText = sentenceText;
                            _emitSentenceTextOnNextAudioChunk = !string.IsNullOrWhiteSpace(sentenceText);
                        }
                        else
                        {
                            _currentSentenceText = sentenceText ?? _currentSentenceText;
                        }

                        await _onEvent(new TtsSynthesisStreamEventDto
                        {
                            EventType = frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsSentenceStart ? "sentence_start" : "sentence_end",
                            Text = _currentSentenceText,
                            Format = _format,
                            ContentType = _contentType,
                            RawEventJson = payload?.ToJsonString() ?? ToFrameDebugJson(frame).ToJsonString(),
                            IsFinal = frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsSentenceEnd
                        }, cancellationToken);

                        if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsSentenceEnd)
                        {
                            _currentSentenceText = null;
                            _emitSentenceTextOnNextAudioChunk = false;
                        }
                        continue;
                    }

                    if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventSessionCanceled)
                    {
                        _completionSource.TrySetCanceled(cancellationToken);
                        break;
                    }

                    if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventSessionFinished)
                    {
                        _completionSource.TrySetResult(new TtsSynthesisResponseDto
                        {
                            InvocationMode = "streaming",
                            Format = _format,
                            ContentType = _contentType,
                            AudioSize = 0,
                            RawResponseJson = _rawFrames.ToJsonString()
                        });
                        break;
                    }

                    if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventSessionFailed)
                    {
                        _completionSource.TrySetException(BuildTtsError(frame));
                        break;
                    }
                }

                if (!_completionSource.Task.IsCompleted)
                {
                    _completionSource.TrySetResult(new TtsSynthesisResponseDto
                    {
                        InvocationMode = "streaming",
                        Format = _format,
                        ContentType = _contentType,
                        AudioSize = 0,
                        RawResponseJson = _rawFrames.ToJsonString()
                    });
                }
            }
            catch (OperationCanceledException ex)
            {
                _completionSource.TrySetCanceled(ex.CancellationToken);
            }
            catch (Exception ex)
            {
                _completionSource.TrySetException(ex);
            }
        }

        private DoubaoTtsExecutionOptions ResolveOptions()
        {
            return DoubaoSpeechExecutionOptionsBinder.BindTts(
                _context.ModelConfig.ConfigObject,
                _request.Voice,
                _request.ResponseFormat ?? "pcm",
                _request.Speed,
                _request.ExtraOptions);
        }

        private CancellationTokenSource CreateTimeoutToken(CancellationToken cancellationToken)
        {
            var timeoutCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken, _lifetimeCts.Token);
            timeoutCts.CancelAfter(_timeoutMs <= 0 ? DefaultTimeoutMs : _timeoutMs);
            return timeoutCts;
        }

        private void EnsureSessionStarted()
        {
            if (!_sessionStarted || _socket == null || string.IsNullOrWhiteSpace(_sessionId))
                throw new InvalidOperationException("豆包 TTS 双向流式会话尚未初始化");
        }

        private void ThrowIfDisposed()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(DoubaoBidirectionalTtsStreamingSession));
        }
    }

    private sealed class DoubaoTtsSynthesisSession : ITtsSynthesisSession
    {
        private readonly StageExecutionContext _context;
        private readonly int _timeoutMs;
        private readonly SemaphoreSlim _mutex = new(1, 1);
        private ClientWebSocket? _socket;
        private bool _connectionStarted;
        private bool _disposed;

        public DoubaoTtsSynthesisSession(StageExecutionContext context)
        {
            _context = context;
            _timeoutMs = ResolveTimeoutMs(context.InvocationProfile);
        }

        public async Task<TtsSynthesisResponseDto> SynthesizeAsync(TtsSynthesisRequestDto request, CancellationToken cancellationToken = default)
        {
            if (string.IsNullOrWhiteSpace(request.Text))
                throw new InvalidOperationException("Error:TtsTextMissing");

            await _mutex.WaitAsync(cancellationToken);
            try
            {
                ThrowIfDisposed();

                var options = DoubaoSpeechExecutionOptionsBinder.BindTts(
                    _context.ModelConfig.ConfigObject,
                    request.Voice,
                    request.ResponseFormat,
                    request.Speed,
                    request.ExtraOptions);
                using var timeoutCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
                timeoutCts.CancelAfter(_timeoutMs);

                await EnsureConnectedAsync(options, timeoutCts.Token);
                return await RunSynthesisAsync(options, request.Text, timeoutCts.Token);
            }
            finally
            {
                _mutex.Release();
            }
        }

        public async ValueTask DisposeAsync()
        {
            if (_disposed)
                return;

            _disposed = true;
            await _mutex.WaitAsync();
            try
            {
                if (_socket == null)
                    return;

                if (_socket.State == WebSocketState.Open && _connectionStarted)
                {
                    try
                    {
                        using var timeoutCts = new CancellationTokenSource(_timeoutMs);
                        await SendBinaryAsync(_socket,
                            DoubaoTtsWebSocketProtocol.BuildConnectionFrame(
                                DoubaoTtsWebSocketProtocol.EventFinishConnection,
                                new JsonObject()),
                            timeoutCts.Token);
                    }
                    catch
                    {
                    }

                    try
                    {
                        await _socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "done", CancellationToken.None);
                    }
                    catch
                    {
                    }
                }

                _socket.Dispose();
                _socket = null;
            }
            finally
            {
                _mutex.Release();
                _mutex.Dispose();
            }
        }

        private async Task EnsureConnectedAsync(DoubaoTtsExecutionOptions options, CancellationToken cancellationToken)
        {
            _socket?.Dispose();
            _socket = new ClientWebSocket();
            foreach (var header in BuildHeaders(options))
                _socket.Options.SetRequestHeader(header.Key, header.Value);

            await _socket.ConnectAsync(new Uri(options.WsUrl), cancellationToken);
            var rawFrames = new JsonArray();
            await SendBinaryAsync(_socket,
                DoubaoTtsWebSocketProtocol.BuildConnectionFrame(
                    DoubaoTtsWebSocketProtocol.EventStartConnection,
                    new JsonObject()),
                cancellationToken);
            await ExpectTtsEventAsync(_socket, rawFrames, cancellationToken,
                DoubaoTtsWebSocketProtocol.EventConnectionStarted,
                DoubaoTtsWebSocketProtocol.EventConnectionFailed);
            _connectionStarted = true;
        }

        private async Task<TtsSynthesisResponseDto> RunSynthesisAsync(DoubaoTtsExecutionOptions options, string text, CancellationToken cancellationToken)
        {
            var sessionId = Guid.NewGuid().ToString("N")[..12];
            var rawFrames = new JsonArray();
            using var audioStream = new MemoryStream();

            await SendBinaryAsync(_socket!,
                DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                    DoubaoTtsWebSocketProtocol.EventStartSession,
                    sessionId,
                    BuildStartSessionPayload(options)),
                cancellationToken);
            await ExpectTtsEventAsync(_socket!, rawFrames, cancellationToken,
                DoubaoTtsWebSocketProtocol.EventSessionStarted,
                DoubaoTtsWebSocketProtocol.EventSessionFailed);

            await SendBinaryAsync(_socket!,
                DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                    DoubaoTtsWebSocketProtocol.EventTaskRequest,
                    sessionId,
                    BuildTaskPayload(text)),
                cancellationToken);

            await SendBinaryAsync(_socket!,
                DoubaoTtsWebSocketProtocol.BuildSessionFrame(
                    DoubaoTtsWebSocketProtocol.EventFinishSession,
                    sessionId,
                    new JsonObject()),
                cancellationToken);

            string? contentType = null;
            while (true)
            {
                var received = await ReceiveBinaryMessageAsync(_socket!, cancellationToken);
                if (received.IsClosed)
                    break;

                var frame = DoubaoTtsWebSocketProtocol.ParseFrame(received.Payload);
                rawFrames.Add(ToFrameDebugJson(frame));

                if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
                    throw BuildTtsError(frame);

                if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeAudioOnlyResponse
                    && frame.EventCode == DoubaoTtsWebSocketProtocol.EventTtsResponse)
                {
                    audioStream.Write(frame.PayloadBytes, 0, frame.PayloadBytes.Length);
                    contentType ??= GuessContentType(NormalizeResponseFormat(options.Encoding));
                    continue;
                }

                if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeFullServerResponse)
                {
                    if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventSessionFinished)
                        break;
                    if (frame.EventCode == DoubaoTtsWebSocketProtocol.EventSessionFailed)
                        throw BuildTtsError(frame);
                }
            }

            var bytes = audioStream.ToArray();
            var format = NormalizeResponseFormat(options.Encoding);
            return new TtsSynthesisResponseDto
            {
                InvocationMode = "streaming",
                ContentType = contentType ?? GuessContentType(format),
                Format = format,
                AudioBase64 = bytes.Length == 0 ? null : Convert.ToBase64String(bytes),
                AudioSize = bytes.LongLength,
            };
        }

        private void ThrowIfDisposed()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(DoubaoTtsSynthesisSession));
        }
    }

 }
