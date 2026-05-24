using System.Text.Json.Nodes;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class LlmChatMessageDto
{
    public string Role { get; set; } = "user";
    public string Content { get; set; } = string.Empty;
    public string? Name { get; set; }
    public string? ToolCallId { get; set; }
    public JsonArray? ToolCalls { get; set; }
}
