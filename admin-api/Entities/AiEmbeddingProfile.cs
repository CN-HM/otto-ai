using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_embedding_profile")]
public class AiEmbeddingProfile
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("name")]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [Column("description")]
    public string? Description { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "active";

    [Column("is_enabled")]
    public bool IsEnabled { get; set; } = true;

    [Column("is_default")]
    public bool IsDefault { get; set; }

    [Column("endpoint")]
    [MaxLength(500)]
    public string? Endpoint { get; set; }

    [Column("integration_id")]
    [MaxLength(32)]
    public string IntegrationId { get; set; } = string.Empty;

    [Column("model")]
    [MaxLength(200)]
    public string? Model { get; set; }

    [Column("dimension")]
    public int? Dimension { get; set; }

    [Column("config_json", TypeName = "jsonb")]
    public string? ConfigJson { get; set; }

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
