using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Embedding;
using AiAdmin.Services.Knowledge.Interfaces;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Knowledge;

public class ArkKnowledgeEmbeddingProvider : IKnowledgeEmbeddingProvider, ITransientDependency
{
    private const string DefaultEndpoint = "https://ark.cn-beijing.volces.com/api/v3/embeddings/multimodal";
    private const string DefaultModel = "doubao-embedding-vision-251215";

    private readonly AiAdminDbContext _db;
    private readonly IHttpClientFactory _httpClientFactory;

    public ArkKnowledgeEmbeddingProvider(AiAdminDbContext db, IHttpClientFactory httpClientFactory)
    {
        _db = db;
        _httpClientFactory = httpClientFactory;
    }

    public async Task<EmbeddingResult> EmbedAsync(string text, string? embeddingModelId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(text))
            throw new InvalidOperationException("嵌入文本不能为空");

        var profile = await ResolveEmbeddingProfileAsync(embeddingModelId,
            cancellationToken);
        var integrationId = NormalizeOptional(profile.IntegrationId)
            ?? throw new InvalidOperationException("向量模型未绑定 Provider Integration");
        var endpoint = ResolveEndpoint(profile.Endpoint);
        var model = NormalizeOptional(profile.Model) ?? DefaultModel;

        var integration = await ResolveRequiredIntegrationAsync(integrationId,
            cancellationToken);
        var apiKey = NormalizeOptional(integration.ApiKey) ?? NormalizeOptional(integration.AccessToken)
            ?? throw new InvalidOperationException("关联的 Provider Integration 未配置 API Key/AccessToken");

        var payload = BuildPayload(endpoint, model, text);

        using var request = new HttpRequestMessage(HttpMethod.Post, endpoint)
        {
            Content = new StringContent(payload.ToJsonString(), Encoding.UTF8, "application/json")
        };
        request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

        using var client = _httpClientFactory.CreateClient();
        using var response = await client.SendAsync(request, cancellationToken);
        var body = await response.Content.ReadAsStringAsync(cancellationToken);
        if (!response.IsSuccessStatusCode)
            throw new InvalidOperationException($"向量模型调用失败：{(int)response.StatusCode} {response.ReasonPhrase} - {body}");

        using var document = ParseResponseBody(body);
        var root = document.RootElement;
        var providerError = TryExtractProviderError(root);
        if (!string.IsNullOrWhiteSpace(providerError))
            throw new InvalidOperationException($"向量模型返回错误：{providerError}");
        if (!TryFindEmbedding(root, out var embeddingElement))
            throw new InvalidOperationException($"向量模型响应未包含可用 embedding 字段，请检查 Embedding Profile 的 endpoint/model 是否指向向量模型。响应摘要：{BuildBodySummary(body)}");

        var values = embeddingElement.EnumerateArray().Select(x => x.GetSingle()).ToArray();
        if (values.Length == 0)
            throw new InvalidOperationException("向量模型返回空向量");

