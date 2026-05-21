using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 用户角色关联实体
/// 多对多关联表，建立用户与角色的映射关系
/// </summary>
[Table("sys_user_role")]
public class SysUserRole
{
    [Key]
    [Column("id")]
    public long Id { get; set; }

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("role_id")]
    public long RoleId { get; set; }
}
