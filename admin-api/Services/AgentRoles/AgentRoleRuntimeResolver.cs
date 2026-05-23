using System.Text.Json;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.AgentRoles;

public class AgentRoleRuntimeResolver : ITransientDependency
{
    private const string PublishedReleaseSource = "published_release";
    private const string DraftRoleSource = "draft_role";

    private readonly AgentRoleService _agentRoleService;

    public AgentRoleRuntimeResolver(AgentRoleService agentRoleService)
    {
        _agentRoleService = agentRoleService;
    }

    public async Task<AgentRoleRuntimeDescriptorDto> ResolveAsync(string? roleId, string? roleCode, string? releaseId, CancellationToken cancellationToken = default)
    {
        var entity = await _agentRoleService.ResolveByIdOrCodeAsync(roleId, roleCode, false, cancellationToken);
        if (!string.IsNullOrWhiteSpace(releaseId))
        {
            var explicitRelease = await _agentRoleService.ResolveReleaseAsync(entity, releaseId, cancellationToken)
                ?? throw new InvalidOperationException("Error:AgentRoleReleaseNotFound");
            if (TryCreateDescriptorFromRelease(entity, explicitRelease, out var explicitDescriptor))
                return explicitDescriptor;

            throw new InvalidOperationException("Error:AgentRoleReleaseSnapshotInvalid");
        }

        var release = await _agentRoleService.ResolveCurrentReleaseAsync(entity, cancellationToken);
        if (release != null && TryCreateDescriptorFromRelease(entity, release, out var publishedDescriptor))
            return publishedDescriptor;

        return await CreateDraftDescriptorAsync(entity, cancellationToken);
    }

    private async Task<AgentRoleRuntimeDescriptorDto> CreateDraftDescriptorAsync(AiAgentRole entity, CancellationToken cancellationToken)
    {
        var pluginMappings = await _agentRoleService.GetPluginMappingsAsync(entity.Id, cancellationToken);
        var contextProviders = await _agentRoleService.GetContextProvidersAsync(entity.Id, cancellationToken);
        var knowledgeBindings = await _agentRoleService.GetKnowledgeBindingsAsync(entity.Id, cancellationToken);
        var descriptor = new AgentRoleRuntimeDescriptorDto
        {
            Id = entity.Id,
            Code = entity.Code,
            Name = entity.Name,
            DisplayName = entity.DisplayName,
            Description = entity.Description,
            Status = entity.Status,
            ThemeToken = entity.ThemeToken,
            RuntimeConfigSource = DraftRoleSource,
            UsesPublishedSnapshot = false,
            CurrentReleaseId = entity.CurrentReleaseId,
            CurrentVersion = entity.CurrentVersion,
            AsrProfileId = entity.AsrProfileId,
            VadProfileId = entity.VadProfileId,
            LlmProfileId = entity.LlmProfileId,
            TtsProfileId = entity.TtsProfileId,
            TtsVoiceId = entity.TtsVoiceId,
            TtsLanguage = entity.TtsLanguage,
            TtsVolume = entity.TtsVolume,
            TtsRate = entity.TtsRate,
            TtsPitch = entity.TtsPitch,
            ChatHistoryConf = entity.ChatHistoryConf,
            SystemPrompt = entity.SystemPrompt,
            KnowledgeNoHitFallbackText = entity.KnowledgeNoHitFallbackText,
            MemoryLibraryId = entity.MemoryLibraryId,
            MemoryEntityScope = entity.MemoryEntityScope,
            MemoryTopK = entity.MemoryTopK,
            MemoryMinScore = entity.MemoryMinScore,
            MemoryIntentRecall = entity.MemoryIntentRecall,
            MemoryQueryRewrite = entity.MemoryQueryRewrite,
            MemoryRerank = entity.MemoryRerank,
            LangCode = entity.LangCode,
            Language = entity.Language,
            PluginMappings = pluginMappings.Select(item => new AgentRolePluginMappingDto
            {
                PluginId = item.PluginId,
                ParamInfo = item.ParamInfo,
                ProviderCode = item.ProviderCode
            }).ToList(),
            ContextProviders = contextProviders.Select(item => new AgentRoleContextProviderDto
            {
                Id = item.Id,
                Url = item.Url,
                Headers = item.Headers
            }).ToList(),
            KnowledgeBindings = knowledgeBindings.Select(item => new AgentRoleKnowledgeBindingDto
            {
                Id = item.Id,
                DatasetId = item.DatasetId,
                Sort = item.Sort,
                Enabled = item.Enabled,
                TopK = item.TopK,
                MinScore = item.MinScore,
                RerankEnabled = item.RerankEnabled,
                MaxChunks = item.MaxChunks
            }).ToList()
        };

        return descriptor;
    }

