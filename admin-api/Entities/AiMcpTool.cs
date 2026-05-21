using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// MCP 工具主档 - 全局内置 MCP 工具管理
/// </summary>
[Table("ai_mcp_tool")]
public class AiMcpTool
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    /// <summary>工具编码（唯一标识）</summary>
    [Column("code")]
    [MaxLength(50)]
    public string Code { get; set; } = string.Empty;

    /// <summary>显示名称</summary>
    [Column("name")]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    /// <summary>功能描述</summary>
    [Column("description")]
    [MaxLength(500)]
    public string? Description { get; set; }


    /// <summary>工具类别标签（如 weather、search、calculator）</summary>
    [Column("category")]
    [MaxLength(50)]
    public string? Category { get; set; }

    [Column("is_system")]
    public bool IsSystem { get; set; }

    /// <summary>调用参数模板 JSON（参数定义、必填项、默认值）</summary>
    [Column("param_schema", TypeName = "jsonb")]
    public string? ParamSchema { get; set; }

    /// <summary>启用状态：active/inactive</summary>
    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "active";

    /// <summary>排序权重</summary>
    [Column("sort")]
    public int Sort { get; set; } = 0;

    /// <summary>创建时间</summary>
    [Column("created_at")]
    public DateTime CreatedAt { get; set; }

    /// <summary>更新时间</summary>
    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }

    /// <summary>创建人</summary>
    [Column("creator")]
    public long Creator { get; set; }

    /// <summary>更新人</summary>
    [Column("updater")]
    public long? Updater { get; set; }
}
