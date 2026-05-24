using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Execution.Dtos;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public abstract class OpenAiCompatibleHttpAdapterBase : ProviderAdapterBase
{
    private readonly IHttpClientFactory _httpClientFactory;

    protected OpenAiCompatibleHttpAdapterBase(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }

    protected HttpClient CreateClient()
    {
        return _httpClientFactory.CreateClient();
    }

    protected static string ResolveEndpoint(ModelExecutionConfigDto modelConfig, string fallbackRelativePath, params string[] configPaths)
    {
        var configured = ExecutionJsonHelper.GetString(modelConfig.ConfigObject, configPaths);
        if (!string.IsNullOrWhiteSpace(configured))
        {
            if (Uri.TryCreate(configured, UriKind.Absolute, out _))
                return configured;
            return CombineUrl(modelConfig.ProviderEndpoint, configured);
        }

        return CombineUrl(modelConfig.ProviderEndpoint, fallbackRelativePath);
    }

    protected static string ResolveRequiredString(ModelExecutionConfigDto modelConfig, string errorMessage, params string[] configPaths)
    {
        var value = ExecutionJsonHelper.GetString(modelConfig.ConfigObject, configPaths);
        return !string.IsNullOrWhiteSpace(value)
            ? value
            : throw new InvalidOperationException(errorMessage);
    }

    protected static string? ResolveOptionalString(ModelExecutionConfigDto modelConfig, params string[] configPaths)
    {
        return ExecutionJsonHelper.GetString(modelConfig.ConfigObject, configPaths);
    }

    protected static int? ResolveOptionalInt(ModelExecutionConfigDto modelConfig, params string[] configPaths)
    {
        return ExecutionJsonHelper.GetInt(modelConfig.ConfigObject, configPaths);
    }

    protected static double? ResolveOptionalDouble(ModelExecutionConfigDto modelConfig, params string[] configPaths)
    {
        return ExecutionJsonHelper.GetDouble(modelConfig.ConfigObject, configPaths);
    }

    protected static void ApplyAuthorization(HttpRequestMessage request, ModelExecutionConfigDto modelConfig)
    {
        var authorization = ResolveOptionalString(modelConfig, "authorization");
        if (!string.IsNullOrWhiteSpace(authorization))
        {
            request.Headers.TryAddWithoutValidation("Authorization", authorization);
            return;
        }

        var apiKey = ResolveOptionalString(modelConfig, "api_key", "access_token", "token");
        if (!string.IsNullOrWhiteSpace(apiKey))
        {
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);
        }
    }

    protected static StringContent CreateJsonContent(JsonNode body)
    {
        return new StringContent(body.ToJsonString(), Encoding.UTF8, "application/json");
    }

    protected static async Task<string> ReadSuccessBodyAsync(HttpResponseMessage response, CancellationToken cancellationToken)
    {
        var body = await response.Content.ReadAsStringAsync(cancellationToken);
        if (!response.IsSuccessStatusCode)
        {
            throw new InvalidOperationException($"上游模型调用失败：{(int)response.StatusCode} {response.ReasonPhrase} - {body}");
        }

        return body;
    }

    protected static string CombineUrl(string? baseUrl, string relativeOrAbsolute)
    {
        if (Uri.TryCreate(relativeOrAbsolute, UriKind.Absolute, out var absoluteUri))
            return absoluteUri.ToString();
        if (string.IsNullOrWhiteSpace(baseUrl))
            throw new InvalidOperationException("模型配置缺少可用的服务地址");

        var normalizedBase = baseUrl.TrimEnd('/');
        var normalizedRelative = relativeOrAbsolute.TrimStart('/');
        return $"{normalizedBase}/{normalizedRelative}";
    }

    protected static JsonArray BuildOpenAiMessages(LlmChatRequestDto request)
    {
        var messages = new JsonArray();
        if (!string.IsNullOrWhiteSpace(request.SystemPrompt))
        {
            messages.Add(new JsonObject
            {
                ["role"] = "system",
                ["content"] = request.SystemPrompt
            });
        }

        foreach (var message in request.Messages)
        {
            var json = new JsonObject
            {
                ["role"] = string.IsNullOrWhiteSpace(message.Role) ? "user" : message.Role,
                ["content"] = message.Content
            };
            if (!string.IsNullOrWhiteSpace(message.Name))
                json["name"] = message.Name;
            if (!string.IsNullOrWhiteSpace(message.ToolCallId))
                json["tool_call_id"] = message.ToolCallId;
            if (message.ToolCalls is { Count: > 0 })
                json["tool_calls"] = message.ToolCalls.DeepClone();
            messages.Add(json);
        }

        return messages;
    }

    protected static string? ExtractMessageText(JsonNode? node)
    {
        return node switch
        {
            JsonValue value when value.TryGetValue<string>(out var text) => text,
            JsonArray array => string.Concat(array
                .OfType<JsonObject>()
                .Select(item => item["text"]?.GetValue<string>())),
            _ => null
        };
    }

    protected static (int? PromptTokens, int? CompletionTokens, int? TotalTokens) ExtractUsage(JsonObject? root)
    {
        var usage = root?["usage"] as JsonObject;
        return (
            usage?["prompt_tokens"]?.GetValue<int?>(),
            usage?["completion_tokens"]?.GetValue<int?>(),
            usage?["total_tokens"]?.GetValue<int?>());
    }
}
