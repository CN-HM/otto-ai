namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class LlmChatRequestDto
{
    public string? SystemPrompt { get; set; }
    public List<LlmChatMessageDto> Messages { get; set; } = new();
    public bool? Stream { get; set; }
    public double? Temperature { get; set; }
    public int? MaxTokens { get; set; }
    public double? TopP { get; set; }
    public Dictionary<string, object?> ExtraOptions { get; set; } = new();
}
