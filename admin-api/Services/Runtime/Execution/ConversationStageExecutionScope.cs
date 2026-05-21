using System.Diagnostics;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.Extensions.Logging;

namespace AiAdmin.Services.Runtime.Execution;

internal sealed class ConversationStageExecutionScope
{
    private readonly ConversationOrchestrationRequestDto _orchestrationRequest;
    private readonly string _stage;
    private readonly ConversationRuntimeTraceAggregator _traceAggregator;
    private readonly ILogger _logger;
    private readonly Stopwatch _stopwatch = Stopwatch.StartNew();

    public ConversationStageExecutionScope(
        ConversationOrchestrationRequestDto orchestrationRequest,
        string stage,
        ConversationRuntimeTraceAggregator traceAggregator,
        ILogger logger)
    {
        _orchestrationRequest = orchestrationRequest;
        _stage = stage;
        _traceAggregator = traceAggregator;
        _logger = logger;
    }

    public StageExecutionTraceDto? Trace { get; private set; }

    public void EnsureTrace(ConversationOrchestrationPlanDto? plan = null, ModelInvocationProfileDto? profile = null)
    {
        Trace ??= CreateTrace(_orchestrationRequest, _stage, plan, profile);
    }

    public void CompleteSuccess(string? actualInvocationMode)
    {
        var trace = Trace ?? throw new InvalidOperationException("阶段执行 trace 尚未初始化");
        trace.Succeeded = true;
        trace.DurationMs = _stopwatch.ElapsedMilliseconds;
        trace.ActualInvocationMode = NormalizeMode(actualInvocationMode);
        trace.FallbackReason = ResolveFallbackReason(trace);
        trace.FailureReason = null;
        _traceAggregator.RecordStageTrace(trace);
        LogStageSuccess(trace);
    }

    public void CompleteFailure(Exception ex, string failureReason, ConversationOrchestrationPlanDto? plan, ModelInvocationProfileDto? profile)
    {
        EnsureTrace(plan, profile);
        var trace = Trace!;
        trace.Succeeded = false;
        trace.DurationMs = _stopwatch.ElapsedMilliseconds;
        trace.ActualInvocationMode = trace.PlannedInvocationMode;
        trace.FallbackReason ??= ResolveFallbackReason(trace);
        trace.FailureReason = NormalizeValue(failureReason);
        trace.ErrorCode = ex.GetType().Name;
        trace.ErrorMessage = ex.Message;
        ex.Data[ConversationRuntimeObservationCodes.ExceptionDataKeys.StageTrace] = trace;
        _traceAggregator.RecordStageTrace(trace);
        LogStageFailure(trace, ex);
    }

    private static StageExecutionTraceDto CreateTrace(
        ConversationOrchestrationRequestDto orchestrationRequest,
        string stage,
        ConversationOrchestrationPlanDto? plan = null,
        ModelInvocationProfileDto? profile = null)
    {
        return new StageExecutionTraceDto
        {
            SessionId = NormalizeValue(orchestrationRequest.SessionId),
            DeviceId = NormalizeValue(orchestrationRequest.DeviceId),
            AgentRoleId = NormalizeValue(plan?.AgentRoleId ?? orchestrationRequest.AgentRoleId),
            AgentRoleCode = NormalizeValue(plan?.AgentRoleCode ?? orchestrationRequest.AgentRoleCode),
            AgentRoleVersion = NormalizeValue(plan?.AgentRoleVersion),
            AgentRoleReleaseId = NormalizeValue(plan?.AgentRoleReleaseId),
            AgentRoleConfigSource = NormalizeValue(plan?.AgentRoleConfigSource),
            Stage = stage,
            RequestedInvocationMode = NormalizeMode(plan?.RequestedInvocationMode ?? orchestrationRequest.RequestedInvocationMode),
            PlannedInvocationMode = NormalizeMode(profile?.InvocationMode ?? plan?.RequestedInvocationMode ?? orchestrationRequest.RequestedInvocationMode),
            ActualInvocationMode = NormalizeMode(profile?.InvocationMode ?? plan?.RequestedInvocationMode ?? orchestrationRequest.RequestedInvocationMode),
            FallbackMode = NormalizeMode(plan?.FallbackMode),
            ProfileId = NormalizeValue(profile?.ProfileId),
            ProviderCode = NormalizeValue(profile?.ProviderCode),
            ProviderType = profile?.ProviderType,
            ProviderName = NormalizeValue(profile?.ProviderName),
            ProviderFamily = NormalizeValue(profile?.ProviderFamily),
            CapabilitySource = NormalizeValue(profile?.CapabilitySource),
            CapabilityTags = profile?.CapabilityTags.ToList() ?? []
        };
    }

