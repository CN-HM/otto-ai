using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_asr_profile")]
public class AiAsrProfile
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

    [Column("audio_format")]
    [MaxLength(20)]
    public string? AudioFormat { get; set; }

    [Column("codec")]
    [MaxLength(20)]
    public string? Codec { get; set; }

    [Column("sample_rate")]
    public int? SampleRate { get; set; }

    [Column("bits")]
    public int? Bits { get; set; }

    [Column("channels")]
    public int? Channels { get; set; }

    [Column("chunk_duration_ms")]
    public int? ChunkDurationMs { get; set; }

    [Column("chunk_size_bytes")]
    public int? ChunkSizeBytes { get; set; }

    [Column("language")]
    [MaxLength(32)]
    public string? Language { get; set; }

    [Column("context")]
    public string? Context { get; set; }

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
