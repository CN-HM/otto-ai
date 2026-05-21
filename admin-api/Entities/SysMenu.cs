using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 系统菜单实体
/// RBAC权限模型中的权限定义，支持目录、菜单、按钮三种类型
/// </summary>
[Table("sys_menu")]
public class SysMenu
{
    [Key]
    [Column("id")]
    public long Id { get; set; }

    [Column("parent_id")]
    public long? ParentId { get; set; }

    [Column("name")]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [Column("code")]
    [MaxLength(100)]
    public string Code { get; set; } = string.Empty;

    /// <summary>0=目录, 1=菜单, 2=按钮</summary>
    [Column("type")]
    public short Type { get; set; }

    [Column("sort")]
    public int Sort { get; set; }

    [Column("status")]
    public short Status { get; set; } = 1;
}
