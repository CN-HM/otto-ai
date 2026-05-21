using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_tts_profile")]
public class AiTtsProfile
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

    [Column("invocation_mode")]
    [MaxLength(20)]
    public string InvocationMode { get; set; } = "streaming";

    [Column("ws_url")]
    [MaxLength(500)]
    public string? WsUrl { get; set; }

    [Column("resource_id")]
    [MaxLength(100)]
    public string? ResourceId { get; set; }

    [Column("integration_id")]
    [MaxLength(32)]
    public string IntegrationId { get; set; } = string.Empty;

    [Column("encoding")]
    [MaxLength(20)]
    public string? Encoding { get; set; }

    [Column("sample_rate")]
    public int? SampleRate { get; set; }

    [Column("speech_rate")]
    public int? SpeechRate { get; set; }

    [Column("loudness_rate")]
    public int? LoudnessRate { get; set; }

    [Column("model")]
    [MaxLength(100)]
    public string? Model { get; set; }

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
