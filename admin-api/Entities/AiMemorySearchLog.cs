using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_search_log")]
public class AiMemorySearchLog
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("library_id")]
    [MaxLength(32)]
    public string LibraryId { get; set; } = string.Empty;

    [Column("agent_id")]
    [MaxLength(32)]
    public string? AgentId { get; set; }

    [Column("device_id")]
    [MaxLength(32)]
    public string? DeviceId { get; set; }

    [Column("user_id")]
    public long? UserId { get; set; }

    [Column("entity_id")]
    [MaxLength(100)]
    public string? EntityId { get; set; }

    [Column("session_id")]
    [MaxLength(64)]
    public string? SessionId { get; set; }

    [Column("query")]
    public string? Query { get; set; }

    [Column("record_type")]
    [MaxLength(20)]
    public string? RecordType { get; set; }

    [Column("max_results")]
    public int MaxResults { get; set; }

    [Column("hit_count")]
    public int HitCount { get; set; }

    [Column("result_json", TypeName = "jsonb")]
    public string? ResultJson { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }
}
