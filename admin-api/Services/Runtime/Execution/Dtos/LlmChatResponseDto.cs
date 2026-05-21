namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class LlmChatResponseDto
{
    public string InvocationMode { get; set; } = "non_streaming";
    public string? ProviderResponseId { get; set; }
    public string? Model { get; set; }
    public string? Text { get; set; }
    public string? FinishReason { get; set; }
    public LlmChatUsageDto? Usage { get; set; }
    public string? RawResponseJson { get; set; }
    public StageExecutionTraceDto? StageTrace { get; set; }
}
