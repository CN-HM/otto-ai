using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class ConversationExecutionBindingDto
{
    public ConversationOrchestrationPlanDto Orchestration { get; set; } = new();
    public List<string> AdapterRoute { get; set; } = new();
    public bool UsesMixedAdapters { get; set; }
    public bool IsFullyResolved { get; set; }
    public List<string> MissingStages { get; set; } = new();
    public StageExecutionBindingDto? Asr { get; set; }
    public StageExecutionBindingDto? Llm { get; set; }
    public StageExecutionBindingDto? Tts { get; set; }
    public List<string> Warnings { get; set; } = new();
}
