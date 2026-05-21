using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_provider_integration")]
public class AiProviderIntegration
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("code")]
    [MaxLength(64)]
    public string Code { get; set; } = string.Empty;

    [Column("name")]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [Column("description")]
    public string? Description { get; set; }

    [Column("provider_code")]
    [MaxLength(50)]
    public string ProviderCode { get; set; } = string.Empty;

    [Column("provider_type")]
    public ProviderType ProviderType { get; set; } = ProviderType.Ark;

    [Column("supports_asr")]
    public bool SupportsAsr { get; set; }

    [Column("supports_tts")]
    public bool SupportsTts { get; set; }

    [Column("supports_llm")]
    public bool SupportsLlm { get; set; }

    [Column("supports_mem")]
    public bool SupportsMem { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "active";

    [Column("is_enabled")]
    public bool IsEnabled { get; set; } = true;

    [Column("is_default")]
    public bool IsDefault { get; set; }

    [Column("api_key")]
    [MaxLength(500)]
    public string? ApiKey { get; set; }

    [Column("secret_key")]
    [MaxLength(500)]
    public string? SecretKey { get; set; }

    [Column("app_id")]
    [MaxLength(100)]
    public string? AppId { get; set; }

    [Column("access_token")]
    [MaxLength(500)]
    public string? AccessToken { get; set; }

    [Column("organization")]
    [MaxLength(100)]
    public string? Organization { get; set; }

    [Column("voice_catalog_access_key")]
    [MaxLength(200)]
    public string? VoiceCatalogAccessKey { get; set; }

    [Column("voice_catalog_secret")]
    [MaxLength(500)]
    public string? VoiceCatalogSecret { get; set; }

    [Column("voice_catalog_app_id")]
    [MaxLength(100)]
    public string? VoiceCatalogAppId { get; set; }

    [Column("voice_catalog_endpoint")]
    [MaxLength(500)]
    public string? VoiceCatalogEndpoint { get; set; }

    [Column("sort")]
    public int Sort { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
