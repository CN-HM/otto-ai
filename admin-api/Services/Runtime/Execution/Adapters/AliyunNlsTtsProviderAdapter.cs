using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class AliyunNlsTtsProviderAdapter : ProviderAdapterBase, IExecutableTtsProviderAdapter, ITransientDependency
{
    private const string DefaultEndpoint = "https://nls-gateway-cn-shanghai.aliyuncs.com/stream/v1/tts";

    private readonly IHttpClientFactory _httpClientFactory;

    public string AdapterCode => "tts_aliyun_nls";
    public string AdapterName => "Aliyun NLS TTS Adapter";
    public int Order => 20;

    public AliyunNlsTtsProviderAdapter(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.DashScope),
            MatchByProviderCode(profile.ProviderCode, "aliyun"));
    }

    public async Task<TtsSynthesisResponseDto> SynthesizeAsync(StageExecutionContext context, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(request.Text))
            throw new InvalidOperationException("Error:TtsTextMissing");

        var config = context.ModelConfig.ConfigObject;
        var endpoint = ResolveEndpoint(config, context.ModelConfig.ProviderEndpoint);
        var appKey = ExecutionJsonHelper.GetString(config, "appkey", "app_key")
            ?? throw new InvalidOperationException("阿里云 TTS 模型配置缺少 appkey");
        var token = ExecutionJsonHelper.GetString(config, "token")
            ?? throw new InvalidOperationException("阿里云 TTS 模型配置缺少 token");
        var voice = request.Voice
            ?? ExecutionJsonHelper.GetString(config, "voice", "voice_id")
            ?? "xiaoyun";
        var responseFormat = (request.ResponseFormat
            ?? ExecutionJsonHelper.GetString(config, "format", "response_format")
            ?? "wav").Trim().ToLowerInvariant();
        var sampleRate = ExecutionJsonHelper.GetInt(config, "sample_rate", "sampleRate")
            ?? GuessSampleRate(responseFormat);

        var body = new JsonObject
        {
            ["appkey"] = appKey,
            ["token"] = token,
            ["text"] = request.Text,
            ["format"] = responseFormat,
            ["sample_rate"] = sampleRate,
            ["voice"] = voice
        };

        var targetModel = ResolveExtraOptionString(request.ExtraOptions, "target_model", "model")
            ?? ExecutionJsonHelper.GetString(config, "target_model", "model");
        if (!string.IsNullOrWhiteSpace(targetModel))
            body["target_model"] = targetModel;

        var volume = ExecutionJsonHelper.GetInt(config, "volume");
        if (volume.HasValue)
            body["volume"] = volume.Value;

        var pitchRate = ExecutionJsonHelper.GetInt(config, "pitch_rate", "pitchRate");
        if (pitchRate.HasValue)
            body["pitch_rate"] = pitchRate.Value;

        var speechRate = ResolveSpeechRate(config, request.Speed);
        if (speechRate.HasValue)
            body["speech_rate"] = speechRate.Value;

        foreach (var option in request.ExtraOptions)
        {
            if (string.IsNullOrWhiteSpace(option.Key) || option.Value == null)
                continue;

            body[option.Key] = ExecutionJsonHelper.ToJsonNode(option.Value);
        }

        using var httpRequest = new HttpRequestMessage(HttpMethod.Post, endpoint);
        httpRequest.Headers.TryAddWithoutValidation("X-NLS-Token", token);
        httpRequest.Content = new StringContent(body.ToJsonString(), Encoding.UTF8, "application/json");

        var client = _httpClientFactory.CreateClient();
        using var response = await client.SendAsync(httpRequest, cancellationToken);
        var contentType = response.Content.Headers.ContentType?.MediaType;
        var isJsonError = string.IsNullOrWhiteSpace(contentType)
            || contentType.Contains("application/json", StringComparison.OrdinalIgnoreCase);
        if (!response.IsSuccessStatusCode || isJsonError)
        {
            var errorBody = await response.Content.ReadAsStringAsync(cancellationToken);
            var requestId = response.Headers.TryGetValues("X-NLS-RequestId", out var values)
                ? values.FirstOrDefault()
                : null;
            var requestIdSuffix = string.IsNullOrWhiteSpace(requestId) ? string.Empty : $" [requestId={requestId}]";
            throw new InvalidOperationException($"上游阿里云 TTS 调用失败：{(int)response.StatusCode} {response.ReasonPhrase}{requestIdSuffix} - {errorBody}");
        }

        var bytes = await response.Content.ReadAsByteArrayAsync(cancellationToken);
        return new TtsSynthesisResponseDto
        {
            InvocationMode = context.InvocationProfile.InvocationMode,
            ContentType = contentType ?? GuessContentType(responseFormat),
            Format = responseFormat,
            AudioBase64 = Convert.ToBase64String(bytes),
            AudioSize = bytes.LongLength
        };
    }

    private static string ResolveEndpoint(JsonObject? config, string? providerEndpoint)
    {
        var configuredEndpoint = ExecutionJsonHelper.GetString(config,
            "api_url",
            "url",
            "endpoint",
            "base_url");
        var endpoint = NormalizeValue(configuredEndpoint) ?? NormalizeValue(providerEndpoint);
        if (string.IsNullOrWhiteSpace(endpoint))
            return DefaultEndpoint;

        if (!Uri.TryCreate(endpoint, UriKind.Absolute, out var uri))
            return endpoint;

        return string.IsNullOrWhiteSpace(uri.AbsolutePath) || uri.AbsolutePath == "/"
            ? new Uri(uri, "/stream/v1/tts").ToString()
            : endpoint;
    }

    private static int? ResolveSpeechRate(JsonObject? config, double? speed)
    {
        var configuredSpeechRate = ExecutionJsonHelper.GetInt(config, "speech_rate", "speechRate");
        if (speed == null)
            return configuredSpeechRate;

        var mappedSpeed = (int)Math.Round((speed.Value - 1d) * 500d, MidpointRounding.AwayFromZero);
        return Math.Clamp(mappedSpeed, -500, 500);
    }

    private static int GuessSampleRate(string format)
    {
        return format switch
        {
            _ => 16000
        };
    }

    private static string GuessContentType(string format)
    {
        return format switch
        {
            "mp3" => "audio/mpeg",
            "ogg" => "audio/ogg",
            "opus" => "audio/ogg",
            "pcm" => "application/octet-stream",
            _ => "audio/wav"
        };
    }

    private static string? ResolveExtraOptionString(IReadOnlyDictionary<string, object?> options, params string[] keys)
    {
        foreach (var key in keys)
        {
            if (!options.TryGetValue(key, out var value) || value == null)
                continue;

            if (value is JsonElement element)
            {
                if (element.ValueKind == JsonValueKind.String)
                    return element.GetString();
                return element.ToString();
            }

            var text = value.ToString();
            if (!string.IsNullOrWhiteSpace(text))
                return text;
        }

        return null;
    }
}
