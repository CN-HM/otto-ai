using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_rule")]
public class AiMemoryRule
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("library_id")]
    [MaxLength(32)]
    public string LibraryId { get; set; } = string.Empty;

    [Column("rule_code")]
    [MaxLength(64)]
    public string RuleCode { get; set; } = string.Empty;

    [Column("rule_type")]
    [MaxLength(20)]
    public string RuleType { get; set; } = "node";

    [Column("rule_name")]
    [MaxLength(100)]
    public string RuleName { get; set; } = string.Empty;

    [Column("instruction")]
    public string? Instruction { get; set; }

    [Column("ttl_days")]
    public int? TtlDays { get; set; }

    [Column("is_enabled")]
    public bool IsEnabled { get; set; } = true;

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
