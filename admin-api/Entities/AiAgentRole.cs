using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_agent_role")]
public class AiAgentRole
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

    [Column("display_name")]
    [MaxLength(100)]
    public string? DisplayName { get; set; }

    [Column("description")]
    public string? Description { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "active";

    [Column("is_system")]
    public bool IsSystem { get; set; }

    [Column("icon")]
    [MaxLength(255)]
    public string? Icon { get; set; }

    [Column("cover_image", TypeName = "text")]
    public string? CoverImage { get; set; }

    [Column("theme_token")]
    [MaxLength(100)]
    public string? ThemeToken { get; set; }

    [Column("asr_profile_id")]
    [MaxLength(32)]
    public string? AsrProfileId { get; set; }

    [Column("vad_profile_id")]
    [MaxLength(32)]
    public string? VadProfileId { get; set; }

    [Column("llm_profile_id")]
    [MaxLength(32)]
    public string? LlmProfileId { get; set; }

    [Column("tts_profile_id")]
    [MaxLength(32)]
    public string? TtsProfileId { get; set; }

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

    [Column("knowledge_no_hit_fallback_text")]
    public string? KnowledgeNoHitFallbackText { get; set; }

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

    [Column("current_release_id")]
    [MaxLength(32)]
    public string? CurrentReleaseId { get; set; }

    [Column("current_version")]
    [MaxLength(40)]
    public string? CurrentVersion { get; set; }

    [Column("published_at")]
    public DateTime? PublishedAt { get; set; }

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
