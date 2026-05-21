using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_subscription_period")]
public class AiSubscriptionPeriod
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("subscription_id")]
    [MaxLength(32)]
    public string SubscriptionId { get; set; } = string.Empty;

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("period_key")]
    [MaxLength(20)]
    public string PeriodKey { get; set; } = string.Empty;

    [Column("period_start_at")]
    public DateTime PeriodStartAt { get; set; }

    [Column("period_end_at")]
    public DateTime PeriodEndAt { get; set; }

    [Column("plan_tokens")]
    public long PlanTokens { get; set; }

    [Column("purchased_tokens")]
    public long PurchasedTokens { get; set; }

    [Column("gifted_tokens")]
    public long GiftedTokens { get; set; }

    [Column("consumed_tokens")]
    public long ConsumedTokens { get; set; }

    [Column("remaining_tokens")]
    public long RemainingTokens { get; set; }

    [Column("exhausted_at")]
    public DateTime? ExhaustedAt { get; set; }

    [Column("low_balance_warned_at")]
    public DateTime? LowBalanceWarnedAt { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
