namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class LlmChatStreamChunkDto
{
    public string? TextDelta { get; set; }
    public string? ProviderResponseId { get; set; }
    public string? Model { get; set; }
    public string? FinishReason { get; set; }
    public bool IsFinal { get; set; }
}
