using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_rule_execution_log")]
public class AiMemoryRuleExecutionLog
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("run_id")]
    [MaxLength(32)]
    public string RunId { get; set; } = string.Empty;

    [Column("library_id")]
    [MaxLength(32)]
    public string LibraryId { get; set; } = string.Empty;

    [Column("rule_id")]
    [MaxLength(32)]
    public string RuleId { get; set; } = string.Empty;

    [Column("rule_code")]
    [MaxLength(64)]
    public string? RuleCode { get; set; }

    [Column("match_result")]
    public bool MatchResult { get; set; }

    [Column("match_confidence")]
    public double MatchConfidence { get; set; }

    [Column("match_reason")]
    public string? MatchReason { get; set; }

    [Column("llm_request_json", TypeName = "jsonb")]
    public string? LlmRequestJson { get; set; }

    [Column("llm_response_json", TypeName = "jsonb")]
    public string? LlmResponseJson { get; set; }

    [Column("candidate_json", TypeName = "jsonb")]
    public string? CandidateJson { get; set; }

    [Column("validated_candidate_json", TypeName = "jsonb")]
    public string? ValidatedCandidateJson { get; set; }

    [Column("saved_record_ids", TypeName = "jsonb")]
    public string? SavedRecordIds { get; set; }

    [Column("updated_record_ids", TypeName = "jsonb")]
    public string? UpdatedRecordIds { get; set; }

    [Column("skipped_reasons", TypeName = "jsonb")]
    public string? SkippedReasons { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "running";

    [Column("error_message")]
    public string? ErrorMessage { get; set; }

    [Column("created_at")]
    public DateTime CreatedAt { get; set; }
}
