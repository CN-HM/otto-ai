using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 智能体实体
/// 存储用户创建的智能体配置，包括模型选择、TTS设置、系统提示词等
/// </summary>
[Table("ai_agent")]
public class AiAgent
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("user_id")]
    public long? UserId { get; set; }

    [Column("agent_code")]
    [MaxLength(36)]
    public string? AgentCode { get; set; }

    [Column("agent_name")]
    [MaxLength(64)]
    public string? AgentName { get; set; }

    [Column("tts_voice_id")]
    [MaxLength(32)]
    public string? TtsVoiceId { get; set; }

    [Column("tts_language")]
    [MaxLength(20)]
    public string? TtsLanguage { get; set; }

    [Column("tts_volume")]
    public double? TtsVolume { get; set; }

    [Column("tts_rate")]
    public double? TtsRate { get; set; }

    [Column("tts_pitch")]
    public double? TtsPitch { get; set; }

    [Column("chat_history_conf")]
    public int? ChatHistoryConf { get; set; }

    [Column("system_prompt")]
    public string? SystemPrompt { get; set; }

    [Column("memory_library_id")]
    [MaxLength(32)]
    public string? MemoryLibraryId { get; set; }

    [Column("memory_entity_scope")]
    [MaxLength(20)]
    public string? MemoryEntityScope { get; set; }

    [Column("memory_top_k")]
    public int? MemoryTopK { get; set; }

    [Column("memory_min_score")]
    public double? MemoryMinScore { get; set; }

    [Column("memory_intent_recall")]
    public bool? MemoryIntentRecall { get; set; }

    [Column("memory_query_rewrite")]
    public bool? MemoryQueryRewrite { get; set; }

    [Column("memory_rerank")]
    public bool? MemoryRerank { get; set; }

    [Column("lang_code")]
    [MaxLength(10)]
    public string? LangCode { get; set; }

    [Column("language")]
    [MaxLength(10)]
    public string? Language { get; set; }

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
