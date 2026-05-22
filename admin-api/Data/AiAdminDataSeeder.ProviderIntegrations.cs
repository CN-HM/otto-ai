using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private const string ArkDefaultProviderIntegrationId = "INTEGRATION_ArkDefault";
    private const string DoubaoSpeechDefaultProviderIntegrationId = "INTEGRATION_DoubaoSpeechDefault";
    private const string DashScopeDefaultProviderIntegrationId = "INTEGRATION_DashScopeDefault";

    private static readonly string[] BuiltInProviderIntegrationIds =
    [
        ArkDefaultProviderIntegrationId,
        DoubaoSpeechDefaultProviderIntegrationId,
        DashScopeDefaultProviderIntegrationId
    ];

    private async Task SeedProviderIntegrations()
    {
        var now = DateTime.UtcNow;
        var integrations = new List<AiProviderIntegration>
        {
            new()
            {
                Id = ArkDefaultProviderIntegrationId,
                Code = "ArkDefault",
                Name = "火山方舟",
                Description = "火山引擎豆包大模型平台，支持 ASR / LLM / TTS / Embedding 全栈能力。",
                ProviderType = ProviderType.Ark,
                Status = "active",
                IsEnabled = true,
                IsDefault = true,
                SupportsAsr = true,
                SupportsTts = true,
                SupportsLlm = true,
                SupportsMem = true,
                Sort = 1,
                CreatedAt = now,
                UpdatedAt = now
            },
            new()
            {
                Id = DoubaoSpeechDefaultProviderIntegrationId,
                Code = "DoubaoSpeechDefault",
                Name = "豆包语音",
                Description = "火山引擎豆包语音平台，专注于 ASR 语音识别与 TTS 语音合成。",
                ProviderType = ProviderType.DoubaoSpeech,
                Status = "active",
                IsEnabled = true,
                IsDefault = false,
                SupportsAsr = true,
                SupportsTts = true,
                SupportsLlm = false,
                SupportsMem = false,
                Sort = 2,
                CreatedAt = now,
                UpdatedAt = now
            },
            new()
            {
                Id = DashScopeDefaultProviderIntegrationId,
                Code = "DashScopeDefault",
                Name = "阿里百炼",
                Description = "阿里云 DashScope 百炼平台，支持 LLM / TTS / Embedding 能力。",
                ProviderType = ProviderType.DashScope,
                Status = "active",
                IsEnabled = true,
                IsDefault = false,
                SupportsAsr = false,
                SupportsTts = true,
                SupportsLlm = true,
                SupportsMem = true,
                Sort = 3,
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
                current.ProviderType = integration.ProviderType;
                current.Status = integration.Status;
                current.IsEnabled = integration.IsEnabled;
                current.IsDefault = integration.IsDefault;
                current.SupportsAsr = integration.SupportsAsr;
                current.SupportsTts = integration.SupportsTts;
                current.SupportsLlm = integration.SupportsLlm;
                current.SupportsMem = integration.SupportsMem;
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