    private static string? ResolveFallbackReason(StageExecutionTraceDto trace)
    {
        if (trace.RequestedInvocationMode == "streaming" && trace.PlannedInvocationMode != "streaming")
            return ConversationRuntimeObservationCodes.FallbackReasons.CapabilityDowngrade;
        if (trace.ActualInvocationMode != trace.PlannedInvocationMode)
            return ConversationRuntimeObservationCodes.FallbackReasons.RuntimeModeOverride;
        return null;
    }

    private void LogStageSuccess(StageExecutionTraceDto trace)
    {
        _logger.LogInformation(
            "Conversation stage succeeded. SessionId={SessionId} Stage={Stage} RequestedMode={RequestedInvocationMode} PlannedMode={PlannedInvocationMode} ActualMode={ActualInvocationMode} FallbackReason={FallbackReason} DurationMs={DurationMs} AgentRoleCode={AgentRoleCode} AgentRoleVersion={AgentRoleVersion} AgentRoleReleaseId={AgentRoleReleaseId} AgentRoleConfigSource={AgentRoleConfigSource} DeviceId={DeviceId} ProviderCode={ProviderCode} ProfileId={ProfileId} CapabilitySource={CapabilitySource}",
            trace.SessionId,
            trace.Stage,
            trace.RequestedInvocationMode,
            trace.PlannedInvocationMode,
            trace.ActualInvocationMode,
            trace.FallbackReason,
            trace.DurationMs,
            trace.AgentRoleCode,
            trace.AgentRoleVersion,
            trace.AgentRoleReleaseId,
            trace.AgentRoleConfigSource,
            trace.DeviceId,
            trace.ProviderCode,
            trace.ProfileId,
            trace.CapabilitySource);
    }

    private void LogStageFailure(StageExecutionTraceDto trace, Exception ex)
    {
        _logger.LogError(
            ex,
            "Conversation stage failed. SessionId={SessionId} Stage={Stage} RequestedMode={RequestedInvocationMode} PlannedMode={PlannedInvocationMode} FallbackReason={FallbackReason} FailureReason={FailureReason} DurationMs={DurationMs} AgentRoleCode={AgentRoleCode} AgentRoleVersion={AgentRoleVersion} AgentRoleReleaseId={AgentRoleReleaseId} AgentRoleConfigSource={AgentRoleConfigSource} DeviceId={DeviceId} ProviderCode={ProviderCode} ProfileId={ProfileId} ErrorCode={ErrorCode}",
            trace.SessionId,
            trace.Stage,
            trace.RequestedInvocationMode,
            trace.PlannedInvocationMode,
            trace.FallbackReason,
            trace.FailureReason,
            trace.DurationMs,
            trace.AgentRoleCode,
            trace.AgentRoleVersion,
            trace.AgentRoleReleaseId,
            trace.AgentRoleConfigSource,
            trace.DeviceId,
            trace.ProviderCode,
            trace.ProfileId,
            trace.ErrorCode);
    }

    private static string NormalizeMode(string? mode)
    {
        return string.Equals(mode, "streaming", StringComparison.OrdinalIgnoreCase)
            ? "streaming"
            : "non_streaming";
    }

    private static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
