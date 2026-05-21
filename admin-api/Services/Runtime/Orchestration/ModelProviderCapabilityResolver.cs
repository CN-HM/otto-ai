using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Orchestration;

public class ModelProviderCapabilityResolver : IModelProviderCapabilityResolver, ITransientDependency
{
    private readonly AiAdminDbContext _db;

    public ModelProviderCapabilityResolver(AiAdminDbContext db)
    {
        _db = db;
    }

    public async Task<ModelProviderCapabilityDto?> ResolveAsync(string? profileId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(profileId))
            return null;

        var asrProfile = await _db.AiAsrProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (asrProfile != null)
        {
            var integration = await ResolveIntegrationAsync(asrProfile.IntegrationId, cancellationToken);
            return new ModelProviderCapabilityDto
            {
                ProfileId = asrProfile.Id,
                ModelType = "ASR",
                ModelCode = asrProfile.Name,
                ModelName = asrProfile.Name,
                ProviderCode = ResolveProviderCode(integration),
                ProviderType = ResolveProviderType(integration),
                ProviderName = integration?.Name ?? "ASR",
                ProviderEndpoint = asrProfile.WsUrl,
                ProviderFamily = ResolveProviderFamily(integration, "ASR"),
                SupportsStreamingInput = true,
                SupportsStreamingOutput = true,
                PreferredInvocationMode = NormalizeMode(asrProfile.InvocationMode),
                CapabilitySource = "profile_definition",
                CapabilityTags = ["speech_to_text", "transcription_streaming", "audio_input_streaming"],
                ResolutionTrace = ["capability resolved from ai_asr_profile"]
            };
        }

        var vadProfile = await _db.AiVadProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (vadProfile != null)
        {
            return new ModelProviderCapabilityDto
            {
                ProfileId = vadProfile.Id,
                ModelType = "VAD",
                ModelCode = vadProfile.Name,
                ModelName = vadProfile.Name,
                ProviderCode = "silero",
                ProviderName = "VAD",
                ProviderEndpoint = vadProfile.ModelDir,
                ProviderFamily = "local_vad",
                SupportsStreamingInput = true,
                SupportsStreamingOutput = false,
                PreferredInvocationMode = "streaming",
                CapabilitySource = "profile_definition",
                CapabilityTags = ["voice_activity_detection", "audio_input_streaming"],
                ResolutionTrace = ["capability resolved from ai_vad_profile"]
            };
        }

        var llmProfile = await _db.AiLlmProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (llmProfile != null)
        {
            var integration = await ResolveIntegrationAsync(llmProfile.IntegrationId, cancellationToken);
            return new ModelProviderCapabilityDto
            {
                ProfileId = llmProfile.Id,
                ModelType = "LLM",
                ModelCode = llmProfile.Name,
                ModelName = llmProfile.Name,
                ProviderCode = ResolveProviderCode(integration),
                ProviderType = ResolveProviderType(integration),
                ProviderName = integration?.Name ?? "OpenAI Compatible LLM",
                ProviderEndpoint = llmProfile.BaseUrl,
                ProviderFamily = ResolveProviderFamily(integration, "LLM"),
                SupportsStreamingInput = false,
                SupportsStreamingOutput = true,
                PreferredInvocationMode = NormalizeMode(llmProfile.InvocationMode),
                CapabilitySource = "profile_definition",
                CapabilityTags = ["chat_completion", "text_output_streaming"],
                ResolutionTrace = ["capability resolved from ai_llm_profile"]
            };
        }

        var ttsProfile = await _db.AiTtsProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == profileId, cancellationToken);
        if (ttsProfile != null)
        {
            var integration = await ResolveIntegrationAsync(ttsProfile.IntegrationId, cancellationToken);
            return new ModelProviderCapabilityDto
            {
                ProfileId = ttsProfile.Id,
                ModelType = "TTS",
                ModelCode = ttsProfile.Name,
                ModelName = ttsProfile.Name,
                ProviderCode = ResolveProviderCode(integration),
                ProviderType = ResolveProviderType(integration),
                ProviderName = integration?.Name ?? "TTS",
                ProviderEndpoint = ttsProfile.WsUrl,
                ProviderFamily = ResolveProviderFamily(integration, "TTS"),
                SupportsStreamingInput = true,
                SupportsStreamingOutput = true,
                PreferredInvocationMode = NormalizeMode(ttsProfile.InvocationMode),
                CapabilitySource = "profile_definition",
                CapabilityTags = ["speech_synthesis", "audio_output_streaming"],
                ResolutionTrace = ["capability resolved from ai_tts_profile"]
            };
        }

        throw new InvalidOperationException("Error:ProfileNotFound");
    }

    private static string NormalizeMode(string? mode)
    {
        return string.Equals(mode, "streaming", StringComparison.OrdinalIgnoreCase)
            ? "streaming"
            : "non_streaming";
    }

    private async Task<AiProviderIntegration?> ResolveIntegrationAsync(string? integrationId, CancellationToken cancellationToken)
    {
        if (string.IsNullOrWhiteSpace(integrationId))
            return null;

        return await _db.AiProviderIntegrations.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == integrationId && x.IsEnabled && x.Status == "active", cancellationToken);
    }

    private static string? ResolveProviderCode(AiProviderIntegration? integration)
    {
        return NormalizeOptional(integration?.ProviderCode);
    }

    private static ProviderType? ResolveProviderType(AiProviderIntegration? integration)
    {
        return integration?.ProviderType;
    }

    private static string? ResolveProviderFamily(AiProviderIntegration? integration, string stage)
    {
        return integration?.ProviderType switch
        {
            ProviderType.Ark => "openai_compatible",
            ProviderType.DoubaoSpeech => "doubao_speech_ws",
            ProviderType.DashScope when string.Equals(stage, "LLM", StringComparison.OrdinalIgnoreCase) => "openai_compatible",
            ProviderType.DashScope => "dashscope",
            _ => null
        };
    }

    private static string? NormalizeOptional(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
