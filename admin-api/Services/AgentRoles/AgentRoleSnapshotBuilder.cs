using System.Text.Json;
using AiAdmin.Entities;

namespace AiAdmin.Services.AgentRoles;

public static class AgentRoleSnapshotBuilder
{
    public static string Build(
        AiAgentRole role,
        IReadOnlyList<AiAgentRolePluginMapping> pluginMappings,
        IReadOnlyList<AiAgentRoleContextProvider> contextProviders,
        IReadOnlyList<AiAgentRoleKnowledgeBinding> knowledgeBindings)
    {
        return JsonSerializer.Serialize(new
        {
            role.Id,
            role.Code,
            role.Name,
            role.DisplayName,
            role.Description,
            role.Status,
            role.Icon,
            role.CoverImage,
            role.ThemeToken,
            role.AsrProfileId,
            role.LlmProfileId,
            role.TtsProfileId,
            role.TtsVoiceId,
            role.TtsLanguage,
            role.TtsVolume,
            role.TtsRate,
            role.TtsPitch,
            role.ChatHistoryConf,
            role.SystemPrompt,
            role.KnowledgeNoHitFallbackText,
            role.MemoryLibraryId,
            role.MemoryEntityScope,
            role.MemoryTopK,
            role.MemoryMinScore,
            role.MemoryIntentRecall,
            role.MemoryQueryRewrite,
            role.MemoryRerank,
            role.LangCode,
            role.Language,
            role.CurrentVersion,
            role.Sort,
            role.UpdatedAt,
            role.PublishedAt,
            PluginMappings = pluginMappings.Select(item => new
            {
                item.PluginId,
                item.ParamInfo,
                item.ProviderCode
            }).ToList(),
            ContextProviders = contextProviders.Select(item => new
            {
                item.Id,
                item.Url,
                item.Headers,
                item.CreateDate
            }).ToList(),
            KnowledgeBindings = knowledgeBindings.Select(item => new
            {
                item.Id,
                item.DatasetId,
                item.Sort,
                item.Enabled,
                item.TopK,
                item.MinScore,
                item.RerankEnabled,
                item.MaxChunks
            }).ToList()
        });
    }
}
