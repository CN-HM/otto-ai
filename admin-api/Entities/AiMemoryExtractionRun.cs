using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_extraction_run")]
public class AiMemoryExtractionRun
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

    [Column("entity_scope")]
    [MaxLength(20)]
    public string EntityScope { get; set; } = "user";

    [Column("entity_id")]
    [MaxLength(100)]
    public string EntityId { get; set; } = string.Empty;

    [Column("session_id")]
    [MaxLength(64)]
    public string? SessionId { get; set; }

    [Column("user_text")]
    public string? UserText { get; set; }

    [Column("assistant_text")]
    public string? AssistantText { get; set; }

    [Column("conversation_hash")]
    [MaxLength(64)]
    public string? ConversationHash { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "running";

    [Column("started_at")]
    public DateTime StartedAt { get; set; }

    [Column("finished_at")]
    public DateTime? FinishedAt { get; set; }

    [Column("error_message")]
    public string? ErrorMessage { get; set; }

    [Column("matched_rule_count")]
    public int MatchedRuleCount { get; set; }

    [Column("candidate_count")]
    public int CandidateCount { get; set; }

    [Column("saved_count")]
    public int SavedCount { get; set; }

    [Column("updated_count")]
    public int UpdatedCount { get; set; }

    [Column("skipped_count")]
    public int SkippedCount { get; set; }

    [Column("rejected_count")]
    public int RejectedCount { get; set; }

    [Column("created_at")]
    public DateTime CreatedAt { get; set; }
}
