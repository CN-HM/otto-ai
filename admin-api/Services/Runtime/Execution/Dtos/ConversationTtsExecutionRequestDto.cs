using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class ConversationTtsExecutionRequestDto
{
    public ConversationOrchestrationRequestDto Orchestration { get; set; } = new();
    public TtsSynthesisRequestDto Request { get; set; } = new();
}
