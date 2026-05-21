using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 角色菜单关联实体
/// 多对多关联表，定义角色拥有的权限菜单
/// </summary>
[Table("sys_role_menu")]
public class SysRoleMenu
{
    [Key]
    [Column("id")]
    public long Id { get; set; }

    [Column("role_id")]
    public long RoleId { get; set; }

    [Column("menu_id")]
    public long MenuId { get; set; }
}
