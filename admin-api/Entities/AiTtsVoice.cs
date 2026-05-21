using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// TTS音色实体
/// 存储系统内置TTS音色配置，按TTS模型分类
/// </summary>
[Table("ai_tts_voice")]
public class AiTtsVoice
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("tts_profile_id")]
    [MaxLength(32)]
    public string? TtsProfileId { get; set; }

    [Column("name")]
    [MaxLength(20)]
    public string? Name { get; set; }

    [Column("tts_voice")]
    [MaxLength(50)]
    public string? TtsVoice { get; set; }

    [Column("languages")]
    [MaxLength(50)]
    public string? Languages { get; set; }

    [Column("voice_demo")]
    [MaxLength(500)]
    public string? VoiceDemo { get; set; }

    [Column("remark")]
    [MaxLength(255)]
    public string? Remark { get; set; }

    [Column("sort")]
    public int Sort { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
