using System.Globalization;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class AliyunNlsAsrProviderAdapter : ProviderAdapterBase, IExecutableAsrProviderAdapter, ITransientDependency
{
    private const string DefaultEndpoint = "https://nls-gateway-cn-shanghai.aliyuncs.com/stream/v1/asr";
    private const int DefaultTimeoutMs = 60000;

    private static readonly HashSet<string> ReservedQueryKeys = new(StringComparer.OrdinalIgnoreCase)
    {
        "appkey",
        "format",
        "sample_rate"
    };

    private readonly IHttpClientFactory _httpClientFactory;

    public string AdapterCode => "asr_aliyun_nls";
    public string AdapterName => "Aliyun NLS ASR Adapter";
    public int Order => 30;

    public AliyunNlsAsrProviderAdapter(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.DashScope),
            MatchByProviderCode(profile.ProviderCode, "aliyun"));
    }

    public async Task<AsrRecognitionResponseDto> RecognizeAsync(StageExecutionContext context, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(request.AudioBase64))
            throw new InvalidOperationException("Error:AsrAudioMissing");

        var config = context.ModelConfig.ConfigObject;
        var endpoint = ResolveEndpoint(config, context.ModelConfig.ProviderEndpoint);
        var appKey = ExecutionJsonHelper.GetString(config, "appkey", "app_key")
            ?? throw new InvalidOperationException("阿里云 ASR 模型配置缺少 appkey");
        var token = ExecutionJsonHelper.GetString(config, "token")
            ?? throw new InvalidOperationException("阿里云 ASR 模型配置缺少 token");
        var audioBytes = Convert.FromBase64String(request.AudioBase64);
        var audioFormat = NormalizeAudioFormat(request.AudioFormat
            ?? ExecutionJsonHelper.GetString(config, "format", "audio_format")) ?? "wav";
        var sampleRate = ExecutionJsonHelper.GetInt(config, "sample_rate", "sampleRate", "audio_fs")
            ?? GuessSampleRate(audioFormat);

        var queryParameters = new Dictionary<string, object?>(StringComparer.OrdinalIgnoreCase)
        {
            ["appkey"] = appKey,
            ["format"] = audioFormat,
            ["sample_rate"] = sampleRate
        };

        CopyQueryValue(queryParameters, "vocabulary_id", ExecutionJsonHelper.GetString(config, "vocabulary_id", "vocabularyId"));
        CopyQueryValue(queryParameters, "customization_id", ExecutionJsonHelper.GetString(config, "customization_id", "customizationId"));
        CopyQueryValue(queryParameters, "enable_punctuation_prediction", ExecutionJsonHelper.GetBool(config, "enable_punctuation_prediction", "enablePunctuationPrediction"));
        CopyQueryValue(queryParameters, "enable_inverse_text_normalization", ExecutionJsonHelper.GetBool(config, "enable_inverse_text_normalization", "enableInverseTextNormalization"));
        CopyQueryValue(queryParameters, "enable_voice_detection", ExecutionJsonHelper.GetBool(config, "enable_voice_detection", "enableVoiceDetection"));
        CopyQueryValue(queryParameters, "disfluency", ExecutionJsonHelper.GetBool(config, "disfluency"));

        foreach (var option in request.ExtraOptions)
        {
            if (string.IsNullOrWhiteSpace(option.Key) || option.Value == null || ReservedQueryKeys.Contains(option.Key))
                continue;

            queryParameters[option.Key] = option.Value;
        }

        using var httpRequest = new HttpRequestMessage(HttpMethod.Post, AppendQueryString(endpoint, queryParameters));
        httpRequest.Headers.TryAddWithoutValidation("X-NLS-Token", token);
        httpRequest.Content = new ByteArrayContent(audioBytes);
        httpRequest.Content.Headers.ContentType = MediaTypeHeaderValue.Parse("application/octet-stream");

        using var timeoutCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        timeoutCts.CancelAfter(ResolveTimeoutMs(context.InvocationProfile));

        var client = _httpClientFactory.CreateClient();
        using var response = await client.SendAsync(httpRequest, timeoutCts.Token);
        var responseBody = await response.Content.ReadAsStringAsync(timeoutCts.Token);
        if (!response.IsSuccessStatusCode)
        {
            throw BuildAsrFailure(response.StatusCode,
                response.ReasonPhrase,
                response.Headers.TryGetValues("X-NLS-RequestId", out var values) ? values.FirstOrDefault() : null,
                responseBody);
        }

        var responseObject = TryParseJsonObject(responseBody);
        var status = ExecutionJsonHelper.GetInt(responseObject, "status");
        if (status.HasValue && status.Value != 20000000)
        {
            var message = ExecutionJsonHelper.GetString(responseObject, "message") ?? "UNKNOWN";
            var requestId = ExecutionJsonHelper.GetString(responseObject, "task_id", "taskId")
                ?? (response.Headers.TryGetValues("X-NLS-RequestId", out var values) ? values.FirstOrDefault() : null);
            throw BuildAsrFailure(response.StatusCode, response.ReasonPhrase, requestId, responseBody, status.Value, message);
        }

        return new AsrRecognitionResponseDto
        {
            InvocationMode = "non_streaming",
            Transcript = TryExtractTranscript(responseObject, responseBody),
            RawResponseJson = responseBody
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
            ? new Uri(uri, "/stream/v1/asr").ToString()
            : endpoint;
    }

    private static int ResolveTimeoutMs(ModelInvocationProfileDto profile)
    {
        if (profile.StreamIdleTimeoutMs is > 0)
            return profile.StreamIdleTimeoutMs.Value;
        if (profile.FirstPacketTimeoutMs is > 0)
            return profile.FirstPacketTimeoutMs.Value;
        return DefaultTimeoutMs;
    }

    private static void CopyQueryValue(Dictionary<string, object?> queryParameters, string key, object? value)
    {
        if (string.IsNullOrWhiteSpace(key) || value == null)
            return;

        queryParameters[key] = value;
    }

    private static string AppendQueryString(string endpoint, Dictionary<string, object?> queryParameters)
    {
        var pairs = queryParameters
            .Where(x => x.Value != null)
            .Select(x => $"{Uri.EscapeDataString(x.Key)}={Uri.EscapeDataString(ConvertToString(x.Value)!)}")
            .ToList();
        if (pairs.Count == 0)
            return endpoint;

        var separator = endpoint.Contains('?') ? "&" : "?";
        return endpoint + separator + string.Join("&", pairs);
    }

    private static string? ConvertToString(object? value)
    {
        return value switch
        {
            null => null,
            string text => text,
            bool boolValue => boolValue ? bool.TrueString.ToLowerInvariant() : bool.FalseString.ToLowerInvariant(),
            IFormattable formattable => formattable.ToString(null, CultureInfo.InvariantCulture),
            _ => value.ToString()
        };
    }

    private static string? NormalizeAudioFormat(string? format)
    {
        var normalized = NormalizeValue(format)?.TrimStart('.').ToLowerInvariant();
        if (string.IsNullOrWhiteSpace(normalized))
            return null;

        if (normalized.StartsWith("audio/", StringComparison.OrdinalIgnoreCase))
            normalized = normalized["audio/".Length..];

        return normalized switch
        {
            "x-wav" => "wav",
            "mpeg" => "mp3",
            "mp4" => "aac",
            "m4a" => "aac",
            "ogg" => "opus",
            "webm" => "opus",
            _ => normalized
        };
    }

    private static int GuessSampleRate(string format)
    {
        return format switch
        {
            "amr" => 8000,
            _ => 16000
        };
    }

    private static JsonObject? TryParseJsonObject(string responseBody)
    {
        if (string.IsNullOrWhiteSpace(responseBody))
            return null;

        try
        {
            return JsonNode.Parse(responseBody) as JsonObject;
        }
        catch (JsonException)
        {
            return null;
        }
    }

    private static string? TryExtractTranscript(JsonObject? responseObject, string responseBody)
    {
        return ExecutionJsonHelper.GetString(responseObject,
                   "result",
                   "text",
                   "transcript")
               ?? NormalizeValue(responseBody);
    }

    private static InvalidOperationException BuildAsrFailure(System.Net.HttpStatusCode statusCode, string? reasonPhrase, string? requestId, string responseBody, int? serviceStatus = null, string? serviceMessage = null)
    {
        var requestIdSuffix = string.IsNullOrWhiteSpace(requestId) ? string.Empty : $" [requestId={requestId}]";
        var serviceStatusPrefix = serviceStatus.HasValue ? $"{serviceStatus.Value} " : string.Empty;
        var serviceMessageSuffix = string.IsNullOrWhiteSpace(serviceMessage) ? string.Empty : $" - {serviceMessage}";
        return new InvalidOperationException($"上游阿里云 ASR 调用失败：{(int)statusCode} {reasonPhrase}{requestIdSuffix} - {serviceStatusPrefix}{responseBody}{serviceMessageSuffix}");
    }
}
