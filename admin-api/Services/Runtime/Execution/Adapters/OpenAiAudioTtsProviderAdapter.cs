using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class OpenAiAudioTtsProviderAdapter : OpenAiCompatibleHttpAdapterBase, IExecutableTtsProviderAdapter, ITransientDependency
{
    public string AdapterCode => "tts_openai_audio";
    public string AdapterName => "OpenAI Audio TTS Adapter";
    public int Order => 10;

    public OpenAiAudioTtsProviderAdapter(IHttpClientFactory httpClientFactory)
        : base(httpClientFactory)
    {
    }

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByCapabilityTag(profile.CapabilityTags, "speech_synthesis", "audio_output"),
            MatchByProviderCode(profile.ProviderCode, "openai", "azure_openai", "azure-openai", "openai_compatible"),
            MatchByProviderFamily(profile.ProviderFamily, "openai_compatible"));
    }

    public async Task<TtsSynthesisResponseDto> SynthesizeAsync(StageExecutionContext context, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default)
    {
        var endpoint = ResolveEndpoint(context.ModelConfig,
            "/audio/speech",
            "api_url",
            "tts_url",
            "ttsUrl",
            "tts.endpoint");
        var model = ResolveRequiredString(context.ModelConfig,
            "TTS 模型配置缺少 model / model_name",
            "model",
            "model_name");
        var voice = request.Voice
            ?? ResolveOptionalString(context.ModelConfig, "voice", "voice_id")
            ?? throw new InvalidOperationException("TTS 模型配置缺少 voice / voice_id");
        var responseFormat = request.ResponseFormat
            ?? ResolveOptionalString(context.ModelConfig, "response_format", "format")
            ?? "mp3";

        var body = new JsonObject
        {
            ["model"] = model,
            ["input"] = request.Text,
            ["voice"] = voice,
            ["response_format"] = responseFormat
        };

        var speed = request.Speed ?? ResolveOptionalDouble(context.ModelConfig, "speed");
        if (speed.HasValue)
            body["speed"] = speed.Value;

        foreach (var option in request.ExtraOptions)
        {
            body[option.Key] = ExecutionJsonHelper.ToJsonNode(option.Value);
        }

        using var httpRequest = new HttpRequestMessage(HttpMethod.Post, endpoint);
        ApplyAuthorization(httpRequest, context.ModelConfig);
        httpRequest.Content = CreateJsonContent(body);

        var client = CreateClient();
        using var response = await client.SendAsync(httpRequest, cancellationToken);
        if (!response.IsSuccessStatusCode)
        {
            var errorBody = await response.Content.ReadAsStringAsync(cancellationToken);
            throw new InvalidOperationException($"上游 TTS 调用失败：{(int)response.StatusCode} {response.ReasonPhrase} - {errorBody}");
        }

        var bytes = await response.Content.ReadAsByteArrayAsync(cancellationToken);
        var contentType = response.Content.Headers.ContentType?.MediaType ?? GuessContentType(responseFormat);

        return new TtsSynthesisResponseDto
        {
            InvocationMode = "non_streaming",
            ContentType = contentType,
            Format = responseFormat,
            AudioBase64 = Convert.ToBase64String(bytes),
            AudioSize = bytes.LongLength
        };
    }

    private static string GuessContentType(string format)
    {
        return format.Trim().ToLowerInvariant() switch
        {
            "wav" => "audio/wav",
            "opus" => "audio/ogg",
            "aac" => "audio/aac",
            _ => "audio/mpeg"
        };
    }
}