    private static bool TryCreateDescriptorFromRelease(AiAgentRole role, AiAgentRoleRelease release, out AgentRoleRuntimeDescriptorDto descriptor)
    {
        descriptor = new AgentRoleRuntimeDescriptorDto();

        try
        {
            descriptor = JsonSerializer.Deserialize<AgentRoleRuntimeDescriptorDto>(release.SnapshotJson, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            }) ?? new AgentRoleRuntimeDescriptorDto();
            descriptor.Id ??= role.Id;
            descriptor.Code ??= role.Code;
            descriptor.Name ??= role.Name;
            descriptor.DisplayName ??= role.DisplayName;
            descriptor.Description ??= role.Description;
            descriptor.Status ??= role.Status;
            descriptor.ThemeToken ??= role.ThemeToken;
            descriptor.AsrProfileId ??= role.AsrProfileId;
            descriptor.VadProfileId ??= role.VadProfileId;
            descriptor.LlmProfileId ??= role.LlmProfileId;
            descriptor.TtsProfileId ??= role.TtsProfileId;
            descriptor.TtsVoiceId ??= role.TtsVoiceId;
            descriptor.TtsLanguage ??= role.TtsLanguage;
            descriptor.TtsVolume ??= role.TtsVolume;
            descriptor.TtsRate ??= role.TtsRate;
            descriptor.TtsPitch ??= role.TtsPitch;
            descriptor.ChatHistoryConf ??= role.ChatHistoryConf;
            descriptor.SystemPrompt ??= role.SystemPrompt;
            descriptor.KnowledgeNoHitFallbackText ??= role.KnowledgeNoHitFallbackText;
            descriptor.MemoryLibraryId ??= role.MemoryLibraryId;
            descriptor.MemoryEntityScope ??= role.MemoryEntityScope;
            descriptor.MemoryTopK ??= role.MemoryTopK;
            descriptor.MemoryMinScore ??= role.MemoryMinScore;
            if (descriptor.MemoryIntentRecall == null)
                descriptor.MemoryIntentRecall = role.MemoryIntentRecall;
            if (descriptor.MemoryQueryRewrite == null)
                descriptor.MemoryQueryRewrite = role.MemoryQueryRewrite;
            if (descriptor.MemoryRerank == null)
                descriptor.MemoryRerank = role.MemoryRerank;
            descriptor.LangCode ??= role.LangCode;
            descriptor.Language ??= role.Language;
            descriptor.RuntimeConfigSource = PublishedReleaseSource;
            descriptor.UsesPublishedSnapshot = true;
            descriptor.CurrentReleaseId = release.Id;
            descriptor.CurrentVersion = release.Version;
            descriptor.PluginMappings ??= [];
            descriptor.ContextProviders ??= [];
            descriptor.KnowledgeBindings ??= [];
            return true;
        }
        catch (JsonException)
        {
            descriptor = new AgentRoleRuntimeDescriptorDto
            {
                Id = role.Id,
                Code = role.Code,
                Name = role.Name,
                DisplayName = role.DisplayName,
                Status = role.Status,
                RuntimeConfigSource = DraftRoleSource,
                UsesPublishedSnapshot = false,
                CurrentReleaseId = role.CurrentReleaseId,
                CurrentVersion = role.CurrentVersion,
                AsrProfileId = role.AsrProfileId,
                VadProfileId = role.VadProfileId,
                LlmProfileId = role.LlmProfileId,
                TtsProfileId = role.TtsProfileId,
                TtsVoiceId = role.TtsVoiceId,
                TtsLanguage = role.TtsLanguage,
                TtsVolume = role.TtsVolume,
                TtsRate = role.TtsRate,
                TtsPitch = role.TtsPitch,
                ChatHistoryConf = role.ChatHistoryConf,
                SystemPrompt = role.SystemPrompt,
                KnowledgeNoHitFallbackText = role.KnowledgeNoHitFallbackText,
                MemoryLibraryId = role.MemoryLibraryId,
                MemoryEntityScope = role.MemoryEntityScope,
                MemoryTopK = role.MemoryTopK,
                MemoryMinScore = role.MemoryMinScore,
                MemoryIntentRecall = role.MemoryIntentRecall,
                MemoryQueryRewrite = role.MemoryQueryRewrite,
                MemoryRerank = role.MemoryRerank,
                LangCode = role.LangCode,
                Language = role.Language,
                PluginMappings = [],
                ContextProviders = [],
                KnowledgeBindings = []
            };
            return false;
        }
    }

}
