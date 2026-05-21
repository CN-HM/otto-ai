namespace AiAdmin.Services.AgentRoles.Dtos;

public class AgentRoleRuntimeDescriptorDto
{
    public string? Id { get; set; }
    public string? Code { get; set; }
    public string? Name { get; set; }
    public string? DisplayName { get; set; }
    public string? Description { get; set; }
    public string? Status { get; set; }
    public string? ThemeToken { get; set; }
    public string RuntimeConfigSource { get; set; } = "draft_role";
    public bool UsesPublishedSnapshot { get; set; }
    public string? CurrentReleaseId { get; set; }
    public string? CurrentVersion { get; set; }
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
    public string? MemoryLibraryId { get; set; }
    public string? MemoryEntityScope { get; set; }
    public int? MemoryTopK { get; set; }
    public double? MemoryMinScore { get; set; }
    public bool? MemoryIntentRecall { get; set; }
    public bool? MemoryQueryRewrite { get; set; }
    public bool? MemoryRerank { get; set; }
    public string? LangCode { get; set; }
    public string? Language { get; set; }
    public string? AgentTemplateId { get; set; }
    public string? SystemPromptVersion { get; set; }
    public string PreferredInvocationMode { get; set; } = "non_streaming";
    public string FallbackMode { get; set; } = "non_streaming";
    public bool SupportsStreamingInput { get; set; }
    public bool SupportsStreamingOutput { get; set; }
    public int? FirstPacketTimeoutMs { get; set; }
    public int? StreamIdleTimeoutMs { get; set; }
    public List<AgentRolePluginMappingDto> PluginMappings { get; set; } = [];
    public List<AgentRoleContextProviderDto> ContextProviders { get; set; } = [];
    public List<AgentRoleKnowledgeBindingDto> KnowledgeBindings { get; set; } = [];
}
