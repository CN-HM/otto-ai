using System.Text.Json;
using AiAdmin.Services.AgentRoles;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Orchestration;

public class ConversationOrchestrationService : IConversationOrchestrationService, ITransientDependency
{
    private static readonly List<string> BaselineNodes =
    [
        "ble_blufi_provisioning",
        "device_credential_bootstrap",
        "mqtt_connect_hello",
        "udp_audio_uplink",
        "admin_api_session_orchestration",
        PipelineStageTypeConverter.ToCloudNodeValue(PipelineStageType.Asr),
        PipelineStageTypeConverter.ToCloudNodeValue(PipelineStageType.Llm),
        PipelineStageTypeConverter.ToCloudNodeValue(PipelineStageType.Tts),
        "mqtt_signaling_and_udp_downlink"
    ];

    private readonly AgentRoleRuntimeResolver _agentRoleRuntimeResolver;
    private readonly IModelProviderCapabilityResolver _modelProviderCapabilityResolver;

    public ConversationOrchestrationService(
        AgentRoleRuntimeResolver agentRoleRuntimeResolver,
        IModelProviderCapabilityResolver modelProviderCapabilityResolver)
    {
        _agentRoleRuntimeResolver        = agentRoleRuntimeResolver;
        _modelProviderCapabilityResolver = modelProviderCapabilityResolver;
    }

    public async Task<ConversationOrchestrationPlanDto> BuildPlanAsync(ConversationOrchestrationRequestDto request,
        CancellationToken cancellationToken = default)
    {
        var agentRole = await _agentRoleRuntimeResolver.ResolveAsync(request.AgentRoleId,
            request.AgentRoleCode,
            request.AgentRoleReleaseId,
            cancellationToken);

        var requestedInvocationMode = NormalizeRequestedMode(request.RequestedInvocationMode,
            request.PreferStreaming,
            agentRole.PreferredInvocationMode);
        var fallbackMode            = NormalizeMode(agentRole.FallbackMode);
        var preferredInvocationMode = NormalizeMode(agentRole.PreferredInvocationMode);
        var pipelineConfig = PipelineRuntimeConfig.Default(null);
        var effectiveVadProfileId = ResolveProfileId(request.VadProfileId,
            agentRole.VadProfileId,
            pipelineConfig.IsStageEnabled(PipelineStageType.Vad));
        var effectiveAsrProfileId = ResolveProfileId(request.AsrProfileId,
            agentRole.AsrProfileId,
            pipelineConfig.IsStageEnabled(PipelineStageType.Asr));
        var effectiveLlmProfileId = ResolveProfileId(request.LlmProfileId,
            agentRole.LlmProfileId,
            pipelineConfig.IsStageEnabled(PipelineStageType.Llm));
        var effectiveTtsProfileId = ResolveProfileId(request.TtsProfileId,
            agentRole.TtsProfileId,
            pipelineConfig.IsStageEnabled(PipelineStageType.Tts));
        var firstPacketTimeoutMs    = agentRole.FirstPacketTimeoutMs;
        var streamIdleTimeoutMs     = agentRole.StreamIdleTimeoutMs;

        var vadCapability = await _modelProviderCapabilityResolver.ResolveAsync(effectiveVadProfileId,
            cancellationToken);
        var asrCapability = await _modelProviderCapabilityResolver.ResolveAsync(effectiveAsrProfileId,
            cancellationToken);
        var llmCapability = await _modelProviderCapabilityResolver.ResolveAsync(effectiveLlmProfileId,
            cancellationToken);
        var ttsCapability = await _modelProviderCapabilityResolver.ResolveAsync(effectiveTtsProfileId,
            cancellationToken);

        var plan = new ConversationOrchestrationPlanDto
        {
            AgentRoleId             = agentRole.Id,
            AgentRoleCode           = agentRole.Code,
            AgentRoleName           = agentRole.DisplayName ?? agentRole.Name,
            AgentRoleVersion        = agentRole.CurrentVersion,
            AgentRoleReleaseId      = agentRole.CurrentReleaseId,
            AgentRoleConfigSource   = agentRole.RuntimeConfigSource,
            RequestedInvocationMode = requestedInvocationMode,
            EffectiveInvocationMode = requestedInvocationMode,
            FallbackMode            = fallbackMode,
            BaselineNodes           = BaselineNodes.ToList(),
            EnabledStages           = pipelineConfig.EnabledStages.ToList(),
            DisabledStages          = pipelineConfig.DisabledStages.ToList(),
            Vad = BuildInvocationProfile(PipelineStageType.Vad,
                vadCapability,
                requestedInvocationMode,
                fallbackMode,
                preferredInvocationMode,
                firstPacketTimeoutMs,
                streamIdleTimeoutMs,
                out var vadWarning),
            Asr = BuildInvocationProfile(PipelineStageType.Asr,
                asrCapability,
                requestedInvocationMode,
                fallbackMode,
                preferredInvocationMode,
                firstPacketTimeoutMs,
                streamIdleTimeoutMs,
                out var asrWarning),
            Llm = BuildInvocationProfile(PipelineStageType.Llm,
                llmCapability,
                requestedInvocationMode,
                fallbackMode,
                preferredInvocationMode,
                firstPacketTimeoutMs,
                streamIdleTimeoutMs,
                out var llmWarning),
            Tts = BuildInvocationProfile(PipelineStageType.Tts,
                ttsCapability,
                requestedInvocationMode,
                fallbackMode,
                preferredInvocationMode,
                firstPacketTimeoutMs,
                streamIdleTimeoutMs,
                out var ttsWarning)
        };

        plan.ProviderRoute = BuildProviderRoute(plan.Asr,
            plan.Llm,
            plan.Tts);
        plan.UsesMixedProviders = plan.ProviderRoute
            .Select(x => x[(x.IndexOf(':') + 1)..].Trim())
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .Count() > 1;

        AddWarning(plan.Warnings,
            vadWarning);
        AddWarning(plan.Warnings,
            asrWarning);
        AddWarning(plan.Warnings,
            llmWarning);
        AddWarning(plan.Warnings,
            ttsWarning);

        if (agentRole is { UsesPublishedSnapshot: false })
        {
            AddWarning(plan.Warnings,
                "当前智能体角色未命中已发布快照，运行时正在使用草稿配置。",
                true);
        }

        if (plan.UsesMixedProviders)
        {
            AddWarning(plan.Warnings,
                "当前编排计划使用了多供应商分段路由，ASR / LLM / TTS 可独立切换。",
                true);
        }

        if (requestedInvocationMode == "streaming"
            && ((pipelineConfig.IsStageEnabled(PipelineStageType.Asr) && plan.Asr?.InvocationMode != "streaming")
                || plan.Llm?.InvocationMode != "streaming"
                || (pipelineConfig.IsStageEnabled(PipelineStageType.Tts) && plan.Tts?.InvocationMode != "streaming")))
        {
            plan.EffectiveInvocationMode = fallbackMode;
            AddWarning(plan.Warnings,
                "部分模型未满足流式要求，已按角色回退策略降级。",
                true);
        }

        return plan;
    }

