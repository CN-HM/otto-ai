namespace AiAdmin.Services.Runtime.Execution.Dtos;

using AiAdmin.Entities;

public class StageExecutionTraceDto
{
    public string? SessionId { get; set; }
    public string? DeviceId { get; set; }
    public string? AgentRoleId { get; set; }
    public string? AgentRoleCode { get; set; }
    public string? AgentRoleVersion { get; set; }
    public string? AgentRoleReleaseId { get; set; }
    public string? AgentRoleConfigSource { get; set; }
    public string Stage { get; set; } = string.Empty;
    public string RequestedInvocationMode { get; set; } = "non_streaming";
    public string PlannedInvocationMode { get; set; } = "non_streaming";
    public string ActualInvocationMode { get; set; } = "non_streaming";
    public string FallbackMode { get; set; } = "non_streaming";
    public string? FallbackReason { get; set; }
    public string? FailureReason { get; set; }
    public string? ProfileId { get; set; }
    public string? ProviderCode { get; set; }
    public ProviderType? ProviderType { get; set; }
    public string? ProviderName { get; set; }
    public string? ProviderFamily { get; set; }
    public string? CapabilitySource { get; set; }
    public List<string> CapabilityTags { get; set; } = new();
    public bool Succeeded { get; set; }
    public long DurationMs { get; set; }
    public string? ErrorCode { get; set; }
    public string? ErrorMessage { get; set; }
}
