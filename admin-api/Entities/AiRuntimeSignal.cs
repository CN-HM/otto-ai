using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_runtime_signal")]
public class AiRuntimeSignal
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("signal_type")]
    [MaxLength(32)]
    public string SignalType { get; set; } = string.Empty;

    [Column("signal_code")]
    [MaxLength(64)]
    public string? SignalCode { get; set; }

    [Column("severity")]
    [MaxLength(20)]
    public string Severity { get; set; } = "low";

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "pending";

    [Column("user_id")]
    public long? UserId { get; set; }

    [Column("device_id")]
    [MaxLength(32)]
    public string? DeviceId { get; set; }

    [Column("agent_role_id")]
    [MaxLength(32)]
    public string? AgentRoleId { get; set; }

    [Column("session_id")]
    [MaxLength(64)]
    public string? SessionId { get; set; }

    [Column("source_run_id")]
    [MaxLength(32)]
    public string? SourceRunId { get; set; }

    [Column("source_text")]
    public string? SourceText { get; set; }

    [Column("payload_json", TypeName = "jsonb")]
    public string? PayloadJson { get; set; }

    [Column("scheduled_at")]
    public DateTime? ScheduledAt { get; set; }

    [Column("processed_at")]
    public DateTime? ProcessedAt { get; set; }

    [Column("dedupe_key")]
    [MaxLength(128)]
    public string? DedupeKey { get; set; }

    [Column("retry_count")]
    public int RetryCount { get; set; }

    [Column("error_message")]
    public string? ErrorMessage { get; set; }

    [Column("wakeup_job_id")]
    [MaxLength(256)]
    public string? WakeupJobId { get; set; }

    [Column("created_at")]
    public DateTime CreatedAt { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
