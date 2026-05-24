using System.Text.Json.Nodes;

namespace AiAdmin.Services.McpTools.Dtos;

/// <summary>
/// MCP 工具调用结果 DTO
/// </summary>
public class McpToolCallResult
{
    public bool Success { get; set; }
    public string Message { get; set; } = string.Empty;
    public JsonObject Data { get; set; } = new();
}
