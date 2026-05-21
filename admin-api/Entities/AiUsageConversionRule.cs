using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_usage_conversion_rule")]
public class AiUsageConversionRule
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("service_type")]
    [MaxLength(20)]
    public string ServiceType { get; set; } = string.Empty;

    [Column("provider_code")]
    [MaxLength(64)]
    public string? ProviderCode { get; set; }

    [Column("model_type")]
    [MaxLength(20)]
    public string? ModelType { get; set; }

    [Column("unit_type")]
    [MaxLength(20)]
    public string UnitType { get; set; } = string.Empty;

    [Column("tokens_per_unit")]
    public decimal TokensPerUnit { get; set; }

    [Column("is_enabled")]
    public bool IsEnabled { get; set; } = true;

    [Column("remark")]
    public string? Remark { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
