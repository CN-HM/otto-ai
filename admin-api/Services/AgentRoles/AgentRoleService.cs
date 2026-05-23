using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Voice;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.AgentRoles;

public class AgentRoleService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public AgentRoleService(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public async Task<(List<AgentRoleDto> List, long Total)> GetPageAsync(AgentRoleListQuery query, CancellationToken cancellationToken = default)
    {
        var page = Math.Max(1, query.Page ?? 1);
        var limit = Math.Clamp(query.Limit ?? 10, 1, 100);
        var roles = _db.AiAgentRoles.AsNoTracking().AsQueryable();

        if (!string.IsNullOrWhiteSpace(query.Keyword))
        {
            var keyword = query.Keyword.Trim();
            roles = roles.Where(x => x.Name.Contains(keyword)
                || x.Code.Contains(keyword)
                || (x.DisplayName != null && x.DisplayName.Contains(keyword)));
        }

        if (!string.IsNullOrWhiteSpace(query.Status))
        {
            var status = query.Status.Trim();
            roles = roles.Where(x => x.Status == status);
        }

        var total = await roles.LongCountAsync(cancellationToken);
        var list = await roles
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Code)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        return (list.Select(entity => MapRole(entity)).ToList(), total);
    }

    public async Task<List<AgentRoleDto>> GetAllPublishedActiveAsync(CancellationToken cancellationToken = default)
    {
        var roles = await _db.AiAgentRoles.AsNoTracking()
            .Where(x => x.Status == "active" && x.CurrentReleaseId != null)
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Code)
            .ToListAsync(cancellationToken);
        return roles.Select(entity => MapRole(entity)).ToList();
    }

    public async Task<AgentRoleDto> GetAsync(string id, CancellationToken cancellationToken = default)
    {
        var entity = await GetRequiredRoleAsync(id, false, cancellationToken);
        return await MapRoleAsync(entity, cancellationToken);
    }

    public async Task<List<AgentRoleReleaseDto>> GetReleasesAsync(string id, CancellationToken cancellationToken = default)
    {
        await EnsureRoleExistsAsync(id, cancellationToken);
        var releases = await _db.AiAgentRoleReleases.AsNoTracking()
            .Where(x => x.RoleId == id)
            .OrderByDescending(x => x.PublishedAt)
            .ThenByDescending(x => x.CreatedAt)
            .ToListAsync(cancellationToken);
        return releases.Select(MapRelease).ToList();
    }

    public async Task<AgentRoleDto> CreateAsync(AgentRoleUpsertDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var code = RequireValue(dto.Code, "角色编码不能为空");
        var name = RequireValue(dto.Name, "角色名称不能为空");
        await EnsureBindingTargetsExistAsync(dto, cancellationToken);

        if (await _db.AiAgentRoles.AnyAsync(x => x.Code == code, cancellationToken))
            throw new InvalidOperationException("Error:RoleCodeExists");

        var now = DateTime.UtcNow;
        var entity = new AiAgentRole
        {
            Id = _guidGenerator.Create().ToString("N"),
            Code = code,
            Name = name,
            DisplayName = NormalizeOptionalText(dto.DisplayName),
            Description = NormalizeOptionalText(dto.Description),
            Status = NormalizeStatus(dto.Status),
            Icon = NormalizeOptionalText(dto.Icon),
            CoverImage = NormalizeOptionalText(dto.CoverImage),
            ThemeToken = NormalizeOptionalText(dto.ThemeToken),
            AsrProfileId = NormalizeOptionalText(dto.AsrProfileId),
            VadProfileId = NormalizeOptionalText(dto.VadProfileId),
            LlmProfileId = NormalizeOptionalText(dto.LlmProfileId),
            TtsProfileId = NormalizeOptionalText(dto.TtsProfileId),
            TtsVoiceId = NormalizeOptionalText(dto.TtsVoiceId),
            TtsLanguage = NormalizeOptionalText(dto.TtsLanguage),
            TtsVolume = dto.TtsVolume,
            TtsRate = dto.TtsRate,
            TtsPitch = dto.TtsPitch,
            ChatHistoryConf = dto.ChatHistoryConf,
            SystemPrompt = NormalizeOptionalText(dto.SystemPrompt),
            KnowledgeNoHitFallbackText = NormalizeOptionalText(dto.KnowledgeNoHitFallbackText),
            MemoryLibraryId = null,
            MemoryEntityScope = NormalizeOptionalText(dto.MemoryEntityScope),
            MemoryTopK = dto.MemoryTopK,
            MemoryMinScore = dto.MemoryMinScore,
            MemoryIntentRecall = dto.MemoryIntentRecall,
            MemoryQueryRewrite = dto.MemoryQueryRewrite,
            MemoryRerank = dto.MemoryRerank,
            LangCode = NormalizeOptionalText(dto.LangCode),
            Language = NormalizeOptionalText(dto.Language),
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        _db.AiAgentRoles.Add(entity);
        await ApplyMemoryBindingAsync(entity, dto, operatorUserId, now, cancellationToken);
        await ReplaceChildrenAsync(entity.Id, dto, cancellationToken);
        await _db.SaveChangesAsync(cancellationToken);
        return await MapRoleAsync(entity, cancellationToken);
    }

    public async Task<AgentRoleDto> UpdateAsync(string id, AgentRoleUpsertDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var entity = await GetRequiredRoleAsync(id, true, cancellationToken);
        var code = RequireValue(dto.Code, "角色编码不能为空");
        var name = RequireValue(dto.Name, "角色名称不能为空");
        await EnsureBindingTargetsExistAsync(dto, cancellationToken);

        if (await _db.AiAgentRoles.AnyAsync(x => x.Code == code && x.Id != id, cancellationToken))
            throw new InvalidOperationException("Error:RoleCodeExists");

        entity.Code = code;
        entity.Name = name;
        entity.DisplayName = NormalizeOptionalText(dto.DisplayName);
        entity.Description = NormalizeOptionalText(dto.Description);
        entity.Status = NormalizeStatus(dto.Status, entity.Status);
        entity.Icon = NormalizeOptionalText(dto.Icon);
        entity.CoverImage = NormalizeOptionalText(dto.CoverImage);
        entity.ThemeToken = NormalizeOptionalText(dto.ThemeToken);
        entity.AsrProfileId = NormalizeOptionalText(dto.AsrProfileId);
        entity.VadProfileId = NormalizeOptionalText(dto.VadProfileId);
        entity.LlmProfileId = NormalizeOptionalText(dto.LlmProfileId);
        entity.TtsProfileId = NormalizeOptionalText(dto.TtsProfileId);
        entity.TtsVoiceId = NormalizeOptionalText(dto.TtsVoiceId);
        entity.TtsLanguage = NormalizeOptionalText(dto.TtsLanguage);
        entity.TtsVolume = dto.TtsVolume;
        entity.TtsRate = dto.TtsRate;
        entity.TtsPitch = dto.TtsPitch;
        entity.ChatHistoryConf = dto.ChatHistoryConf;
        entity.SystemPrompt = NormalizeOptionalText(dto.SystemPrompt);
        entity.KnowledgeNoHitFallbackText = NormalizeOptionalText(dto.KnowledgeNoHitFallbackText);
        entity.MemoryEntityScope = NormalizeOptionalText(dto.MemoryEntityScope);
        entity.MemoryTopK = dto.MemoryTopK;
        entity.MemoryMinScore = dto.MemoryMinScore;
        entity.MemoryIntentRecall = dto.MemoryIntentRecall;
        entity.MemoryQueryRewrite = dto.MemoryQueryRewrite;
        entity.MemoryRerank = dto.MemoryRerank;
        entity.LangCode = NormalizeOptionalText(dto.LangCode);
        entity.Language = NormalizeOptionalText(dto.Language);
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = DateTime.UtcNow;

        await ApplyMemoryBindingAsync(entity, dto, operatorUserId, entity.UpdatedAt.Value, cancellationToken);
        await ReplaceChildrenAsync(entity.Id, dto, cancellationToken);
        await _db.SaveChangesAsync(cancellationToken);
        return await MapRoleAsync(entity, cancellationToken);
    }

    public async Task DeleteAsync(string id, CancellationToken cancellationToken = default)
    {
        var entity = await GetRequiredRoleAsync(id, true, cancellationToken);
        if (entity.IsSystem)
            throw new InvalidOperationException("Error:BuiltInAgentRoleDeleteDenied");

        var releases = await _db.AiAgentRoleReleases.Where(x => x.RoleId == id).ToListAsync(cancellationToken);
        if (releases.Count > 0)
            _db.AiAgentRoleReleases.RemoveRange(releases);

        var pluginMappings = await _db.AiAgentRolePluginMappings.Where(x => x.AgentRoleId == id).ToListAsync(cancellationToken);
        if (pluginMappings.Count > 0)
            _db.AiAgentRolePluginMappings.RemoveRange(pluginMappings);

        var contextProviders = await _db.AiAgentRoleContextProviders.Where(x => x.AgentRoleId == id).ToListAsync(cancellationToken);
        if (contextProviders.Count > 0)
            _db.AiAgentRoleContextProviders.RemoveRange(contextProviders);

        var knowledgeBindings = await _db.AiAgentRoleKnowledgeBindings.Where(x => x.AgentRoleId == id).ToListAsync(cancellationToken);
        if (knowledgeBindings.Count > 0)
            _db.AiAgentRoleKnowledgeBindings.RemoveRange(knowledgeBindings);

        _db.AiAgentRoles.Remove(entity);
        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task<AgentRoleReleaseDto> PublishAsync(string id, AgentRolePublishDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var entity = await GetRequiredRoleAsync(id, true, cancellationToken);
        var version = NormalizeOptionalText(dto.Version) ?? $"v{DateTime.UtcNow:yyyy.MM.dd.HHmmss}";

        if (await _db.AiAgentRoleReleases.AnyAsync(x => x.RoleId == id && x.Version == version, cancellationToken))
            throw new InvalidOperationException("Error:ReleaseVersionExists");

        var pluginMappings = await _db.AiAgentRolePluginMappings.AsNoTracking()
            .Where(x => x.AgentRoleId == id)
            .OrderBy(x => x.Id)
            .ToListAsync(cancellationToken);
        var contextProviders = await _db.AiAgentRoleContextProviders.AsNoTracking()
            .Where(x => x.AgentRoleId == id)
            .OrderBy(x => x.CreateDate)
            .ThenBy(x => x.Id)
            .ToListAsync(cancellationToken);
        var knowledgeBindings = await _db.AiAgentRoleKnowledgeBindings.AsNoTracking()
            .Where(x => x.AgentRoleId == id)
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Id)
            .ToListAsync(cancellationToken);

        var now = DateTime.UtcNow;
        var currentReleases = await _db.AiAgentRoleReleases
            .Where(x => x.RoleId == id && x.Status == "published")
            .ToListAsync(cancellationToken);
        foreach (var current in currentReleases)
        {
            current.Status = "history";
            current.Updater = operatorUserId;
            current.UpdatedAt = now;
        }

        entity.CurrentReleaseId = null;
        entity.CurrentVersion = version;
        entity.PublishedAt = now;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;

        var release = new AiAgentRoleRelease
        {
            Id = _guidGenerator.Create().ToString("N"),
            RoleId = entity.Id,
            Version = version,
            Status = "published",
            SnapshotJson = AgentRoleSnapshotBuilder.Build(entity, pluginMappings, contextProviders, knowledgeBindings),
            Remark = NormalizeOptionalText(dto.Remark),
            PublishedAt = now,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        entity.CurrentReleaseId = release.Id;
        entity.CurrentVersion = release.Version;

        _db.AiAgentRoleReleases.Add(release);
        await _db.SaveChangesAsync(cancellationToken);
        return MapRelease(release);
    }

    public async Task<AgentRoleReleaseDto> ActivateReleaseAsync(string id, string releaseId, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var entity = await GetRequiredRoleAsync(id, true, cancellationToken);
        var target = await _db.AiAgentRoleReleases
            .FirstOrDefaultAsync(x => x.Id == releaseId && x.RoleId == id, cancellationToken);
        if (target == null)
            throw new InvalidOperationException("Error:ReleaseVersionNotFound");

        var now = DateTime.UtcNow;
        var currentReleases = await _db.AiAgentRoleReleases
            .Where(x => x.RoleId == id && x.Status == "published")
            .ToListAsync(cancellationToken);
        foreach (var current in currentReleases)
        {
            current.Status = current.Id == target.Id ? "published" : "history";
            current.Updater = operatorUserId;
            current.UpdatedAt = now;
        }

        if (currentReleases.All(x => x.Id != target.Id))
        {
            target.Status = "published";
            target.Updater = operatorUserId;
            target.UpdatedAt = now;
        }

        entity.CurrentReleaseId = target.Id;
        entity.CurrentVersion = target.Version;
        entity.PublishedAt = target.PublishedAt ?? now;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;

        await _db.SaveChangesAsync(cancellationToken);
        return MapRelease(target);
    }

    public async Task<AiAgentRole> ResolveByIdOrCodeAsync(string? roleId, string? roleCode, bool tracking = false, CancellationToken cancellationToken = default)
    {
        var query = tracking ? _db.AiAgentRoles.AsQueryable() : _db.AiAgentRoles.AsNoTracking();
        var normalizedId = NormalizeOptionalText(roleId);
        if (!string.IsNullOrWhiteSpace(normalizedId))
        {
            var byId = await query.FirstOrDefaultAsync(x => x.Id == normalizedId, cancellationToken);
            if (byId != null)
                return byId;
            throw new InvalidOperationException("Error:AgentRoleNotFound");
        }

        var normalizedCode = NormalizeOptionalText(roleCode);
        if (!string.IsNullOrWhiteSpace(normalizedCode))
        {
            var byCode = await query.FirstOrDefaultAsync(x => x.Code == normalizedCode, cancellationToken);
            if (byCode != null)
                return byCode;
        }

        throw new InvalidOperationException("Error:AgentRoleNotFound");
    }

    public async Task<AiAgentRoleRelease?> ResolveCurrentReleaseAsync(AiAgentRole role, CancellationToken cancellationToken = default)
    {
        var releaseId = NormalizeOptionalText(role.CurrentReleaseId);
        if (!string.IsNullOrWhiteSpace(releaseId))
        {
            var byId = await _db.AiAgentRoleReleases.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == releaseId && x.RoleId == role.Id, cancellationToken);
            if (byId != null)
                return byId;
        }

        return await _db.AiAgentRoleReleases.AsNoTracking()
            .Where(x => x.RoleId == role.Id && x.Status == "published")
            .OrderByDescending(x => x.PublishedAt)
            .ThenByDescending(x => x.CreatedAt)
            .FirstOrDefaultAsync(cancellationToken);
    }

    public async Task<AiAgentRoleRelease?> ResolveReleaseAsync(AiAgentRole role, string? releaseId, CancellationToken cancellationToken = default)
    {
        var normalizedReleaseId = NormalizeOptionalText(releaseId);
        if (string.IsNullOrWhiteSpace(normalizedReleaseId))
            return null;

        return await _db.AiAgentRoleReleases.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == normalizedReleaseId && x.RoleId == role.Id, cancellationToken);
    }

    public async Task<List<AiAgentRolePluginMapping>> GetPluginMappingsAsync(string roleId, CancellationToken cancellationToken = default)
    {
        return await _db.AiAgentRolePluginMappings.AsNoTracking()
            .Where(x => x.AgentRoleId == roleId)
            .OrderBy(x => x.Id)
            .ToListAsync(cancellationToken);
    }

    public async Task<List<AiAgentRoleContextProvider>> GetContextProvidersAsync(string roleId, CancellationToken cancellationToken = default)
    {
        return await _db.AiAgentRoleContextProviders.AsNoTracking()
            .Where(x => x.AgentRoleId == roleId)
            .OrderBy(x => x.CreateDate)
            .ThenBy(x => x.Id)
            .ToListAsync(cancellationToken);
    }

    public async Task<List<AiAgentRoleKnowledgeBinding>> GetKnowledgeBindingsAsync(string roleId, CancellationToken cancellationToken = default)
    {
        return await _db.AiAgentRoleKnowledgeBindings.AsNoTracking()
            .Where(x => x.AgentRoleId == roleId)
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Id)
            .ToListAsync(cancellationToken);
    }

    private async Task ReplaceChildrenAsync(string roleId, AgentRoleUpsertDto dto, CancellationToken cancellationToken)
    {
        var normalizedKnowledgeBindings = NormalizeKnowledgeBindings(dto.KnowledgeBindings);
        if (normalizedKnowledgeBindings.Count > 0 && string.IsNullOrWhiteSpace(NormalizeOptionalText(dto.KnowledgeNoHitFallbackText)))
            throw new InvalidOperationException("Error:KnowledgeFallbackRequired");
        await EnsureDatasetsExistAsync(normalizedKnowledgeBindings.Select(item => item.DatasetId).ToList(), cancellationToken);

        var existingPluginMappings = await _db.AiAgentRolePluginMappings
            .Where(x => x.AgentRoleId == roleId)
            .ToListAsync(cancellationToken);
        if (existingPluginMappings.Count > 0)
            _db.AiAgentRolePluginMappings.RemoveRange(existingPluginMappings);

        var existingContextProviders = await _db.AiAgentRoleContextProviders
            .Where(x => x.AgentRoleId == roleId)
            .ToListAsync(cancellationToken);
        if (existingContextProviders.Count > 0)
            _db.AiAgentRoleContextProviders.RemoveRange(existingContextProviders);

        var existingKnowledgeBindings = await _db.AiAgentRoleKnowledgeBindings
            .Where(x => x.AgentRoleId == roleId)
            .ToListAsync(cancellationToken);
        if (existingKnowledgeBindings.Count > 0)
            _db.AiAgentRoleKnowledgeBindings.RemoveRange(existingKnowledgeBindings);

        var pluginMappings = (dto.PluginMappings ?? [])
            .Select(item => new AiAgentRolePluginMapping
            {
                AgentRoleId = roleId,
                PluginId = NormalizeOptionalText(item.PluginId) ?? string.Empty,
                ParamInfo = NormalizeJson(item.ParamInfo) ?? "{}",
                ProviderCode = NormalizeOptionalText(item.ProviderCode)
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.PluginId))
            .ToList();
        if (pluginMappings.Count > 0)
            _db.AiAgentRolePluginMappings.AddRange(pluginMappings);

        var now = DateTime.UtcNow;
        var contextProviders = (dto.ContextProviders ?? [])
            .Select(item => new AiAgentRoleContextProvider
            {
                Id = NormalizeOptionalText(item.Id) ?? _guidGenerator.Create().ToString("N"),
                AgentRoleId = roleId,
                Url = NormalizeOptionalText(item.Url),
                Headers = NormalizeJson(item.Headers),
                CreateDate = now
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.Url))
            .ToList();
        if (contextProviders.Count > 0)
            _db.AiAgentRoleContextProviders.AddRange(contextProviders);

        var knowledgeBindings = normalizedKnowledgeBindings
            .Select(item => new AiAgentRoleKnowledgeBinding
            {
                AgentRoleId = roleId,
                DatasetId = item.DatasetId!,
                Sort = item.Sort ?? 0,
                Enabled = item.Enabled ?? true,
                TopK = item.TopK,
                MinScore = item.MinScore,
                RerankEnabled = item.RerankEnabled,
                MaxChunks = item.MaxChunks
            })
            .ToList();
        if (knowledgeBindings.Count > 0)
            _db.AiAgentRoleKnowledgeBindings.AddRange(knowledgeBindings.ToArray());
    }

    private async Task EnsureRoleExistsAsync(string id, CancellationToken cancellationToken)
    {
        if (!await _db.AiAgentRoles.AsNoTracking().AnyAsync(x => x.Id == id, cancellationToken))
            throw new InvalidOperationException("Error:AgentRoleNotFound");
    }

    private async Task<AiAgentRole> GetRequiredRoleAsync(string id, bool tracking, CancellationToken cancellationToken)
    {
        var query = tracking ? _db.AiAgentRoles.AsQueryable() : _db.AiAgentRoles.AsNoTracking();
        var entity = await query.FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        if (entity == null)
            throw new InvalidOperationException("Error:AgentRoleNotFound");
        return entity;
    }

    private async Task<AgentRoleDto> MapRoleAsync(AiAgentRole entity, CancellationToken cancellationToken)
    {
        var pluginMappings = await GetPluginMappingsAsync(entity.Id, cancellationToken);
        var contextProviders = await GetContextProvidersAsync(entity.Id, cancellationToken);
        var knowledgeBindings = await GetKnowledgeBindingsAsync(entity.Id, cancellationToken);
        var result = MapRole(entity, pluginMappings, contextProviders, knowledgeBindings);
        if (!string.IsNullOrWhiteSpace(entity.MemoryLibraryId))
        {
            result.MemoryModelId = await _db.AiMemoryLibraries.AsNoTracking()
                .Where(x => x.Id == entity.MemoryLibraryId)
                .Select(x => x.MemoryModelId)
                .FirstOrDefaultAsync(cancellationToken);
        }

        return result;
    }

    private static AgentRoleDto MapRole(
        AiAgentRole entity,
        IReadOnlyList<AiAgentRolePluginMapping>? pluginMappings = null,
        IReadOnlyList<AiAgentRoleContextProvider>? contextProviders = null,
        IReadOnlyList<AiAgentRoleKnowledgeBinding>? knowledgeBindings = null)
    {
        return new AgentRoleDto
        {
            Id = entity.Id,
            Code = entity.Code,
            Name = entity.Name,
            DisplayName = entity.DisplayName,
            Description = entity.Description,
            Status = entity.Status,
            IsSystem = entity.IsSystem,
            Icon = entity.Icon,
            CoverImage = entity.CoverImage,
            ThemeToken = entity.ThemeToken,
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
            MemoryEnabled = !string.IsNullOrWhiteSpace(entity.MemoryLibraryId),
            MemoryLibraryId = entity.MemoryLibraryId,
            MemoryEntityScope = entity.MemoryEntityScope,
            MemoryTopK = entity.MemoryTopK,
            MemoryMinScore = entity.MemoryMinScore,
            MemoryIntentRecall = entity.MemoryIntentRecall,
            MemoryQueryRewrite = entity.MemoryQueryRewrite,
            MemoryRerank = entity.MemoryRerank,
            LangCode = entity.LangCode,
            Language = entity.Language,
            CurrentReleaseId = entity.CurrentReleaseId,
            CurrentVersion = entity.CurrentVersion,
            PublishedAt = entity.PublishedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Sort = entity.Sort,
            Creator = entity.Creator,
            CreatedAt = entity.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Updater = entity.Updater,
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            PluginMappings = (pluginMappings ?? [])
                .Select(item => new AgentRolePluginMappingDto
                {
                    PluginId = item.PluginId,
                    ParamInfo = item.ParamInfo,
                    ProviderCode = item.ProviderCode
                })
                .ToList(),
            ContextProviders = (contextProviders ?? [])
                .Select(item => new AgentRoleContextProviderDto
                {
                    Id = item.Id,
                    Url = item.Url,
                    Headers = item.Headers
                })
                .ToList(),
            KnowledgeBindings = (knowledgeBindings ?? [])
                .Select(item => new AgentRoleKnowledgeBindingDto
                {
                    Id = item.Id,
                    DatasetId = item.DatasetId,
                    Sort = item.Sort,
                    Enabled = item.Enabled,
                    TopK = item.TopK,
                    MinScore = item.MinScore,
                    RerankEnabled = item.RerankEnabled,
                    MaxChunks = item.MaxChunks
                })
                .ToList()
        };
    }

    private static AgentRoleReleaseDto MapRelease(AiAgentRoleRelease entity)
    {
        return new AgentRoleReleaseDto
        {
            Id = entity.Id,
            RoleId = entity.RoleId,
            Version = entity.Version,
            Status = entity.Status,
            SnapshotJson = entity.SnapshotJson,
            Remark = entity.Remark,
            PublishedAt = entity.PublishedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Creator = entity.Creator,
            CreatedAt = entity.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Updater = entity.Updater,
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static string NormalizeStatus(string? value, string fallback = "active")
    {
        var normalized = NormalizeOptionalText(value);
        return string.IsNullOrWhiteSpace(normalized) ? fallback : normalized;
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private static string? NormalizeJson(string? value)
    {
        return NormalizeOptionalText(value);
    }

    private static List<AgentRoleKnowledgeBindingDto> NormalizeKnowledgeBindings(List<AgentRoleKnowledgeBindingDto>? value)
    {
        return (value ?? [])
            .Select((item, index) => new AgentRoleKnowledgeBindingDto
            {
                DatasetId = NormalizeOptionalText(item.DatasetId),
                Sort = item.Sort ?? index,
                Enabled = item.Enabled ?? true,
                TopK = item.TopK is >= 1 and <= 20 ? item.TopK : 5,
                MinScore = item.MinScore is >= 0 and <= 1 ? item.MinScore : 0.3,
                RerankEnabled = item.RerankEnabled ?? false,
                MaxChunks = item.MaxChunks is >= 1 and <= 20 ? item.MaxChunks : 5
            })
            .Where(item => !string.IsNullOrWhiteSpace(item.DatasetId))
            .GroupBy(item => item.DatasetId)
            .Select(group => group.First())
            .OrderBy(item => item.Sort)
            .ToList();
    }

    private async Task EnsureDatasetsExistAsync(IReadOnlyList<string?> datasetIds, CancellationToken cancellationToken)
    {
        var normalizedIds = datasetIds
            .Select(NormalizeOptionalText)
            .Where(id => !string.IsNullOrWhiteSpace(id))
            .Cast<string>()
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();
        if (normalizedIds.Count == 0)
            return;

        var existingCount = await _db.AiRagDatasets.AsNoTracking()
            .Where(x => normalizedIds.Contains(x.DatasetId) || normalizedIds.Contains(x.Id))
            .Select(x => x.DatasetId)
            .Distinct()
            .CountAsync(cancellationToken);
        if (existingCount != normalizedIds.Count)
            throw new InvalidOperationException("Error:InvalidKnowledgeBinding");
    }

    private async Task EnsureBindingTargetsExistAsync(AgentRoleUpsertDto dto, CancellationToken cancellationToken)
    {
        var asrProfileId = NormalizeOptionalText(dto.AsrProfileId);
        if (!string.IsNullOrWhiteSpace(asrProfileId)
            && !await _db.AiAsrProfiles.AsNoTracking().AnyAsync(x => x.Id == asrProfileId, cancellationToken))
            throw new InvalidOperationException("Error:SelectedAsrProfileNotFound");

        var vadProfileId = NormalizeOptionalText(dto.VadProfileId);
        if (!string.IsNullOrWhiteSpace(vadProfileId)
            && !await _db.AiVadProfiles.AsNoTracking().AnyAsync(x => x.Id == vadProfileId, cancellationToken))
            throw new InvalidOperationException("Error:SelectedVadProfileNotFound");

        var llmProfileId = NormalizeOptionalText(dto.LlmProfileId);
        if (!string.IsNullOrWhiteSpace(llmProfileId)
            && !await _db.AiLlmProfiles.AsNoTracking().AnyAsync(x => x.Id == llmProfileId, cancellationToken))
            throw new InvalidOperationException("Error:SelectedLlmProfileNotFound");

        var memoryModelId = NormalizeOptionalText(dto.MemoryModelId);
        if (!string.IsNullOrWhiteSpace(memoryModelId))
        {
            var memoryModel = await _db.AiLlmProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == memoryModelId, cancellationToken);
            if (memoryModel == null)
                throw new InvalidOperationException("Error:MemoryExtractionModelInvalid");
            if (string.IsNullOrWhiteSpace(memoryModel.BaseUrl))
                throw new InvalidOperationException("Error:MemoryExtractionLlmBaseUrlMissing");
        }

        var ttsProfileId = NormalizeOptionalText(dto.TtsProfileId);
        if (!string.IsNullOrWhiteSpace(ttsProfileId)
            && !await _db.AiTtsProfiles.AsNoTracking().AnyAsync(x => x.Id == ttsProfileId, cancellationToken))
            throw new InvalidOperationException("Error:SelectedTtsProfileNotFound");

        var ttsVoiceId = NormalizeOptionalText(dto.TtsVoiceId);
        if (!string.IsNullOrWhiteSpace(ttsProfileId) && string.IsNullOrWhiteSpace(ttsVoiceId))
            throw new InvalidOperationException("Error:TtsVoiceRequiredWhenTtsEnabled");
        if (string.IsNullOrWhiteSpace(ttsProfileId) && !string.IsNullOrWhiteSpace(ttsVoiceId))
            throw new InvalidOperationException("Error:TtsProfileRequiredBeforeVoice");
        if (!string.IsNullOrWhiteSpace(ttsVoiceId))
        {
            var voice = await _db.AiTtsVoices.AsNoTracking().FirstOrDefaultAsync(x => x.Id == ttsVoiceId, cancellationToken);
            if (voice == null)
                throw new InvalidOperationException("Error:TtsVoiceNotFound");
            if (!string.IsNullOrWhiteSpace(ttsProfileId)
                && !string.Equals(voice.TtsProfileId, ttsProfileId, StringComparison.OrdinalIgnoreCase))
                throw new InvalidOperationException("Error:TtsVoiceProfileMismatch");
            if (!string.IsNullOrWhiteSpace(ttsProfileId))
            {
                var profile = await _db.AiTtsProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == ttsProfileId, cancellationToken);
                if (profile != null)
                    TtsVoiceResourceValidator.EnsureMatchesProfileResource(profile, voice, "保存智能体角色");
            }
        }
    }

    private async Task ApplyMemoryBindingAsync(AiAgentRole entity, AgentRoleUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        if (dto.MemoryEnabled != true)
        {
            entity.MemoryLibraryId = null;
            return;
        }

        var memoryModelId = RequireValue(dto.MemoryModelId, "开启长期记忆后必须选择记忆提取模型");

        var existingLibrary = !string.IsNullOrWhiteSpace(entity.MemoryLibraryId)
            ? await _db.AiMemoryLibraries.FirstOrDefaultAsync(x => x.Id == entity.MemoryLibraryId, cancellationToken)
            : null;

        existingLibrary ??= await _db.AiMemoryLibraries
            .FirstOrDefaultAsync(x => x.AgentId == entity.Id && x.Code == BuildMemoryLibraryCode(entity.Code), cancellationToken);

        if (existingLibrary == null)
        {
            existingLibrary = new AiMemoryLibrary
            {
                Id = _guidGenerator.Create().ToString("N"),
                AgentId = entity.Id,
                Code = BuildMemoryLibraryCode(entity.Code),
                Name = $"{entity.Name}记忆库",
                Description = $"{entity.Name}的角色专属长期记忆库",
                Status = 1,
                IsDefault = false,
                EntityScope = NormalizeMemoryEntityScope(entity.MemoryEntityScope),
                MemoryModelId = memoryModelId,
                RetrievalConfig = BuildMemoryRetrievalConfigJson(entity),
                WriteConfig = BuildMemoryWriteConfigJson(),
                Sort = entity.Sort,
                Creator = operatorUserId,
                CreatedAt = now,
                Updater = operatorUserId,
                UpdatedAt = now
            };
            _db.AiMemoryLibraries.Add(existingLibrary);
        }
        else
        {
            existingLibrary.AgentId = entity.Id;
            existingLibrary.Code = BuildMemoryLibraryCode(entity.Code);
            existingLibrary.Name = $"{entity.Name}记忆库";
            existingLibrary.Description = $"{entity.Name}的角色专属长期记忆库";
            existingLibrary.Status = 1;
            existingLibrary.EntityScope = NormalizeMemoryEntityScope(entity.MemoryEntityScope);
            existingLibrary.MemoryModelId = memoryModelId;
            existingLibrary.RetrievalConfig = BuildMemoryRetrievalConfigJson(entity);
            existingLibrary.WriteConfig ??= BuildMemoryWriteConfigJson();
            existingLibrary.Sort = entity.Sort;
            existingLibrary.Updater = operatorUserId;
            existingLibrary.UpdatedAt = now;
        }

        entity.MemoryLibraryId = existingLibrary.Id;
    }

    private static string BuildMemoryLibraryCode(string roleCode)
    {
        var normalized = roleCode.Trim();
        return normalized.Length <= 56 ? $"mem_{normalized}" : $"mem_{normalized[..56]}";
    }

    private static string NormalizeMemoryEntityScope(string? value)
    {
        return string.Equals(value?.Trim(), "user", StringComparison.OrdinalIgnoreCase) ? "user" : "device";
    }

    private static string BuildMemoryRetrievalConfigJson(AiAgentRole entity)
    {
        return JsonSerializer.Serialize(new Dictionary<string, object?>
        {
            ["topK"] = entity.MemoryTopK ?? 5,
            ["minScore"] = entity.MemoryMinScore ?? 0.3,
            ["intentRecall"] = entity.MemoryIntentRecall ?? true,
            ["queryRewrite"] = entity.MemoryQueryRewrite ?? false,
            ["rerank"] = entity.MemoryRerank ?? false
        });
    }

    private static string BuildMemoryWriteConfigJson()
    {
        return JsonSerializer.Serialize(new Dictionary<string, object?>
        {
            ["autoExtract"] = true,
            ["minImportance"] = 1,
            ["deduplicate"] = true
        });
    }

    private static string RequireValue(string? value, string message)
    {
        var normalized = NormalizeOptionalText(value);
        if (string.IsNullOrWhiteSpace(normalized))
            throw new InvalidOperationException(message);
        return normalized;
    }

    public Task<List<OptionItemDto>> GetIconOptionsAsync(CancellationToken cancellationToken = default)
    {
        var icons = new List<OptionItemDto>
        {
            new() { Label = "机器人", Value = "robot", Description = "robot" },
            new() { Label = "爱心", Value = "heart", Description = "heart" },
            new() { Label = "星星", Value = "star", Description = "star" },
            new() { Label = "闪光", Value = "sparkles", Description = "sparkles" },
            new() { Label = "笑脸", Value = "smile", Description = "smile" },
            new() { Label = "家", Value = "home", Description = "home" },
            new() { Label = "音乐", Value = "music", Description = "music" },
            new() { Label = "游戏手柄", Value = "gamepad", Description = "gamepad" },
            new() { Label = "书本", Value = "book", Description = "book" },
            new() { Label = "礼物", Value = "gift", Description = "gift" }
        };
        return Task.FromResult(icons);
    }

    public Task<List<OptionItemDto>> GetThemeOptionsAsync(CancellationToken cancellationToken = default)
    {
        var themes = new List<OptionItemDto>
        {
            new() { Label = "默认主题", Value = "default", Description = "通用浅色风格" },
            new() { Label = "冷蓝", Value = "cool", Description = "cool" },
            new() { Label = "多彩", Value = "playful", Description = "playful" },
            new() { Label = "深灰", Value = "professional", Description = "professional" },
            new() { Label = "纯白", Value = "minimal", Description = "minimal" }
        };
        return Task.FromResult(themes);
    }

    public async Task<AgentRoleBindingOptionsDto> GetBindingOptionsAsync(CancellationToken cancellationToken = default)
    {
        var asrProfiles = await _db.AiAsrProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .ToListAsync(cancellationToken);

        var llmProfiles = await _db.AiLlmProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .ToListAsync(cancellationToken);

        var vadProfiles = await _db.AiVadProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .ToListAsync(cancellationToken);

        var ttsProfiles = await _db.AiTtsProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .ToListAsync(cancellationToken);

        return new AgentRoleBindingOptionsDto
        {
            AsrProfiles = asrProfiles.Select(item => BuildProfileOption(item.Name, item.Id, item.Description, item.IsDefault)).ToList(),
            VadProfiles = vadProfiles.Select(item => BuildProfileOption(item.Name, item.Id, item.Description, item.IsDefault)).ToList(),
            LlmProfiles = llmProfiles.Select(item => BuildProfileOption(item.Name, item.Id, item.Description, item.IsDefault)).ToList(),
            TtsProfiles = ttsProfiles.Select(item => BuildProfileOption(item.Name, item.Id, item.Description, item.IsDefault)).ToList()
        };
    }

    private static OptionItemDto BuildProfileOption(string name, string id, string? description, bool isDefault)
    {
        var label = isDefault ? $"{name}（默认）" : name;
        var detail = NormalizeOptionalText(description);
        return new OptionItemDto
        {
            Label = label,
            Value = id,
            Description = string.IsNullOrWhiteSpace(detail) ? null : detail
        };
    }
}
