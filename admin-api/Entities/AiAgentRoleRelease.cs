using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_agent_role_release")]
public class AiAgentRoleRelease
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("role_id")]
    [MaxLength(32)]
    public string RoleId { get; set; } = string.Empty;

    [Column("version")]
    [MaxLength(40)]
    public string Version { get; set; } = string.Empty;

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "published";

    [Column("snapshot_json", TypeName = "jsonb")]
    public string SnapshotJson { get; set; } = "{}";

    [Column("remark")]
    [MaxLength(255)]
    public string? Remark { get; set; }

    [Column("published_at")]
    public DateTime? PublishedAt { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
