using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_token_ledger")]
public class AiTokenLedger
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("period_id")]
    [MaxLength(32)]
    public string? PeriodId { get; set; }

    [Column("change_type")]
    [MaxLength(20)]
    public string ChangeType { get; set; } = string.Empty;

    [Column("delta_tokens")]
    public long DeltaTokens { get; set; }

    [Column("balance_after")]
    public long BalanceAfter { get; set; }

    [Column("usage_record_id")]
    [MaxLength(32)]
    public string? UsageRecordId { get; set; }

    [Column("order_id")]
    [MaxLength(32)]
    public string? OrderId { get; set; }

    [Column("operator_id")]
    public long? OperatorId { get; set; }

    [Column("remark")]
    public string? Remark { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }
}