        return new EmbeddingResult
        {
            ModelConfigId = profile.Id,
            Values = values
        };
    }

    private async Task<AiEmbeddingProfile> ResolveEmbeddingProfileAsync(string? embeddingModelId, CancellationToken cancellationToken)
    {
        var normalizedId = NormalizeOptional(embeddingModelId);
        if (!string.IsNullOrWhiteSpace(normalizedId))
        {
            var selected = await _db.AiEmbeddingProfiles.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == normalizedId && x.IsEnabled && x.Status == "active",
                    cancellationToken);
            if (selected != null)
                return selected;
        }

        var fallback = await _db.AiEmbeddingProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .FirstOrDefaultAsync(cancellationToken)
            ?? throw new InvalidOperationException("Error:KnowledgeEmbeddingProfileUnavailable");
        return fallback;
    }

    private async Task<AiProviderIntegration> ResolveRequiredIntegrationAsync(string integrationId, CancellationToken cancellationToken)
    {
        var integration = await _db.AiProviderIntegrations.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == integrationId && x.IsEnabled && x.Status == "active",
                cancellationToken)
            ?? throw new InvalidOperationException("Error:ProviderIntegrationUnavailable");

        return integration;
    }

    private static string ResolveEndpoint(string? endpoint)
    {
        var normalized = NormalizeOptional(endpoint) ?? DefaultEndpoint;
        if (!Uri.TryCreate(normalized, UriKind.Absolute, out var uri))
            throw new InvalidOperationException("向量模型 endpoint 不是有效的绝对地址");

        var text = uri.ToString().TrimEnd('/');
        if (!text.EndsWith("/embeddings", StringComparison.OrdinalIgnoreCase)
            && !text.EndsWith("/embeddings/multimodal", StringComparison.OrdinalIgnoreCase))
        {
            text = $"{text}/embeddings";
        }
        return text;
    }

    private static JsonObject BuildPayload(string endpoint, string model, string text)
    {
        if (endpoint.EndsWith("/embeddings/multimodal", StringComparison.OrdinalIgnoreCase))
        {
            return new JsonObject
            {
                ["model"] = model,
                ["input"] = new JsonArray
                {
                    new JsonObject
                    {
                        ["type"] = "text",
                        ["text"] = text
                    }
                }
            };
        }

        return new JsonObject
        {
            ["model"] = model,
            ["input"] = text
        };
    }

    private static bool TryFindEmbedding(JsonElement root, out JsonElement embeddingElement)
    {
        if (root.TryGetProperty("data", out var data))
        {
            if (data.ValueKind == JsonValueKind.Array && data.GetArrayLength() > 0)
            {
                var first = data[0];
                if (first.TryGetProperty("embedding", out embeddingElement) && embeddingElement.ValueKind == JsonValueKind.Array)
                    return true;
            }

            if (data.ValueKind == JsonValueKind.Object
                && data.TryGetProperty("embedding", out embeddingElement)
                && embeddingElement.ValueKind == JsonValueKind.Array)
            {
                return true;
            }
        }

        if (root.TryGetProperty("embedding", out embeddingElement) && embeddingElement.ValueKind == JsonValueKind.Array)
            return true;

        embeddingElement = default;
        return false;
    }

    private static string? TryExtractProviderError(JsonElement root)
    {
        if (root.TryGetProperty("error", out var error))
        {
            if (error.ValueKind == JsonValueKind.String)
                return error.GetString();

            if (error.ValueKind == JsonValueKind.Object)
            {
                var code = GetStringProperty(error, "code") ?? GetStringProperty(error, "type");
                var message = GetStringProperty(error, "message") ?? GetStringProperty(error, "msg");
                return string.Join(" - ", new[] { code, message }.Where(x => !string.IsNullOrWhiteSpace(x)));
            }
        }

        var rootCode = GetStringProperty(root, "code");
        var rootMessage = GetStringProperty(root, "message") ?? GetStringProperty(root, "msg");
        if (!string.IsNullOrWhiteSpace(rootCode)
            && !string.Equals(rootCode, "0", StringComparison.OrdinalIgnoreCase)
            && !string.Equals(rootCode, "200", StringComparison.OrdinalIgnoreCase)
            && !string.Equals(rootCode, "ok", StringComparison.OrdinalIgnoreCase)
            && !string.Equals(rootCode, "success", StringComparison.OrdinalIgnoreCase))
        {
            return string.Join(" - ", new[] { rootCode, rootMessage }.Where(x => !string.IsNullOrWhiteSpace(x)));
        }

        return null;
    }

    private static string? GetStringProperty(JsonElement source, string propertyName)
    {
        if (!source.TryGetProperty(propertyName, out var property))
            return null;

        return property.ValueKind switch
        {
            JsonValueKind.String => property.GetString(),
            JsonValueKind.Number => property.GetRawText(),
            JsonValueKind.True => "true",
            JsonValueKind.False => "false",
            _ => null
        };
    }

    private static string BuildBodySummary(string body)
    {
        var normalized = body.Replace("\r", " ").Replace("\n", " ").Trim();
        return normalized.Length <= 500 ? normalized : $"{normalized[..500]}...";
    }

    private static JsonDocument ParseResponseBody(string body)
    {
        try
        {
            return JsonDocument.Parse(body);
        }
        catch (JsonException ex)
        {
            throw new InvalidOperationException($"向量模型响应不是有效 JSON：{BuildBodySummary(body)}", ex);
        }
    }

    private static string? NormalizeOptional(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? null : value.Trim();
    }
}
