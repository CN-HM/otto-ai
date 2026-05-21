using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 设备实体
/// 存储IoT设备信息（ESP32等），包括MAC地址、固件版本、绑定智能体等
/// </summary>
[Table("ai_device")]
public class AiDevice
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("user_id")]
    public long? UserId { get; set; }

    [Column("mac_address")]
    [MaxLength(50)]
    public string? MacAddress { get; set; }

    [Column("credential_id")]
    [MaxLength(64)]
    public string? CredentialId { get; set; }

    [Column("credential_secret")]
    [MaxLength(128)]
    public string? CredentialSecret { get; set; }

    [Column("credential_issued_at")]
    public DateTime? CredentialIssuedAt { get; set; }

    [Column("last_connected_at")]
    public DateTime? LastConnectedAt { get; set; }

    [Column("auto_update")]
    public short AutoUpdate { get; set; }

    [Column("board")]
    [MaxLength(50)]
    public string? Board { get; set; }

    [Column("alias")]
    [MaxLength(64)]
    public string? Alias { get; set; }

    [Column("agent_role_id")]
    [MaxLength(32)]
    public string? AgentRoleId { get; set; }

    [Column("agent_role_release_id")]
    [MaxLength(32)]
    public string? AgentRoleReleaseId { get; set; }

    [Column("app_version")]
    [MaxLength(20)]
    public string? AppVersion { get; set; }

    [Column("sort")]
    public int Sort { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }

    [Column("is_online")]
    public bool IsOnline { get; set; }
}
