using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class ConversationAsrExecutionRequestDto
{
    public ConversationOrchestrationRequestDto Orchestration { get; set; } = new();
    public AsrRecognitionRequestDto Request { get; set; } = new();
}
