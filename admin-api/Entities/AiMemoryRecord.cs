using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_record")]
public class AiMemoryRecord
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
    public string EntityId { get; set; } = string.Empty;

    [Column("session_id")]
    [MaxLength(64)]
    public string? SessionId { get; set; }

    [Column("rule_id")]
    [MaxLength(32)]
    public string? RuleId { get; set; }

    [Column("rule_code")]
    [MaxLength(64)]
    public string? RuleCode { get; set; }

    [Column("entity_scope")]
    [MaxLength(20)]
    public string EntityScope { get; set; } = "user";

    [Column("record_type")]
    [MaxLength(20)]
    public string RecordType { get; set; } = "node";

    [Column("title")]
    [MaxLength(200)]
    public string? Title { get; set; }

    [Column("content")]
    public string Content { get; set; } = string.Empty;

    [Column("summary")]
    public string? Summary { get; set; }

    [Column("keywords", TypeName = "jsonb")]
    public string? Keywords { get; set; }

    [Column("payload_json", TypeName = "jsonb")]
    public string? PayloadJson { get; set; }

    [Column("canonical_key")]
    [MaxLength(300)]
    public string? CanonicalKey { get; set; }

    [Column("content_hash")]
    [MaxLength(64)]
    public string? ContentHash { get; set; }

    [Column("embedding_model_id")]
    [MaxLength(64)]
    public string? EmbeddingModelId { get; set; }

    [Column("embedding_dimension")]
    public int EmbeddingDimension { get; set; }

    [Column("embedding_json", TypeName = "jsonb")]
    public string? EmbeddingJson { get; set; }

    [Column("importance")]
    public int Importance { get; set; } = 1;

    [Column("confidence")]
    public double Confidence { get; set; } = 1;

    [Column("is_pinned")]
    public bool IsPinned { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "active";

    [Column("source")]
    [MaxLength(50)]
    public string? Source { get; set; }

    [Column("source_chat_history_id")]
    [MaxLength(32)]
    public string? SourceChatHistoryId { get; set; }

    [Column("source_turn_id")]
    [MaxLength(64)]
    public string? SourceTurnId { get; set; }

    [Column("source_run_id")]
    [MaxLength(32)]
    public string? SourceRunId { get; set; }

    [Column("merged_from_record_ids", TypeName = "jsonb")]
    public string? MergedFromRecordIds { get; set; }

    [Column("superseded_by_record_id")]
    [MaxLength(32)]
    public string? SupersededByRecordId { get; set; }

    [Column("revision")]
    public int Revision { get; set; } = 1;

    [Column("expires_at")]
    public DateTime? ExpiresAt { get; set; }

    [Column("last_accessed_at")]
    public DateTime? LastAccessedAt { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
