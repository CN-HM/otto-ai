using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 用户令牌实体
/// 存储用户登录后的JWT令牌信息，支持令牌过期时间管理
/// </summary>
[Table("sys_user_token")]
public class SysUserToken
{
    [Key]
    [Column("id")]
    public long Id { get; set; }

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("token")]
    [MaxLength(2000)]
    public string Token { get; set; } = string.Empty;

    [Column("expire_date")]
    public DateTime? ExpireDate { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }
}
