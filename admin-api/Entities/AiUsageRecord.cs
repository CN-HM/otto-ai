using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_usage_record")]
public class AiUsageRecord
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("user_id")]
    public long UserId { get; set; }

    [Column("agent_id")]
    [MaxLength(32)]
    public string? AgentId { get; set; }

    [Column("device_id")]
    [MaxLength(32)]
    public string? DeviceId { get; set; }

    [Column("session_id")]
    [MaxLength(64)]
    public string? SessionId { get; set; }

    [Column("service_type")]
    [MaxLength(20)]
    public string ServiceType { get; set; } = "OTHER";

    [Column("provider_code")]
    [MaxLength(64)]
    public string? ProviderCode { get; set; }

    [Column("model_config_id")]
    [MaxLength(32)]
    public string? ModelConfigId { get; set; }

    [Column("unit_type")]
    [MaxLength(20)]
    public string UnitType { get; set; } = "tokens";

    [Column("raw_units")]
    public decimal RawUnits { get; set; }

    [Column("normalized_tokens")]
    public long NormalizedTokens { get; set; }

    [Column("raw_usage_json")]
    public string? RawUsageJson { get; set; }

    [Column("idempotency_key")]
    [MaxLength(128)]
    public string IdempotencyKey { get; set; } = string.Empty;

    [Column("charge_status")]
    [MaxLength(20)]
    public string ChargeStatus { get; set; } = "charged";

    [Column("happened_at")]
    public DateTime HappenedAt { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }
}
