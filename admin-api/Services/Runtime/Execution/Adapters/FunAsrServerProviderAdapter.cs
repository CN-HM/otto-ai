using System.Net.WebSockets;
using System.Text;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class FunAsrServerProviderAdapter : ProviderAdapterBase, IExecutableAsrProviderAdapter, ITransientDependency
{
    private const int DefaultTimeoutMs = 60000;
    private const int BinaryChunkSize = 32 * 1024;

    public string AdapterCode => "asr_funasr_server";
    public string AdapterName => "FunASR Server Adapter";
    public int Order => 20;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "fun_server");
    }

    public async Task<AsrRecognitionResponseDto> RecognizeAsync(StageExecutionContext context, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(request.AudioBase64))
            throw new InvalidOperationException("Error:AsrAudioMissing");

        var endpoint = ResolveEndpoint(context.ModelConfig);
        var mode = NormalizeValue(ExecutionJsonHelper.GetString(context.ModelConfig.ConfigObject, "mode")) ?? "offline";
        var audioFormat = NormalizeValue(request.AudioFormat)
            ?? NormalizeValue(ExecutionJsonHelper.GetString(context.ModelConfig.ConfigObject, "wav_format", "format"))
            ?? "pcm";
        var sampleRate = ExecutionJsonHelper.GetInt(context.ModelConfig.ConfigObject, "audio_fs", "sample_rate");
        var audioBytes = Convert.FromBase64String(request.AudioBase64);

        using var socket = new ClientWebSocket();
        using var timeoutCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        timeoutCts.CancelAfter(ResolveTimeoutMs(context.InvocationProfile));

        await socket.ConnectAsync(new Uri(endpoint), timeoutCts.Token);
        await SendTextAsync(socket, BuildStartMessage(context.ModelConfig, mode, audioFormat, sampleRate, request.Language).ToJsonString(), timeoutCts.Token);
        await SendBinaryAsync(socket, audioBytes, timeoutCts.Token);
        await SendTextAsync(socket, new JsonObject
        {
            ["is_speaking"] = false
        }.ToJsonString(), timeoutCts.Token);

        var rawMessages = new JsonArray();
        string? transcript = null;
        while (socket.State == WebSocketState.Open || socket.State == WebSocketState.CloseReceived)
        {
            var received = await ReceiveTextMessageAsync(socket, timeoutCts.Token);
            if (received.IsClosed)
                break;
            if (string.IsNullOrWhiteSpace(received.Text))
                continue;

            var parsed = TryParseJson(received.Text);
            rawMessages.Add(parsed ?? JsonValue.Create(received.Text));
            var responseObject = parsed as JsonObject;
            var currentTranscript = ExecutionJsonHelper.GetString(responseObject,
                "text",
                "result",
                "transcript",
                "sentence.text");
            if (!string.IsNullOrWhiteSpace(currentTranscript))
                transcript = currentTranscript;

            if (IsFinalResponse(responseObject, mode, transcript))
                break;
        }

        if (socket.State == WebSocketState.Open)
        {
            await socket.CloseAsync(WebSocketCloseStatus.NormalClosure, "done", CancellationToken.None);
        }
        else if (socket.State == WebSocketState.CloseReceived)
        {
            await socket.CloseOutputAsync(WebSocketCloseStatus.NormalClosure, "done", CancellationToken.None);
        }

        return new AsrRecognitionResponseDto
        {
            InvocationMode = "non_streaming",
            Transcript = transcript,
            RawResponseJson = rawMessages.Count > 0 ? rawMessages.ToJsonString() : null
        };
    }

    private static JsonObject BuildStartMessage(ModelExecutionConfigDto modelConfig, string mode, string audioFormat, int? sampleRate, string? language)
    {
        var message = new JsonObject
        {
            ["mode"] = mode,
            ["wav_name"] = $"{NormalizeValue(modelConfig.ModelCode) ?? modelConfig.ProfileId}_{Guid.NewGuid():N}",
            ["wav_format"] = audioFormat,
            ["is_speaking"] = true
        };

        if (sampleRate.HasValue)
            message["audio_fs"] = sampleRate.Value;
        if (!string.IsNullOrWhiteSpace(language))
            message["language"] = language;

        CopyOptionalNode(modelConfig.ConfigObject, message, "chunk_size");
        CopyOptionalNode(modelConfig.ConfigObject, message, "hotwords");
        CopyOptionalScalar(modelConfig.ConfigObject, message, "chunk_interval");
        CopyOptionalScalar(modelConfig.ConfigObject, message, "encoder_chunk_look_back");
        CopyOptionalScalar(modelConfig.ConfigObject, message, "decoder_chunk_look_back");
        CopyOptionalScalar(modelConfig.ConfigObject, message, "itn");
        return message;
    }

    private static string ResolveEndpoint(ModelExecutionConfigDto modelConfig)
    {
        var endpoint = NormalizeValue(ExecutionJsonHelper.GetString(modelConfig.ConfigObject,
                "ws_url",
                "wsUrl",
                "websocket_url",
                "websocketUrl",
                "ws_endpoint"))
            ?? NormalizeValue(modelConfig.ProviderEndpoint)
            ?? ModelCapabilityJsonHelper.BuildEndpointFromHostPort(modelConfig.ConfigObject, "ws");
        if (string.IsNullOrWhiteSpace(endpoint))
            throw new InvalidOperationException("FunASR Server 配置缺少 host/port 或 websocket endpoint");

        if (endpoint.StartsWith("ws://", StringComparison.OrdinalIgnoreCase)
            || endpoint.StartsWith("wss://", StringComparison.OrdinalIgnoreCase))
        {
            return endpoint;
        }

        if (endpoint.StartsWith("http://", StringComparison.OrdinalIgnoreCase))
            return "ws://" + endpoint[7..];
        if (endpoint.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
            return "wss://" + endpoint[8..];
        return $"ws://{endpoint}";
    }

    private static int ResolveTimeoutMs(ModelInvocationProfileDto profile)
    {
        if (profile.StreamIdleTimeoutMs is > 0)
            return profile.StreamIdleTimeoutMs.Value;
        if (profile.FirstPacketTimeoutMs is > 0)
            return profile.FirstPacketTimeoutMs.Value;
        return DefaultTimeoutMs;
    }

    private static async Task SendTextAsync(ClientWebSocket socket, string text, CancellationToken cancellationToken)
    {
        var bytes = Encoding.UTF8.GetBytes(text);
        await socket.SendAsync(new ArraySegment<byte>(bytes), WebSocketMessageType.Text, true, cancellationToken);
    }

    private static async Task SendBinaryAsync(ClientWebSocket socket, byte[] audioBytes, CancellationToken cancellationToken)
    {
        if (audioBytes.Length == 0)
            return;

        for (var offset = 0; offset < audioBytes.Length; offset += BinaryChunkSize)
        {
            var count = Math.Min(BinaryChunkSize, audioBytes.Length - offset);
            var isEndOfMessage = offset + count >= audioBytes.Length;
            await socket.SendAsync(new ArraySegment<byte>(audioBytes, offset, count),
                WebSocketMessageType.Binary,
                isEndOfMessage,
                cancellationToken);
        }
    }

    private static async Task<(string? Text, bool IsClosed)> ReceiveTextMessageAsync(ClientWebSocket socket, CancellationToken cancellationToken)
    {
        var buffer = new byte[4096];
        using var stream = new MemoryStream();

        while (true)
        {
            var result = await socket.ReceiveAsync(new ArraySegment<byte>(buffer), cancellationToken);
            if (result.MessageType == WebSocketMessageType.Close)
                return (null, true);

            if (result.Count > 0)
                stream.Write(buffer, 0, result.Count);

            if (!result.EndOfMessage)
                continue;

            if (result.MessageType != WebSocketMessageType.Text)
                return (null, false);

            return (Encoding.UTF8.GetString(stream.ToArray()), false);
        }
    }

    private static JsonNode? TryParseJson(string text)
    {
        try
        {
            return JsonNode.Parse(text);
        }
        catch
        {
            return null;
        }
    }

    private static bool IsFinalResponse(JsonObject? responseObject, string mode, string? transcript)
    {
        var isFinal = ExecutionJsonHelper.GetBool(responseObject,
            "is_final",
            "isFinal",
            "final");
        if (isFinal == true)
            return true;

        var isSpeaking = ExecutionJsonHelper.GetBool(responseObject, "is_speaking");
        if (isSpeaking == false && !string.IsNullOrWhiteSpace(transcript))
            return true;

        return string.Equals(mode, "offline", StringComparison.OrdinalIgnoreCase)
            && !string.IsNullOrWhiteSpace(transcript);
    }

    private static void CopyOptionalNode(JsonObject? source, JsonObject target, string key)
    {
        if (ModelCapabilityJsonHelper.GetNode(source, key) is { } node)
            target[key] = node.DeepClone();
    }

    private static void CopyOptionalScalar(JsonObject? source, JsonObject target, string key)
    {
        var value = ExecutionJsonHelper.ToPlainObject(ModelCapabilityJsonHelper.GetNode(source, key));
        if (value != null)
            target[key] = System.Text.Json.JsonSerializer.SerializeToNode(value);
    }
}
