using System.Globalization;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Voice.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.Voice;

public class TtsVoiceCatalogSyncService : ITransientDependency
{
    private const string VolcengineHost = "open.volcengineapi.com";
    private const string VolcengineRegion = "cn-north-1";
    private const string VolcengineService = "speech_saas_prod";
    private const string VolcengineVersion = "2023-11-07";
    private const string AliyunCustomizationEndpoint = "https://dashscope.aliyuncs.com/api/v1/services/audio/tts/customization";
    private const string VolcengineEndpoint = "https://open.volcengineapi.com/";

    private readonly AiAdminDbContext _db;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IGuidGenerator _guidGenerator;

    public TtsVoiceCatalogSyncService(AiAdminDbContext db, IHttpClientFactory httpClientFactory, IGuidGenerator guidGenerator)
    {
        _db = db;
        _httpClientFactory = httpClientFactory;
        _guidGenerator = guidGenerator;
    }

    public async Task<TtsVoiceSyncResultDto> SyncAsync(string ttsProfileId, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var profile = await _db.AiTtsProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == ttsProfileId, cancellationToken)
            ?? throw new InvalidOperationException("Error:TtsProfileNotFound");
        var integration = await ResolveRequiredIntegrationAsync(profile, cancellationToken);

        return integration.ProviderType switch
        {
            ProviderType.DashScope => await SyncAliyunAsync(profile, integration, operatorUserId, cancellationToken),
            ProviderType.DoubaoSpeech => await SyncVolcengineAsync(profile, integration, operatorUserId, cancellationToken),
            _ => throw new InvalidOperationException($"当前 TTS Profile 不支持云音色同步：{ProviderTypeConverter.ToStorageValue(integration.ProviderType)}")
        };
    }

    private async Task<TtsVoiceSyncResultDto> SyncAliyunAsync(AiTtsProfile profile, AiProviderIntegration integration, long operatorUserId, CancellationToken cancellationToken)
    {
        var endpoint = NormalizeOptional(integration.VoiceCatalogEndpoint) ?? AliyunCustomizationEndpoint;
        var apiKey = RequireCatalogCredential(
            NormalizeCatalogCredential(integration.VoiceCatalogAccessKey) ?? NormalizeCatalogCredential(integration.ApiKey),
            "阿里云",
            "API Key",
            "请先在 Provider Integration 配置真实的 voiceCatalogAccessKey 或 apiKey，再手动执行云音色同步。");

        var remoteVoices = new List<RemoteVoiceRecord>();
        var pageIndex = 0;
        var totalCount = int.MaxValue;
        var client = _httpClientFactory.CreateClient();

        while (remoteVoices.Count < totalCount)
        {
            var payload = JsonSerializer.Serialize(new
            {
                model = "qwen-voice-design",
                input = new
                {
                    action = "list",
                    page_size = 100,
                    page_index = pageIndex
                }
            });

            using var request = new HttpRequestMessage(HttpMethod.Post, endpoint);
            request.Headers.TryAddWithoutValidation("Authorization", $"Bearer {apiKey}");
            request.Content = new StringContent(payload, Encoding.UTF8, "application/json");

            using var response = await client.SendAsync(request, cancellationToken);
            var body = await response.Content.ReadAsStringAsync(cancellationToken);
            if (!response.IsSuccessStatusCode)
            {
                throw new InvalidOperationException($"阿里云音色同步失败：{(int)response.StatusCode} {response.ReasonPhrase} - {body}");
            }

            using var document = JsonDocument.Parse(body);
            var output = document.RootElement.TryGetProperty("output", out var outputElement) ? outputElement : default;
            if (output.ValueKind != JsonValueKind.Object)
            {
                throw new InvalidOperationException("阿里云音色同步返回异常，缺少 output 节点");
            }

            totalCount = output.TryGetProperty("total_count", out var totalElement) && totalElement.TryGetInt32(out var total)
                ? total
                : remoteVoices.Count;
            if (!output.TryGetProperty("voice_list", out var voiceListElement) || voiceListElement.ValueKind != JsonValueKind.Array)
            {
                break;
            }

            var currentCount = 0;
            foreach (var item in voiceListElement.EnumerateArray())
            {
                var voice = GetString(item, "voice");
                if (string.IsNullOrWhiteSpace(voice))
                {
                    continue;
                }

                currentCount++;
                remoteVoices.Add(new RemoteVoiceRecord(
                    VoiceCode: voice.Trim(),
                    DisplayName: voice.Trim(),
                    Language: GetString(item, "language"),
                    Preview: GetString(item, "preview_text"),
                    Description: BuildAliyunDescription(GetString(item, "voice_prompt"), GetString(item, "target_model"))));
            }

            if (currentCount == 0)
            {
                break;
            }

            pageIndex++;
            if (pageIndex > 200)
            {
                break;
            }
        }

        return await UpsertRemoteVoicesAsync(profile, "aliyun", remoteVoices, operatorUserId, cancellationToken);
    }

    private async Task<TtsVoiceSyncResultDto> SyncVolcengineAsync(AiTtsProfile profile, AiProviderIntegration integration, long operatorUserId, CancellationToken cancellationToken)
    {
        var appId = RequireCatalogCredential(
            NormalizeCatalogCredential(integration.VoiceCatalogAppId) ?? NormalizeCatalogCredential(integration.AppId),
            "豆包",
            "AppId",
            "请先在 Provider Integration 配置真实的 voiceCatalogAppId 或 appId，再手动执行云音色同步。");
        var accessKey = RequireCatalogCredential(
            NormalizeCatalogCredential(integration.VoiceCatalogAccessKey),
            "豆包",
            "AccessKey",
            "请先在 Provider Integration 配置真实的 voiceCatalogAccessKey，再手动执行云音色同步。");
        var secretKey = RequireCatalogCredential(
            NormalizeCatalogCredential(integration.VoiceCatalogSecret),
            "豆包",
            "SecretKey",
            "请先在 Provider Integration 配置真实的 voiceCatalogSecret，再手动执行云音色同步。");

        var remoteVoices = new List<RemoteVoiceRecord>();
        var pageNumber = 1;
        var totalCount = int.MaxValue;
        var client = _httpClientFactory.CreateClient();

        while (remoteVoices.Count < totalCount)
        {
            var bodyJson = JsonSerializer.Serialize(new
            {
                AppID = appId,
                PageNumber = pageNumber,
                PageSize = 100
            });

            using var request = BuildVolcengineRequest(accessKey, secretKey, "BatchListMegaTTSTrainStatus", bodyJson);
            using var response = await client.SendAsync(request, cancellationToken);
            var body = await response.Content.ReadAsStringAsync(cancellationToken);
            if (!response.IsSuccessStatusCode)
            {
                throw new InvalidOperationException($"豆包音色同步失败：{(int)response.StatusCode} {response.ReasonPhrase} - {body}");
            }

            using var document = JsonDocument.Parse(body);
            var result = document.RootElement.TryGetProperty("Result", out var resultElement) ? resultElement : default;
            if (result.ValueKind != JsonValueKind.Object)
            {
                throw new InvalidOperationException("豆包音色同步返回异常，缺少 Result 节点");
            }

            totalCount = result.TryGetProperty("TotalCount", out var totalElement) && totalElement.TryGetInt32(out var total)
                ? total
                : remoteVoices.Count;
            if (!result.TryGetProperty("Statuses", out var statusesElement) || statusesElement.ValueKind != JsonValueKind.Array)
            {
                break;
            }

            var currentCount = 0;
            foreach (var item in statusesElement.EnumerateArray())
            {
                var speakerId = GetString(item, "SpeakerID");
                if (string.IsNullOrWhiteSpace(speakerId))
                {
                    continue;
                }

                currentCount++;
                var alias = GetString(item, "Alias");
                var state = GetString(item, "State");
                var instanceNo = GetString(item, "InstanceNO");
                var version = GetString(item, "Version");
                var modelDetail = item.TryGetProperty("ModelTypeDetails", out var detailsElement) && detailsElement.ValueKind == JsonValueKind.Array
                    ? detailsElement.EnumerateArray().FirstOrDefault()
                    : default;
                var iclSpeakerId = modelDetail.ValueKind == JsonValueKind.Object ? GetString(modelDetail, "IclSpeakerId") : null;
                var resourceId = modelDetail.ValueKind == JsonValueKind.Object ? GetString(modelDetail, "ResourceID") : null;
                var demoAudio = GetString(item, "DemoAudio") ?? (modelDetail.ValueKind == JsonValueKind.Object ? GetString(modelDetail, "DemoAudio") : null);

                remoteVoices.Add(new RemoteVoiceRecord(
                    VoiceCode: NormalizeOptional(iclSpeakerId) ?? speakerId.Trim(),
                    DisplayName: NormalizeOptional(alias) ?? speakerId.Trim(),
                    Language: null,
                    Preview: demoAudio,
                    Description: BuildVolcengineDescription(state, speakerId, resourceId, version, instanceNo)));
            }

            if (currentCount == 0)
            {
                break;
            }

            pageNumber++;
        }

        return await UpsertRemoteVoicesAsync(profile, "doubao", remoteVoices, operatorUserId, cancellationToken);
    }

    private async Task<TtsVoiceSyncResultDto> UpsertRemoteVoicesAsync(AiTtsProfile profile, string providerCode, IReadOnlyList<RemoteVoiceRecord> remoteVoices, long operatorUserId, CancellationToken cancellationToken)
    {
        var now = DateTime.UtcNow;
        var existingList = await _db.AiTtsVoices.Where(x => x.TtsProfileId == profile.Id).ToListAsync(cancellationToken);
        var existingByVoice = existingList
            .Where(x => !string.IsNullOrWhiteSpace(x.TtsVoice))
            .GroupBy(x => x.TtsVoice!, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(x => x.Key, x => x.First(), StringComparer.OrdinalIgnoreCase);

        var createdCount = 0;
        var updatedCount = 0;
        var skippedCount = 0;
        var nextSort = existingList.Count == 0 ? 1 : existingList.Max(x => x.Sort) + 1;

        foreach (var remoteVoice in remoteVoices)
        {
            if (string.IsNullOrWhiteSpace(remoteVoice.VoiceCode))
            {
                skippedCount++;
                continue;
            }

            if (existingByVoice.TryGetValue(remoteVoice.VoiceCode, out var current))
            {
                current.Name = remoteVoice.DisplayName;
                current.Languages = remoteVoice.Language ?? current.Languages;
                current.VoiceDemo = remoteVoice.Preview;
                current.Remark = remoteVoice.Description;
                current.Updater = operatorUserId;
                current.UpdateDate = now;
                updatedCount++;
                continue;
            }

            var entity = new AiTtsVoice
            {
                Id = _guidGenerator.Create().ToString("N"),
                TtsProfileId = profile.Id,
                Name = remoteVoice.DisplayName,
                TtsVoice = remoteVoice.VoiceCode,
                Languages = remoteVoice.Language,
                VoiceDemo = remoteVoice.Preview,
                Remark = remoteVoice.Description,
                Sort = nextSort++,
                Creator = operatorUserId,
                CreateDate = now,
                Updater = operatorUserId,
                UpdateDate = now
            };

            _db.AiTtsVoices.Add(entity);
            existingByVoice[remoteVoice.VoiceCode] = entity;
            createdCount++;
        }

        await _db.SaveChangesAsync(cancellationToken);
        return new TtsVoiceSyncResultDto
        {
            ProviderCode = providerCode,
            TtsProfileId = profile.Id,
            RemoteCount = remoteVoices.Count,
            CreatedCount = createdCount,
            UpdatedCount = updatedCount,
            SkippedCount = skippedCount,
            Message = $"已从 {profile.Name} 同步 {remoteVoices.Count} 条云音色，新增 {createdCount} 条，更新 {updatedCount} 条。"
        };
    }

    private static HttpRequestMessage BuildVolcengineRequest(string accessKey, string secretKey, string action, string body)
    {
        var now = DateTime.UtcNow;
        var xDate = now.ToString("yyyyMMdd'T'HHmmss'Z'", CultureInfo.InvariantCulture);
        var shortDate = xDate[..8];
        var query = new SortedDictionary<string, string>(StringComparer.Ordinal)
        {
            ["Action"] = action,
            ["Version"] = VolcengineVersion
        };
        var normalizedQuery = NormalizeQuery(query);
        var contentType = "application/json; charset=utf-8";
        var bodyHash = Sha256Hex(body);
        var signedHeaders = "content-type;host;x-content-sha256;x-date";
        var canonicalHeaders = string.Join('\n',
            $"content-type:{contentType}",
            $"host:{VolcengineHost}",
            $"x-content-sha256:{bodyHash}",
            $"x-date:{xDate}");
        var canonicalRequest = string.Join('\n',
            "POST",
            "/",
            normalizedQuery,
            canonicalHeaders,
            string.Empty,
            signedHeaders,
            bodyHash);
        var credentialScope = $"{shortDate}/{VolcengineRegion}/{VolcengineService}/request";
        var stringToSign = string.Join('\n', "HMAC-SHA256", xDate, credentialScope, Sha256Hex(canonicalRequest));
        var signature = ToHex(HmacSha256(GetSigningKey(secretKey, shortDate, VolcengineRegion, VolcengineService), stringToSign));
        var authorization = $"HMAC-SHA256 Credential={accessKey}/{credentialScope}, SignedHeaders={signedHeaders}, Signature={signature}";

        var request = new HttpRequestMessage(HttpMethod.Post, $"{VolcengineEndpoint}?{normalizedQuery}");
        request.Headers.TryAddWithoutValidation("X-Date", xDate);
        request.Headers.TryAddWithoutValidation("X-Content-Sha256", bodyHash);
        request.Headers.TryAddWithoutValidation("Authorization", authorization);
        request.Content = new StringContent(body, Encoding.UTF8, "application/json");
        request.Headers.Host = VolcengineHost;
        return request;
    }

    private static byte[] GetSigningKey(string secretKey, string shortDate, string region, string service)
    {
        var kDate = HmacSha256(Encoding.UTF8.GetBytes(secretKey), shortDate);
        var kRegion = HmacSha256(kDate, region);
        var kService = HmacSha256(kRegion, service);
        return HmacSha256(kService, "request");
    }

    private static byte[] HmacSha256(byte[] key, string value)
    {
        using var hmac = new HMACSHA256(key);
        return hmac.ComputeHash(Encoding.UTF8.GetBytes(value));
    }

    private static string Sha256Hex(string value)
    {
        return ToHex(SHA256.HashData(Encoding.UTF8.GetBytes(value)));
    }

    private static string ToHex(byte[] bytes)
    {
        return Convert.ToHexString(bytes).ToLowerInvariant();
    }

    private static string NormalizeQuery(SortedDictionary<string, string> query)
    {
        return string.Join("&", query.Select(pair => $"{Escape(pair.Key)}={Escape(pair.Value)}"));
    }

    private static string Escape(string value)
    {
        return Uri.EscapeDataString(value).Replace("+", "%20");
    }

    private static string? GetString(JsonElement element, string propertyName)
    {
        return element.TryGetProperty(propertyName, out var property) && property.ValueKind != JsonValueKind.Null
            ? property.ToString()
            : null;
    }

    private static string BuildVolcengineDescription(string? state, string? speakerId, string? resourceId, string? version, string? instanceNo)
    {
        var parts = new List<string>();
        if (!string.IsNullOrWhiteSpace(state)) parts.Add($"状态：{state}");
        if (!string.IsNullOrWhiteSpace(speakerId)) parts.Add($"SpeakerID：{speakerId}");
        if (!string.IsNullOrWhiteSpace(resourceId)) parts.Add($"ResourceID：{resourceId}");
        if (!string.IsNullOrWhiteSpace(version)) parts.Add($"版本：{version}");
        if (!string.IsNullOrWhiteSpace(instanceNo)) parts.Add($"实例：{instanceNo}");
        return string.Join(" | ", parts);
    }

    private static string? BuildAliyunDescription(string? voicePrompt, string? targetModel)
    {
        var parts = new List<string>();
        if (!string.IsNullOrWhiteSpace(voicePrompt)) parts.Add(voicePrompt.Trim());
        if (!string.IsNullOrWhiteSpace(targetModel)) parts.Add($"目标模型：{targetModel.Trim()}");
        return parts.Count == 0 ? null : string.Join(" | ", parts);
    }

    private static string? NormalizeOptional(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? null : value.Trim();
    }

    private async Task<AiProviderIntegration> ResolveRequiredIntegrationAsync(AiTtsProfile profile, CancellationToken cancellationToken)
    {
        var integrationId = NormalizeOptional(profile.IntegrationId)
            ?? throw new InvalidOperationException("TTS Profile 未绑定 Provider Integration，无法执行云音色同步。");

        var integration = await _db.AiProviderIntegrations.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == integrationId && x.IsEnabled && x.Status == "active", cancellationToken)
            ?? throw new InvalidOperationException("Error:ProviderIntegrationUnavailableForVoiceSync");

        return integration;
    }

    private static string? NormalizeCatalogCredential(string? value)
    {
        var normalized = NormalizeOptional(value);
        return normalized == null || IsCredentialPlaceholder(normalized) ? null : normalized;
    }

    private static string RequireCatalogCredential(string? value, string providerName, string credentialName, string missingHint)
    {
        if (string.IsNullOrWhiteSpace(value))
            throw new InvalidOperationException($"{providerName}云音色同步未配置 {credentialName}。{missingHint}");

        if (!IsAscii(value))
            throw new InvalidOperationException($"{providerName}云音色同步配置的 {credentialName} 含有非 ASCII 字符，当前值看起来像占位文本。请先填写真实云平台凭据后再手动同步。");

        return value;
    }

    private static bool IsCredentialPlaceholder(string value)
    {
        return value.StartsWith("你的", StringComparison.Ordinal)
            || value.StartsWith("请填写", StringComparison.Ordinal)
            || value.Contains("示例", StringComparison.Ordinal)
            || value.Contains("placeholder", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_api_key", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_access_token", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_app_id", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_appid", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_secret", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_access_key", StringComparison.OrdinalIgnoreCase)
            || value.Equals("your_secret_key", StringComparison.OrdinalIgnoreCase);
    }

    private static bool IsAscii(string value)
    {
        return value.All(ch => ch <= 0x7F);
    }

    private sealed record RemoteVoiceRecord(
        string VoiceCode,
        string DisplayName,
        string? Language,
        string? Preview,
        string? Description);
}
