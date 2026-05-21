namespace AiAdmin.Services.Runtime.Orchestration.Dtos;

public class ConversationOrchestrationRequestDto
{
    public string? AgentRoleId { get; set; }
    public string? AgentRoleCode { get; set; }
    public string? AgentRoleReleaseId { get; set; }
    public string? SessionId { get; set; }
    public string? DeviceId { get; set; }
    public string? PipelineTemplateId { get; set; }
    public string? VadProfileId { get; set; }
    public string? AsrProfileId { get; set; }
    public string? LlmProfileId { get; set; }
    public string? TtsProfileId { get; set; }
    public string? RequestedInvocationMode { get; set; }
    public bool? PreferStreaming { get; set; }
}
