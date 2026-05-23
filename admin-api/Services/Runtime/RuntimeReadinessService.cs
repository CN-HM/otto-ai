using System.Diagnostics.CodeAnalysis;
using AiAdmin.Config;
using AiAdmin.Data;
using AiAdmin.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public sealed record RuntimeReadinessSnapshotDto(
    bool Ready,
    string Severity,
    int PassedCheckCount,
    int WarningCheckCount,
    int FailedCheckCount,
    IReadOnlyList<RuntimeReadinessCheckDto> Checks);

public sealed record RuntimeReadinessCheckDto(
    string Key,
    string Title,
    bool Ready,
    bool Blocking,
    string Severity,
    string Summary,
    IReadOnlyList<string> Details);

public class RuntimeReadinessService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IoTRuntimeOptions _runtimeOptions;

    public RuntimeReadinessService(
        AiAdminDbContext db,
        IOptions<IoTRuntimeOptions> runtimeOptions)
    {
        _db = db;
        _runtimeOptions = runtimeOptions.Value;
    }

    public async Task<RuntimeReadinessSnapshotDto> GetSnapshotAsync(CancellationToken cancellationToken = default)
    {
        var asrProfiles = await _db.AiAsrProfiles.AsNoTracking().Where(x => x.IsEnabled && x.Status == "active").ToListAsync(cancellationToken);
        var vadProfiles = await _db.AiVadProfiles.AsNoTracking().Where(x => x.IsEnabled && x.Status == "active").ToListAsync(cancellationToken);
        var llmProfiles = await _db.AiLlmProfiles.AsNoTracking().Where(x => x.IsEnabled && x.Status == "active").ToListAsync(cancellationToken);
        var ttsProfiles = await _db.AiTtsProfiles.AsNoTracking().Where(x => x.IsEnabled && x.Status == "active").ToListAsync(cancellationToken);
        var activeIntegrations = await _db.AiProviderIntegrations.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .ToListAsync(cancellationToken);
        var agentRoles = await _db.AiAgentRoles.AsNoTracking()
            .Where(x => x.Status == "active")
            .ToListAsync(cancellationToken);
        var devices = await _db.AiDevices.AsNoTracking().ToListAsync(cancellationToken);
        var activeIntegrationMap = activeIntegrations.ToDictionary(x => x.Id, StringComparer.OrdinalIgnoreCase);

        var runtimeSwitchCheck = BuildRuntimeSwitchCheck();
        var modelPathAssessment = AssessModelPathReadiness(asrProfiles, vadProfiles, llmProfiles, ttsProfiles, activeIntegrationMap);
        var agentRoleRouteAssessment = AssessAgentRoleRouteReadiness(agentRoles, modelPathAssessment.ReadyConfigIdsByType);
        var deviceProvisioningCheck = BuildDeviceProvisioningCheck(devices, agentRoleRouteAssessment.ReadyAgentRoleIds);

        var checks = new[]
        {
            runtimeSwitchCheck,
            modelPathAssessment.Check,
            agentRoleRouteAssessment.Check,
            deviceProvisioningCheck
        };

        var failedCheckCount = checks.Count(check => check.Blocking && !check.Ready);
        var warningCheckCount = checks.Count(check => !check.Blocking && !check.Ready);
        var passedCheckCount = checks.Length - failedCheckCount - warningCheckCount;
        var ready = failedCheckCount == 0;
        var severity = ready
            ? warningCheckCount > 0 ? "warn" : "success"
            : "danger";

        return new RuntimeReadinessSnapshotDto(
            ready,
            severity,
            passedCheckCount,
            warningCheckCount,
            failedCheckCount,
            checks);
    }

    private RuntimeReadinessCheckDto BuildRuntimeSwitchCheck()
    {
        var ready = _runtimeOptions.Enabled;
        var details = new List<string>
        {
            $"MQTT {(_runtimeOptions.EnableMqtt ? "开启" : "关闭")}",
            $"UDP {(_runtimeOptions.EnableUdp ? "开启" : "关闭")}",
            $"WebSocket {(_runtimeOptions.EnableDeviceWebSocket ? "开启" : "关闭")}",
            $"切句超时 {_runtimeOptions.LocalSpeechIdleTimeoutMs} ms",
            $"MQTT 端口 {_runtimeOptions.MqttPort} / UDP 端口 {_runtimeOptions.UdpPort}"
        };

        return new RuntimeReadinessCheckDto(
            "runtime-switch",
            "运行时总开关",
            ready,
            true,
            ready ? "success" : "secondary",
            ready ? "IoT Runtime 已启用，可继续检查主路径前置。" : "IoT Runtime 当前关闭，设备侧主路径不会进入本地会话执行。",
            details);
    }

    private static ModelPathAssessment AssessModelPathReadiness(
        IReadOnlyList<AiAsrProfile> asrProfiles,
        IReadOnlyList<AiVadProfile> vadProfiles,
        IReadOnlyList<AiLlmProfile> llmProfiles,
        IReadOnlyList<AiTtsProfile> ttsProfiles,
        IReadOnlyDictionary<string, AiProviderIntegration> activeIntegrationMap)
    {
        var readyConfigIdsByType = new Dictionary<PipelineStageType, HashSet<string>>();
        var details = new List<string>();
        var readyAsrIds = asrProfiles.Where(x => IsAsrReady(x, activeIntegrationMap)).Select(x => x.Id).ToHashSet(StringComparer.OrdinalIgnoreCase);
        var readyVadIds = vadProfiles.Where(IsVadReady).Select(x => x.Id).ToHashSet(StringComparer.OrdinalIgnoreCase);
        var readyLlmIds = llmProfiles.Where(x => IsLlmReady(x, activeIntegrationMap)).Select(x => x.Id).ToHashSet(StringComparer.OrdinalIgnoreCase);
        var readyTtsIds = ttsProfiles.Where(x => IsTtsReady(x, activeIntegrationMap)).Select(x => x.Id).ToHashSet(StringComparer.OrdinalIgnoreCase);

        readyConfigIdsByType[PipelineStageType.Asr] = readyAsrIds;
        readyConfigIdsByType[PipelineStageType.Vad] = readyVadIds;
        readyConfigIdsByType[PipelineStageType.Llm] = readyLlmIds;
        readyConfigIdsByType[PipelineStageType.Tts] = readyTtsIds;

        details.Add($"ASR 基础就绪 {readyAsrIds.Count} / 已启用 {asrProfiles.Count}");
        details.Add($"VAD 基础就绪 {readyVadIds.Count} / 已启用 {vadProfiles.Count}");
        details.Add($"LLM 基础就绪 {readyLlmIds.Count} / 已启用 {llmProfiles.Count}");
        details.Add($"TTS 基础就绪 {readyTtsIds.Count} / 已启用 {ttsProfiles.Count}");

        var ready = readyLlmIds.Count > 0;

        var check = new RuntimeReadinessCheckDto(
            "model-path-readiness",
            "模型主路径前置",
            ready,
            true,
            ready ? "success" : "danger",
            ready ? "至少有一组基础字段完整的已启用 LLM 配置；VAD / ASR / TTS 是否必需由 Pipeline 节点开关决定。"
                : "缺少基础字段完整的已启用 LLM Profile，无法生成回复。",
            details);

        return new ModelPathAssessment(check, readyConfigIdsByType);
    }

    private AgentRoleRouteAssessment AssessAgentRoleRouteReadiness(
        IReadOnlyList<AiAgentRole> agentRoles,
        IReadOnlyDictionary<PipelineStageType, HashSet<string>> readyConfigIdsByType)
    {
        var readyAgentRoleIds = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var missingVadCount = 0;
        var missingAsrCount = 0;
        var missingLlmCount = 0;
        var missingTtsCount = 0;
        var invalidRouteCount = 0;

        foreach (var agentRole in agentRoles)
        {
            var pipelineConfig = ReadinessPipelineConfig.Default;
            var vadProfileId = pipelineConfig.IsStageEnabled(PipelineStageType.Vad) ? agentRole.VadProfileId : null;
            var asrProfileId = pipelineConfig.IsStageEnabled(PipelineStageType.Asr) ? agentRole.AsrProfileId : null;
            var llmProfileId = pipelineConfig.IsStageEnabled(PipelineStageType.Llm) ? agentRole.LlmProfileId : null;
            var ttsProfileId = pipelineConfig.IsStageEnabled(PipelineStageType.Tts) ? agentRole.TtsProfileId : null;

            var hasVad = !pipelineConfig.IsStageEnabled(PipelineStageType.Vad) || HasReadyConfig(readyConfigIdsByType, PipelineStageType.Vad, vadProfileId);
            var hasAsr = !pipelineConfig.IsStageEnabled(PipelineStageType.Asr) || HasReadyConfig(readyConfigIdsByType, PipelineStageType.Asr, asrProfileId);
            var hasLlm = pipelineConfig.IsStageEnabled(PipelineStageType.Llm) && HasReadyConfig(readyConfigIdsByType, PipelineStageType.Llm, llmProfileId);
            var hasTts = !pipelineConfig.IsStageEnabled(PipelineStageType.Tts) || HasReadyConfig(readyConfigIdsByType, PipelineStageType.Tts, ttsProfileId);

            if (pipelineConfig.IsStageEnabled(PipelineStageType.Vad) && !HasMeaningfulId(vadProfileId))
                missingVadCount += 1;
            if (pipelineConfig.IsStageEnabled(PipelineStageType.Asr) && !HasMeaningfulId(asrProfileId))
                missingAsrCount += 1;
            if (pipelineConfig.IsStageEnabled(PipelineStageType.Llm) && !HasMeaningfulId(llmProfileId))
                missingLlmCount += 1;
            if (pipelineConfig.IsStageEnabled(PipelineStageType.Tts) && !HasMeaningfulId(ttsProfileId))
                missingTtsCount += 1;

            if (hasVad && hasAsr && hasLlm && hasTts)
            {
                readyAgentRoleIds.Add(agentRole.Id);
            }
            else if (HasMeaningfulId(vadProfileId) || HasMeaningfulId(asrProfileId) || HasMeaningfulId(llmProfileId) || HasMeaningfulId(ttsProfileId))
            {
                invalidRouteCount += 1;
            }
        }

        var ready = readyAgentRoleIds.Count > 0;
        var details = new List<string>
        {
            $"完整路由智能体角色 {readyAgentRoleIds.Count} / 总数 {agentRoles.Count}",
            $"缺 VAD {missingVadCount} / 缺 ASR {missingAsrCount} / 缺 LLM {missingLlmCount} / 缺 TTS {missingTtsCount}",
            $"引用未就绪模型的智能体角色 {invalidRouteCount}"
        };

        var check = new RuntimeReadinessCheckDto(
            "agent-role-route-readiness",
            "智能体角色主路径装配",
            ready,
            true,
            ready ? "success" : "danger",
            ready ? "至少有一个智能体角色可组成当前 Pipeline 启用节点所需的主路径。"
                : "还没有智能体角色绑定到当前 Pipeline 启用节点所需且基础就绪的配置。",
            details);

        return new AgentRoleRouteAssessment(check, readyAgentRoleIds);
    }

    private static RuntimeReadinessCheckDto BuildDeviceProvisioningCheck(IReadOnlyList<AiDevice> devices, ISet<string> readyAgentRoleIds)
    {
        var issuedCredentialCount = devices.Count(device => HasMeaningfulId(device.CredentialId) && HasMeaningfulId(device.CredentialSecret));
        var boundAgentRoleCount = devices.Count(device => HasMeaningfulId(device.AgentRoleId));
        var readyDeviceCount = devices.Count(device => HasMeaningfulId(device.CredentialId)
            && HasMeaningfulId(device.CredentialSecret)
            && HasMeaningfulId(device.AgentRoleId)
            && readyAgentRoleIds.Contains(device.AgentRoleId!));
        var ready = readyDeviceCount > 0;

        return new RuntimeReadinessCheckDto(
            "device-provisioning",
            "设备联调前置",
            ready,
            false,
            ready ? "success" : "warn",
            ready
                ? "已存在可直接联调的发证设备。"
                : "尚未发现已发证且绑定到完整对话主路径的设备，可继续从设备配网或设备绑定收口。",
            [
                $"已发证设备 {issuedCredentialCount} / 总数 {devices.Count}",
                $"已绑 AgentRole 设备 {boundAgentRoleCount}",
                $"可直接联调设备 {readyDeviceCount}"
            ]);
    }

    private static bool IsAsrReady(AiAsrProfile profile, IReadOnlyDictionary<string, AiProviderIntegration> activeIntegrationMap)
    {
        if (!TryResolveRequiredIntegration(profile.IntegrationId, activeIntegrationMap, out var integration))
            return false;

        if (!integration.SupportsAsr)
            return false;

        var apiKey = integration.ApiKey;
        var accessToken = integration.AccessToken;
        var appId = integration.AppId;
        var hasCredential = HasMeaningfulId(apiKey) || (HasMeaningfulId(accessToken) && HasMeaningfulId(appId));
        return HasMeaningfulId(profile.WsUrl) && HasMeaningfulId(profile.ResourceId) && hasCredential;
    }

    private static bool IsVadReady(AiVadProfile profile)
    {
        return HasMeaningfulId(profile.ModelDir);
    }

    private static bool IsLlmReady(AiLlmProfile profile, IReadOnlyDictionary<string, AiProviderIntegration> activeIntegrationMap)
    {
        if (!TryResolveRequiredIntegration(profile.IntegrationId, activeIntegrationMap, out var integration))
            return false;

        if (!integration.SupportsLlm)
            return false;

        var apiKey = integration.ApiKey;
        return HasMeaningfulId(profile.BaseUrl) && HasMeaningfulId(profile.Model) && HasMeaningfulId(apiKey);
    }

    private static bool IsTtsReady(AiTtsProfile profile, IReadOnlyDictionary<string, AiProviderIntegration> activeIntegrationMap)
    {
        if (!TryResolveRequiredIntegration(profile.IntegrationId, activeIntegrationMap, out var integration))
            return false;

        if (!integration.SupportsTts)
            return false;

        var apiKey = integration.ApiKey;
        var accessToken = integration.AccessToken;
        var appId = integration.AppId;
        var hasCredential = HasMeaningfulId(apiKey) || (HasMeaningfulId(accessToken) && HasMeaningfulId(appId));
        return HasMeaningfulId(profile.WsUrl) && HasMeaningfulId(profile.ResourceId) && hasCredential;
    }

    private static bool TryResolveRequiredIntegration(
        string integrationId,
        IReadOnlyDictionary<string, AiProviderIntegration> activeIntegrationMap,
        [NotNullWhen(true)] out AiProviderIntegration? integration)
    {
        var normalizedIntegrationId = NormalizeValue(integrationId);
        if (normalizedIntegrationId == null)
        {
            integration = null;
            return false;
        }

        if (!activeIntegrationMap.TryGetValue(normalizedIntegrationId, out var resolvedIntegration))
        {
            integration = null;
            return false;
        }

        integration = resolvedIntegration;
        return true;
    }

    private static bool HasReadyConfig(
        IReadOnlyDictionary<PipelineStageType, HashSet<string>> readyConfigIdsByType,
        PipelineStageType modelType,
        string? profileId)
    {
        var normalizedId = NormalizeValue(profileId);
        return !string.IsNullOrWhiteSpace(normalizedId)
            && readyConfigIdsByType.TryGetValue(modelType, out var readyIds)
            && readyIds.Contains(normalizedId);
    }

    private static bool HasMeaningfulId(string? value)
    {
        return !string.IsNullOrWhiteSpace(NormalizeValue(value));
    }

    private static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private sealed record ModelPathAssessment(
        RuntimeReadinessCheckDto Check,
        IReadOnlyDictionary<PipelineStageType, HashSet<string>> ReadyConfigIdsByType);

    private sealed record AgentRoleRouteAssessment(
        RuntimeReadinessCheckDto Check,
        ISet<string> ReadyAgentRoleIds);

    private sealed class ReadinessPipelineConfig
    {
        private static readonly PipelineStageType[] StageNames = PipelineStageTypeConverter.ConversationStages;
        private readonly HashSet<PipelineStageType> _enabledStages;

        private ReadinessPipelineConfig(HashSet<PipelineStageType> enabledStages)
        {
            _enabledStages = enabledStages;
        }

        public static ReadinessPipelineConfig Default { get; } = new(StageNames.ToHashSet());

        public bool IsStageEnabled(PipelineStageType stage)
        {
            return _enabledStages.Contains(stage);
        }
    }
}
