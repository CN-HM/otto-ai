namespace AiAdmin.Services.Runtime.Orchestration.Dtos;

public class ConversationOrchestrationPlanDto
{
    public string? AgentRoleId { get; set; }
    public string? AgentRoleCode { get; set; }
    public string? AgentRoleName { get; set; }
    public string? AgentRoleVersion { get; set; }
    public string? AgentRoleReleaseId { get; set; }
    public string? AgentRoleConfigSource { get; set; }
    public string? PipelineTemplateId { get; set; }
    public string RequestedInvocationMode { get; set; } = "non_streaming";
    public string EffectiveInvocationMode { get; set; } = "non_streaming";
    public string FallbackMode { get; set; } = "non_streaming";
    public List<string> BaselineNodes { get; set; } = new();
    public List<string> EnabledStages { get; set; } = new();
    public List<string> DisabledStages { get; set; } = new();
    public List<string> ProviderRoute { get; set; } = new();
    public bool UsesMixedProviders { get; set; }
    public ModelInvocationProfileDto? Vad { get; set; }
    public ModelInvocationProfileDto? Asr { get; set; }
    public ModelInvocationProfileDto? Llm { get; set; }
    public ModelInvocationProfileDto? Tts { get; set; }
    public List<string> Warnings { get; set; } = new();
}
