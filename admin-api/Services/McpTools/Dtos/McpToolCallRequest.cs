using System.Text.Json.Nodes;

namespace AiAdmin.Services.McpTools.Dtos;

/// <summary>
/// MCP 工具调用请求 DTO
/// </summary>
public class McpToolCallRequest
{
    public string ToolCode { get; set; } = string.Empty;
    public JsonObject Arguments { get; set; } = new();
    public string AgentRoleId { get; set; } = string.Empty;
    public string DeviceId { get; set; } = string.Empty;
    public string SessionId { get; set; } = string.Empty;
    public long? UserId { get; set; }
}
