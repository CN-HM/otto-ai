using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_order")]
public class AiOrder
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("order_no")]
    [MaxLength(40)]
    public string OrderNo { get; set; } = string.Empty;

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("plan_id")]
    [MaxLength(32)]
    public string PlanId { get; set; } = string.Empty;

    [Column("order_type")]
    [MaxLength(20)]
    public string OrderType { get; set; } = "subscription";

    [Column("region_code")]
    [MaxLength(10)]
    public string RegionCode { get; set; } = "TWN";

    [Column("currency_code")]
    [MaxLength(10)]
    public string CurrencyCode { get; set; } = "DEMO";

    [Column("amount")]
    public decimal Amount { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "created";

    [Column("provider_code")]
    [MaxLength(32)]
    public string ProviderCode { get; set; } = "demo";

    [Column("external_trade_no")]
    [MaxLength(64)]
    public string? ExternalTradeNo { get; set; }

    [Column("paid_at")]
    public DateTime? PaidAt { get; set; }

    [Column("activated_at")]
    public DateTime? ActivatedAt { get; set; }

    [Column("cancelled_at")]
    public DateTime? CancelledAt { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
