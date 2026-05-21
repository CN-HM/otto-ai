using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_user_subscription")]
public class AiUserSubscription
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("plan_id")]
    [MaxLength(32)]
    public string PlanId { get; set; } = string.Empty;

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "active";

    [Column("start_at")]
    public DateTime StartAt { get; set; }

    [Column("end_at")]
    public DateTime EndAt { get; set; }

    [Column("next_renew_at")]
    public DateTime? NextRenewAt { get; set; }

    [Column("auto_renew")]
    public bool AutoRenew { get; set; }

    [Column("source")]
    [MaxLength(20)]
    public string Source { get; set; } = "register";

    [Column("last_order_id")]
    [MaxLength(32)]
    public string? LastOrderId { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
