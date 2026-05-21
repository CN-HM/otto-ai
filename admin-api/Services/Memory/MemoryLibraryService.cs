using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Knowledge.Interfaces;
using AiAdmin.Services.Memory.Dtos;
using AiAdmin.Services.Runtime;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.Memory;

/**
 * 记忆库核心服务：管理长期记忆（Library/Rule/Record）的 CRUD、检索与运行时上下文构建。
 *
 * 设计要点：
 * 1. 权限模型：非超管只能访问自己拥有的记忆库；超管可跨用户访问。
 * 2. 默认库：每个用户仅允许一个默认库，设置时自动取消其他默认标记。
 * 3. 记录检索：当前为内存关键词评分排序（非向量检索），预留未来向量检索替换路径。
 * 4. 运行时集成：BuildRuntimeContextAsync 为语音对话链路提供 agent 级别的记忆上下文。
 */
public class MemoryLibraryService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;
    private readonly IKnowledgeEmbeddingProvider _embeddingProvider;
    private readonly IMemoryVectorSearchProvider _vectorSearchProvider;

    public MemoryLibraryService(
        AiAdminDbContext db,
        IGuidGenerator guidGenerator,
        IKnowledgeEmbeddingProvider embeddingProvider,
        IMemoryVectorSearchProvider vectorSearchProvider)
    {
        _db = db;
        _guidGenerator = guidGenerator;
        _embeddingProvider = embeddingProvider;
        _vectorSearchProvider = vectorSearchProvider;
    }

    // ==================== 记忆库 CRUD ====================

    public async Task<(List<MemoryLibraryDto> List, long Total)> GetPageAsync(
        MemoryLibraryListQuery query,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var page = Math.Max(1, query.Page ?? 1);
        var limit = Math.Clamp(query.Limit ?? 10, 1, 100);
        var libraries = _db.AiMemoryLibraries.AsNoTracking().AsQueryable();
        if (!isSuperAdmin)
        {
            libraries = libraries.Where(x => x.UserId == currentUserId);
        }

        if (!string.IsNullOrWhiteSpace(query.Keyword))
        {
            var keyword = query.Keyword.Trim();
            libraries = libraries.Where(x => x.Name.Contains(keyword)
                || x.Code.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword)));
        }

        if (!string.IsNullOrWhiteSpace(query.AgentId))
        {
            var agentId = query.AgentId.Trim();
            libraries = libraries.Where(x => x.AgentId == agentId);
        }

        if (query.Status.HasValue)
        {
            libraries = libraries.Where(x => x.Status == query.Status.Value);
        }

        var total = await libraries.LongCountAsync(cancellationToken);
        var list = await libraries
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.CreatedAt)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        return (list.Select(MapLibrary).ToList(), total);
    }

    public async Task<MemoryLibraryDto> GetAsync(
        string id,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var library = await GetAccessibleLibraryAsync(id,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        return MapLibrary(library);
    }

    // 创建记忆库：若绑定 agent 则归属到 agent 的拥有者；自动生成唯一 Code。
    public async Task<MemoryLibraryDto> CreateAsync(
        MemoryLibraryUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        var agent = await ResolveAgentAsync(dto.AgentId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var ownerUserId = agent?.UserId ?? currentUserId;
        var code = await EnsureUniqueLibraryCodeAsync(dto.Code,
            ownerUserId,
            null,
            cancellationToken);
        var memoryModelId = NormalizeOptionalText(dto.MemoryModelId);
        await EnsureMemoryExtractionModelReadyAsync(memoryModelId, cancellationToken);

        var entity = new AiMemoryLibrary
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = ownerUserId,
            AgentId = agent?.Id,
            Code = code,
            Name = RequireValue(dto.Name,
                "记忆库名称不能为空"),
            Description = NormalizeOptionalText(dto.Description),
            Status = (short)(dto.Status ?? 1),
            IsDefault = dto.IsDefault == 1,
            EntityScope = NormalizeEntityScope(dto.EntityScope),
            MemoryModelId = memoryModelId,
            RetrievalConfig = SerializeRetrievalConfig(dto.RetrievalConfig),
            WriteConfig = SerializeWriteConfig(dto.WriteConfig),
            Sort = dto.Sort ?? 0,
            Creator = currentUserId,
            CreatedAt = now,
            Updater = currentUserId,
            UpdatedAt = now
        };

        // 默认库互斥：同一用户下仅允许一个默认库
        if (entity.IsDefault)
        {
            await ResetDefaultLibrariesAsync(ownerUserId,
                entity.Id,
                cancellationToken);
        }

        _db.AiMemoryLibraries.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapLibrary(entity);
    }

    public async Task<MemoryLibraryDto> UpdateAsync(
        string id,
        MemoryLibraryUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var library = await GetAccessibleLibraryAsync(id,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var agent = await ResolveAgentAsync(dto.AgentId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);

        if (!string.IsNullOrWhiteSpace(dto.Code))
        {
            library.Code = await EnsureUniqueLibraryCodeAsync(dto.Code,
                library.UserId,
                library.Id,
                cancellationToken);
        }

        if (!string.IsNullOrWhiteSpace(dto.Name))
        {
            library.Name = dto.Name.Trim();
        }

        if (dto.Description != null)
        {
            library.Description = NormalizeOptionalText(dto.Description);
        }

        if (dto.Status.HasValue)
        {
            library.Status = (short)dto.Status.Value;
        }

        if (dto.IsDefault.HasValue)
        {
            library.IsDefault = dto.IsDefault == 1;
        }

        if (dto.EntityScope != null)
        {
            library.EntityScope = NormalizeEntityScope(dto.EntityScope);
        }

        if (dto.MemoryModelId != null)
        {
            var memoryModelId = NormalizeOptionalText(dto.MemoryModelId);
            await EnsureMemoryExtractionModelReadyAsync(memoryModelId, cancellationToken);
            library.MemoryModelId = memoryModelId;
        }

        if (dto.RetrievalConfig != null)
        {
            library.RetrievalConfig = SerializeRetrievalConfig(dto.RetrievalConfig);
        }

        if (dto.WriteConfig != null)
        {
            library.WriteConfig = SerializeWriteConfig(dto.WriteConfig);
        }

        if (dto.Sort.HasValue)
        {
            library.Sort = dto.Sort.Value;
        }

        if (dto.AgentId != null)
        {
            library.AgentId = agent?.Id;
            if (agent?.UserId != null)
            {
                library.UserId = agent.UserId;
            }
        }

        if (library.IsDefault)
        {
            await ResetDefaultLibrariesAsync(library.UserId,
                library.Id,
                cancellationToken);
        }

        library.Updater = currentUserId;
        library.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
        return MapLibrary(library);
    }

    // 级联删除：同步清除库下的规则、记录、检索日志，避免外键残留。
    public async Task DeleteAsync(
        string id,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var library = await GetAccessibleLibraryAsync(id,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var rules = _db.AiMemoryRules.Where(x => x.LibraryId == id);
        var records = _db.AiMemoryRecords.Where(x => x.LibraryId == id);
        var searchLogs = _db.AiMemorySearchLogs.Where(x => x.LibraryId == id);
        _db.AiMemoryRules.RemoveRange(rules);
        _db.AiMemoryRecords.RemoveRange(records);
        _db.AiMemorySearchLogs.RemoveRange(searchLogs);
        _db.AiMemoryLibraries.Remove(library);
        await _db.SaveChangesAsync(cancellationToken);
    }

    // ==================== 记忆规则 CRUD ====================

    public async Task<List<MemoryRuleDto>> GetRulesAsync(
        string libraryId,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var rules = await _db.AiMemoryRules.AsNoTracking()
            .Where(x => x.LibraryId == libraryId)
            .OrderBy(x => x.CreatedAt)
            .ToListAsync(cancellationToken);
        return rules.Select(MapRule).ToList();
    }

    public async Task<MemoryRuleDto> CreateRuleAsync(
        string libraryId,
        MemoryRuleUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var now = DateTime.UtcNow;
        var ruleType = dto.RuleType;
        var ruleTypeValue = MemoryRuleTypes.ToStorageValue(ruleType);
        var entity = new AiMemoryRule
        {
            Id = _guidGenerator.Create().ToString("N"),
            LibraryId = libraryId,
            RuleCode = NormalizeRuleCode(null, dto.RuleName),
            RuleType = ruleTypeValue,
            RuleName = RequireValue(dto.RuleName,
                "规则名称不能为空"),
            Instruction = NormalizeOptionalText(dto.Instruction),
            TtlDays = NormalizeNullableInt(dto.TtlDays),
            IsEnabled = dto.IsEnabled != 0,
            Creator = currentUserId,
            CreatedAt = now,
            Updater = currentUserId,
            UpdatedAt = now
        };
        ApplyFixedRuleRuntimePolicy(entity);
        _db.AiMemoryRules.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapRule(entity);
    }

    public async Task<MemoryRuleDto> UpdateRuleAsync(
        string libraryId,
        string ruleId,
        MemoryRuleUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var entity = await _db.AiMemoryRules.FirstOrDefaultAsync(x => x.Id == ruleId && x.LibraryId == libraryId,
            cancellationToken);
        if (entity == null)
        {
            throw new InvalidOperationException("Error:MemoryRuleNotFound");
        }

        entity.RuleType = MemoryRuleTypes.ToStorageValue(dto.RuleType);

        if (!string.IsNullOrWhiteSpace(dto.RuleName))
        {
            entity.RuleName = dto.RuleName.Trim();
        }

        if (dto.Instruction != null)
        {
            entity.Instruction = NormalizeOptionalText(dto.Instruction);
        }

        if (dto.TtlDays.HasValue)
        {
            entity.TtlDays = NormalizeNullableInt(dto.TtlDays);
        }

        if (dto.IsEnabled.HasValue)
        {
            entity.IsEnabled = dto.IsEnabled != 0;
        }

        ApplyFixedRuleRuntimePolicy(entity);
        entity.RuleCode = NormalizeRuleCode(null, entity.RuleName);
        entity.Updater = currentUserId;
        entity.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
        return MapRule(entity);
    }

    public async Task DeleteRuleAsync(
        string libraryId,
        string ruleId,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var entity = await _db.AiMemoryRules.FirstOrDefaultAsync(x => x.Id == ruleId && x.LibraryId == libraryId,
            cancellationToken);
        if (entity == null)
        {
            throw new InvalidOperationException("Error:MemoryRuleNotFound");
        }

        _db.AiMemoryRules.Remove(entity);
        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task<(List<MemoryRecordDto> List, long Total)> GetRecordsPageAsync(
        string libraryId,
        MemoryRecordPageQuery query,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var page = Math.Max(1, query.Page ?? 1);
        var limit = Math.Clamp(query.Limit ?? 20, 1, 100);
        var records = BuildRecordFilter(_db.AiMemoryRecords.AsNoTracking(),
            libraryId,
            null,
            null,
            query.RecordType,
            query.Keyword,
            query.IncludeExpired == 1,
            null);
        var total = await records.LongCountAsync(cancellationToken);
        var list = await records
            .OrderByDescending(x => x.IsPinned)
            .ThenByDescending(x => x.Importance)
            .ThenByDescending(x => x.UpdatedAt)
            .ThenByDescending(x => x.CreatedAt)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapRecord).ToList(), total);
    }

    // ==================== 记忆记录 CRUD ====================

    public async Task<MemoryRecordDto> CreateRecordAsync(
        string libraryId,
        MemoryRecordUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var library = await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        return await CreateRecordInternalAsync(library,
            dto,
            currentUserId,
            cancellationToken);
    }

    // 服务内部调用（如语音运行时）：不校验用户权限，仅校验库存在且启用。
    public async Task<MemoryRecordDto> CreateRecordByServiceAsync(
        string libraryId,
        MemoryRecordUpsertDto dto,
        CancellationToken cancellationToken = default)
    {
        var library = await _db.AiMemoryLibraries.FirstOrDefaultAsync(x => x.Id == libraryId && x.Status == 1,
            cancellationToken);
        if (library == null)
        {
            throw new InvalidOperationException("Error:MemoryLibraryNotFound");
        }

        return await CreateRecordInternalAsync(library,
            dto,
            null,
            cancellationToken);
    }

    public async Task<MemoryRecordDto> UpdateRecordAsync(
        string libraryId,
        string recordId,
        MemoryRecordUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var entity = await _db.AiMemoryRecords.FirstOrDefaultAsync(x => x.Id == recordId && x.LibraryId == libraryId,
            cancellationToken);
        if (entity == null)
        {
            throw new InvalidOperationException("Error:MemoryRecordNotFound");
        }

        if (!string.IsNullOrWhiteSpace(dto.AgentId)) entity.AgentId = dto.AgentId.Trim();
        if (!string.IsNullOrWhiteSpace(dto.DeviceId)) entity.DeviceId = dto.DeviceId.Trim();
        if (dto.UserId.HasValue) entity.UserId = dto.UserId.Value;
        if (!string.IsNullOrWhiteSpace(dto.EntityId)) entity.EntityId = dto.EntityId.Trim();
        if (dto.SessionId != null) entity.SessionId = NormalizeOptionalText(dto.SessionId);
        if (dto.RuleId != null) entity.RuleId = NormalizeOptionalText(dto.RuleId);
        if (dto.RuleCode != null) entity.RuleCode = NormalizeOptionalText(dto.RuleCode);
        if (dto.EntityScope != null) entity.EntityScope = NormalizeEntityScope(dto.EntityScope);
        if (!string.IsNullOrWhiteSpace(dto.RecordType)) entity.RecordType = NormalizeRecordType(dto.RecordType);
        if (dto.Title != null) entity.Title = NormalizeOptionalText(dto.Title);
        if (!string.IsNullOrWhiteSpace(dto.Content)) entity.Content = dto.Content.Trim();
        if (dto.Summary != null) entity.Summary = NormalizeOptionalText(dto.Summary);
        if (dto.Keywords != null) entity.Keywords = NormalizeJson(dto.Keywords);
        if (dto.PayloadJson != null) entity.PayloadJson = NormalizeJson(dto.PayloadJson);
        if (dto.CanonicalKey != null) entity.CanonicalKey = NormalizeOptionalText(dto.CanonicalKey);
        if (dto.ContentHash != null) entity.ContentHash = NormalizeOptionalText(dto.ContentHash);
        if (dto.Importance.HasValue) entity.Importance = NormalizeImportance(dto.Importance.Value);
        if (dto.Confidence.HasValue) entity.Confidence = NormalizeThreshold(dto.Confidence, 1);
        if (dto.IsPinned.HasValue) entity.IsPinned = dto.IsPinned == 1;
        if (dto.Source != null) entity.Source = NormalizeOptionalText(dto.Source);
        if (dto.SourceChatHistoryId != null) entity.SourceChatHistoryId = NormalizeOptionalText(dto.SourceChatHistoryId);
        if (dto.SourceTurnId != null) entity.SourceTurnId = NormalizeOptionalText(dto.SourceTurnId);
        if (dto.SourceRunId != null) entity.SourceRunId = NormalizeOptionalText(dto.SourceRunId);
        if (dto.ExpiresAt.HasValue) entity.ExpiresAt = dto.ExpiresAt.Value;
        entity.Revision++;
        entity.Updater = currentUserId;
        entity.UpdatedAt = DateTime.UtcNow;

        var embedding = await _embeddingProvider.EmbedAsync(BuildMemoryEmbeddingText(entity),
            null,
            cancellationToken);
        entity.EmbeddingModelId = embedding.ModelConfigId;
        entity.EmbeddingDimension = embedding.Values.Length;
        entity.EmbeddingJson = JsonSerializer.Serialize(embedding.Values);
        await _db.SaveChangesAsync(cancellationToken);
        await _vectorSearchProvider.SaveRecordEmbeddingAsync(entity.Id,
            embedding.Values,
            cancellationToken);
        return MapRecord(entity);
    }

    public async Task DeleteRecordAsync(
        string libraryId,
        string recordId,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        var entity = await _db.AiMemoryRecords.FirstOrDefaultAsync(x => x.Id == recordId && x.LibraryId == libraryId,
            cancellationToken);
        if (entity == null)
        {
            throw new InvalidOperationException("Error:MemoryRecordNotFound");
        }

        _db.AiMemoryRecords.Remove(entity);
        await _db.SaveChangesAsync(cancellationToken);
    }

    // ==================== 检索与运行时上下文 ====================

    public async Task<MemorySearchResultDto> SearchAsync(
        string libraryId,
        MemorySearchDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var library = await GetAccessibleLibraryAsync(libraryId,
            currentUserId,
            isSuperAdmin,
            cancellationToken);
        return await SearchInternalAsync(library,
            dto,
            currentUserId,
            true,
            null,
            null,
            null,
            cancellationToken);
    }

    // 为语音对话运行时构建记忆上下文：按 agent 配置合并库级与 agent 级检索参数。
    // 返回 null 表示该 agent 未启用记忆库或库不可用。
    public async Task<MemoryRuntimeContextDto?> BuildRuntimeContextAsync(
        AiAgent agent,
        AiDevice device,
        string? query = null,
        string? sessionId = null,
        CancellationToken cancellationToken = default)
    {
        return await BuildRuntimeContextCoreAsync(agent.MemoryLibraryId,
            agent.MemoryEntityScope,
            agent.MemoryTopK,
            agent.MemoryMinScore,
            agent.MemoryIntentRecall,
            agent.MemoryQueryRewrite,
            agent.MemoryRerank,
            agent.UserId,
            device,
            query,
            sessionId,
            cancellationToken);
    }

    public async Task<MemoryRuntimeContextDto?> BuildRuntimeContextAsync(
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        string? query = null,
        string? sessionId = null,
        CancellationToken cancellationToken = default)
    {
        return await BuildRuntimeContextCoreAsync(agentRole.MemoryLibraryId,
            agentRole.MemoryEntityScope,
            agentRole.MemoryTopK,
            agentRole.MemoryMinScore,
            agentRole.MemoryIntentRecall,
            agentRole.MemoryQueryRewrite,
            agentRole.MemoryRerank,
            null,
            device,
            query,
            sessionId,
            cancellationToken);
    }

    private async Task<MemoryRuntimeContextDto?> BuildRuntimeContextCoreAsync(
        string? memoryLibraryId,
        string? memoryEntityScope,
        int? memoryTopK,
        double? memoryMinScore,
        bool? memoryIntentRecall,
        bool? memoryQueryRewrite,
        bool? memoryRerank,
        long? ownerUserId,
        AiDevice device,
        string? query,
        string? sessionId,
        CancellationToken cancellationToken)
    {
        if (string.IsNullOrWhiteSpace(memoryLibraryId))
        {
            return null;
        }

        var library = await _db.AiMemoryLibraries.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == memoryLibraryId && x.Status == 1,
                cancellationToken);
        if (library == null)
        {
            return null;
        }

        var effectiveOwnerUserId = device.UserId ?? ownerUserId;
        var entityScope = MemoryEntityScopes.Parse(memoryEntityScope ?? library.EntityScope);
        var entityScopeValue = MemoryEntityScopes.ToStorageValue(entityScope);
        var entityId = ResolveEntityId(entityScope,
            effectiveOwnerUserId,
            device,
            sessionId);
        var retrievalConfig = DeserializeRetrievalConfig(library.RetrievalConfig);
        var topK = memoryTopK ?? retrievalConfig.TopK;
        var minScore = memoryMinScore ?? retrievalConfig.MinScore;
        var intentRecall = memoryIntentRecall ?? retrievalConfig.IntentRecall;
        var queryRewrite = memoryQueryRewrite ?? retrievalConfig.QueryRewrite;
        var rerank = memoryRerank ?? retrievalConfig.Rerank;

        var searchResult = await SearchInternalAsync(library,
            new MemorySearchDto
            {
                EntityId = entityId,
                Query = query,
                MaxResults = topK,
                IncludeExpired = 0
            },
            effectiveOwnerUserId,
            false,
            device.Id,
            device.UserId,
            null,
            cancellationToken);

        var records = !string.IsNullOrWhiteSpace(searchResult.Query)
            ? searchResult.Hits.Where(x => x.Score >= minScore).ToList()
            : searchResult.Hits;

        return new MemoryRuntimeContextDto
        {
            LibraryId = library.Id,
            LibraryName = library.Name,
            EntityScope = entityScopeValue,
            EntityId = entityId,
            TopK = topK,
            MinScore = minScore,
            IntentRecall = intentRecall,
            QueryRewrite = queryRewrite,
            Rerank = rerank,
            Records = records
        };
    }

    // ==================== 内部实现 ====================

    // 记录创建核心：自动关联库默认 agent，应用规则 TTL 计算过期时间。
    private async Task<MemoryRecordDto> CreateRecordInternalAsync(
        AiMemoryLibrary library,
        MemoryRecordUpsertDto dto,
        long? operatorUserId,
        CancellationToken cancellationToken)
    {
        var now = DateTime.UtcNow;
        var rule = !string.IsNullOrWhiteSpace(dto.RuleId)
            ? await _db.AiMemoryRules.FirstOrDefaultAsync(x => x.Id == dto.RuleId && x.LibraryId == library.Id,
                cancellationToken)
            : null;
        var expiresAt = dto.ExpiresAt ?? ResolveRuleExpiry(now,
            rule);
        var entity = new AiMemoryRecord
        {
            Id = _guidGenerator.Create().ToString("N"),
            LibraryId = library.Id,
            AgentId = NormalizeOptionalText(dto.AgentId) ?? library.AgentId,
            DeviceId = NormalizeOptionalText(dto.DeviceId),
            UserId = dto.UserId ?? library.UserId,
            EntityId = RequireValue(dto.EntityId,
                "memory entity id 不能为空"),
            SessionId = NormalizeOptionalText(dto.SessionId),
            RuleId = NormalizeOptionalText(dto.RuleId),
            RuleCode = NormalizeOptionalText(dto.RuleCode) ?? rule?.RuleCode,
            EntityScope = NormalizeEntityScope(dto.EntityScope),
            RecordType = NormalizeRecordType(dto.RecordType),
            Title = NormalizeOptionalText(dto.Title),
            Content = RequireValue(dto.Content,
                "记忆内容不能为空"),
            Summary = NormalizeOptionalText(dto.Summary),
            Keywords = NormalizeJson(dto.Keywords),
            PayloadJson = NormalizeJson(dto.PayloadJson),
            CanonicalKey = NormalizeOptionalText(dto.CanonicalKey),
            ContentHash = NormalizeOptionalText(dto.ContentHash),
            Importance = NormalizeImportance(dto.Importance ?? 1),
            Confidence = NormalizeThreshold(dto.Confidence, 1),
            IsPinned = dto.IsPinned == 1,
            Status = "active",
            Source = NormalizeOptionalText(dto.Source),
            SourceChatHistoryId = NormalizeOptionalText(dto.SourceChatHistoryId),
            SourceTurnId = NormalizeOptionalText(dto.SourceTurnId),
            SourceRunId = NormalizeOptionalText(dto.SourceRunId),
            ExpiresAt = expiresAt,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        var embedding = await _embeddingProvider.EmbedAsync(BuildMemoryEmbeddingText(entity),
            null,
            cancellationToken);
        entity.EmbeddingModelId = embedding.ModelConfigId;
        entity.EmbeddingDimension = embedding.Values.Length;
        entity.EmbeddingJson = JsonSerializer.Serialize(embedding.Values);

        _db.AiMemoryRecords.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        await _vectorSearchProvider.SaveRecordEmbeddingAsync(entity.Id,
            embedding.Values,
            cancellationToken);
        return MapRecord(entity);
    }

    // 检索核心实现：先按过滤条件取 Top 300，再在内存中按关键词匹配评分排序。
    // 当前为过渡方案：未来应替换为向量检索（pgvector / Milvus），保留相同 DTO 契约即可平滑迁移。
    private async Task<MemorySearchResultDto> SearchInternalAsync(
        AiMemoryLibrary library,
        MemorySearchDto dto,
        long? operatorUserId,
        bool writeLog,
        string? deviceId,
        long? deviceUserId,
        string? agentId,
        CancellationToken cancellationToken)
    {
        var maxResults = Math.Clamp(dto.MaxResults ?? 10, 1, 100);
        var retrievalConfig = DeserializeRetrievalConfig(library.RetrievalConfig);
        var minScore = Math.Clamp(dto.MinScore ?? retrievalConfig.MinScore, 0, 1);
        var queryText = NormalizeOptionalText(dto.Query);
        var hits = !string.IsNullOrWhiteSpace(queryText)
            ? (await _vectorSearchProvider.SearchAsync(new MemoryVectorSearchRequest
            {
                LibraryId = library.Id,
                Query = queryText,
                EntityId = dto.EntityId,
                SessionId = dto.SessionId,
                RecordType = dto.RecordType,
                IncludeExpired = dto.IncludeExpired == 1,
                MinImportance = dto.MinImportance,
                TopK = maxResults,
                MinScore = minScore
            }, cancellationToken))
            .Select(x => new
            {
                Entity = x.Record,
                x.Score
            })
            .ToList()
            : (await BuildRecordFilter(_db.AiMemoryRecords,
                    library.Id,
                    dto.EntityId,
                    dto.SessionId,
                    dto.RecordType,
                    null,
                    dto.IncludeExpired == 1,
                    dto.MinImportance)
                .OrderByDescending(x => x.IsPinned)
                .ThenByDescending(x => x.Importance)
                .ThenByDescending(x => x.UpdatedAt)
                .ThenByDescending(x => x.CreatedAt)
                .Take(maxResults)
                .ToListAsync(cancellationToken))
            .Select(x => new
            {
                Entity = x,
                Score = CalculateScore(x, null)
            })
            .ToList();

        // 更新最近访问时间，用于未来 LRU/热数据优化。
        var now = DateTime.UtcNow;
        foreach (var hit in hits)
        {
            hit.Entity.LastAccessedAt = now;
        }

        if (hits.Count > 0)
        {
            await _db.SaveChangesAsync(cancellationToken);
        }

        var result = new MemorySearchResultDto
        {
            LibraryId = library.Id,
            EntityId = NormalizeOptionalText(dto.EntityId),
            Query = queryText,
            MinScore = minScore,
            Total = hits.Count,
            Hits = hits.Select(x => MapSearchHit(x.Entity,
                x.Score)).ToList()
        };

        if (writeLog)
        {
            _db.AiMemorySearchLogs.Add(new AiMemorySearchLog
            {
                Id = _guidGenerator.Create().ToString("N"),
                LibraryId = library.Id,
                AgentId = agentId ?? library.AgentId,
                DeviceId = deviceId,
                UserId = deviceUserId ?? operatorUserId ?? library.UserId,
                EntityId = result.EntityId,
                SessionId = NormalizeOptionalText(dto.SessionId),
                Query = queryText,
                RecordType = NormalizeOptionalText(dto.RecordType),
                MaxResults = maxResults,
                HitCount = result.Total,
                ResultJson = JsonSerializer.Serialize(result.Hits),
                CreatedAt = now
            });
            await _db.SaveChangesAsync(cancellationToken);
        }

        return result;
    }

    // 记录过滤：强制限定 libraryId + active 状态；过期过滤在数据库层完成。
    private IQueryable<AiMemoryRecord> BuildRecordFilter(
        IQueryable<AiMemoryRecord> query,
        string libraryId,
        string? entityId,
        string? sessionId,
        string? recordType,
        string? keyword,
        bool includeExpired,
        int? minImportance)
    {
        query = query.Where(x => x.LibraryId == libraryId && x.Status == "active");
        if (!includeExpired)
        {
            var now = DateTime.UtcNow;
            query = query.Where(x => x.ExpiresAt == null || x.ExpiresAt > now);
        }

        if (!string.IsNullOrWhiteSpace(entityId))
        {
            var normalizedEntityId = entityId.Trim();
            query = query.Where(x => x.EntityId == normalizedEntityId);
        }

        if (!string.IsNullOrWhiteSpace(sessionId))
        {
            var normalizedSessionId = sessionId.Trim();
            query = query.Where(x => x.SessionId == normalizedSessionId);
        }

        if (!string.IsNullOrWhiteSpace(recordType))
        {
            var normalizedRecordType = NormalizeRecordType(recordType);
            query = query.Where(x => x.RecordType == normalizedRecordType);
        }

        if (!string.IsNullOrWhiteSpace(keyword))
        {
            var text = keyword.Trim();
            query = query.Where(x => (x.Title != null && x.Title.Contains(text))
                || x.Content.Contains(text)
                || (x.Summary != null && x.Summary.Contains(text)));
        }

        if (minImportance.HasValue)
        {
            query = query.Where(x => x.Importance >= minImportance.Value);
        }

        return query;
    }

    private async Task<AiMemoryLibrary> GetAccessibleLibraryAsync(
        string id,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken)
    {
        var library = await _db.AiMemoryLibraries.FirstOrDefaultAsync(x => x.Id == id,
            cancellationToken);
        if (library == null)
        {
            throw new InvalidOperationException("Error:MemoryLibraryNotFound");
        }

        if (!CanAccess(library.UserId,
                currentUserId,
                isSuperAdmin))
        {
            throw new InvalidOperationException("无权访问该记忆库");
        }

        return library;
    }

    private async Task<AiAgent?> ResolveAgentAsync(
        string? agentId,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken)
    {
        if (string.IsNullOrWhiteSpace(agentId))
        {
            return null;
        }

        var agent = await _db.AiAgents.FirstOrDefaultAsync(x => x.Id == agentId.Trim(),
            cancellationToken);
        if (agent == null)
        {
            throw new InvalidOperationException("智能体不存在");
        }

        if (!CanAccess(agent.UserId,
                currentUserId,
                isSuperAdmin))
        {
            throw new InvalidOperationException("无权操作该智能体");
        }

        return agent;
    }

    private async Task<string> EnsureUniqueLibraryCodeAsync(
        string? candidate,
        long? ownerUserId,
        string? currentLibraryId,
        CancellationToken cancellationToken)
    {
        var baseCode = string.IsNullOrWhiteSpace(candidate)
            ? $"mem_{_guidGenerator.Create().ToString("N")[..8]}"
            : candidate.Trim();
        var code = baseCode;
        var suffix = 1;
        while (await _db.AiMemoryLibraries.AnyAsync(x => x.UserId == ownerUserId && x.Code == code && x.Id != currentLibraryId,
                   cancellationToken))
        {
            code = $"{baseCode}_{suffix}";
            suffix++;
        }

        return code;
    }

    private async Task ResetDefaultLibrariesAsync(long? ownerUserId, string currentId, CancellationToken cancellationToken)
    {
        var existingDefaults = await _db.AiMemoryLibraries
            .Where(x => x.UserId == ownerUserId && x.Id != currentId && x.IsDefault)
            .ToListAsync(cancellationToken);
        foreach (var item in existingDefaults)
        {
            item.IsDefault = false;
        }
    }

    private static MemoryLibraryDto MapLibrary(AiMemoryLibrary entity)
    {
        return new MemoryLibraryDto
        {
            Id = entity.Id,
            UserId = entity.UserId,
            AgentId = entity.AgentId,
            Code = entity.Code,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IsDefault = entity.IsDefault ? 1 : 0,
            EntityScope = entity.EntityScope,
            MemoryModelId = entity.MemoryModelId,
            RetrievalConfig = DeserializeRetrievalConfig(entity.RetrievalConfig),
            WriteConfig = DeserializeWriteConfig(entity.WriteConfig),
            Sort = entity.Sort,
            Creator = entity.Creator,
            CreatedAt = entity.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Updater = entity.Updater,
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static MemoryRuleDto MapRule(AiMemoryRule entity)
    {
        return new MemoryRuleDto
        {
            Id = entity.Id,
            LibraryId = entity.LibraryId,
            RuleType = MemoryRuleTypes.Parse(entity.RuleType),
            RuleName = entity.RuleName,
            Instruction = entity.Instruction,
            TtlDays = entity.TtlDays,
            IsEnabled = entity.IsEnabled ? 1 : 0,
            Creator = entity.Creator,
            CreatedAt = entity.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Updater = entity.Updater,
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static MemoryRecordDto MapRecord(AiMemoryRecord entity)
    {
        return new MemoryRecordDto
        {
            Id = entity.Id,
            LibraryId = entity.LibraryId,
            AgentId = entity.AgentId,
            DeviceId = entity.DeviceId,
            UserId = entity.UserId,
            EntityId = entity.EntityId,
            SessionId = entity.SessionId,
            RuleId = entity.RuleId,
            RuleCode = entity.RuleCode,
            EntityScope = entity.EntityScope,
            RecordType = entity.RecordType,
            Title = entity.Title,
            Content = entity.Content,
            Summary = entity.Summary,
            Keywords = DeserializeJson(entity.Keywords),
            PayloadJson = DeserializeJson(entity.PayloadJson),
            CanonicalKey = entity.CanonicalKey,
            ContentHash = entity.ContentHash,
            EmbeddingModelId = entity.EmbeddingModelId,
            EmbeddingDimension = entity.EmbeddingDimension,
            HasEmbedding = !string.IsNullOrWhiteSpace(entity.EmbeddingJson),
            EmbeddingPreview = BuildEmbeddingPreview(entity.EmbeddingJson),
            Importance = entity.Importance,
            Confidence = entity.Confidence,
            IsPinned = entity.IsPinned ? 1 : 0,
            Status = entity.Status,
            Source = entity.Source,
            SourceChatHistoryId = entity.SourceChatHistoryId,
            SourceTurnId = entity.SourceTurnId,
            SourceRunId = entity.SourceRunId,
            MergedFromRecordIds = DeserializeJson(entity.MergedFromRecordIds),
            SupersededByRecordId = entity.SupersededByRecordId,
            Revision = entity.Revision,
            ExpiresAt = entity.ExpiresAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            LastAccessedAt = entity.LastAccessedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            CreatedAt = entity.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static MemorySearchHitDto MapSearchHit(AiMemoryRecord entity, double score)
    {
        return new MemorySearchHitDto
        {
            Id = entity.Id,
            EntityId = entity.EntityId,
            SessionId = entity.SessionId,
            RuleId = entity.RuleId,
            RecordType = entity.RecordType,
            Title = entity.Title,
            Content = entity.Content,
            Summary = entity.Summary,
            Keywords = DeserializeJson(entity.Keywords),
            PayloadJson = DeserializeJson(entity.PayloadJson),
            EmbeddingModelId = entity.EmbeddingModelId,
            EmbeddingDimension = entity.EmbeddingDimension,
            HasEmbedding = !string.IsNullOrWhiteSpace(entity.EmbeddingJson),
            Importance = entity.Importance,
            IsPinned = entity.IsPinned ? 1 : 0,
            Score = Math.Round(score, 4),
            ExpiresAt = entity.ExpiresAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static string BuildMemoryEmbeddingText(AiMemoryRecord entity)
    {
        var parts = new[]
        {
            entity.Title,
            entity.Summary,
            entity.Content,
            entity.Keywords
        };
        return string.Join("\n",
            parts.Where(x => !string.IsNullOrWhiteSpace(x)).Select(x => x!.Trim()));
    }

    private static List<float> BuildEmbeddingPreview(string? embeddingJson)
    {
        if (string.IsNullOrWhiteSpace(embeddingJson))
            return [];

        try
        {
            var values = JsonSerializer.Deserialize<List<float>>(embeddingJson);
            return values?.Take(8).ToList() ?? [];
        }
        catch
        {
            return [];
        }
    }

    private static string NormalizeRecordType(string? value)
    {
        return MemoryRecordTypes.ToStorageValue(MemoryRecordTypes.Parse(value));
    }

    private static string NormalizeEntityScope(string? value)
    {
        return MemoryEntityScopes.ToStorageValue(MemoryEntityScopes.Parse(value));
    }

    private static string NormalizeRuleCode(string? value, string? ruleName)
    {
        var normalized = NormalizeOptionalText(value) ?? NormalizeOptionalText(ruleName) ?? "memory_rule";
        var chars = normalized.Trim().ToLowerInvariant()
            .Select(x => char.IsLetterOrDigit(x) ? x : '_')
            .ToArray();
        var code = new string(chars).Trim('_');
        while (code.Contains("__", StringComparison.Ordinal))
        {
            code = code.Replace("__", "_", StringComparison.Ordinal);
        }

        return string.IsNullOrWhiteSpace(code) ? "memory_rule" : code[..Math.Min(code.Length, 64)];
    }

    private static void ApplyFixedRuleRuntimePolicy(AiMemoryRule entity)
    {
        var ruleType = MemoryRuleTypes.Parse(entity.RuleType);
        entity.RuleType = MemoryRuleTypes.ToStorageValue(ruleType);
    }

    private static double NormalizeThreshold(double? value, double fallback)
    {
        return Math.Clamp(value ?? fallback, 0, 1);
    }

    private static string RequireValue(string? value, string message)
    {
        var normalized = NormalizeOptionalText(value);
        if (string.IsNullOrWhiteSpace(normalized))
        {
            throw new InvalidOperationException(message);
        }

        return normalized;
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private async Task EnsureMemoryExtractionModelReadyAsync(string? memoryModelId, CancellationToken cancellationToken)
    {
        var normalizedId = NormalizeOptionalText(memoryModelId);
        if (normalizedId == null)
            return;

        var profile = await _db.AiLlmProfiles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == normalizedId && x.IsEnabled && x.Status == "active", cancellationToken)
            ?? throw new InvalidOperationException("记忆提取模型不可用：请选择启用状态的 LLM Profile。记忆提取模型不是 Embedding Profile。");

        if (string.IsNullOrWhiteSpace(profile.BaseUrl))
            throw new InvalidOperationException("记忆提取 LLM Profile 缺少主连接地址，请在 LLM Profile 中配置 Base URL / 主连接地址。向量 Profile 的主连接地址只用于记忆向量写入，不用于记忆抽取。");
        if (string.IsNullOrWhiteSpace(profile.Model))
            throw new InvalidOperationException("记忆提取 LLM Profile 缺少模型名称，请在 LLM Profile 中配置模型。");
    }

    private static int NormalizeImportance(int value)
    {
        return Math.Clamp(value, 1, 10);
    }

    private static int? NormalizeNullableInt(int? value)
    {
        if (!value.HasValue || value.Value <= 0)
        {
            return null;
        }

        return value.Value;
    }

    private static string? NormalizeJson(object? value)
    {
        if (value == null)
        {
            return null;
        }

        return value switch
        {
            JsonElement element => element.GetRawText(),
            string text when string.IsNullOrWhiteSpace(text) => null,
            string text => text,
            _ => JsonSerializer.Serialize(value)
        };
    }

    private static object? DeserializeJson(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return null;
        }

        try
        {
            return JsonSerializer.Deserialize<object>(value);
        }
        catch
        {
            return value;
        }
    }

    private static string SerializeRetrievalConfig(MemoryRetrievalConfigDto? config)
    {
        return JsonSerializer.Serialize(NormalizeRetrievalConfig(config));
    }

    private static string SerializeWriteConfig(MemoryWriteConfigDto? config)
    {
        return JsonSerializer.Serialize(NormalizeWriteConfig(config));
    }

    private static MemoryRetrievalConfigDto DeserializeRetrievalConfig(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return NormalizeRetrievalConfig(null);
        }

        try
        {
            var config = JsonSerializer.Deserialize<MemoryRetrievalConfigDto>(value,
                new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            return NormalizeRetrievalConfig(config);
        }
        catch
        {
            return NormalizeRetrievalConfig(null);
        }
    }

    private static MemoryWriteConfigDto DeserializeWriteConfig(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return NormalizeWriteConfig(null);
        }

        try
        {
            var config = JsonSerializer.Deserialize<MemoryWriteConfigDto>(value,
                new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            return NormalizeWriteConfig(config);
        }
        catch
        {
            return NormalizeWriteConfig(null);
        }
    }

    private static MemoryRetrievalConfigDto NormalizeRetrievalConfig(MemoryRetrievalConfigDto? config)
    {
        config ??= new MemoryRetrievalConfigDto();
        return new MemoryRetrievalConfigDto
        {
            TopK = Math.Clamp(config.TopK <= 0 ? 5 : config.TopK, 1, 50),
            MinScore = Math.Clamp(config.MinScore <= 0 ? 0.35 : config.MinScore, 0, 1),
            IntentRecall = config.IntentRecall,
            QueryRewrite = config.QueryRewrite,
            Rerank = config.Rerank
        };
    }

    private static MemoryWriteConfigDto NormalizeWriteConfig(MemoryWriteConfigDto? config)
    {
        config ??= new MemoryWriteConfigDto();
        return new MemoryWriteConfigDto
        {
            AutoWrite = config.AutoWrite,
            AutoExtract = config.AutoExtract,
            TtlDays = Math.Clamp(config.TtlDays, 0, 3650),
            MinImportance = Math.Clamp(config.MinImportance <= 0 ? 1 : config.MinImportance, 1, 10),
            ImportanceThreshold = Math.Clamp(config.ImportanceThreshold <= 0 ? 3 : config.ImportanceThreshold, 1, 10),
            Deduplicate = config.Deduplicate
        };
    }

    private static bool CanAccess(long? ownerUserId, long currentUserId, bool isSuperAdmin)
    {
        return ownerUserId == currentUserId || isSuperAdmin;
    }

    private static DateTime? ResolveRuleExpiry(DateTime now, AiMemoryRule? rule)
    {
        return rule?.TtlDays > 0 ? now.AddDays(rule.TtlDays.Value) : null;
    }

    // 评分算法：Title > Summary > Content > Keywords；Pinned 和 Importance 提供基础分。
    // 总分仅用于内存排序，不暴露为语义相似度分数。向量检索上线后可弃用。
    private static double CalculateScore(AiMemoryRecord record, string? queryText)
    {
        var score = record.IsPinned ? 4d : 0d;
        score += record.Importance * 0.25d;

        if (string.IsNullOrWhiteSpace(queryText))
        {
            return score;
        }

        var normalizedQuery = queryText.Trim();
        // 整句匹配权重更高
        score += MatchScore(record.Title, normalizedQuery, 6d);
        score += MatchScore(record.Summary, normalizedQuery, 4.5d);
        score += MatchScore(record.Content, normalizedQuery, 3.5d);
        score += MatchScore(record.Keywords, normalizedQuery, 3d);
        // 分词匹配：按常见分隔符拆分，短词（<2 字）丢弃，避免噪声
        foreach (var token in normalizedQuery.Split(new[] { ' ', ',', ';', '，', '。', '|', '/' }, StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
                     .Where(x => x.Length >= 2)
                     .Distinct(StringComparer.OrdinalIgnoreCase))
        {
            score += MatchScore(record.Title, token, 1.5d);
            score += MatchScore(record.Summary, token, 1.2d);
            score += MatchScore(record.Content, token, 0.9d);
            score += MatchScore(record.Keywords, token, 1d);
        }

        return score;
    }

    private static double MatchScore(string? text, string query, double weight)
    {
        if (string.IsNullOrWhiteSpace(text) || string.IsNullOrWhiteSpace(query))
        {
            return 0;
        }

        var count = text.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0 ? 1 : 0;
        return count * weight;
    }

    // 运行时实体 ID 解析策略：
    // - device 级别隔离：按设备 MAC/ID 隔离记忆，适合共享设备场景。
    // - user 级别隔离：优先使用 device 归属用户，否则回退到 agent 归属用户，最后兜底设备 ID。
    private static string ResolveEntityId(MemoryEntityScope entityScope, long? ownerUserId, AiDevice device, string? sessionId)
    {
        if (entityScope == MemoryEntityScope.Device)
        {
            return $"device:{DeviceCredentialService.NormalizeDeviceId(device.MacAddress ?? device.Id)}";
        }

        if (entityScope == MemoryEntityScope.Session)
        {
            var normalizedSessionId = NormalizeOptionalText(sessionId);
            return string.IsNullOrWhiteSpace(normalizedSessionId)
                ? $"device:{DeviceCredentialService.NormalizeDeviceId(device.MacAddress ?? device.Id)}"
                : $"session:{normalizedSessionId}";
        }

        if (entityScope == MemoryEntityScope.Global)
        {
            return MemoryEntityScopes.Global;
        }

        if (device.UserId.HasValue)
        {
            return $"user:{device.UserId.Value}";
        }

        if (ownerUserId.HasValue)
        {
            return $"user:{ownerUserId.Value}";
        }

        return $"device:{DeviceCredentialService.NormalizeDeviceId(device.MacAddress ?? device.Id)}";
    }
}
