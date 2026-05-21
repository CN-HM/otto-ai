using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_billing_plan_price")]
public class AiBillingPlanPrice
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("plan_id")]
    [MaxLength(32)]
    public string PlanId { get; set; } = string.Empty;

    [Column("region_code")]
    [MaxLength(10)]
    public string RegionCode { get; set; } = "TWN";

    [Column("currency_code")]
    [MaxLength(10)]
    public string CurrencyCode { get; set; } = "DEMO";

    [Column("amount")]
    public decimal Amount { get; set; }

    [Column("provider_code")]
    [MaxLength(32)]
    public string ProviderCode { get; set; } = "demo";

    [Column("payment_channels_json")]
    public string? PaymentChannelsJson { get; set; }

    [Column("is_enabled")]
    public bool IsEnabled { get; set; } = true;

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