    private static ModelInvocationProfileDto? BuildInvocationProfile(
        PipelineStageType stage,
        ModelProviderCapabilityDto? capability,
        string requestedInvocationMode,
        string fallbackMode,
        string preferredInvocationMode,
        int? firstPacketTimeoutMs,
        int? streamIdleTimeoutMs,
        out string? warning)
    {
        warning = null;
        if (capability == null)
            return null;

        var stageLabel = PipelineStageTypeConverter.ToLabel(stage);
        var canStream = stage == PipelineStageType.Asr
            ? capability.SupportsStreamingInput || capability.SupportsStreamingOutput
            : capability.SupportsStreamingOutput;
        var resolvedMode = requestedInvocationMode == "streaming"
            ? canStream ? "streaming" : fallbackMode
            : "non_streaming";

        if (requestedInvocationMode == "streaming" && resolvedMode != "streaming")
        {
            warning = $"{stageLabel} Profile {capability.ModelName ?? capability.ProfileId} 不支持流式，已回退到 {fallbackMode}。";
        }

        if (requestedInvocationMode == "non_streaming" && preferredInvocationMode == "streaming" && canStream)
        {
            warning = $"{stageLabel} 模型具备流式能力，但本次请求显式选择了非流式。";
        }

        return new ModelInvocationProfileDto
        {
            Stage                   = stageLabel,
            ProfileId               = capability.ProfileId,
            ModelType               = capability.ModelType,
            ModelCode               = capability.ModelCode,
            ModelName               = capability.ModelName,
            ProviderCode            = capability.ProviderCode,
            ProviderType            = capability.ProviderType,
            ProviderName            = capability.ProviderName,
            ProviderFamily          = capability.ProviderFamily,
            InvocationMode          = resolvedMode,
            SupportsStreamingInput  = capability.SupportsStreamingInput,
            SupportsStreamingOutput = capability.SupportsStreamingOutput,
            FirstPacketTimeoutMs    = firstPacketTimeoutMs,
            StreamIdleTimeoutMs     = streamIdleTimeoutMs,
            CapabilitySource        = capability.CapabilitySource,
            CapabilityTags          = capability.CapabilityTags.ToList()
        };
    }

