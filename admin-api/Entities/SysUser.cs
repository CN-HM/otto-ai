using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 系统用户实体
/// 存储用户信息，支持用户名/手机号登录，密码使用BCrypt加密
/// </summary>
[Table("sys_user")]
public class SysUser
{
    [Key]
    [Column("id")]
    public long Id { get; set; }

    [Column("username")]
    [MaxLength(50)]
    public string Username { get; set; } = string.Empty;

    [Column("password")]
    [MaxLength(100)]
    public string? Password { get; set; }

    [Column("super_admin")]
    public short SuperAdmin { get; set; }

    [Column("status")]
    public short Status { get; set; } = 1;

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }

    [Column("mobile")]
    [MaxLength(20)]
    public string? Mobile { get; set; }

    [Column("email")]
    [MaxLength(100)]
    public string? Email { get; set; }
}
