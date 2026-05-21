namespace AiAdmin.Services.McpTools.Dtos;

/// <summary>
/// MCP 工具 DTO
/// </summary>
public class McpToolDto
{
    public string Id { get; set; } = string.Empty;
    public string Code { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public string? Category { get; set; }
    public bool IsSystem { get; set; }
    public string? ParamSchema { get; set; }
    public string Status { get; set; } = "active";
    public int Sort { get; set; } = 0;
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}

/// <summary>
/// MCP 工具列表查询参数
/// </summary>
public class McpToolListQuery
{
    public int? Page { get; set; }
    public int? Limit { get; set; }
    public string? Keyword { get; set; }
    public string? Status { get; set; }
    public string? Category { get; set; }
}

/// <summary>
/// MCP 工具简略信息（用于下拉选择）
/// </summary>
public class McpToolOptionDto
{
    public string Id { get; set; } = string.Empty;
    public string Code { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public string? Category { get; set; }
    public bool IsSystem { get; set; }
}