    private static List<string> BuildProviderRoute(params ModelInvocationProfileDto?[] profiles)
    {
        return profiles
            .Where(x => x != null)
            .Select(x => $"{x!.Stage}: {FormatProviderLabel(x)}")
            .ToList();
    }

    private static string FormatProviderLabel(ModelInvocationProfileDto profile)
    {
        if (!string.IsNullOrWhiteSpace(profile.ProviderName) && !string.IsNullOrWhiteSpace(profile.ProviderCode))
            return $"{profile.ProviderName} ({profile.ProviderCode})";
        if (!string.IsNullOrWhiteSpace(profile.ProviderName))
            return profile.ProviderName;
        if (!string.IsNullOrWhiteSpace(profile.ProviderCode))
            return profile.ProviderCode;
        return profile.ProviderFamily ?? "unknown";
    }

    private static void AddWarning(List<string> warnings, string? warning, bool allowDuplicate = false)
    {
        if (string.IsNullOrWhiteSpace(warning))
            return;
        if (allowDuplicate || !warnings.Contains(warning))
            warnings.Add(warning);
    }

    private static string? ResolveProfileId(string? requestProfileId, string? agentRoleProfileId, bool stageEnabled)
    {
        if (!stageEnabled)
            return null;
        return NormalizeValue(requestProfileId) ?? NormalizeValue(agentRoleProfileId);
    }

    private static string NormalizeRequestedMode(string? requestedInvocationMode, bool? preferStreaming,
        string preferredMode)
    {
        if (!string.IsNullOrWhiteSpace(requestedInvocationMode))
            return NormalizeMode(requestedInvocationMode);
        if (preferStreaming.HasValue)
            return preferStreaming.Value ? "streaming" : "non_streaming";
        return NormalizeMode(preferredMode);
    }

    private static string NormalizeMode(string? mode)
    {
        return string.Equals(mode,
            "streaming",
            StringComparison.OrdinalIgnoreCase)
            ? "streaming"
            : "non_streaming";
    }

    private static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private sealed class PipelineRuntimeConfig
    {
        private static readonly PipelineStageType[] StageNames = PipelineStageTypeConverter.ConversationStages;
        private readonly HashSet<PipelineStageType> _enabledStages;

        private PipelineRuntimeConfig(string? templateId, HashSet<PipelineStageType> enabledStages)
        {
            TemplateId = templateId;
            _enabledStages = enabledStages;
            EnabledStages = StageNames.Where(_enabledStages.Contains).Select(PipelineStageTypeConverter.ToLabel).ToList();
            DisabledStages = StageNames.Where(stage => !_enabledStages.Contains(stage)).Select(PipelineStageTypeConverter.ToLabel).ToList();
        }

        public string? TemplateId { get; }
        public IReadOnlyList<string> EnabledStages { get; }
        public IReadOnlyList<string> DisabledStages { get; }

        public static PipelineRuntimeConfig Default(string? templateId)
        {
            return new PipelineRuntimeConfig(templateId,
                StageNames.ToHashSet());
        }

        public static PipelineRuntimeConfig FromGraphJson(string? templateId, string? graphJson)
        {
            var config = Default(templateId);
            var normalized = NormalizeValue(graphJson);
            if (normalized == null)
                return config;

            try
            {
                using var document = JsonDocument.Parse(normalized);
                var root = document.RootElement;
                if (root.ValueKind != JsonValueKind.Object)
                    return config;

                var enabledStages = ReadEnabledStages(root);
                return new PipelineRuntimeConfig(templateId, enabledStages);
            }
            catch (JsonException)
            {
                return config;
            }
        }

        public bool IsStageEnabled(PipelineStageType stage)
        {
            return _enabledStages.Contains(stage);
        }

        private static HashSet<PipelineStageType> ReadEnabledStages(JsonElement root)
        {
            if (!root.TryGetProperty("enabledStages", out var enabledElement) || enabledElement.ValueKind != JsonValueKind.Array)
                return StageNames.ToHashSet();

            var result = new HashSet<PipelineStageType>();
            foreach (var item in enabledElement.EnumerateArray())
            {
                if (item.ValueKind != JsonValueKind.String)
                    continue;
                if (PipelineStageTypeConverter.TryParse(item.GetString(), out var stage))
                    result.Add(stage);
            }

            return result;
        }
    }
}
