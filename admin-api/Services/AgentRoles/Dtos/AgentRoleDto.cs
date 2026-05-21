namespace AiAdmin.Services.AgentRoles.Dtos;

public class AgentRoleDto
{
    public string? Id { get; set; }
    public string? Code { get; set; }
    public string? Name { get; set; }
    public string? DisplayName { get; set; }
    public string? Description { get; set; }
    public string? Status { get; set; }
    public bool IsSystem { get; set; }
    public string? Icon { get; set; }
    public string? CoverImage { get; set; }
    public string? ThemeToken { get; set; }
    public string? PipelineTemplateId { get; set; }
    public string? AsrProfileId { get; set; }
    public string? VadProfileId { get; set; }
    public string? LlmProfileId { get; set; }
    public string? TtsProfileId { get; set; }
    public string? TtsVoiceId { get; set; }
    public string? TtsLanguage { get; set; }
    public double? TtsVolume { get; set; }
    public double? TtsRate { get; set; }
    public double? TtsPitch { get; set; }
    public int? ChatHistoryConf { get; set; }
    public string? SystemPrompt { get; set; }
    public string? KnowledgeNoHitFallbackText { get; set; }
    public bool MemoryEnabled { get; set; }
    public string? MemoryLibraryId { get; set; }
    public string? MemoryModelId { get; set; }
    public string? MemoryEntityScope { get; set; }
    public int? MemoryTopK { get; set; }
    public double? MemoryMinScore { get; set; }
    public bool? MemoryIntentRecall { get; set; }
    public bool? MemoryQueryRewrite { get; set; }
    public bool? MemoryRerank { get; set; }
    public string? LangCode { get; set; }
    public string? Language { get; set; }
    public string? CurrentReleaseId { get; set; }
    public string? CurrentVersion { get; set; }
    public string? PublishedAt { get; set; }
    public int Sort { get; set; }
    public long? Creator { get; set; }
    public string? CreatedAt { get; set; }
    public long? Updater { get; set; }
    public string? UpdatedAt { get; set; }
    public List<AgentRolePluginMappingDto> PluginMappings { get; set; } = [];
    public List<AgentRoleContextProviderDto> ContextProviders { get; set; } = [];
    public List<AgentRoleKnowledgeBindingDto> KnowledgeBindings { get; set; } = [];
}
