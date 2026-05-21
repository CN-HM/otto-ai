using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_payment_transaction")]
public class AiPaymentTransaction
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("order_id")]
    [MaxLength(32)]
    public string OrderId { get; set; } = string.Empty;

    [Column("provider_code")]
    [MaxLength(32)]
    public string ProviderCode { get; set; } = "demo";

    [Column("transaction_no")]
    [MaxLength(64)]
    public string? TransactionNo { get; set; }

    [Column("callback_payload")]
    public string? CallbackPayload { get; set; }

    [Column("callback_status")]
    [MaxLength(32)]
    public string? CallbackStatus { get; set; }

    [Column("signature_verified")]
    public bool SignatureVerified { get; set; }

    [Column("paid_at")]
    public DateTime? PaidAt { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
