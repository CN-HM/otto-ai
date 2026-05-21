namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class LlmChatUsageDto
{
    public int? PromptTokens { get; set; }
    public int? CompletionTokens { get; set; }
    public int? TotalTokens { get; set; }
}
