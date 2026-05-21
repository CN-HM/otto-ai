using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Execution.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution;

public class ModelExecutionConfigResolver : IModelExecutionConfigResolver, ITransientDependency
{
    private readonly AiAdminDbContext _db;

    public ModelExecutionConfigResolver(AiAdminDbContext db)
    {
        _db = db;
    }

    public async Task<ModelExecutionConfigDto> ResolveAsync(string profileId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(profileId))
            throw new InvalidOperationException("Profile 不能为空");

        var asrProfile = await _db.AiAsrProfiles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (asrProfile != null)
            return await BuildAsrConfigAsync(asrProfile, cancellationToken);

        var vadProfile = await _db.AiVadProfiles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (vadProfile != null)
            return BuildVadConfig(vadProfile);

        var llmProfile = await _db.AiLlmProfiles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (llmProfile != null)
            return await BuildLlmConfigAsync(llmProfile, cancellationToken);

        var ttsProfile = await _db.AiTtsProfiles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (ttsProfile != null)
            return await BuildTtsConfigAsync(ttsProfile, cancellationToken);

        throw new InvalidOperationException("Error:ProfileNotFound");
    }

    private async Task<ModelExecutionConfigDto> BuildAsrConfigAsync(AiAsrProfile profile, CancellationToken cancellationToken)
    {
        var integration = await ResolveRequiredIntegrationAsync(profile.IntegrationId, cancellationToken);
        EnsureIntegrationSupportsScope(integration, ProviderScope.Asr);
        var providerCode = ResolveProviderCode(integration);
        var providerType = integration.ProviderType;
        var providerTypeValue = ProviderTypeConverter.ToStorageValue(providerType);
        var config = new JsonObject
        {
            ["type"] = providerCode,
            ["provider_type"] = providerTypeValue,
            ["ws_url"] = profile.WsUrl,
            ["resource_id"] = profile.ResourceId,
            ["api_key"] = integration.ApiKey,
            ["appid"] = integration.AppId,
            ["access_token"] = integration.AccessToken,
            ["audio_format"] = profile.AudioFormat,
            ["codec"] = profile.Codec,
            ["sample_rate"] = profile.SampleRate,
            ["bits"] = profile.Bits,
            ["channels"] = profile.Channels,
            ["chunk_duration_ms"] = profile.ChunkDurationMs,
            ["chunk_size_bytes"] = profile.ChunkSizeBytes,
            ["language"] = profile.Language,
            ["context"] = profile.Context,
            ["enable_nonstream"] = profile.EnableNonstream
        };

        MergeConfigJson(config, profile.ConfigJson);

        return new ModelExecutionConfigDto
        {
            ProfileId = profile.Id,
            ModelType = "ASR",
            ModelCode = profile.Name,
            ModelName = profile.Name,
            ProviderCode = providerCode,
            ProviderType = providerType,
            ProviderName = integration.Name,
            ProviderEndpoint = profile.WsUrl,
            ConfigObject = RemoveNulls(config),
            RawConfigJson = RemoveNulls(config).ToJsonString()
        };
    }

    private static ModelExecutionConfigDto BuildVadConfig(AiVadProfile profile)
    {
        const string vadProviderCode = "silero";
        var config = new JsonObject
        {
            ["type"] = vadProviderCode,
            ["model_dir"] = profile.ModelDir,
            ["threshold"] = profile.Threshold,
            ["min_silence_duration_ms"] = profile.MinSilenceDurationMs,
            ["speech_pad_ms"] = profile.SpeechPadMs
        };

        return new ModelExecutionConfigDto
        {
            ProfileId = profile.Id,
            ModelType = "VAD",
            ModelCode = profile.Name,
            ModelName = profile.Name,
            ProviderCode = vadProviderCode,
            ProviderName = "Silero VAD",
            ProviderEndpoint = profile.ModelDir,
            ConfigObject = RemoveNulls(config),
            RawConfigJson = RemoveNulls(config).ToJsonString()
        };
    }

    private async Task<ModelExecutionConfigDto> BuildLlmConfigAsync(AiLlmProfile profile, CancellationToken cancellationToken)
    {
        var integration = await ResolveRequiredIntegrationAsync(profile.IntegrationId, cancellationToken);
        EnsureIntegrationSupportsScope(integration, ProviderScope.Llm);
        var providerCode = ResolveProviderCode(integration);
        var providerType = integration.ProviderType;
        var providerTypeValue = ProviderTypeConverter.ToStorageValue(providerType);
        var baseUrl = NormalizeOptional(profile.BaseUrl);
        var config = new JsonObject
        {
            ["type"] = providerCode,
            ["provider_type"] = providerTypeValue,
            ["base_url"] = baseUrl,
            ["api_key"] = integration.ApiKey,
            ["model"] = profile.Model,
            ["model_name"] = profile.Model,
            ["organization"] = integration.Organization,
            ["temperature"] = profile.Temperature,
            ["max_tokens"] = profile.MaxTokens,
            ["top_p"] = profile.TopP
        };

        return new ModelExecutionConfigDto
        {
            ProfileId = profile.Id,
            ModelType = "LLM",
            ModelCode = profile.Name,
            ModelName = profile.Name,
            ProviderCode = providerCode,
            ProviderType = providerType,
            ProviderName = integration.Name,
            ProviderEndpoint = baseUrl,
            ConfigObject = RemoveNulls(config),
            RawConfigJson = RemoveNulls(config).ToJsonString()
        };
    }

    private async Task<ModelExecutionConfigDto> BuildTtsConfigAsync(AiTtsProfile profile, CancellationToken cancellationToken)
    {
        var integration = await ResolveRequiredIntegrationAsync(profile.IntegrationId, cancellationToken);
        EnsureIntegrationSupportsScope(integration, ProviderScope.Tts);
        var providerCode = ResolveProviderCode(integration);
        var providerType = integration.ProviderType;
        var providerTypeValue = ProviderTypeConverter.ToStorageValue(providerType);
        var config = new JsonObject
        {
            ["type"] = providerCode,
            ["provider_type"] = providerTypeValue,
            ["ws_url"] = profile.WsUrl,
            ["resource_id"] = profile.ResourceId,
            ["api_key"] = integration.ApiKey,
            ["appid"] = integration.AppId,
            ["access_token"] = integration.AccessToken,
            ["encoding"] = profile.Encoding,
            ["sample_rate"] = profile.SampleRate,
            ["speech_rate"] = profile.SpeechRate,
            ["loudness_rate"] = profile.LoudnessRate,
            ["model"] = profile.Model
        };

        MergeConfigJson(config, profile.ConfigJson);

        return new ModelExecutionConfigDto
        {
            ProfileId = profile.Id,
            ModelType = "TTS",
            ModelCode = profile.Name,
            ModelName = profile.Name,
            ProviderCode = providerCode,
            ProviderType = providerType,
            ProviderName = integration.Name,
            ProviderEndpoint = profile.WsUrl,
            ConfigObject = RemoveNulls(config),
            RawConfigJson = RemoveNulls(config).ToJsonString()
        };
    }

    private async Task<AiProviderIntegration> ResolveRequiredIntegrationAsync(string integrationId, CancellationToken cancellationToken)
    {
        var normalizedIntegrationId = NormalizeOptional(integrationId)
            ?? throw new InvalidOperationException("Profile 未绑定 Provider Integration");

        var integration = await _db.AiProviderIntegrations.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == normalizedIntegrationId && x.IsEnabled && x.Status == "active", cancellationToken);
        if (integration == null)
        {
            throw new InvalidOperationException("Error:ProviderIntegrationUnavailable");
        }

        return integration;
    }

    private static string ResolveProviderCode(AiProviderIntegration integration)
    {
        return ProviderTypeConverter.ToStorageValue(integration.ProviderType);
    }

    private static void EnsureIntegrationSupportsScope(AiProviderIntegration integration, ProviderScope scope)
    {
        var supported = scope switch
        {
            ProviderScope.Asr => integration.SupportsAsr,
            ProviderScope.Tts => integration.SupportsTts,
            ProviderScope.Llm => integration.SupportsLlm,
            ProviderScope.Emb => integration.SupportsMem,
            _ => throw new InvalidOperationException($"不支持的 ProviderScope：{scope}")
        };
        if (!supported)
        {
            throw new InvalidOperationException($"Provider Integration 未开启 {ProviderScopeConverter.ToLabel(scope)} 应用范围");
        }
    }

    private static void MergeConfigJson(JsonObject target, string? configJson)
    {
        if (string.IsNullOrWhiteSpace(configJson))
            return;

        try
        {
            var parsed = JsonNode.Parse(configJson);
            if (parsed is JsonObject obj)
            {
                foreach (var prop in obj)
                {
                    target[prop.Key] = prop.Value?.DeepClone();
                }
            }
        }
        catch (JsonException)
        {
        }
    }

    private static JsonObject RemoveNulls(JsonObject source)
    {
        var result = new JsonObject();
        foreach (var item in source)
        {
            if (item.Value != null)
                result[item.Key] = item.Value.DeepClone();
        }

        return result;
    }

    private static string? NormalizeOptional(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? null : value.Trim();
    }
}
