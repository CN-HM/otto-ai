using System.Globalization;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class OpenAiAudioTranscriptionAsrProviderAdapter : OpenAiCompatibleHttpAdapterBase, IExecutableAsrProviderAdapter, ITransientDependency
{
    public string AdapterCode => "asr_openai_audio_transcription";
    public string AdapterName => "OpenAI Audio Transcription ASR Adapter";
    public int Order => 10;

    public OpenAiAudioTranscriptionAsrProviderAdapter(IHttpClientFactory httpClientFactory)
        : base(httpClientFactory)
    {
    }

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByCapabilityTag(profile.CapabilityTags, "transcription", "speech_to_text", "audio_input"),
            MatchByProviderCode(profile.ProviderCode, "openai", "azure_openai", "azure-openai", "openai_compatible"),
            MatchByProviderFamily(profile.ProviderFamily, "openai_compatible"));
    }

    public async Task<AsrRecognitionResponseDto> RecognizeAsync(StageExecutionContext context, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(request.AudioBase64))
            throw new InvalidOperationException("Error:AsrAudioMissing");

        var endpoint = ResolveEndpoint(context.ModelConfig,
            "/audio/transcriptions",
            "api_url",
            "transcription_url",
            "transcriptionUrl",
            "asr_url",
            "asrUrl",
            "asr.endpoint");
        var model = ResolveRequiredString(context.ModelConfig,
            "ASR 模型配置缺少 model / model_name",
            "model",
            "model_name",
            "deployment",
            "deployment_name");
        var responseFormat = ResolveOptionalString(context.ModelConfig, "response_format") ?? "json";
        var language = request.Language ?? ResolveOptionalString(context.ModelConfig, "language");
        var prompt = ResolveOptionalString(context.ModelConfig, "prompt");
        var temperature = ResolveOptionalDouble(context.ModelConfig, "temperature");
        var audioBytes = Convert.FromBase64String(request.AudioBase64);
        var audioFormat = NormalizeValue(request.AudioFormat) ?? "wav";

        using var body = new MultipartFormDataContent();
        using var fileContent = new ByteArrayContent(audioBytes);
        var contentType = GuessContentType(audioFormat);
        if (!string.IsNullOrWhiteSpace(contentType))
            fileContent.Headers.ContentType = MediaTypeHeaderValue.Parse(contentType);
        body.Add(fileContent, "file", $"audio.{NormalizeExtension(audioFormat)}");
        body.Add(new StringContent(model), "model");
        body.Add(new StringContent(responseFormat), "response_format");

        if (!string.IsNullOrWhiteSpace(language))
            body.Add(new StringContent(language), "language");
        if (!string.IsNullOrWhiteSpace(prompt))
            body.Add(new StringContent(prompt), "prompt");
        if (temperature.HasValue)
            body.Add(new StringContent(temperature.Value.ToString(CultureInfo.InvariantCulture)), "temperature");

        foreach (var option in request.ExtraOptions)
        {
            AddMultipartValue(body, option.Key, option.Value);
        }

        using var httpRequest = new HttpRequestMessage(HttpMethod.Post, endpoint);
        ApplyAuthorization(httpRequest, context.ModelConfig);
        httpRequest.Content = body;

        var client = CreateClient();
        using var response = await client.SendAsync(httpRequest, cancellationToken);
        var responseBody = await ReadSuccessBodyAsync(response, cancellationToken);
        var transcript = TryExtractTranscript(responseBody);

        return new AsrRecognitionResponseDto
        {
            InvocationMode = "non_streaming",
            Transcript = transcript,
            RawResponseJson = responseBody
        };
    }

    private static void AddMultipartValue(MultipartFormDataContent body, string key, object? value)
    {
        if (string.IsNullOrWhiteSpace(key) || value == null)
            return;

        switch (value)
        {
            case string text when !string.IsNullOrWhiteSpace(text):
                body.Add(new StringContent(text), key);
                return;
            case bool boolValue:
                body.Add(new StringContent(boolValue ? bool.TrueString.ToLowerInvariant() : bool.FalseString.ToLowerInvariant()), key);
                return;
            case IFormattable formattable:
                body.Add(new StringContent(formattable.ToString(null, CultureInfo.InvariantCulture)), key);
                return;
            default:
                body.Add(new StringContent(JsonSerializer.Serialize(value)), key);
                return;
        }
    }

    private static string? TryExtractTranscript(string responseBody)
    {
        if (string.IsNullOrWhiteSpace(responseBody))
            return null;

        try
        {
            if (JsonNode.Parse(responseBody) is JsonObject root)
            {
                return ExtractMessageText(root["text"])
                    ?? ExtractMessageText(root["transcript"])
                    ?? ExtractMessageText(root["result"])
                    ?? responseBody.Trim();
            }
        }
        catch (JsonException)
        {
        }

        return responseBody.Trim();
    }

    private static string NormalizeExtension(string format)
    {
        return format.Trim().TrimStart('.').ToLowerInvariant() switch
        {
            "mpeg" => "mp3",
            _ => format.Trim().TrimStart('.').ToLowerInvariant()
        };
    }

    private static string GuessContentType(string format)
    {
        return NormalizeExtension(format) switch
        {
            "wav" => "audio/wav",
            "mp3" => "audio/mpeg",
            "mp4" => "audio/mp4",
            "m4a" => "audio/mp4",
            "webm" => "audio/webm",
            "ogg" => "audio/ogg",
            "opus" => "audio/ogg",
            "flac" => "audio/flac",
            "pcm" => "application/octet-stream",
            _ => "application/octet-stream"
        };
    }
}
