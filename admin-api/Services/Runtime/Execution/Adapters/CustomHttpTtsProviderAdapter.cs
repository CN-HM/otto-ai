using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class CustomHttpTtsProviderAdapter : ProviderAdapterBase, IExecutableTtsProviderAdapter, ITransientDependency
{
    private readonly IHttpClientFactory _httpClientFactory;

    public string AdapterCode => "tts_custom_http";
    public string AdapterName => "Custom HTTP TTS Adapter";
    public int Order => 30;

    public CustomHttpTtsProviderAdapter(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "custom", "gpt_sovits_v2", "gpt_sovits_v3", "fishspeech");
    }

    public async Task<TtsSynthesisResponseDto> SynthesizeAsync(StageExecutionContext context, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default)
    {
        var endpoint = ExecutionJsonHelper.GetString(context.ModelConfig.ConfigObject,
            "url",
            "api_url",
            "endpoint") ?? context.ModelConfig.ProviderEndpoint;
        if (string.IsNullOrWhiteSpace(endpoint))
            throw new InvalidOperationException("自定义 TTS 缺少 url / api_url / endpoint 配置");

        var method = (ExecutionJsonHelper.GetString(context.ModelConfig.ConfigObject, "method") ?? "GET").Trim().ToUpperInvariant();
        var headers = ExecutionJsonHelper.ToStringDictionary(ExecutionJsonHelper.GetObject(context.ModelConfig.ConfigObject, "headers"));
        var parameterNode = ExecutionJsonHelper.GetObject(context.ModelConfig.ConfigObject, "params");
        var parameters = parameterNode == null
            ? new Dictionary<string, object?>(StringComparer.OrdinalIgnoreCase)
            : parameterNode.ToDictionary(x => x.Key, x => ExecutionJsonHelper.ToPlainObject(x.Value), StringComparer.OrdinalIgnoreCase);

        parameters["text"] = request.Text;
        if (!string.IsNullOrWhiteSpace(request.Voice))
            parameters["voice"] = request.Voice;

        var responseFormat = request.ResponseFormat
            ?? ExecutionJsonHelper.GetString(context.ModelConfig.ConfigObject, "format", "response_format")
            ?? "wav";
        parameters["format"] = responseFormat;

        if (request.Speed.HasValue)
            parameters["speed"] = request.Speed.Value;
        foreach (var option in request.ExtraOptions)
        {
            parameters[option.Key] = option.Value;
        }

        using var httpRequest = BuildRequest(method, endpoint, headers, parameters);
        var client = _httpClientFactory.CreateClient();
        using var response = await client.SendAsync(httpRequest, cancellationToken);
        if (!response.IsSuccessStatusCode)
        {
            var errorBody = await response.Content.ReadAsStringAsync(cancellationToken);
            throw new InvalidOperationException($"上游自定义 TTS 调用失败：{(int)response.StatusCode} {response.ReasonPhrase} - {errorBody}");
        }

        var bytes = await response.Content.ReadAsByteArrayAsync(cancellationToken);
        return new TtsSynthesisResponseDto
        {
            InvocationMode = "non_streaming",
            ContentType = response.Content.Headers.ContentType?.MediaType ?? GuessContentType(responseFormat),
            Format = responseFormat,
            AudioBase64 = Convert.ToBase64String(bytes),
            AudioSize = bytes.LongLength
        };
    }

    private static HttpRequestMessage BuildRequest(string method, string endpoint, Dictionary<string, string> headers, Dictionary<string, object?> parameters)
    {
        HttpRequestMessage request;
        if (method == "POST")
        {
            request = new HttpRequestMessage(HttpMethod.Post, endpoint)
            {
                Content = new StringContent(new JsonObject(parameters.Select(x => KeyValuePair.Create<string, JsonNode?>(x.Key, ExecutionJsonHelper.ToJsonNode(x.Value))).ToDictionary()).ToJsonString(), System.Text.Encoding.UTF8, "application/json")
            };
        }
        else
        {
            request = new HttpRequestMessage(HttpMethod.Get, AppendQueryString(endpoint, parameters));
        }

        foreach (var header in headers)
        {
            request.Headers.TryAddWithoutValidation(header.Key, header.Value);
        }

        return request;
    }

    private static string AppendQueryString(string endpoint, Dictionary<string, object?> parameters)
    {
        var pairs = parameters
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
            IFormattable formattable => formattable.ToString(null, System.Globalization.CultureInfo.InvariantCulture),
            _ => value.ToString()
        };
    }

    private static string GuessContentType(string format)
    {
        return format.Trim().ToLowerInvariant() switch
        {
            "mp3" => "audio/mpeg",
            "ogg" => "audio/ogg",
            _ => "audio/wav"
        };
    }
}
