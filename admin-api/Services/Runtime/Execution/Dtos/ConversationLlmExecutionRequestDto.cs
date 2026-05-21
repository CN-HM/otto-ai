using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class ConversationLlmExecutionRequestDto
{
    public ConversationOrchestrationRequestDto Orchestration { get; set; } = new();
    public LlmChatRequestDto Request { get; set; } = new();
}
