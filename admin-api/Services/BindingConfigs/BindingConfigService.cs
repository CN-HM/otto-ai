using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.BindingConfigs.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.BindingConfigs;

public class BindingConfigService : ITransientDependency
{
    private static readonly JsonSerializerOptions JsonOptions = new(JsonSerializerDefaults.Web);
    private const string DefaultDoubaoEmbeddingEndpoint = "https://ark.cn-beijing.volces.com/api/v3/embeddings/multimodal";
    private const string DefaultDoubaoEmbeddingModel = "doubao-embedding-vision-251215";

    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public BindingConfigService(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public async Task<List<OptionItemDto>> GetIntegrationOptionsAsync(string? providerCode, string? scope, CancellationToken cancellationToken = default)
    {
        var normalizedProviderCode = NormalizeProviderCode(providerCode);
        var normalizedScope = ProviderScopeConverter.ParseOptional(scope);
        var query = _db.AiProviderIntegrations.AsNoTracking().AsQueryable();
        if (normalizedProviderCode != null)
        {
            if (ProviderTypeConverter.TryParse(normalizedProviderCode, out var providerType))
                query = query.Where(x => x.ProviderType == providerType);
            else
                query = query.Where(x => x.ProviderCode.ToLower() == normalizedProviderCode);
        }

        query = ApplyScopeFilter(query, normalizedScope);

        return await query
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .Select(x => new OptionItemDto
            {
                Value = x.Id,
                Label = x.Name
            })
            .ToListAsync(cancellationToken);
    }

    public Task<List<BindingConfigKindMetaDto>> GetKindsAsync(CancellationToken cancellationToken = default)
    {
        var result = new List<BindingConfigKindMetaDto>
        {
            new()
            {
                Kind = BindingConfigKinds.Integration,
                Label = "模型提供商",
                Description = "维护模型提供商与基础鉴权信息，供 ASR / LLM / TTS / Embedding Profile 绑定。",
                SupportsCode = true,
                SupportsProviderType = true,
                SupportsProviderScopes = true,
                SupportsIsEnabled = true,
                SupportsApiKey = true,
                SupportsAppId = true,
                SupportsAccessToken = true,
                SupportsOrganization = true
            },
            new()
            {
                Kind = BindingConfigKinds.Pipeline,
                Label = "对话链路配置",
                Description = "定义角色运行时编排骨架。",
                SupportsCode = true,
                SupportsIsSystem = true,
                SupportsGraphJson = true
            },
            new()
            {
                Kind = BindingConfigKinds.Asr,
                Label = "ASR Profile",
                Description = "语音识别配置。",
                SupportsIntegrationId = true,
                SupportsIsEnabled = true,
                SupportsInvocationMode = true,
                SupportsPrimaryEndpoint = true,
                SupportsResourceId = true,
                SupportsAudioFormat = true,
                SupportsCodec = true,
                SupportsSampleRate = true,
                SupportsBits = true,
                SupportsChannels = true,
                SupportsChunkDurationMs = true,
                SupportsChunkSizeBytes = true,
                SupportsLanguage = true,
                SupportsContext = true,
                SupportsEnableNonstream = true,
                SupportsConfigJson = true
            },
            new()
            {
                Kind = BindingConfigKinds.Vad,
                Label = "VAD Profile",
                Description = "语音活动检测配置，仅维护本地检测提供方，不绑定模型提供商。",
                SupportsIsEnabled = true,
                SupportsConfigJson = true
            },
            new()
            {
                Kind = BindingConfigKinds.Llm,
                Label = "LLM Profile",
                Description = "大模型对话配置。",
                SupportsIntegrationId = true,
                SupportsIsEnabled = true,
                SupportsInvocationMode = true,
                SupportsPrimaryEndpoint = true,
                SupportsPrimaryModel = true,
                SupportsTemperature = true,
                SupportsMaxTokens = true,
                SupportsTopP = true
            },
            new()
            {
                Kind = BindingConfigKinds.Tts,
                Label = "TTS Profile",
                Description = "语音合成配置。",
                SupportsIntegrationId = true,
                SupportsIsEnabled = true,
                SupportsInvocationMode = true,
                SupportsPrimaryEndpoint = true,
                SupportsPrimaryModel = true,
                SupportsResourceId = true,
                SupportsEncoding = true,
                SupportsSampleRate = true,
                SupportsSpeechRate = true,
                SupportsLoudnessRate = true,
                SupportsConfigJson = true
            },
            new()
            {
                Kind = BindingConfigKinds.Embedding,
                Label = "知识库向量模型",
                Description = "配置知识库切片与检索使用的向量模型，支持默认模型与多模型切换。",
                SupportsIntegrationId = true,
                SupportsIsEnabled = true,
                SupportsPrimaryEndpoint = true,
                SupportsPrimaryModel = true,
                SupportsDimension = true,
                SupportsConfigJson = true
            }
        };

        return Task.FromResult(result);
    }

    public async Task<(List<BindingConfigDto> List, long Total)> GetPageAsync(string kind, BindingConfigListQuery query, CancellationToken cancellationToken = default)
    {
        kind = BindingConfigKinds.Normalize(kind);
        var page = Math.Max(1, query.Page ?? 1);
        var limit = Math.Clamp(query.Limit ?? 10, 1, 100);
        var keyword = NormalizeOptional(query.Keyword);
        var status = NormalizeOptional(query.Status);

        return kind switch
        {
            BindingConfigKinds.Integration => await GetIntegrationPageAsync(page, limit, keyword, status, cancellationToken),
            BindingConfigKinds.Pipeline => await GetPipelinePageAsync(page, limit, keyword, status, cancellationToken),
            BindingConfigKinds.Asr => await GetAsrPageAsync(page, limit, keyword, status, cancellationToken),
            BindingConfigKinds.Vad => await GetVadPageAsync(page, limit, keyword, status, cancellationToken),
            BindingConfigKinds.Llm => await GetLlmPageAsync(page, limit, keyword, status, cancellationToken),
            BindingConfigKinds.Tts => await GetTtsPageAsync(page, limit, keyword, status, cancellationToken),
            BindingConfigKinds.Embedding => await GetEmbeddingPageAsync(page, limit, keyword, status, cancellationToken),
            _ => throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind))
        };
    }

    public async Task<BindingConfigDto> GetAsync(string kind, string id, CancellationToken cancellationToken = default)
    {
        kind = BindingConfigKinds.Normalize(kind);
        var normalizedId = RequireValue(id, "配置 ID 不能为空");

        return kind switch
        {
            BindingConfigKinds.Integration => MapIntegration(await GetRequiredAsync(_db.AiProviderIntegrations.AsNoTracking(), normalizedId, "Provider Integration 不存在", cancellationToken)),
            BindingConfigKinds.Pipeline => MapPipeline(await GetRequiredAsync(_db.AiPipelineTemplates.AsNoTracking(), normalizedId, "对话链路配置不存在", cancellationToken)),
            BindingConfigKinds.Asr => MapAsr(await GetRequiredAsync(_db.AiAsrProfiles.AsNoTracking(), normalizedId, "Error:AsrProfileNotFound", cancellationToken)),
            BindingConfigKinds.Vad => MapVad(await GetRequiredAsync(_db.AiVadProfiles.AsNoTracking(), normalizedId, "Error:VadProfileNotFound", cancellationToken)),
            BindingConfigKinds.Llm => MapLlm(await GetRequiredAsync(_db.AiLlmProfiles.AsNoTracking(), normalizedId, "Error:LlmProfileNotFound", cancellationToken)),
            BindingConfigKinds.Tts => MapTts(await GetRequiredAsync(_db.AiTtsProfiles.AsNoTracking(), normalizedId, "Error:TtsProfileNotFound", cancellationToken)),
            BindingConfigKinds.Embedding => MapEmbedding(await GetRequiredAsync(_db.AiEmbeddingProfiles.AsNoTracking(), normalizedId, "Error:EmbeddingProfileNotFound", cancellationToken)),
            _ => throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind))
        };
    }

    public async Task<BindingConfigDto> CreateAsync(string kind, BindingConfigUpsertDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        kind = BindingConfigKinds.Normalize(kind);
        var name = RequireValue(dto.Name, "名称不能为空");
        var code = NormalizeOptional(dto.Code) ?? name;
        var now = DateTime.UtcNow;

        return kind switch
        {
            BindingConfigKinds.Integration => await CreateIntegrationAsync(code, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Pipeline => await CreatePipelineAsync(code, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Asr => await CreateAsrAsync(name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Vad => await CreateVadAsync(name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Llm => await CreateLlmAsync(name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Tts => await CreateTtsAsync(name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Embedding => await CreateEmbeddingAsync(name, dto, operatorUserId, now, cancellationToken),
            _ => throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind))
        };
    }

    public async Task<BindingConfigDto> UpdateAsync(string kind, string id, BindingConfigUpsertDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        kind = BindingConfigKinds.Normalize(kind);
        var normalizedId = RequireValue(id, "配置 ID 不能为空");
        var name = RequireValue(dto.Name, "名称不能为空");
        var code = NormalizeOptional(dto.Code) ?? name;
        var now = DateTime.UtcNow;

        return kind switch
        {
            BindingConfigKinds.Integration => await UpdateIntegrationAsync(normalizedId, code, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Pipeline => await UpdatePipelineAsync(normalizedId, code, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Asr => await UpdateAsrAsync(normalizedId, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Vad => await UpdateVadAsync(normalizedId, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Llm => await UpdateLlmAsync(normalizedId, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Tts => await UpdateTtsAsync(normalizedId, name, dto, operatorUserId, now, cancellationToken),
            BindingConfigKinds.Embedding => await UpdateEmbeddingAsync(normalizedId, name, dto, operatorUserId, now, cancellationToken),
            _ => throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind))
        };
    }

    public async Task DeleteAsync(string kind, string id, CancellationToken cancellationToken = default)
    {
        kind = BindingConfigKinds.Normalize(kind);
        var normalizedId = RequireValue(id, "配置 ID 不能为空");
        await EnsureNotReferencedAsync(kind, normalizedId, cancellationToken);

        switch (kind)
        {
            case BindingConfigKinds.Integration:
                _db.AiProviderIntegrations.Remove(await GetRequiredAsync(_db.AiProviderIntegrations, normalizedId, "Provider Integration 不存在", cancellationToken));
                break;
            case BindingConfigKinds.Pipeline:
            {
                var entity = await GetRequiredAsync(_db.AiPipelineTemplates, normalizedId, "对话链路配置不存在", cancellationToken);
                if (entity.IsSystem)
                {
                    throw new InvalidOperationException("Error:BuiltInPipelineDeleteDenied");
                }

                _db.AiPipelineTemplates.Remove(entity);
                break;
            }
            case BindingConfigKinds.Asr:
                _db.AiAsrProfiles.Remove(await GetRequiredAsync(_db.AiAsrProfiles, normalizedId, "Error:AsrProfileNotFound", cancellationToken));
                break;
            case BindingConfigKinds.Vad:
                _db.AiVadProfiles.Remove(await GetRequiredAsync(_db.AiVadProfiles, normalizedId, "Error:VadProfileNotFound", cancellationToken));
                break;
            case BindingConfigKinds.Llm:
                _db.AiLlmProfiles.Remove(await GetRequiredAsync(_db.AiLlmProfiles, normalizedId, "Error:LlmProfileNotFound", cancellationToken));
                break;
            case BindingConfigKinds.Tts:
                _db.AiTtsProfiles.Remove(await GetRequiredAsync(_db.AiTtsProfiles, normalizedId, "Error:TtsProfileNotFound", cancellationToken));
                break;
            case BindingConfigKinds.Embedding:
                _db.AiEmbeddingProfiles.Remove(await GetRequiredAsync(_db.AiEmbeddingProfiles, normalizedId, "Error:EmbeddingProfileNotFound", cancellationToken));
                break;
            default:
                throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind));
        }

        await _db.SaveChangesAsync(cancellationToken);
    }

    private async Task EnsureNotReferencedAsync(string kind, string id, CancellationToken cancellationToken)
    {
        switch (kind)
        {
            case BindingConfigKinds.Integration:
            {
                var asrCount = await _db.AiAsrProfiles.AsNoTracking().LongCountAsync(x => x.IntegrationId == id, cancellationToken);
                var llmCount = await _db.AiLlmProfiles.AsNoTracking().LongCountAsync(x => x.IntegrationId == id, cancellationToken);
                var ttsCount = await _db.AiTtsProfiles.AsNoTracking().LongCountAsync(x => x.IntegrationId == id, cancellationToken);
                var totalRefCount = asrCount + llmCount + ttsCount;
                if (totalRefCount > 0)
                {
                    throw new LocalizedBusinessException("Error:ProviderIntegrationInUse", ("count", totalRefCount));
                }

                break;
            }
            case BindingConfigKinds.Pipeline:
            {
                var roleCount = await _db.AiAgentRoles.AsNoTracking().LongCountAsync(x => x.PipelineTemplateId == id, cancellationToken);
                if (roleCount > 0)
                {
                    throw new LocalizedBusinessException("Error:PipelineConfigInUse", ("count", roleCount));
                }

                break;
            }
            case BindingConfigKinds.Asr:
            {
                var roleCount = await _db.AiAgentRoles.AsNoTracking().LongCountAsync(x => x.AsrProfileId == id, cancellationToken);
                if (roleCount > 0)
                {
                    throw new LocalizedBusinessException("Error:AsrProfileInUse", ("count", roleCount));
                }

                break;
            }
            case BindingConfigKinds.Vad:
            {
                var roleCount = await _db.AiAgentRoles.AsNoTracking().LongCountAsync(x => x.VadProfileId == id, cancellationToken);
                if (roleCount > 0)
                {
                    throw new LocalizedBusinessException("Error:VadProfileInUse", ("count", roleCount));
                }

                break;
            }
            case BindingConfigKinds.Llm:
            {
                var roleCount = await _db.AiAgentRoles.AsNoTracking().LongCountAsync(x => x.LlmProfileId == id, cancellationToken);
                if (roleCount > 0)
                {
                    throw new LocalizedBusinessException("Error:LlmProfileInUse", ("count", roleCount));
                }

                var memoryLibraryCount = await _db.AiMemoryLibraries.AsNoTracking().LongCountAsync(x => x.MemoryModelId == id, cancellationToken);
                if (memoryLibraryCount > 0)
                {
                    throw new LocalizedBusinessException("Error:MemoryExtractionModelInUse", ("count", memoryLibraryCount));
                }

                break;
            }
            case BindingConfigKinds.Tts:
            {
                var roleCount = await _db.AiAgentRoles.AsNoTracking().LongCountAsync(x => x.TtsProfileId == id, cancellationToken);
                if (roleCount > 0)
                {
                    throw new LocalizedBusinessException("Error:TtsProfileInUse", ("count", roleCount));
                }

                var voiceCount = await _db.AiTtsVoices.AsNoTracking().LongCountAsync(x => x.TtsProfileId == id, cancellationToken);
                if (voiceCount > 0)
                {
                    throw new LocalizedBusinessException("Error:TtsProfileVoiceInUse", ("count", voiceCount));
                }

                break;
            }
            case BindingConfigKinds.Embedding:
                break;
            default:
                throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind));
        }
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetIntegrationPageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiProviderIntegrations.AsNoTracking().AsQueryable();
        if (keyword != null)
        {
            query = query.Where(x => x.Code.Contains(keyword)
                || x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword))
                || x.ProviderCode.Contains(keyword));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderBy(x => x.Sort).ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapIntegration).ToList(), total);
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetPipelinePageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiPipelineTemplates.AsNoTracking().AsQueryable();
        if (keyword != null)
        {
            query = query.Where(x => x.Code.Contains(keyword)
                || x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword)));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderByDescending(x => x.IsSystem).ThenBy(x => x.Sort).ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapPipeline).ToList(), total);
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetAsrPageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiAsrProfiles.AsNoTracking().AsQueryable();
        if (keyword != null)
        {
            query = query.Where(x => x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword))
                || (x.WsUrl != null && x.WsUrl.Contains(keyword)));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderByDescending(x => x.IsDefault).ThenBy(x => x.Sort).ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapAsr).ToList(), total);
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetVadPageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiVadProfiles.AsNoTracking().AsQueryable();
        if (keyword != null)
        {
            query = query.Where(x => x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword)));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderByDescending(x => x.IsDefault).ThenBy(x => x.Sort).ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapVad).ToList(), total);
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetLlmPageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiLlmProfiles.AsNoTracking().AsQueryable();
        if (keyword != null)
        {
            query = query.Where(x => x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword))
                || (x.Model != null && x.Model.Contains(keyword)));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderByDescending(x => x.IsDefault).ThenBy(x => x.Sort).ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(x => MapLlm(x)).ToList(), total);
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetTtsPageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiTtsProfiles.AsNoTracking().AsQueryable();
        if (keyword != null)
        {
            query = query.Where(x => x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword))
                || (x.Model != null && x.Model.Contains(keyword)));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderByDescending(x => x.IsDefault).ThenBy(x => x.Sort).ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapTts).ToList(), total);
    }

    private async Task<(List<BindingConfigDto> List, long Total)> GetEmbeddingPageAsync(int page, int limit, string? keyword, string? status, CancellationToken cancellationToken)
    {
        var query = _db.AiEmbeddingProfiles.AsNoTracking();
        if (keyword != null)
        {
            query = query.Where(x => x.Name.Contains(keyword)
                || (x.Description != null && x.Description.Contains(keyword))
                || (x.Endpoint != null && x.Endpoint.Contains(keyword)));
        }
        if (status != null)
        {
            query = query.Where(x => x.Status == status);
        }

        var total = await query.LongCountAsync(cancellationToken);
        var list = await query.OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);
        return (list.Select(MapEmbedding).ToList(), total);
    }

    private async Task<BindingConfigDto> CreateIntegrationAsync(string code, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        if (await _db.AiProviderIntegrations.AnyAsync(x => x.Code == code, cancellationToken))
        {
            throw new InvalidOperationException("Error:ProviderIntegrationCodeExists");
        }

        var providerType = ResolveProviderType(dto);
        var providerTypeValue = ProviderTypeConverter.ToStorageValue(providerType);
        var entity = new AiProviderIntegration
        {
            Id = _guidGenerator.Create().ToString("N"),
            Code = code,
            Name = name,
            Description = NormalizeOptional(dto.Description),
            ProviderCode = providerTypeValue,
            ProviderType = providerType,
            SupportsAsr = dto.SupportsAsr,
            SupportsTts = dto.SupportsTts,
            SupportsLlm = dto.SupportsLlm,
            SupportsMem = dto.SupportsMem,
            Status = NormalizeStatus(dto.Status),
            IsEnabled = dto.IsEnabled ?? true,
            IsDefault = dto.IsDefault,
            VoiceCatalogEndpoint = NormalizeOptional(dto.PrimaryEndpoint),
            ApiKey = NormalizeOptional(dto.ApiKey),
            SecretKey = NormalizeOptional(dto.SecretKey),
            AppId = NormalizeOptional(dto.AppId),
            AccessToken = NormalizeOptional(dto.AccessToken),
            Organization = NormalizeOptional(dto.Organization),
            VoiceCatalogAccessKey = NormalizeOptional(dto.CatalogAccessKey),
            VoiceCatalogSecret = NormalizeOptional(dto.CatalogSecretKey),
            VoiceCatalogAppId = NormalizeOptional(dto.CatalogAppId),
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        await ApplyDefaultOnCreateAsync(
            _db.AiProviderIntegrations,
            entity.Id,
            dto.IsDefault,
            value => entity.IsDefault = value,
            integration => integration.IsDefault = false,
            cancellationToken);
        _db.AiProviderIntegrations.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapIntegration(entity);
    }

    private async Task<BindingConfigDto> CreatePipelineAsync(string code, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        if (await _db.AiPipelineTemplates.AnyAsync(x => x.Code == code, cancellationToken))
        {
            throw new InvalidOperationException("Error:ConversationPipelineCodeExists");
        }

        var entity = new AiPipelineTemplate
        {
            Id = _guidGenerator.Create().ToString("N"),
            Code = code,
            Name = name,
            Description = NormalizeOptional(dto.Description),
            Status = NormalizeStatus(dto.Status),
            IsSystem = dto.IsSystem ?? false,
            IsDefault = dto.IsDefault,
            GraphJson = NormalizePipelineGraphJsonOrDefault(dto.GraphJson, "{}"),
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        await ApplyDefaultOnCreateAsync(
            _db.AiPipelineTemplates,
            entity.Id,
            dto.IsDefault,
            value => entity.IsDefault = value,
            template => template.IsDefault = false,
            cancellationToken);
        _db.AiPipelineTemplates.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapPipeline(entity);
    }

    private async Task<BindingConfigDto> CreateAsrAsync(string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var integrationId = RequireValue(dto.IntegrationId, "ASR Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Asr, cancellationToken);

        var entity = new AiAsrProfile
        {
            Id = _guidGenerator.Create().ToString("N"),
            Name = name,
            Description = NormalizeOptional(dto.Description),
            Status = NormalizeStatus(dto.Status),
            IsEnabled = dto.IsEnabled ?? true,
            IsDefault = dto.IsDefault,
            InvocationMode = NormalizeOptional(dto.InvocationMode) ?? "streaming",
            WsUrl = NormalizeOptional(dto.PrimaryEndpoint),
            IntegrationId = integrationId,
            ResourceId = NormalizeOptional(dto.ResourceId),
            AudioFormat = NormalizeOptional(dto.AudioFormat),
            Codec = NormalizeOptional(dto.Codec),
            SampleRate = dto.SampleRate,
            Bits = dto.Bits,
            Channels = dto.Channels,
            ChunkDurationMs = dto.ChunkDurationMs,
            ChunkSizeBytes = dto.ChunkSizeBytes,
            Language = NormalizeOptional(dto.Language),
            Context = NormalizeOptional(dto.Context),
            EnableNonstream = dto.EnableNonstream,
            ConfigJson = NormalizeJsonOrDefault(dto.ConfigJson, "{}"),
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        await ApplyDefaultOnCreateAsync(
            _db.AiAsrProfiles,
            entity.Id,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            cancellationToken);
        _db.AiAsrProfiles.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapAsr(entity);
    }

    private async Task<BindingConfigDto> CreateVadAsync(string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = new AiVadProfile
        {
            Id = _guidGenerator.Create().ToString("N"),
            Name = name,
            Description = NormalizeOptional(dto.Description),
            Status = NormalizeStatus(dto.Status),
            IsEnabled = dto.IsEnabled ?? true,
            IsDefault = dto.IsDefault,
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        ApplyVadConfig(entity, dto.ConfigJson);
        await ApplyDefaultOnCreateAsync(
            _db.AiVadProfiles,
            entity.Id,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            cancellationToken);
        _db.AiVadProfiles.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapVad(entity);
    }

    private async Task<BindingConfigDto> CreateLlmAsync(string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var integrationId = RequireValue(dto.IntegrationId, "LLM Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Llm, cancellationToken);

        var entity = new AiLlmProfile
        {
            Id = _guidGenerator.Create().ToString("N"),
            Name = name,
            Description = NormalizeOptional(dto.Description),
            Status = NormalizeStatus(dto.Status),
            IsEnabled = dto.IsEnabled ?? true,
            IsDefault = false,
            InvocationMode = NormalizeOptional(dto.InvocationMode) ?? "streaming",
            BaseUrl = NormalizeOptional(dto.PrimaryEndpoint),
            IntegrationId = integrationId,
            Model = NormalizeOptional(dto.PrimaryModel),
            Temperature = dto.Temperature,
            MaxTokens = dto.MaxTokens,
            TopP = dto.TopP,
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        _db.AiLlmProfiles.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapLlm(entity);
    }

    private async Task<BindingConfigDto> CreateTtsAsync(string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var integrationId = RequireValue(dto.IntegrationId, "TTS Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Tts, cancellationToken);

        var entity = new AiTtsProfile
        {
            Id = _guidGenerator.Create().ToString("N"),
            Name = name,
            Description = NormalizeOptional(dto.Description),
            Status = NormalizeStatus(dto.Status),
            IsEnabled = dto.IsEnabled ?? true,
            IsDefault = dto.IsDefault,
            InvocationMode = NormalizeOptional(dto.InvocationMode) ?? "streaming",
            WsUrl = NormalizeOptional(dto.PrimaryEndpoint),
            ResourceId = NormalizeOptional(dto.ResourceId),
            IntegrationId = integrationId,
            Model = NormalizeOptional(dto.PrimaryModel),
            Encoding = NormalizeOptional(dto.Encoding),
            SampleRate = dto.SampleRate,
            SpeechRate = dto.SpeechRate,
            LoudnessRate = dto.LoudnessRate,
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        entity.ConfigJson = NormalizeJsonOrDefault(dto.ConfigJson, "{}");
        await ApplyDefaultOnCreateAsync(
            _db.AiTtsProfiles,
            entity.Id,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            cancellationToken);
        _db.AiTtsProfiles.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapTts(entity);
    }

    private async Task<BindingConfigDto> CreateEmbeddingAsync(string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var integrationId = RequireValue(dto.IntegrationId, "Embedding Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Emb, cancellationToken);
        var config = BuildEmbeddingConfig(dto,
            null,
            null,
            null,
            null);
        var status = NormalizeStatus(dto.Status);

        var entity = new AiEmbeddingProfile
        {
            Id = _guidGenerator.Create().ToString("N"),
            Name = name,
            Description = NormalizeOptional(dto.Description),
            Status = status,
            IsDefault = dto.IsDefault,
            IsEnabled = dto.IsEnabled ?? status != "inactive",
            Endpoint = config.Endpoint,
            IntegrationId = integrationId,
            Model = config.Model,
            Dimension = config.Dimension,
            ConfigJson = config.ConfigJson,
            Sort = dto.Sort ?? 0,
            Creator = operatorUserId,
            CreatedAt = now,
            Updater = operatorUserId,
            UpdatedAt = now
        };

        await ApplyDefaultOnCreateAsync(
            _db.AiEmbeddingProfiles,
            entity.Id,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            cancellationToken);
        _db.AiEmbeddingProfiles.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapEmbedding(entity);
    }

    private async Task<BindingConfigDto> UpdateIntegrationAsync(string id, string code, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiProviderIntegrations, id, "Provider Integration 不存在", cancellationToken);
        var currentIsDefault = entity.IsDefault;
        if (await _db.AiProviderIntegrations.AnyAsync(x => x.Code == code && x.Id != id, cancellationToken))
        {
            throw new InvalidOperationException("Error:ProviderIntegrationCodeExists");
        }

        entity.Code = code;
        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        var providerType = ResolveProviderType(dto);
        var providerTypeValue = ProviderTypeConverter.ToStorageValue(providerType);
        entity.ProviderCode = providerTypeValue;
        entity.ProviderType = providerType;
        entity.SupportsAsr = dto.SupportsAsr;
        entity.SupportsTts = dto.SupportsTts;
        entity.SupportsLlm = dto.SupportsLlm;
        entity.SupportsMem = dto.SupportsMem;
        entity.Status = NormalizeStatus(dto.Status);
        entity.IsEnabled = dto.IsEnabled ?? entity.IsEnabled;
        await ApplyDefaultOnUpdateAsync(
            _db.AiProviderIntegrations,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            integration => integration.IsDefault = false,
            "Provider Integration",
            cancellationToken);
        entity.VoiceCatalogEndpoint = NormalizeOptional(dto.PrimaryEndpoint);
        entity.ApiKey = NormalizeOptional(dto.ApiKey);
        entity.SecretKey = NormalizeOptional(dto.SecretKey);
        entity.AppId = NormalizeOptional(dto.AppId);
        entity.AccessToken = NormalizeOptional(dto.AccessToken);
        entity.Organization = NormalizeOptional(dto.Organization);
        entity.VoiceCatalogAccessKey = NormalizeOptional(dto.CatalogAccessKey);
        entity.VoiceCatalogSecret = NormalizeOptional(dto.CatalogSecretKey);
        entity.VoiceCatalogAppId = NormalizeOptional(dto.CatalogAppId);
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;

        await _db.SaveChangesAsync(cancellationToken);
        return MapIntegration(entity);
    }

    private async Task<BindingConfigDto> UpdatePipelineAsync(string id, string code, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiPipelineTemplates, id, "对话链路配置不存在", cancellationToken);
        var currentIsDefault = entity.IsDefault;
        if (await _db.AiPipelineTemplates.AnyAsync(x => x.Code == code && x.Id != id, cancellationToken))
        {
            throw new InvalidOperationException("Error:ConversationPipelineCodeExists");
        }

        entity.Code = code;
        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        entity.Status = NormalizeStatus(dto.Status);
        entity.IsSystem = dto.IsSystem ?? entity.IsSystem;
        await ApplyDefaultOnUpdateAsync(
            _db.AiPipelineTemplates,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            template => template.IsDefault = false,
            "Pipeline",
            cancellationToken);
        entity.GraphJson = NormalizePipelineGraphJsonOrDefault(dto.GraphJson, entity.GraphJson);
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;

        await _db.SaveChangesAsync(cancellationToken);
        return MapPipeline(entity);
    }

    private async Task<BindingConfigDto> UpdateAsrAsync(string id, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiAsrProfiles, id, "Error:AsrProfileNotFound", cancellationToken);
        var currentIsDefault = entity.IsDefault;

        var integrationId = RequireValue(dto.IntegrationId, "ASR Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Asr, cancellationToken);

        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        entity.Status = NormalizeStatus(dto.Status);
        entity.IsEnabled = dto.IsEnabled ?? entity.IsEnabled;
        entity.InvocationMode = NormalizeOptional(dto.InvocationMode) ?? entity.InvocationMode;
        entity.WsUrl = NormalizeOptional(dto.PrimaryEndpoint);
        entity.IntegrationId = integrationId;
        entity.ResourceId = NormalizeOptional(dto.ResourceId);
        entity.AudioFormat = NormalizeOptional(dto.AudioFormat);
        entity.Codec = NormalizeOptional(dto.Codec);
        entity.SampleRate = dto.SampleRate;
        entity.Bits = dto.Bits;
        entity.Channels = dto.Channels;
        entity.ChunkDurationMs = dto.ChunkDurationMs;
        entity.ChunkSizeBytes = dto.ChunkSizeBytes;
        entity.Language = NormalizeOptional(dto.Language);
        entity.Context = NormalizeOptional(dto.Context);
        entity.EnableNonstream = dto.EnableNonstream;
        entity.ConfigJson = NormalizeJsonOrDefault(dto.ConfigJson, entity.ConfigJson ?? "{}");
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;
        await ApplyDefaultOnUpdateAsync(
            _db.AiAsrProfiles,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            "ASR Profile",
            cancellationToken);

        await _db.SaveChangesAsync(cancellationToken);
        return MapAsr(entity);
    }

    private async Task<BindingConfigDto> UpdateVadAsync(string id, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiVadProfiles, id, "Error:VadProfileNotFound", cancellationToken);
        var currentIsDefault = entity.IsDefault;

        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        entity.Status = NormalizeStatus(dto.Status);
        entity.IsEnabled = dto.IsEnabled ?? entity.IsEnabled;
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;
        ApplyVadConfig(entity, dto.ConfigJson);
        await ApplyDefaultOnUpdateAsync(
            _db.AiVadProfiles,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            "VAD Profile",
            cancellationToken);

        await _db.SaveChangesAsync(cancellationToken);
        return MapVad(entity);
    }

    private async Task<BindingConfigDto> UpdateLlmAsync(string id, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiLlmProfiles, id, "Error:LlmProfileNotFound", cancellationToken);
        var currentIsDefault = entity.IsDefault;

        var integrationId = RequireValue(dto.IntegrationId, "LLM Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Llm, cancellationToken);

        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        entity.Status = NormalizeStatus(dto.Status);
        entity.IsEnabled = dto.IsEnabled ?? entity.IsEnabled;
        entity.InvocationMode = NormalizeOptional(dto.InvocationMode) ?? entity.InvocationMode;
        entity.BaseUrl = NormalizeOptional(dto.PrimaryEndpoint);
        entity.IntegrationId = integrationId;
        entity.Model = NormalizeOptional(dto.PrimaryModel);
        entity.Temperature = dto.Temperature;
        entity.MaxTokens = dto.MaxTokens;
        entity.TopP = dto.TopP;
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;
        await ApplyDefaultOnUpdateAsync(
            _db.AiLlmProfiles,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            "LLM Profile",
            cancellationToken);

        await _db.SaveChangesAsync(cancellationToken);
        return MapLlm(entity);
    }

    private async Task<BindingConfigDto> UpdateTtsAsync(string id, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiTtsProfiles, id, "Error:TtsProfileNotFound", cancellationToken);
        var currentIsDefault = entity.IsDefault;

        var integrationId = RequireValue(dto.IntegrationId, "TTS Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Tts, cancellationToken);

        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        entity.Status = NormalizeStatus(dto.Status);
        entity.IsEnabled = dto.IsEnabled ?? entity.IsEnabled;
        entity.InvocationMode = NormalizeOptional(dto.InvocationMode) ?? entity.InvocationMode;
        entity.WsUrl = NormalizeOptional(dto.PrimaryEndpoint);
        entity.ResourceId = NormalizeOptional(dto.ResourceId);
        entity.IntegrationId = integrationId;
        entity.Model = NormalizeOptional(dto.PrimaryModel);
        entity.Encoding = NormalizeOptional(dto.Encoding);
        entity.SampleRate = dto.SampleRate;
        entity.SpeechRate = dto.SpeechRate;
        entity.LoudnessRate = dto.LoudnessRate;
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;
        entity.ConfigJson = NormalizeJsonOrDefault(dto.ConfigJson, entity.ConfigJson ?? "{}");
        await ApplyDefaultOnUpdateAsync(
            _db.AiTtsProfiles,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            "TTS Profile",
            cancellationToken);

        await _db.SaveChangesAsync(cancellationToken);
        return MapTts(entity);
    }

    private async Task<BindingConfigDto> UpdateEmbeddingAsync(string id, string name, BindingConfigUpsertDto dto, long operatorUserId, DateTime now, CancellationToken cancellationToken)
    {
        var entity = await GetRequiredAsync(_db.AiEmbeddingProfiles,
            id,
            "Error:EmbeddingProfileNotFound",
            cancellationToken);
        var currentIsDefault = entity.IsDefault;

        var integrationId = RequireValue(dto.IntegrationId, "Embedding Profile 必须绑定 Provider Integration");
        await EnsureIntegrationSupportsScopeAsync(integrationId, ProviderScope.Emb, cancellationToken);
        var config = BuildEmbeddingConfig(dto,
            entity.ConfigJson,
            entity.Endpoint,
            entity.Model,
            entity.Dimension);
        var status = NormalizeStatus(dto.Status);

        entity.Name = name;
        entity.Description = NormalizeOptional(dto.Description);
        entity.Status = status;
        entity.IsEnabled = dto.IsEnabled ?? status != "inactive";
        entity.Endpoint = config.Endpoint;
        entity.IntegrationId = integrationId;
        entity.Model = config.Model;
        entity.Dimension = config.Dimension;
        entity.ConfigJson = config.ConfigJson;
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = operatorUserId;
        entity.UpdatedAt = now;
        await ApplyDefaultOnUpdateAsync(
            _db.AiEmbeddingProfiles,
            entity.Id,
            currentIsDefault,
            dto.IsDefault,
            value => entity.IsDefault = value,
            profile => profile.IsDefault = false,
            "Embedding Profile",
            cancellationToken);

        await _db.SaveChangesAsync(cancellationToken);
        return MapEmbedding(entity);
    }

    private async Task ApplyDefaultOnCreateAsync<TEntity>(
        IQueryable<TEntity> query,
        string currentId,
        bool requestedIsDefault,
        Action<bool> setCurrentDefault,
        Action<TEntity> clearDefault,
        CancellationToken cancellationToken)
        where TEntity : class
    {
        if (requestedIsDefault)
        {
            await ClearOtherDefaultsAsync(query, currentId, clearDefault, cancellationToken);
            setCurrentDefault(true);
            return;
        }

        var hasAnyDefault = await query.AnyAsync(x => EF.Property<bool>(x, "IsDefault"), cancellationToken);
        setCurrentDefault(!hasAnyDefault);
    }

    private async Task EnsureIntegrationSupportsScopeAsync(string integrationId, ProviderScope scope, CancellationToken cancellationToken)
    {
        var integration = await _db.AiProviderIntegrations.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == integrationId && x.IsEnabled && x.Status == "active", cancellationToken);
        if (integration == null)
        {
            throw new InvalidOperationException("Error:ProviderIntegrationUnavailable");
        }

        if (!SupportsScope(integration, scope))
        {
            throw new LocalizedBusinessException("Error:ProviderIntegrationScopeDisabled", ("scopeLabel", ProviderScopeConverter.ToLabel(scope)));
        }
    }

    private static IQueryable<AiProviderIntegration> ApplyScopeFilter(IQueryable<AiProviderIntegration> query, ProviderScope? scope)
    {
        return scope switch
        {
            ProviderScope.Asr => query.Where(x => x.SupportsAsr),
            ProviderScope.Tts => query.Where(x => x.SupportsTts),
            ProviderScope.Llm => query.Where(x => x.SupportsLlm),
            ProviderScope.Emb => query.Where(x => x.SupportsMem),
            _ => query
        };
    }

    private static bool SupportsScope(AiProviderIntegration integration, ProviderScope scope)
    {
        return scope switch
        {
            ProviderScope.Asr => integration.SupportsAsr,
            ProviderScope.Tts => integration.SupportsTts,
            ProviderScope.Llm => integration.SupportsLlm,
            ProviderScope.Emb => integration.SupportsMem,
            _ => throw new LocalizedBusinessException("Error:UnsupportedProviderScope", ("scope", scope))
        };
    }

    private async Task ApplyDefaultOnUpdateAsync<TEntity>(
        IQueryable<TEntity> query,
        string currentId,
        bool currentIsDefault,
        bool requestedIsDefault,
        Action<bool> setCurrentDefault,
        Action<TEntity> clearDefault,
        string kindLabel,
        CancellationToken cancellationToken)
        where TEntity : class
    {
        if (requestedIsDefault)
        {
            await ClearOtherDefaultsAsync(query, currentId, clearDefault, cancellationToken);
            setCurrentDefault(true);
            return;
        }

        var hasOtherDefault = await query.AnyAsync(
            x => EF.Property<string>(x, "Id") != currentId && EF.Property<bool>(x, "IsDefault"),
            cancellationToken);

        if (currentIsDefault && !hasOtherDefault)
        {
            throw new LocalizedBusinessException("Error:DefaultConfigRequired", ("kindLabel", kindLabel));
        }

        if (!currentIsDefault && !hasOtherDefault)
        {
            setCurrentDefault(true);
            return;
        }

        setCurrentDefault(false);
    }

    private static async Task ClearOtherDefaultsAsync<TEntity>(
        IQueryable<TEntity> query,
        string currentId,
        Action<TEntity> clearDefault,
        CancellationToken cancellationToken)
        where TEntity : class
    {
        var others = await query
            .Where(x => EF.Property<string>(x, "Id") != currentId && EF.Property<bool>(x, "IsDefault"))
            .ToListAsync(cancellationToken);

        foreach (var other in others)
        {
            clearDefault(other);
        }
    }

    private static BindingConfigDto MapIntegration(AiProviderIntegration entity)
    {
        return new BindingConfigDto
        {
            Id = entity.Id,
            Code = entity.Code,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            ProviderCode = entity.ProviderCode,
            ProviderType = ProviderTypeConverter.ToStorageValue(entity.ProviderType),
            SupportsAsr = entity.SupportsAsr,
            SupportsTts = entity.SupportsTts,
            SupportsLlm = entity.SupportsLlm,
            SupportsMem = entity.SupportsMem,
            IsEnabled = entity.IsEnabled,
            IsDefault = entity.IsDefault,
            Sort = entity.Sort,
            PrimaryEndpoint = entity.VoiceCatalogEndpoint,
            ApiKey = entity.ApiKey,
            SecretKey = entity.SecretKey,
            AppId = entity.AppId,
            AccessToken = entity.AccessToken,
            Organization = entity.Organization,
            CatalogAccessKey = entity.VoiceCatalogAccessKey,
            CatalogSecretKey = entity.VoiceCatalogSecret,
            CatalogAppId = entity.VoiceCatalogAppId,
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static BindingConfigDto MapEmbedding(AiEmbeddingProfile entity)
    {
        var config = ParseEmbeddingConfigObject(entity.ConfigJson);

        return new BindingConfigDto
        {
            Id = entity.Id,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IntegrationId = entity.IntegrationId,
            IsEnabled = entity.IsEnabled,
            IsDefault = entity.IsDefault,
            Sort = entity.Sort,
            PrimaryEndpoint = NormalizeOptional(entity.Endpoint) ?? DefaultDoubaoEmbeddingEndpoint,
            PrimaryModel = NormalizeOptional(entity.Model) ?? DefaultDoubaoEmbeddingModel,
            Dimension = entity.Dimension,
            ConfigJson = config.ToJsonString(),
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static BindingConfigDto MapPipeline(AiPipelineTemplate entity)
    {
        return new BindingConfigDto
        {
            Id = entity.Id,
            Code = entity.Code,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IsDefault = entity.IsDefault,
            IsSystem = entity.IsSystem,
            Sort = entity.Sort,
            GraphJson = NormalizePipelineGraphJsonOrDefault(entity.GraphJson, "{}"),
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static BindingConfigDto MapAsr(AiAsrProfile entity)
    {
        return new BindingConfigDto
        {
            Id = entity.Id,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IntegrationId = entity.IntegrationId,
            IsEnabled = entity.IsEnabled,
            IsDefault = entity.IsDefault,
            InvocationMode = entity.InvocationMode,
            Sort = entity.Sort,
            PrimaryEndpoint = entity.WsUrl,
            ResourceId = entity.ResourceId,
            AudioFormat = entity.AudioFormat,
            Codec = entity.Codec,
            SampleRate = entity.SampleRate,
            Bits = entity.Bits,
            Channels = entity.Channels,
            ChunkDurationMs = entity.ChunkDurationMs,
            ChunkSizeBytes = entity.ChunkSizeBytes,
            Language = entity.Language,
            Context = entity.Context,
            EnableNonstream = entity.EnableNonstream,
            ConfigJson = entity.ConfigJson,
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static BindingConfigDto MapVad(AiVadProfile entity)
    {
        return new BindingConfigDto
        {
            Id = entity.Id,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IsEnabled = entity.IsEnabled,
            IsDefault = entity.IsDefault,
            Sort = entity.Sort,
            ConfigJson = SerializeVadConfig(entity),
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static BindingConfigDto MapLlm(AiLlmProfile entity)
    {
        return new BindingConfigDto
        {
            Id = entity.Id,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IntegrationId = entity.IntegrationId,
            IsEnabled = entity.IsEnabled,
            IsDefault = entity.IsDefault,
            InvocationMode = entity.InvocationMode,
            Sort = entity.Sort,
            PrimaryEndpoint = entity.BaseUrl,
            PrimaryModel = entity.Model,
            Temperature = entity.Temperature,
            MaxTokens = entity.MaxTokens,
            TopP = entity.TopP,
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static BindingConfigDto MapTts(AiTtsProfile entity)
    {
        return new BindingConfigDto
        {
            Id = entity.Id,
            Name = entity.Name,
            Description = entity.Description,
            Status = entity.Status,
            IntegrationId = entity.IntegrationId,
            IsEnabled = entity.IsEnabled,
            IsDefault = entity.IsDefault,
            InvocationMode = entity.InvocationMode,
            Sort = entity.Sort,
            PrimaryEndpoint = entity.WsUrl,
            ResourceId = entity.ResourceId,
            PrimaryModel = entity.Model,
            Encoding = entity.Encoding,
            SampleRate = entity.SampleRate,
            SpeechRate = entity.SpeechRate,
            LoudnessRate = entity.LoudnessRate,
            ConfigJson = entity.ConfigJson,
            CreatedAt = entity.CreatedAt,
            UpdatedAt = entity.UpdatedAt
        };
    }

    private static string SerializeVadConfig(AiVadProfile entity)
    {
        return SerializeConfig(new Dictionary<string, object?>
        {
            ["modelDir"] = entity.ModelDir,
            ["threshold"] = entity.Threshold,
            ["minSilenceDurationMs"] = entity.MinSilenceDurationMs,
            ["speechPadMs"] = entity.SpeechPadMs
        });
    }

    private static string SerializeConfig(Dictionary<string, object?> config)
    {
        var compact = config
            .Where(x => x.Value != null)
            .ToDictionary(x => x.Key, x => x.Value);
        return JsonSerializer.Serialize(compact, JsonOptions);
    }

    private static void ApplyVadConfig(AiVadProfile entity, string? configJson)
    {
        var config = ParseConfig(configJson);
        entity.ModelDir = GetString(config, "modelDir");
        entity.Threshold = GetDouble(config, "threshold");
        entity.MinSilenceDurationMs = GetInt(config, "minSilenceDurationMs");
        entity.SpeechPadMs = GetInt(config, "speechPadMs");
    }

    private static Dictionary<string, JsonElement> ParseConfig(string? configJson)
    {
        var normalized = NormalizeOptional(configJson);
        if (normalized == null)
        {
            return [];
        }

        using var document = JsonDocument.Parse(normalized);
        if (document.RootElement.ValueKind != JsonValueKind.Object)
        {
            throw new InvalidOperationException("Error:ConfigJsonMustBeObject");
        }

        return document.RootElement.EnumerateObject().ToDictionary(x => x.Name, x => x.Value.Clone());
    }

    private static string? GetString(Dictionary<string, JsonElement> config, string key)
    {
        return config.TryGetValue(key, out var value) && value.ValueKind != JsonValueKind.Null
            ? value.ToString()
            : null;
    }

    private static int? GetInt(Dictionary<string, JsonElement> config, string key)
    {
        if (!config.TryGetValue(key, out var value) || value.ValueKind == JsonValueKind.Null)
        {
            return null;
        }

        if (value.ValueKind == JsonValueKind.Number && value.TryGetInt32(out var number))
        {
            return number;
        }

        if (int.TryParse(value.ToString(), out var parsed))
        {
            return parsed;
        }

        return null;
    }

    private static EmbeddingConfigSnapshot BuildEmbeddingConfig(
        BindingConfigUpsertDto dto,
        string? existingConfigJson,
        string? existingEndpoint,
        string? existingModel,
        int? existingDimension)
    {
        var config = ParseEmbeddingConfigObject(existingConfigJson);
        var patch = ParseEmbeddingConfigObject(dto.ConfigJson);
        foreach (var item in patch)
        {
            config[item.Key] = item.Value?.DeepClone();
        }

        var endpoint = NormalizeOptional(dto.PrimaryEndpoint)
            ?? NormalizeOptional(GetJsonString(config,
                "endpoint"))
            ?? NormalizeOptional(existingEndpoint)
            ?? DefaultDoubaoEmbeddingEndpoint;
        var model = NormalizeOptional(dto.PrimaryModel)
            ?? NormalizeOptional(GetJsonString(config,
                "model"))
            ?? NormalizeOptional(existingModel)
            ?? DefaultDoubaoEmbeddingModel;
        var dimension = dto.Dimension ?? GetJsonInt(config, "dimension") ?? existingDimension;

        config.Remove("providerCode");
        config.Remove("integrationId");
        config.Remove("endpoint");
        config.Remove("model");
        config.Remove("dimension");

        return new EmbeddingConfigSnapshot(config.ToJsonString(), endpoint, model, dimension);
    }

    private static JsonObject ParseEmbeddingConfigObject(string? configJson)
    {
        var normalized = NormalizeOptional(configJson);
        if (normalized == null)
        {
            return new JsonObject();
        }

        var node = JsonNode.Parse(normalized);
        if (node is not JsonObject obj)
        {
            throw new InvalidOperationException("Error:EmbeddingConfigJsonMustBeObject");
        }

        return (JsonObject)obj.DeepClone();
    }

    private static string? GetJsonString(JsonObject obj, string key)
    {
        if (!obj.TryGetPropertyValue(key, out var node) || node == null)
        {
            return null;
        }

        if (node is JsonValue value)
        {
            if (value.TryGetValue<string>(out var text))
            {
                return text;
            }
        }

        return node.ToJsonString();
    }

    private static int? GetJsonInt(JsonObject obj, string key)
    {
        if (!obj.TryGetPropertyValue(key, out var node) || node == null)
        {
            return null;
        }

        if (node is JsonValue value)
        {
            if (value.TryGetValue<int>(out var number))
            {
                return number;
            }

            if (value.TryGetValue<string>(out var text) && int.TryParse(text, out var parsedText))
            {
                return parsedText;
            }
        }

        return int.TryParse(node.ToJsonString(), out var parsed) ? parsed : null;
    }

    private static double? GetDouble(Dictionary<string, JsonElement> config, string key)
    {
        if (!config.TryGetValue(key, out var value) || value.ValueKind == JsonValueKind.Null)
        {
            return null;
        }

        if (value.ValueKind == JsonValueKind.Number && value.TryGetDouble(out var number))
        {
            return number;
        }

        if (double.TryParse(value.ToString(), out var parsed))
        {
            return parsed;
        }

        return null;
    }

    private static bool? GetBool(Dictionary<string, JsonElement> config, string key)
    {
        if (!config.TryGetValue(key, out var value) || value.ValueKind == JsonValueKind.Null)
        {
            return null;
        }

        if (value.ValueKind == JsonValueKind.True || value.ValueKind == JsonValueKind.False)
        {
            return value.GetBoolean();
        }

        if (bool.TryParse(value.ToString(), out var parsed))
        {
            return parsed;
        }

        return null;
    }

    private static string? GetRaw(Dictionary<string, JsonElement> config, string key)
    {
        if (!config.TryGetValue(key, out var value) || value.ValueKind == JsonValueKind.Null)
        {
            return null;
        }

        return value.ValueKind == JsonValueKind.String ? value.GetString() : value.GetRawText();
    }

    private static string RequireValue(string? value, string message)
    {
        var normalized = NormalizeOptional(value);
        if (normalized == null)
        {
            throw new InvalidOperationException(message);
        }

        return normalized;
    }

    private static string NormalizeStatus(string? value)
    {
        var normalized = NormalizeOptional(value) ?? "active";
        return normalized == "inactive" ? "inactive" : "active";
    }

    private static string? NormalizeOptional(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? null : value.Trim();
    }

    private static string? NormalizeProviderCode(string? value)
    {
        return NormalizeOptional(value)?.ToLowerInvariant();
    }

    private static ProviderType ResolveProviderType(BindingConfigUpsertDto dto)
    {
        return ProviderTypeConverter.Parse(dto.ProviderType ?? dto.ProviderCode);
    }

    private static string NormalizeJsonOrDefault(string? value, string fallback)
    {
        var normalized = NormalizeOptional(value);
        if (normalized == null)
        {
            return fallback;
        }

        using var _ = JsonDocument.Parse(normalized);
        return normalized;
    }

    private static string NormalizePipelineGraphJsonOrDefault(string? value, string fallback)
    {
        var normalized = NormalizeJsonOrDefault(value, fallback);
        var node = JsonNode.Parse(normalized);
        if (node is JsonObject jsonObject)
        {
            jsonObject.Remove("profileBindings");
            return jsonObject.ToJsonString(JsonOptions);
        }

        return normalized;
    }

    private static async Task<TEntity> GetRequiredAsync<TEntity>(IQueryable<TEntity> query, string id, string message, CancellationToken cancellationToken)
        where TEntity : class
    {
        var entity = await query.FirstOrDefaultAsync(x => EF.Property<string>(x, "Id") == id, cancellationToken);
        if (entity == null)
        {
            throw new InvalidOperationException(message);
        }

        return entity;
    }

    private sealed record EmbeddingConfigSnapshot(string ConfigJson, string Endpoint, string Model, int? Dimension);
}
