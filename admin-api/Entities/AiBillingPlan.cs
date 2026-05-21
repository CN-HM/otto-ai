using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_billing_plan")]
public class AiBillingPlan
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("code")]
    [MaxLength(64)]
    public string Code { get; set; } = string.Empty;

    [Column("name")]
    [MaxLength(64)]
    public string Name { get; set; } = string.Empty;

    [Column("plan_type")]
    [MaxLength(20)]
    public string PlanType { get; set; } = "monthly";

    [Column("included_tokens")]
    public long IncludedTokens { get; set; }

    [Column("bonus_tokens")]
    public long BonusTokens { get; set; }

    [Column("cycle_months")]
    public int CycleMonths { get; set; } = 1;

    [Column("is_default")]
    public bool IsDefault { get; set; }

    [Column("is_enabled")]
    public bool IsEnabled { get; set; } = true;

    [Column("sort")]
    public int Sort { get; set; }

    [Column("remark")]
    public string? Remark { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
