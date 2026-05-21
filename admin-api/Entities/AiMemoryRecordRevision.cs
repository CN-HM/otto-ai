using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_record_revision")]
public class AiMemoryRecordRevision
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("record_id")]
    [MaxLength(32)]
    public string RecordId { get; set; } = string.Empty;

    [Column("library_id")]
    [MaxLength(32)]
    public string LibraryId { get; set; } = string.Empty;

    [Column("rule_id")]
    [MaxLength(32)]
    public string? RuleId { get; set; }

    [Column("entity_id")]
    [MaxLength(100)]
    public string EntityId { get; set; } = string.Empty;

    [Column("before_json", TypeName = "jsonb")]
    public string? BeforeJson { get; set; }

    [Column("after_json", TypeName = "jsonb")]
    public string? AfterJson { get; set; }

    [Column("change_type")]
    [MaxLength(20)]
    public string ChangeType { get; set; } = "create";

    [Column("change_reason")]
    public string? ChangeReason { get; set; }

    [Column("source_run_id")]
    [MaxLength(32)]
    public string? SourceRunId { get; set; }

    [Column("created_at")]
    public DateTime CreatedAt { get; set; }
}
