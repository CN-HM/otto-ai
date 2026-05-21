using System.ComponentModel.DataAnnotations;

namespace AiAdmin.Services.McpTools.Dtos;

/// <summary>
/// MCP 工具创建/更新 DTO
/// </summary>
public class McpToolUpsertDto
{
    [Required(ErrorMessage = "工具编码不能为空")]
    [MaxLength(50, ErrorMessage = "工具编码最多50字符")]
    public string Code { get; set; } = string.Empty;

    [Required(ErrorMessage = "工具名称不能为空")]
    [MaxLength(100, ErrorMessage = "工具名称最多100字符")]
    public string Name { get; set; } = string.Empty;

    [MaxLength(500, ErrorMessage = "描述最多500字符")]
    public string? Description { get; set; }


    [MaxLength(50, ErrorMessage = "类别最多50字符")]
    public string? Category { get; set; }

    /// <summary>
    /// 调用参数模板 JSON
    /// </summary>
    public string? ParamSchema { get; set; }

    [Required(ErrorMessage = "状态不能为空")]
    [MaxLength(20, ErrorMessage = "状态最多20字符")]
    public string Status { get; set; } = "active";

    public int Sort { get; set; } = 0;
}
