using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private const string DoubaoDefaultProviderIntegrationId = "INTEGRATION_DoubaoDefault";
    private const string AliyunDefaultProviderIntegrationId = "INTEGRATION_AliyunDefault";

    private static readonly string[] BuiltInProviderIntegrationIds =
    [
        DoubaoDefaultProviderIntegrationId,
        AliyunDefaultProviderIntegrationId
    ];

    private async Task SeedProviderIntegrations()
    {
        var now = DateTime.UtcNow;
        var integrations = new List<AiProviderIntegration>
        {
            new()
            {
                Id = DoubaoDefaultProviderIntegrationId,
                Code = "DoubaoDefault",
                Name = "豆包默认集成",
                Description = "供 ASR / LLM / TTS / Embedding 共用的豆包云平台接入凭据。",
                ProviderCode = "doubao",
                Status = "active",
                IsEnabled = true,
                IsDefault = true,
                VoiceCatalogEndpoint = "https://open.volcengineapi.com/",
                Sort = 1,
                CreatedAt = now,
                UpdatedAt = now
            },
            new()
            {
                Id = AliyunDefaultProviderIntegrationId,
                Code = "AliyunDefault",
                Name = "阿里云默认集成",
                Description = "供 ASR / LLM / TTS / Embedding 共用的阿里云接入凭据。",
                ProviderCode = "aliyun",
                Status = "active",
                IsEnabled = true,
                IsDefault = false,
                VoiceCatalogEndpoint = "https://dashscope.aliyuncs.com/api/v1/services/audio/tts/customization",
                Sort = 2,
                CreatedAt = now,
                UpdatedAt = now
            }
        };

        var retainedIds = integrations.Select(x => x.Id).ToArray();
        var obsolete = await _db.AiProviderIntegrations
            .Where(x => BuiltInProviderIntegrationIds.Contains(x.Id) && !retainedIds.Contains(x.Id))
            .ToListAsync();
        if (obsolete.Count > 0)
            _db.AiProviderIntegrations.RemoveRange(obsolete);

        var existing = await _db.AiProviderIntegrations
            .Where(x => retainedIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id);

        foreach (var integration in integrations)
        {
            if (existing.TryGetValue(integration.Id, out var current))
            {
                current.Code = integration.Code;
                current.Name = integration.Name;
                current.Description = integration.Description;
                current.ProviderCode = integration.ProviderCode;
                current.Status = integration.Status;
                current.IsEnabled = integration.IsEnabled;
                current.ApiKey = PreserveCurrentValue(current.ApiKey, integration.ApiKey);
                current.SecretKey = PreserveCurrentValue(current.SecretKey, integration.SecretKey);
                current.AppId = PreserveCurrentValue(current.AppId, integration.AppId);
                current.AccessToken = PreserveCurrentValue(current.AccessToken, integration.AccessToken);
                current.Organization = PreserveCurrentValue(current.Organization, integration.Organization);
                current.VoiceCatalogAccessKey = PreserveCurrentValue(current.VoiceCatalogAccessKey, integration.VoiceCatalogAccessKey);
                current.VoiceCatalogSecret = PreserveCurrentValue(current.VoiceCatalogSecret, integration.VoiceCatalogSecret);
                current.VoiceCatalogAppId = PreserveCurrentValue(current.VoiceCatalogAppId, integration.VoiceCatalogAppId);
                current.VoiceCatalogEndpoint = PreserveCurrentValue(current.VoiceCatalogEndpoint, integration.VoiceCatalogEndpoint);
                current.Sort = integration.Sort;
                current.UpdatedAt = now;
                continue;
            }

            _db.AiProviderIntegrations.Add(integration);
        }

        await _db.SaveChangesAsync();
    }

    private static string? PreserveCurrentValue(string? currentValue, string? seededValue)
    {
        var current = string.IsNullOrWhiteSpace(currentValue) ? null : currentValue.Trim();
        if (current != null)
            return current;

        return string.IsNullOrWhiteSpace(seededValue) ? null : seededValue.Trim();
    }
}
