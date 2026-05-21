using System.Net.WebSockets;
using System.Text.Json.Nodes;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

[ExposeServices(typeof(IExecutableAsrProviderAdapter), typeof(IStreamingExecutableAsrProviderAdapter), typeof(DoubaoAsrProviderAdapter))]
public class DoubaoAsrProviderAdapter : ProviderAdapterBase, IStreamingExecutableAsrProviderAdapter, ITransientDependency
{
    private const int DefaultTimeoutMs = 60000;

    public string AdapterCode => "asr_doubao_ws";
    public string AdapterName => "Doubao ASR WebSocket Adapter";
    public int Order => 5;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.DoubaoSpeech),
            MatchByProviderFamily(profile.ProviderFamily, "doubao_speech_ws"),
            MatchByProviderCode(profile.ProviderCode, "doubao"));
    }

    public async Task<AsrRecognitionResponseDto> RecognizeAsync(StageExecutionContext context, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(request.AudioBase64))
            throw new InvalidOperationException("Error:AsrAudioMissing");

        var options = DoubaoSpeechExecutionOptionsBinder.BindAsr(context.ModelConfig.ConfigObject);
        var endpoint = options.WsUrl;
        var headers = BuildHeaders(options);
        var fullRequestPayload = BuildFullRequestPayload(options, request);
        var audioBytes = Convert.FromBase64String(request.AudioBase64);
        var chunkSize = ResolveChunkSize(options, request.AudioFormat);

        using var socket = new ClientWebSocket();
        foreach (var header in headers)
            socket.Options.SetRequestHeader(header.Key, header.Value);

        using var timeoutCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        timeoutCts.CancelAfter(ResolveTimeoutMs(context.InvocationProfile));

        await socket.ConnectAsync(new Uri(endpoint), timeoutCts.Token);
        await SendBinaryAsync(socket, DoubaoAsrWebSocketProtocol.BuildFullClientRequest(fullRequestPayload), timeoutCts.Token);

        var rawFrames = new JsonArray();
        string? transcript = null;

        foreach (var chunk in SplitAudio(audioBytes, chunkSize))
        {
            await SendBinaryAsync(socket,
                DoubaoAsrWebSocketProtocol.BuildAudioOnlyRequest(chunk.Buffer, chunk.IsFinal),
                timeoutCts.Token);

            while (true)
            {
                var received = await ReceiveBinaryMessageAsync(socket, timeoutCts.Token);
                if (received.IsClosed)
                    break;
                if (received.Payload.Length == 0)
                    break;

                var frame = DoubaoAsrWebSocketProtocol.ParseFrame(received.Payload);
                rawFrames.Add(ToFrameDebugJson(frame));

                if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
                    throw BuildAsrError(frame);

                if (frame.MessageType != DoubaoSpeechWebSocketFrameCodec.MessageTypeFullServerResponse)
                    continue;

                var responseObject = DoubaoSpeechWebSocketPayloadReader.TryParsePayloadAsJson(frame);
                var currentTranscript = ExecutionJsonHelper.GetString(responseObject,
                    "result.text",
                    "result[0].text",
                    "text");
                if (!string.IsNullOrWhiteSpace(currentTranscript))
                    transcript = currentTranscript;

                var isFinalResponse = DoubaoAsrWebSocketProtocol.IsFinalResponse(frame);
                if (isFinalResponse)
                {
                    if (socket.State == WebSocketState.Open)
                        await socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "done", CancellationToken.None);

                    return new AsrRecognitionResponseDto
                    {
                        InvocationMode = "streaming",
                        Transcript = transcript,
                        RawResponseJson = rawFrames.ToJsonString()
                    };
                }

                if (!chunk.IsFinal)
                    break;
            }
        }

        if (socket.State == WebSocketState.Open)
            await socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "done", CancellationToken.None);

        return new AsrRecognitionResponseDto
        {
            InvocationMode = "streaming",
            Transcript = transcript,
            RawResponseJson = rawFrames.Count > 0 ? rawFrames.ToJsonString() : null
        };
    }

    public async Task<IAsrRecognitionSession> CreateRecognitionSessionAsync(
        StageExecutionContext context,
        AsrRecognitionRequestDto request,
        Func<AsrRecognitionStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default)
    {
        var session = new DoubaoAsrRecognitionSession(context, request, onEvent);
        await session.InitializeAsync(cancellationToken);
        return session;
    }

    private static Dictionary<string, string> BuildHeaders(DoubaoAsrExecutionOptions options)
    {
        var headers = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        var connectId = Guid.NewGuid().ToString("D");
        var requestId = Guid.NewGuid().ToString("D");

        var appId = options.AppId;
        var accessToken = options.AccessToken;
        if (!string.IsNullOrWhiteSpace(appId) && !string.IsNullOrWhiteSpace(accessToken))
        {
            headers["X-Api-App-Key"] = appId;
            headers["X-Api-Access-Key"] = accessToken;
        }
        else if (!string.IsNullOrWhiteSpace(options.ApiKey))
        {
            headers["X-Api-Key"] = options.ApiKey;
        }
        else
        {
            throw new InvalidOperationException("豆包 ASR 模型配置缺少语音服务鉴权信息（appid + access_token 或 api_key）");
        }

        headers["X-Api-Resource-Id"] = options.ResourceId;
        headers["X-Api-Request-Id"] = requestId;
        headers["X-Api-Connect-Id"] = connectId;
        headers["X-Api-Sequence"] = "-1";
        return headers;
    }

    private static JsonObject BuildFullRequestPayload(DoubaoAsrExecutionOptions options, AsrRecognitionRequestDto request)
    {
        var audio = new JsonObject
        {
            ["format"] = NormalizeAudioFormat(request.AudioFormat ?? options.AudioFormat) ?? "wav",
            ["codec"] = NormalizeAudioCodec(options.Codec) ?? "raw",
            ["rate"] = options.SampleRate,
            ["bits"] = options.Bits,
            ["channel"] = options.Channels
        };

        var requestObject = new JsonObject
        {
            ["model_name"] = "bigmodel"
        };

        foreach (var pair in options.RequestOptions)
            requestObject[pair.Key] = pair.Value?.DeepClone();

        var language = NormalizeValue(request.Language) ?? options.Language;
        if (!string.IsNullOrWhiteSpace(language))
            audio["language"] = language;

        if (!string.IsNullOrWhiteSpace(options.Context))
        {
            requestObject["corpus"] = new JsonObject
            {
                ["context"] = options.Context
            };
        }

        return new JsonObject
        {
            ["user"] = BuildUserPayload(request),
            ["audio"] = audio,
            ["request"] = requestObject
        };
    }

    private static JsonObject BuildUserPayload(AsrRecognitionRequestDto request)
    {
        var user = new JsonObject
        {
            ["uid"] = Guid.NewGuid().ToString("N")
        };

        foreach (var option in request.ExtraOptions)
        {
            if (!option.Key.StartsWith("user.", StringComparison.OrdinalIgnoreCase) || option.Value == null)
                continue;

            user[option.Key[5..]] = JsonValue.Create(option.Value?.ToString());
        }

        return user;
    }

    private static IEnumerable<(byte[] Buffer, bool IsFinal)> SplitAudio(byte[] audioBytes, int chunkSize)
    {
        if (audioBytes.Length == 0)
        {
            yield return ([], true);
            yield break;
        }

        for (var offset = 0; offset < audioBytes.Length; offset += chunkSize)
        {
            var count = Math.Min(chunkSize, audioBytes.Length - offset);
            var buffer = new byte[count];
            Buffer.BlockCopy(audioBytes, offset, buffer, 0, count);
            yield return (buffer, offset + count >= audioBytes.Length);
        }
    }

    private static int ResolveChunkSize(DoubaoAsrExecutionOptions options, string? requestedFormat)
    {
        var chunkDurationMs = options.ChunkDurationMs;
        var sampleRate = options.SampleRate;
        var channels = options.Channels;
        var codec = NormalizeAudioCodec(options.Codec);
        var format = NormalizeAudioFormat(requestedFormat ?? options.AudioFormat);

        if (string.Equals(codec, "raw", StringComparison.OrdinalIgnoreCase)
            || string.Equals(format, "pcm", StringComparison.OrdinalIgnoreCase)
            || string.Equals(format, "wav", StringComparison.OrdinalIgnoreCase))
        {
            return Math.Max(1, sampleRate * channels * 2 * chunkDurationMs / 1000);
        }

        return Math.Max(4096, options.ChunkSizeBytes);
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
                var text = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                throw new InvalidOperationException($"豆包 ASR 返回文本帧错误：{text}");
            }

            return (stream.ToArray(), false);
        }
    }

    private static InvalidOperationException BuildAsrError(DoubaoSpeechWebSocketFrame frame)
    {
        var errorObject = DoubaoSpeechWebSocketPayloadReader.TryParsePayloadAsJson(frame);
        var message = ExecutionJsonHelper.GetString(errorObject, "message", "error", "msg")
            ?? DoubaoSpeechWebSocketPayloadReader.TryGetPayloadText(frame)
            ?? "unknown";
        return new InvalidOperationException($"豆包 ASR 调用失败：{frame.ErrorCode} - {message}");
    }

    private static JsonObject ToFrameDebugJson(DoubaoSpeechWebSocketFrame frame)
    {
        var result = new JsonObject
        {
            ["messageType"] = frame.MessageType,
            ["messageTypeSpecificFlags"] = frame.MessageTypeSpecificFlags,
            ["serializationMethod"] = frame.SerializationMethod,
            ["compressionMethod"] = frame.CompressionMethod
        };

        if (frame.Sequence.HasValue)
            result["sequence"] = frame.Sequence.Value;

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

    private static string? NormalizeAudioFormat(string? format)
    {
        var normalized = NormalizeValue(format)?.TrimStart('.').ToLowerInvariant();
        return normalized switch
        {
            "x-wav" => "wav",
            "mpeg" => "mp3",
            "ogg_opus" => "ogg",
            _ => normalized
        };
    }

    private static string? NormalizeAudioCodec(string? codec)
    {
        var normalized = NormalizeValue(codec)?.ToLowerInvariant();
        return normalized switch
        {
            "pcm" => "raw",
            _ => normalized
        };
    }

    private sealed class DoubaoAsrRecognitionSession : IAsrRecognitionSession
    {
        private readonly Func<AsrRecognitionStreamEventDto, CancellationToken, Task> _onEvent;
        private readonly string _endpoint;
        private readonly Dictionary<string, string> _headers;
        private readonly JsonObject _fullRequestPayload;
        private readonly int _timeoutMs;
        private readonly SemaphoreSlim _sendLock = new(1, 1);
        private readonly ClientWebSocket _socket = new();
        private readonly CancellationTokenSource _lifetimeCts = new();
        private readonly TaskCompletionSource<AsrRecognitionResponseDto> _completionSource = new(TaskCreationOptions.RunContinuationsAsynchronously);
        private readonly JsonArray _rawFrames = new();
        private readonly HashSet<string> _emittedDefiniteUtterances = new(StringComparer.Ordinal);
        private Task? _receiveLoopTask;
        private string? _latestTranscript;
        private int _completed;
        private bool _disposed;

        public DoubaoAsrRecognitionSession(
            StageExecutionContext context,
            AsrRecognitionRequestDto request,
            Func<AsrRecognitionStreamEventDto, CancellationToken, Task> onEvent)
        {
            _onEvent = onEvent;
            var options = DoubaoSpeechExecutionOptionsBinder.BindAsr(context.ModelConfig.ConfigObject);
            _endpoint = options.WsUrl;
            _headers = BuildHeaders(options);
            _fullRequestPayload = BuildFullRequestPayload(options, request);
            _timeoutMs = ResolveTimeoutMs(context.InvocationProfile);
        }

        public async Task InitializeAsync(CancellationToken cancellationToken)
        {
            using var timeoutCts = CreateTimeoutToken(cancellationToken);
            foreach (var header in _headers)
                _socket.Options.SetRequestHeader(header.Key, header.Value);

            await _socket.ConnectAsync(new Uri(_endpoint), timeoutCts.Token);
            await SendBinaryAsync(_socket, DoubaoAsrWebSocketProtocol.BuildFullClientRequest(_fullRequestPayload), timeoutCts.Token);
            _receiveLoopTask = Task.Run(() => ReceiveLoopAsync(_lifetimeCts.Token));
        }

        public async Task SendAudioAsync(byte[] audioBytes, CancellationToken cancellationToken = default)
        {
            if (audioBytes.Length == 0)
                return;

            using var timeoutCts = CreateTimeoutToken(cancellationToken);
            await _sendLock.WaitAsync(timeoutCts.Token);
            try
            {
                ThrowIfCompleted();
                await SendBinaryAsync(_socket,
                    DoubaoAsrWebSocketProtocol.BuildAudioOnlyRequest(audioBytes, isFinal: false),
                    timeoutCts.Token);
            }
            finally
            {
                _sendLock.Release();
            }
        }

        public async Task<AsrRecognitionResponseDto> CompleteAsync(CancellationToken cancellationToken = default)
        {
            if (Interlocked.Exchange(ref _completed, 1) == 0)
            {
                using var timeoutCts = CreateTimeoutToken(cancellationToken);
                await _sendLock.WaitAsync(timeoutCts.Token);
                try
                {
                    await SendBinaryAsync(_socket,
                        DoubaoAsrWebSocketProtocol.BuildAudioOnlyRequest([], isFinal: true),
                        timeoutCts.Token);
                }
                finally
                {
                    _sendLock.Release();
                }
            }

            var response = await _completionSource.Task.WaitAsync(cancellationToken);
            if (_receiveLoopTask != null)
                await _receiveLoopTask;
            return response;
        }

        public async Task CancelAsync(CancellationToken cancellationToken = default)
        {
            if (Interlocked.Exchange(ref _completed, 1) != 0)
                return;

            _lifetimeCts.Cancel();
            _completionSource.TrySetCanceled(cancellationToken);
            if (_socket.State == WebSocketState.Open || _socket.State == WebSocketState.CloseReceived)
            {
                try
                {
                    await _socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "cancelled", cancellationToken);
                }
                catch
                {
                }
            }
        }

        public async ValueTask DisposeAsync()
        {
            if (_disposed)
                return;

            _disposed = true;
            _lifetimeCts.Cancel();
            if (_socket.State == WebSocketState.Open || _socket.State == WebSocketState.CloseReceived)
            {
                try
                {
                    await _socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "dispose", CancellationToken.None);
                }
                catch
                {
                }
            }

            _socket.Dispose();
            _sendLock.Dispose();
            _lifetimeCts.Dispose();
        }

        private async Task ReceiveLoopAsync(CancellationToken cancellationToken)
        {
            try
            {
                while (!cancellationToken.IsCancellationRequested)
                {
                    var received = await ReceiveBinaryMessageAsync(_socket, cancellationToken);
                    if (received.IsClosed)
                        break;
                    if (received.Payload.Length == 0)
                        continue;

                    var frame = DoubaoAsrWebSocketProtocol.ParseFrame(received.Payload);
                    _rawFrames.Add(ToFrameDebugJson(frame));
                    if (frame.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
                    {
                        _completionSource.TrySetException(BuildAsrError(frame));
                        break;
                    }

                    if (frame.MessageType != DoubaoSpeechWebSocketFrameCodec.MessageTypeFullServerResponse)
                        continue;

                    var responseObject = DoubaoSpeechWebSocketPayloadReader.TryParsePayloadAsJson(frame);
                    var transcript = ExecutionJsonHelper.GetString(responseObject,
                        "result.text",
                        "result[0].text",
                        "text");
                    if (!string.IsNullOrWhiteSpace(transcript))
                    {
                        _latestTranscript = transcript;
                        await _onEvent(new AsrRecognitionStreamEventDto
                        {
                            EventType = "transcript_updated",
                            Transcript = transcript,
                            RawEventJson = responseObject?.ToJsonString()
                        }, cancellationToken);
                    }

                    await EmitUtteranceEventsAsync(responseObject, cancellationToken);

                    if (DoubaoAsrWebSocketProtocol.IsFinalResponse(frame))
                    {
                        var finalResponse = new AsrRecognitionResponseDto
                        {
                            InvocationMode = "streaming",
                            Transcript = _latestTranscript,
                            RawResponseJson = _rawFrames.ToJsonString()
                        };
                        _completionSource.TrySetResult(finalResponse);
                        break;
                    }
                }

                if (!_completionSource.Task.IsCompleted)
                {
                    _completionSource.TrySetResult(new AsrRecognitionResponseDto
                    {
                        InvocationMode = "streaming",
                        Transcript = _latestTranscript,
                        RawResponseJson = _rawFrames.Count == 0 ? null : _rawFrames.ToJsonString()
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

        private async Task EmitUtteranceEventsAsync(JsonObject? responseObject, CancellationToken cancellationToken)
        {
            var utterances = ExtractUtterances(responseObject);
            foreach (var utterance in utterances)
            {
                var text = utterance["text"]?.GetValue<string>();
                if (string.IsNullOrWhiteSpace(text))
                    continue;

                var isDefinite = utterance["definite"]?.GetValue<bool>() == true;
                var startTime = utterance["start_time"]?.GetValue<int>();
                var endTime = utterance["end_time"]?.GetValue<int>();
                var key = $"{startTime}:{endTime}:{text}";
                if (isDefinite && !_emittedDefiniteUtterances.Add(key))
                    continue;

                await _onEvent(new AsrRecognitionStreamEventDto
                {
                    EventType = isDefinite ? "utterance_definite" : "utterance_partial",
                    Transcript = _latestTranscript,
                    UtteranceText = text,
                    IsDefinite = isDefinite,
                    StartTimeMs = startTime,
                    EndTimeMs = endTime,
                    RawEventJson = utterance.ToJsonString()
                }, cancellationToken);
            }
        }

        private static IEnumerable<JsonObject> ExtractUtterances(JsonObject? responseObject)
        {
            if (responseObject == null)
                return [];

            if (responseObject["result"] is JsonObject resultObject
                && resultObject["utterances"] is JsonArray utteranceArray)
            {
                return utteranceArray.OfType<JsonObject>();
            }

            if (responseObject["result"] is JsonArray resultArray)
            {
                return resultArray
                    .OfType<JsonObject>()
                    .SelectMany(item => (item["utterances"] as JsonArray)?.OfType<JsonObject>() ?? Enumerable.Empty<JsonObject>())
                    .ToList();
            }

            return [];
        }

        private CancellationTokenSource CreateTimeoutToken(CancellationToken cancellationToken)
        {
            var timeoutCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken, _lifetimeCts.Token);
            timeoutCts.CancelAfter(_timeoutMs);
            return timeoutCts;
        }

        private void ThrowIfCompleted()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(DoubaoAsrRecognitionSession));
            if (_completionSource.Task.IsCompleted)
                throw new InvalidOperationException("ASR 流式会话已完成或已关闭");
        }
    }
}
