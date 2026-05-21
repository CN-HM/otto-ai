using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Knowledge.Interfaces;
using AiAdmin.Services.Memory.Dtos;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.Memory;

public class MemoryExtractionService : ITransientDependency
{
    private static readonly JsonSerializerOptions JsonOptions = new() { PropertyNameCaseInsensitive = true };
    private static readonly Regex SensitivePattern = new("(password|passwd|pwd|token|api[_-]?key|secret|private[_-]?key|验证码|密码|口令|银行卡|身份证)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
    private const double DefaultRuleMatchConfidenceThreshold = 0.7;
    private const double DefaultRuleConfidenceThreshold = 0.7;
    private const int DefaultRuleImportanceThreshold = 3;
    private const int DefaultRuleMaxRecordsPerTurn = 3;

    private readonly AiAdminDbContext _db;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly IKnowledgeEmbeddingProvider _embeddingProvider;
    private readonly IMemoryVectorSearchProvider _vectorSearchProvider;
    private readonly IGuidGenerator _guidGenerator;

    public MemoryExtractionService(
        AiAdminDbContext db,
        IConversationStageExecutionService conversationStageExecutionService,
        IKnowledgeEmbeddingProvider embeddingProvider,
        IMemoryVectorSearchProvider vectorSearchProvider,
        IGuidGenerator guidGenerator)
    {
        _db = db;
        _conversationStageExecutionService = conversationStageExecutionService;
        _embeddingProvider = embeddingProvider;
        _vectorSearchProvider = vectorSearchProvider;
        _guidGenerator = guidGenerator;
    }

    public async Task<int> ExtractFromConversationTurnAsync(
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string? sessionId,
        string userText,
        string assistantText,
        CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(agentRole.MemoryLibraryId)
            || string.IsNullOrWhiteSpace(userText))
        {
            return 0;
        }

        var library = await _db.AiMemoryLibraries.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == agentRole.MemoryLibraryId && x.Status == 1, cancellationToken);
        if (library == null)
        {
            return 0;
        }

        var entityScope = MemoryEntityScopes.Parse(agentRole.MemoryEntityScope ?? library.EntityScope);
        var entityScopeValue = MemoryEntityScopes.ToStorageValue(entityScope);
        var entityId = ResolveEntityId(entityScope, device, sessionId, library.UserId);
        var run = new AiMemoryExtractionRun
        {
            Id = _guidGenerator.Create().ToString("N"),
            LibraryId = library.Id,
            AgentId = NormalizeOptionalText(agentRole.Id),
            DeviceId = device.Id,
            UserId = device.UserId ?? library.UserId,
            EntityScope = entityScopeValue,
            EntityId = entityId,
            SessionId = NormalizeOptionalText(sessionId),
            UserText = userText,
            AssistantText = assistantText,
            ConversationHash = ComputeHash($"{userText}\n{assistantText}"),
            Status = "running",
            StartedAt = DateTime.UtcNow,
            CreatedAt = DateTime.UtcNow
        };
        _db.AiMemoryExtractionRuns.Add(run);
        await _db.SaveChangesAsync(cancellationToken);

        var writeConfig = DeserializeWriteConfig(library.WriteConfig);
        if (!writeConfig.AutoWrite
            || !writeConfig.AutoExtract
            || string.IsNullOrWhiteSpace(library.MemoryModelId))
        {
            await FinishRunAsync(run, "skipped", "memory write config disabled or memory model missing", cancellationToken);
            return 0;
        }

        await EnsureMemoryExtractionModelReadyAsync(library.MemoryModelId, cancellationToken);

        var rules = await _db.AiMemoryRules.AsNoTracking()
            .Where(x => x.LibraryId == library.Id && x.IsEnabled
                && x.RuleType != MemoryRuleTypes.Risk
                && x.RuleType != MemoryRuleTypes.HealthFollowup
                && x.RuleType != MemoryRuleTypes.Todo
                && x.RuleType != MemoryRuleTypes.Reminder)
            .OrderBy(x => x.CreatedAt)
            .ToListAsync(cancellationToken);
        if (rules.Count == 0)
        {
            await FinishRunAsync(run, "skipped", "no enabled memory rules", cancellationToken);
            return 0;
        }

        try
        {
            var matchedRules = new List<(AiMemoryRule Rule, double Confidence, string Reason)>();
            foreach (var rule in rules)
            {
                var match = await MatchRuleAsync(library, rule, orchestrationRequest, userText, assistantText, cancellationToken);
                if (match.Matched)
                {
                    matchedRules.Add((rule, match.Confidence, match.Reason));
                }
            }

            run.MatchedRuleCount = matchedRules.Count;
            await _db.SaveChangesAsync(cancellationToken);
            if (matchedRules.Count == 0)
            {
                await FinishRunAsync(run, "skipped", "no matched memory rules", cancellationToken);
                return 0;
            }

            foreach (var (rule, confidence, reason) in matchedRules)
            {
                await ExecuteRuleAsync(run, library, writeConfig, agentRole, device, orchestrationRequest, entityScopeValue, entityId, sessionId, userText, assistantText, rule, confidence, reason, cancellationToken);
            }

            await FinishRunAsync(run, run.SavedCount + run.UpdatedCount > 0 ? "success" : "skipped", null, cancellationToken);
            return run.SavedCount + run.UpdatedCount;
        }
        catch (Exception ex)
        {
            await FinishRunAsync(run, "failed", ex.Message, cancellationToken);
            throw;
        }
    }

    private async Task ExecuteRuleAsync(
        AiMemoryExtractionRun run,
        AiMemoryLibrary library,
        MemoryWriteConfigDto writeConfig,
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string entityScope,
        string entityId,
        string? sessionId,
        string userText,
        string assistantText,
        AiMemoryRule rule,
        double matchConfidence,
        string matchReason,
        CancellationToken cancellationToken)
    {
        var log = new AiMemoryRuleExecutionLog
        {
            Id = _guidGenerator.Create().ToString("N"),
            RunId = run.Id,
            LibraryId = library.Id,
            RuleId = rule.Id,
            RuleCode = rule.RuleCode,
            MatchResult = true,
            MatchConfidence = matchConfidence,
            MatchReason = matchReason,
            Status = "running",
            CreatedAt = DateTime.UtcNow
        };
        _db.AiMemoryRuleExecutionLogs.Add(log);
        await _db.SaveChangesAsync(cancellationToken);

        var savedIds = new List<string>();
        var updatedIds = new List<string>();
        var skippedReasons = new List<string>();

        try
        {
            var request = new LlmChatRequestDto
            {
                SystemPrompt = BuildSingleRuleExtractionSystemPrompt(library, rule),
                Temperature = 0.1,
                MaxTokens = 1200,
                Stream = false,
                Messages =
                [
                    new LlmChatMessageDto
                    {
                        Role = "user",
                        Content = BuildConversationInput(userText, assistantText)
                    }
                ]
            };
            var response = await _conversationStageExecutionService.ChatAsync(CreateMemoryModelOrchestrationRequest(orchestrationRequest, library.MemoryModelId!), request, cancellationToken);
            var candidates = ParseCandidates(response.Text);
            log.LlmRequestJson = JsonSerializer.Serialize(request);
            log.LlmResponseJson = JsonSerializer.Serialize(new { text = response.Text });
            log.CandidateJson = JsonSerializer.Serialize(candidates.Select(x => DeserializeJsonObject(x.RawJson)).ToList());
            run.CandidateCount += candidates.Count;

            foreach (var candidate in ValidateCandidates(rule, writeConfig, candidates, skippedReasons))
            {
                var result = await UpsertCandidateAsync(run, library, writeConfig, agentRole, device, entityScope, entityId, sessionId, rule, candidate, cancellationToken);
                if (result.SavedRecordId != null)
                {
                    savedIds.Add(result.SavedRecordId);
                    run.SavedCount++;
                }

                if (result.UpdatedRecordId != null)
                {
                    updatedIds.Add(result.UpdatedRecordId);
                    run.UpdatedCount++;
                }

                if (result.SkippedReason != null)
                {
                    skippedReasons.Add(result.SkippedReason);
                    run.SkippedCount++;
                }
            }

            run.RejectedCount += skippedReasons.Count;
            log.ValidatedCandidateJson = JsonSerializer.Serialize(candidates.Where(x => !string.IsNullOrWhiteSpace(x.Content)).Select(x => DeserializeJsonObject(x.RawJson)).ToList());
            log.SavedRecordIds = JsonSerializer.Serialize(savedIds);
            log.UpdatedRecordIds = JsonSerializer.Serialize(updatedIds);
            log.SkippedReasons = JsonSerializer.Serialize(skippedReasons);
            log.Status = "success";
            await _db.SaveChangesAsync(cancellationToken);
        }
        catch (Exception ex)
        {
            log.Status = "failed";
            log.ErrorMessage = ex.Message;
            await _db.SaveChangesAsync(cancellationToken);
        }
    }

    private static ConversationOrchestrationRequestDto CreateMemoryModelOrchestrationRequest(ConversationOrchestrationRequestDto source, string memoryModelId)
    {
        return new ConversationOrchestrationRequestDto
        {
            AgentRoleId = source.AgentRoleId,
            AgentRoleCode = source.AgentRoleCode,
            AgentRoleReleaseId = source.AgentRoleReleaseId,
            SessionId = source.SessionId,
            DeviceId = source.DeviceId,
            PipelineTemplateId = source.PipelineTemplateId,
            VadProfileId = source.VadProfileId,
            AsrProfileId = source.AsrProfileId,
            LlmProfileId = memoryModelId,
            TtsProfileId = source.TtsProfileId,
            RequestedInvocationMode = "non_streaming",
            PreferStreaming = false
        };
    }

    private async Task EnsureMemoryExtractionModelReadyAsync(string? memoryModelId, CancellationToken cancellationToken)
    {
        var normalizedId = NormalizeOptionalText(memoryModelId)
            ?? throw new InvalidOperationException("记忆抽取未配置 LLM Profile");
        var profile = await _db.AiLlmProfiles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == normalizedId && x.IsEnabled && x.Status == "active", cancellationToken)
            ?? throw new InvalidOperationException("记忆抽取模型不可用：请选择启用状态的 LLM Profile。记忆抽取模型不是 Embedding Profile。");

        if (string.IsNullOrWhiteSpace(profile.BaseUrl))
            throw new InvalidOperationException("记忆抽取 LLM Profile 缺少主连接地址，请在 LLM Profile 中配置 Base URL / 主连接地址。向量 Profile 的主连接地址只用于记忆向量写入，不用于记忆抽取。");
        if (string.IsNullOrWhiteSpace(profile.Model))
            throw new InvalidOperationException("记忆抽取 LLM Profile 缺少模型名称，请在 LLM Profile 中配置模型。");
    }

    private static string BuildConversationInput(string userText, string assistantText)
    {
        if (string.IsNullOrWhiteSpace(assistantText))
            return userText.Trim();

        return $"用户：{userText.Trim()}\n助手：{assistantText.Trim()}";
    }

    private static List<ExtractedMemoryCandidate> ParseCandidates(string? text)
    {
        var json = ExtractJson(text);
        if (string.IsNullOrWhiteSpace(json))
        {
            return [];
        }

        try
        {
            using var document = JsonDocument.Parse(json);
            var root = document.RootElement;
            if (root.ValueKind == JsonValueKind.Array)
            {
                return ParseCandidateArray(root);
            }

            if (root.ValueKind == JsonValueKind.Object
                && root.TryGetProperty("memories", out var memories)
                && memories.ValueKind == JsonValueKind.Array)
            {
                return ParseCandidateArray(memories);
            }
        }
        catch
        {
            return [];
        }

        return [];
    }

    private static List<ExtractedMemoryCandidate> ParseCandidateArray(JsonElement array)
    {
        var result = new List<ExtractedMemoryCandidate>();
        foreach (var item in array.EnumerateArray())
        {
            if (item.ValueKind != JsonValueKind.Object)
            {
                continue;
            }

            var content = GetString(item, "content");
            if (string.IsNullOrWhiteSpace(content))
            {
                continue;
            }

            result.Add(new ExtractedMemoryCandidate
            {
                RawJson = item.GetRawText(),
                Title = GetString(item, "title"),
                Content = content,
                Summary = GetString(item, "summary"),
                Keywords = GetStringArray(item, "keywords"),
                PayloadJson = GetRawJson(item, "payload"),
                Importance = GetInt(item, "importance"),
                Confidence = GetDouble(item, "confidence")
            });
        }

        return result;
    }

    private static string? ExtractJson(string? text)
    {
        var normalized = NormalizeOptionalText(text);
        if (string.IsNullOrWhiteSpace(normalized))
        {
            return null;
        }

        if (normalized.StartsWith("```", StringComparison.Ordinal))
        {
            var firstLineEnd = normalized.IndexOf('\n');
            var lastFence = normalized.LastIndexOf("```", StringComparison.Ordinal);
            if (firstLineEnd >= 0 && lastFence > firstLineEnd)
            {
                normalized = normalized[(firstLineEnd + 1)..lastFence].Trim();
            }
        }

        var objectStart = normalized.IndexOf('{');
        var arrayStart = normalized.IndexOf('[');
        var startCandidates = new[] { objectStart, arrayStart }.Where(x => x >= 0).ToList();
        if (startCandidates.Count == 0)
        {
            return normalized;
        }

        var start = startCandidates.Min();
        var end = normalized.LastIndexOf(normalized[start] == '{' ? '}' : ']');
        return end > start ? normalized[start..(end + 1)] : normalized[start..];
    }

    private static string? GetString(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
        {
            return null;
        }

        return value.ValueKind == JsonValueKind.String ? NormalizeOptionalText(value.GetString()) : value.ToString();
    }

    private static int? GetInt(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
        {
            return null;
        }

        if (value.ValueKind == JsonValueKind.Number && value.TryGetInt32(out var number))
        {
            return number;
        }

        if (value.ValueKind == JsonValueKind.String && int.TryParse(value.GetString(), out number))
        {
            return number;
        }

        return null;
    }

    private static double? GetDouble(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
        {
            return null;
        }

        if (value.ValueKind == JsonValueKind.Number && value.TryGetDouble(out var number))
        {
            return number;
        }

        return value.ValueKind == JsonValueKind.String && double.TryParse(value.GetString(), out number) ? number : null;
    }

    private static string? GetRawJson(JsonElement item, string propertyName)
    {
        return item.TryGetProperty(propertyName, out var value) && value.ValueKind != JsonValueKind.Null ? value.GetRawText() : null;
    }

    private static object? DeserializeJsonObject(string? json)
    {
        return JsonSerializer.Deserialize<object>(string.IsNullOrWhiteSpace(json) ? "{}" : json, JsonOptions);
    }

    private static List<string> GetStringArray(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value) || value.ValueKind != JsonValueKind.Array)
        {
            return [];
        }

        return value.EnumerateArray()
            .Select(x => x.ValueKind == JsonValueKind.String ? NormalizeOptionalText(x.GetString()) : NormalizeOptionalText(x.ToString()))
            .Where(x => !string.IsNullOrWhiteSpace(x))
            .Select(x => x!)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .Take(10)
            .ToList();
    }

    private static MemoryWriteConfigDto DeserializeWriteConfig(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return NormalizeWriteConfig(null);
        }

        try
        {
            return NormalizeWriteConfig(JsonSerializer.Deserialize<MemoryWriteConfigDto>(value, JsonOptions));
        }
        catch
        {
            return NormalizeWriteConfig(null);
        }
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

    private async Task<(bool Matched, double Confidence, string Reason)> MatchRuleAsync(
        AiMemoryLibrary library,
        AiMemoryRule rule,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string userText,
        string assistantText,
        CancellationToken cancellationToken)
    {
        var request = new LlmChatRequestDto
        {
            SystemPrompt = BuildRuleMatchSystemPrompt(library, rule),
            Temperature = 0,
            MaxTokens = 300,
            Stream = false,
            Messages =
            [
                new LlmChatMessageDto
                {
                    Role = "user",
                    Content = BuildConversationInput(userText, assistantText)
                }
            ]
        };
        var response = await _conversationStageExecutionService.ChatAsync(CreateMemoryModelOrchestrationRequest(orchestrationRequest, library.MemoryModelId!), request, cancellationToken);
        var parsed = ParseRuleMatch(response.Text);
        return (parsed.Matched && parsed.Confidence >= DefaultRuleMatchConfidenceThreshold, parsed.Confidence, parsed.Reason);
    }

    private List<ExtractedMemoryCandidate> ValidateCandidates(AiMemoryRule rule, MemoryWriteConfigDto writeConfig, IReadOnlyList<ExtractedMemoryCandidate> candidates, List<string> skippedReasons)
    {
        var valid = new List<ExtractedMemoryCandidate>();
        var maxRecords = DefaultRuleMaxRecordsPerTurn;
        foreach (var candidate in candidates)
        {
            if (valid.Count >= maxRecords)
            {
                skippedReasons.Add($"rule {rule.Id} exceeded max_records_per_turn");
                break;
            }

            var content = NormalizeOptionalText(candidate.Content);
            if (content == null)
            {
                skippedReasons.Add("candidate content is empty");
                continue;
            }

            if (ContainsSensitiveText(content) || ContainsSensitiveText(candidate.RawJson))
            {
                skippedReasons.Add("candidate contains sensitive content");
                continue;
            }

            var importance = Math.Clamp(candidate.Importance ?? DefaultRuleImportanceThreshold, 1, 10);
            var importanceThreshold = Math.Max(
                DefaultRuleImportanceThreshold,
                Math.Max(writeConfig.MinImportance, writeConfig.ImportanceThreshold));
            if (importance < importanceThreshold)
            {
                skippedReasons.Add($"candidate importance {importance} below threshold");
                continue;
            }

            var confidence = Math.Clamp(candidate.Confidence ?? 1, 0, 1);
            if (confidence < DefaultRuleConfidenceThreshold)
            {
                skippedReasons.Add($"candidate confidence {confidence:0.###} below threshold");
                continue;
            }

            valid.Add(candidate);
        }

        return valid;
    }

    private async Task<(string? SavedRecordId, string? UpdatedRecordId, string? SkippedReason)> UpsertCandidateAsync(
        AiMemoryExtractionRun run,
        AiMemoryLibrary library,
        MemoryWriteConfigDto writeConfig,
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        string entityScope,
        string entityId,
        string? sessionId,
        AiMemoryRule rule,
        ExtractedMemoryCandidate candidate,
        CancellationToken cancellationToken)
    {
        var now = DateTime.UtcNow;
        var content = NormalizeOptionalText(candidate.Content);
        if (content == null)
        {
            return (null, null, "candidate content is empty");
        }

        var contentHash = ComputeHash($"{library.Id}|{entityId}|{content.ToLowerInvariant()}");
        var ruleType = MemoryRuleTypes.Parse(rule.RuleType);
        var canonicalKey = IsProfileMemoryRule(ruleType)
            ? BuildModelCanonicalKey(library.Id, entityId, candidate)
            : null;
        var duplicate = writeConfig.Deduplicate
            ? await _db.AiMemoryRecords.FirstOrDefaultAsync(x => x.LibraryId == library.Id
                && x.EntityId == entityId
                && x.ContentHash == contentHash
                && x.Status == "active",
                cancellationToken)
            : null;
        if (duplicate != null)
        {
            return (null, null, $"duplicate content skipped: {duplicate.Id}");
        }

        AiMemoryRecord? existing = null;
        if (IsProfileMemoryRule(ruleType))
        {
            if (!string.IsNullOrWhiteSpace(canonicalKey))
            {
                existing = await _db.AiMemoryRecords.FirstOrDefaultAsync(x => x.LibraryId == library.Id
                    && x.EntityId == entityId
                    && x.CanonicalKey == canonicalKey
                    && x.Status == "active",
                    cancellationToken);
            }

            existing ??= (await _vectorSearchProvider.SearchAsync(new MemoryVectorSearchRequest
            {
                LibraryId = library.Id,
                Query = content,
                EntityId = entityId,
                IncludeExpired = false,
                TopK = 1,
                MinScore = 0.86
            }, cancellationToken)).FirstOrDefault()?.Record;
        }

        if (existing != null)
        {
            await UpdateExistingRecordAsync(run, writeConfig, rule, existing, candidate, canonicalKey, contentHash, now, cancellationToken);
            return (null, existing.Id, null);
        }

        var entity = new AiMemoryRecord
        {
            Id = _guidGenerator.Create().ToString("N"),
            LibraryId = library.Id,
            AgentId = NormalizeOptionalText(agentRole.Id) ?? library.AgentId,
            DeviceId = NormalizeOptionalText(device.Id),
            UserId = device.UserId ?? library.UserId,
            EntityScope = entityScope,
            EntityId = entityId,
            SessionId = NormalizeOptionalText(sessionId),
            RuleId = rule.Id,
            RuleCode = rule.RuleCode,
            RecordType = NormalizeMemoryRecordType(ruleType),
            Title = NormalizeOptionalText(candidate.Title),
            Content = content,
            Summary = NormalizeOptionalText(candidate.Summary),
            Keywords = candidate.Keywords.Count == 0 ? null : JsonSerializer.Serialize(candidate.Keywords),
            PayloadJson = candidate.PayloadJson,
            CanonicalKey = NormalizeOptionalText(canonicalKey),
            ContentHash = contentHash,
            Importance = Math.Clamp(candidate.Importance ?? DefaultRuleImportanceThreshold, 1, 10),
            Confidence = Math.Clamp(candidate.Confidence ?? 1, 0, 1),
            IsPinned = false,
            Status = "active",
            Source = "voice_conversation",
            SourceRunId = run.Id,
            ExpiresAt = ResolveExpiresAt(now, writeConfig, rule),
            CreatedAt = now,
            UpdatedAt = now
        };
        await SaveNewRecordAsync(entity, "create", "memory extraction create", cancellationToken);
        return (entity.Id, null, null);
    }

    private async Task UpdateExistingRecordAsync(
        AiMemoryExtractionRun run,
        MemoryWriteConfigDto writeConfig,
        AiMemoryRule rule,
        AiMemoryRecord existing,
        ExtractedMemoryCandidate candidate,
        string? canonicalKey,
        string contentHash,
        DateTime now,
        CancellationToken cancellationToken)
    {
        var beforeJson = BuildRecordSnapshot(existing);
        var mergeStrategy = ResolveMemoryMergeStrategy(MemoryRuleTypes.Parse(rule.RuleType));
        existing.Title = NormalizeOptionalText(candidate.Title) ?? existing.Title;
        existing.Content = mergeStrategy == "replace"
            ? NormalizeOptionalText(candidate.Content) ?? existing.Content
            : MergeText(existing.Content, candidate.Content);
        existing.Summary = NormalizeOptionalText(candidate.Summary) ?? existing.Summary;
        existing.Keywords = MergeJsonArrays(existing.Keywords, candidate.Keywords);
        existing.PayloadJson = MergeJsonObjects(existing.PayloadJson, candidate.PayloadJson);
        existing.CanonicalKey = NormalizeOptionalText(canonicalKey) ?? existing.CanonicalKey;
        existing.ContentHash = contentHash;
        existing.Importance = Math.Max(existing.Importance, Math.Clamp(candidate.Importance ?? DefaultRuleImportanceThreshold, 1, 10));
        existing.Confidence = Math.Max(existing.Confidence, Math.Clamp(candidate.Confidence ?? 1, 0, 1));
        existing.ExpiresAt = ResolveExpiresAt(now, writeConfig, rule);
        existing.SourceRunId = run.Id;
        existing.Revision++;
        existing.UpdatedAt = now;

        var embedding = await _embeddingProvider.EmbedAsync(BuildMemoryEmbeddingText(existing), null, cancellationToken);
        existing.EmbeddingModelId = embedding.ModelConfigId;
        existing.EmbeddingDimension = embedding.Values.Length;
        existing.EmbeddingJson = JsonSerializer.Serialize(embedding.Values);
        _db.AiMemoryRecordRevisions.Add(new AiMemoryRecordRevision
        {
            Id = _guidGenerator.Create().ToString("N"),
            RecordId = existing.Id,
            LibraryId = existing.LibraryId,
            RuleId = existing.RuleId,
            EntityId = existing.EntityId,
            BeforeJson = beforeJson,
            AfterJson = BuildRecordSnapshot(existing),
            ChangeType = mergeStrategy,
            ChangeReason = "memory extraction auto update",
            SourceRunId = run.Id,
            CreatedAt = now
        });
        await _db.SaveChangesAsync(cancellationToken);
        await _vectorSearchProvider.SaveRecordEmbeddingAsync(existing.Id, embedding.Values, cancellationToken);
    }

    private async Task SaveNewRecordAsync(AiMemoryRecord entity, string changeType, string changeReason, CancellationToken cancellationToken)
    {
        var embedding = await _embeddingProvider.EmbedAsync(BuildMemoryEmbeddingText(entity), null, cancellationToken);
        entity.EmbeddingModelId = embedding.ModelConfigId;
        entity.EmbeddingDimension = embedding.Values.Length;
        entity.EmbeddingJson = JsonSerializer.Serialize(embedding.Values);
        _db.AiMemoryRecords.Add(entity);
        _db.AiMemoryRecordRevisions.Add(new AiMemoryRecordRevision
        {
            Id = _guidGenerator.Create().ToString("N"),
            RecordId = entity.Id,
            LibraryId = entity.LibraryId,
            RuleId = entity.RuleId,
            EntityId = entity.EntityId,
            AfterJson = BuildRecordSnapshot(entity),
            ChangeType = changeType,
            ChangeReason = changeReason,
            SourceRunId = entity.SourceRunId,
            CreatedAt = DateTime.UtcNow
        });
        await _db.SaveChangesAsync(cancellationToken);
        await _vectorSearchProvider.SaveRecordEmbeddingAsync(entity.Id, embedding.Values, cancellationToken);
    }

    private async Task FinishRunAsync(AiMemoryExtractionRun run, string status, string? errorMessage, CancellationToken cancellationToken)
    {
        run.Status = status;
        run.ErrorMessage = errorMessage;
        run.FinishedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
    }

    private static string NormalizeMemoryRecordType(MemoryRuleType ruleType)
    {
        return MemoryRuleTypes.ToMemoryRecordType(ruleType);
    }

    private static bool IsProfileMemoryRule(MemoryRuleType ruleType)
    {
        return MemoryRuleTypes.IsProfile(ruleType);
    }

    private static string ResolveMemoryMergeStrategy(MemoryRuleType ruleType)
    {
        return MemoryRuleTypes.ResolveMemoryMergeStrategy(ruleType);
    }

    private static string ResolveEntityId(MemoryEntityScope entityScope, AiDevice device, string? sessionId, long? libraryUserId)
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

        if (libraryUserId.HasValue)
        {
            return $"user:{libraryUserId.Value}";
        }

        return $"device:{DeviceCredentialService.NormalizeDeviceId(device.MacAddress ?? device.Id)}";
    }

    private static DateTime? ResolveExpiresAt(DateTime now, MemoryWriteConfigDto writeConfig, AiMemoryRule? matchedRule)
    {
        if (matchedRule?.TtlDays > 0)
        {
            return now.AddDays(matchedRule.TtlDays.Value);
        }

        return writeConfig.TtlDays > 0 ? now.AddDays(writeConfig.TtlDays) : null;
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private static string BuildRuleMatchSystemPrompt(AiMemoryLibrary library, AiMemoryRule rule)
    {
        var builder = new StringBuilder();
        builder.AppendLine("你是记忆规则匹配器，只判断当前对话是否命中这一条规则。只输出 JSON。");
        builder.AppendLine("输出格式：{\"matched\":true|false,\"confidence\":0-1,\"reason\":\"简短原因\"}");
        builder.AppendLine($"记忆库：{library.Name}");
        builder.AppendLine($"规则ID：{rule.Id}");
        builder.AppendLine($"规则类型：{MemoryRuleTypes.ToStorageValue(MemoryRuleTypes.Parse(rule.RuleType))}");
        builder.AppendLine($"规则名称：{rule.RuleName}");
        builder.AppendLine($"规则说明：{NormalizeOptionalText(rule.Instruction) ?? "按规则名称判断"}");
        AppendRuleTypeMatchPolicy(builder, rule);
        return builder.ToString();
    }

    private static string BuildSingleRuleExtractionSystemPrompt(AiMemoryLibrary library, AiMemoryRule rule)
    {
        var builder = new StringBuilder();
        builder.AppendLine("你是对话信息抽取器。你只能执行当前这一条规则。只输出 JSON，不要输出 Markdown、解释、代码块或多余文本。");
        builder.AppendLine("不适用或没有值得记录/处理的信息时输出 {\"memories\":[]}。");
        builder.AppendLine("输出格式：{\"memories\":[{\"title\":\"短标题\",\"content\":\"可独立理解的记忆内容\",\"summary\":\"摘要\",\"keywords\":[\"关键词\"],\"payload\":{},\"importance\":1-10,\"confidence\":0-1,\"evidence\":\"来自对话的依据\"}]}。");
        builder.AppendLine("不要保存一次性的闲聊、助手自身表述、无明确长期价值的信息、密码、验证码、访问令牌、银行卡号等敏感凭据。");
        builder.AppendLine($"记忆库：{library.Name}");
        if (!string.IsNullOrWhiteSpace(library.Description))
        {
            builder.AppendLine($"记忆库说明：{library.Description}");
        }

        builder.AppendLine($"规则ID：{rule.Id}");
        builder.AppendLine($"规则编码：{rule.RuleCode}");
        builder.AppendLine($"规则类型：{MemoryRuleTypes.ToStorageValue(MemoryRuleTypes.Parse(rule.RuleType))}");
        builder.AppendLine($"规则名称：{rule.RuleName}");
        builder.AppendLine($"规则说明：{NormalizeOptionalText(rule.Instruction) ?? "按规则名称判断"}");
        AppendRuleTypeExtractionPolicy(builder, rule);
        if (IsProfileMemoryRule(MemoryRuleTypes.Parse(rule.RuleType)))
        {
            builder.AppendLine("当前规则会自动更新已有记忆。请在 payload.canonicalKey 中输出稳定身份键，用于识别同一主题/属性/偏好；canonicalKey 应表示主题本身，不要包含会变化的取值。例如记录“用户喜欢恐龙”和“用户不再喜欢恐龙”时，canonicalKey 都应为“preference:dinosaur”。");
        }

        return builder.ToString();
    }

    private static void AppendRuleTypeExtractionPolicy(StringBuilder builder, AiMemoryRule rule)
    {
        var ruleType = MemoryRuleTypes.Parse(rule.RuleType);
        if (ruleType == MemoryRuleType.Profile)
        {
            builder.AppendLine("用户画像只记录长期稳定信息，如昵称、偏好、习惯、长期设置；同一属性或同一偏好对象只能输出一条候选。同一句同时包含昵称和偏好时应拆成多条原子候选，例如“用户的昵称为小明”和“用户喜欢恐龙”。不要把“请以后记住”“要求助手记住”等操作指令写入 content。payload.canonicalKey 请使用 nickname、preference:对象、habit:对象、setting:对象 等稳定键。");
            return;
        }

        if (ruleType == MemoryRuleType.Node)
        {
            builder.AppendLine("事实/事件不要提取昵称、偏好、习惯、长期设置等用户画像信息；这些内容应由用户画像规则处理，避免重复记忆。");
            return;
        }

        if (ruleType == MemoryRuleType.Risk)
        {
            builder.AppendLine("风险线索只输出安全、情绪、照护、诈骗、异常行为等需要后续处理的信号；不要输出普通闲聊，也不要直接生成通知文案。payload 中尽量包含 riskCategory、riskLevel、evidence、suggestedAction。");
            return;
        }

        if (ruleType == MemoryRuleType.HealthFollowup)
        {
            builder.AppendLine("健康线索只输出需要后续关怀或回访的信息，如不适症状、用药、睡眠、饮食、复诊；payload 中尽量包含 symptom、followupReason、suggestedDelayHours。");
            return;
        }

        if (ruleType == MemoryRuleType.Todo)
        {
            builder.AppendLine("待办事项只输出用户明确交代需要后续执行的任务；必须有清晰任务内容和责任对象，不要把普通聊天当成待办。payload 中尽量包含 task、assignee、dueHint。");
            return;
        }

        if (ruleType == MemoryRuleType.Reminder)
        {
            builder.AppendLine("提醒事项只输出明确要求未来触达的提醒；必须包含提醒内容，并尽量提取时间线索。payload 中尽量包含 reminderText、timeHint、context。");
        }
    }

    private static void AppendRuleTypeMatchPolicy(StringBuilder builder, AiMemoryRule rule)
    {
        var ruleType = MemoryRuleTypes.Parse(rule.RuleType);
        if (ruleType == MemoryRuleType.Profile)
        {
            builder.AppendLine("匹配标准：只有昵称、偏好、习惯、长期设置等长期稳定用户画像信息才匹配。");
            return;
        }

        if (ruleType == MemoryRuleType.Node)
        {
            builder.AppendLine("匹配标准：只匹配事实、事件、阶段摘要；昵称、偏好、习惯、长期设置等用户画像信息不匹配。");
            return;
        }

        if (ruleType == MemoryRuleType.Todo)
        {
            builder.AppendLine("匹配标准：只匹配用户明确要求后续执行的任务，必须有可执行动作。用户要求“记住/牢记”昵称、偏好、习惯、设置等长期信息时不匹配待办，应由用户画像规则处理。");
            return;
        }

        if (ruleType == MemoryRuleType.Reminder)
        {
            builder.AppendLine("匹配标准：只匹配用户明确要求未来触达提醒的信息，必须有提醒内容，最好有时间线索。用户要求“记住/牢记”昵称、偏好、习惯、设置等长期信息时不匹配提醒，应由用户画像规则处理。");
            return;
        }

        if (ruleType == MemoryRuleType.Risk)
        {
            builder.AppendLine("匹配标准：只匹配安全、情绪、照护、诈骗、异常行为等需要后续处理的风险线索；普通偏好或个人资料不匹配。");
            return;
        }

        if (ruleType == MemoryRuleType.HealthFollowup)
        {
            builder.AppendLine("匹配标准：只匹配需要后续关怀或回访的健康线索；普通偏好或个人资料不匹配。");
        }
    }

    private static (bool Matched, double Confidence, string Reason) ParseRuleMatch(string? text)
    {
        var json = ExtractJson(text);
        if (string.IsNullOrWhiteSpace(json))
        {
            return (false, 0, "empty match response");
        }

        try
        {
            using var document = JsonDocument.Parse(json);
            var root = document.RootElement;
            return (GetBool(root, "matched"), GetDouble(root, "confidence") ?? 0, GetString(root, "reason") ?? "llm match");
        }
        catch
        {
            return (false, 0, "invalid match response");
        }
    }

    private static bool GetBool(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
        {
            return false;
        }

        return value.ValueKind switch
        {
            JsonValueKind.True => true,
            JsonValueKind.False => false,
            JsonValueKind.String => bool.TryParse(value.GetString(), out var result) && result,
            _ => false
        };
    }

    private static List<string> ParseStringArray(string? json)
    {
        if (string.IsNullOrWhiteSpace(json))
        {
            return [];
        }

        try
        {
            using var document = JsonDocument.Parse(json);
            if (document.RootElement.ValueKind != JsonValueKind.Array)
            {
                return [];
            }

            return document.RootElement.EnumerateArray()
                .Select(x => x.ValueKind == JsonValueKind.String ? x.GetString() : x.ToString())
                .Where(x => !string.IsNullOrWhiteSpace(x))
                .Select(x => x!)
                .Distinct(StringComparer.OrdinalIgnoreCase)
                .ToList();
        }
        catch
        {
            return [];
        }
    }

    private static bool ContainsSensitiveText(string? text)
    {
        return !string.IsNullOrWhiteSpace(text) && SensitivePattern.IsMatch(text);
    }

    private static string? BuildModelCanonicalKey(string libraryId, string entityId, ExtractedMemoryCandidate candidate)
    {
        var identity = TryReadModelIdentity(candidate);
        if (identity == null)
        {
            return null;
        }

        return $"library:{libraryId}|entity:{entityId}|auto:{identity}";
    }

    private static string? TryReadModelIdentity(ExtractedMemoryCandidate candidate)
    {
        if (!string.IsNullOrWhiteSpace(candidate.RawJson))
        {
            try
            {
                using var document = JsonDocument.Parse(candidate.RawJson);
                var paths = new[]
                {
                    "payload.canonicalKey",
                    "payload.canonical_key",
                    "canonicalKey",
                    "canonical_key"
                };
                foreach (var path in paths)
                {
                    var normalized = NormalizeModelIdentity(TryReadPath(document.RootElement, path));
                    if (normalized != null)
                    {
                        return normalized;
                    }
                }
            }
            catch
            {
            }
        }

        return null;
    }

    private static string? NormalizeModelIdentity(string? value)
    {
        var normalized = NormalizeOptionalText(value)?.ToLowerInvariant();
        if (normalized == null)
        {
            return null;
        }

        normalized = string.Join(':', normalized.Split(':', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries));
        return normalized.Length < 2 ? null : normalized;
    }

    private static string? TryReadPath(JsonElement root, string path)
    {
        var current = root;
        foreach (var segment in path.Split('.', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
        {
            if (current.ValueKind != JsonValueKind.Object || !current.TryGetProperty(segment, out current))
            {
                return null;
            }
        }

        return current.ValueKind == JsonValueKind.String ? current.GetString() : current.ToString();
    }

    private static string BuildRecordSnapshot(AiMemoryRecord record)
    {
        return JsonSerializer.Serialize(new
        {
            record.Id,
            record.LibraryId,
            record.RuleId,
            record.RuleCode,
            record.EntityScope,
            record.EntityId,
            record.RecordType,
            record.Title,
            record.Content,
            record.Summary,
            record.Keywords,
            record.PayloadJson,
            record.CanonicalKey,
            record.ContentHash,
            record.Importance,
            record.Confidence,
            record.Status,
            record.ExpiresAt,
            record.Revision
        });
    }

    private static string BuildMemoryEmbeddingText(AiMemoryRecord entity)
    {
        var parts = new[]
        {
            entity.Title,
            entity.Summary,
            entity.Content,
            entity.Keywords,
            entity.PayloadJson
        };
        return string.Join("\n", parts.Where(x => !string.IsNullOrWhiteSpace(x)));
    }

    private static string MergeText(string? existing, string? incoming)
    {
        var normalizedExisting = NormalizeOptionalText(existing);
        var normalizedIncoming = NormalizeOptionalText(incoming);
        if (normalizedExisting == null)
        {
            return normalizedIncoming ?? string.Empty;
        }

        if (normalizedIncoming == null || normalizedExisting.Contains(normalizedIncoming, StringComparison.OrdinalIgnoreCase))
        {
            return normalizedExisting;
        }

        return $"{normalizedExisting}\n{normalizedIncoming}";
    }

    private static string? MergeJsonArrays(string? existingJson, IReadOnlyList<string> incoming)
    {
        var values = ParseStringArray(existingJson);
        values.AddRange(incoming);
        var merged = values.Where(x => !string.IsNullOrWhiteSpace(x)).Distinct(StringComparer.OrdinalIgnoreCase).Take(20).ToList();
        return merged.Count == 0 ? null : JsonSerializer.Serialize(merged);
    }

    private static string? MergeJsonObjects(string? existingJson, string? incomingJson)
    {
        if (string.IsNullOrWhiteSpace(existingJson))
        {
            return incomingJson;
        }

        if (string.IsNullOrWhiteSpace(incomingJson))
        {
            return existingJson;
        }

        try
        {
            var existing = JsonSerializer.Deserialize<Dictionary<string, object?>>(existingJson, JsonOptions) ?? [];
            var incoming = JsonSerializer.Deserialize<Dictionary<string, object?>>(incomingJson, JsonOptions) ?? [];
            foreach (var pair in incoming)
            {
                existing[pair.Key] = pair.Value;
            }

            return JsonSerializer.Serialize(existing);
        }
        catch
        {
            return incomingJson;
        }
    }

    private static string ComputeHash(string value)
    {
        var bytes = SHA256.HashData(Encoding.UTF8.GetBytes(value));
        return Convert.ToHexString(bytes).ToLowerInvariant();
    }

    private sealed class ExtractedMemoryCandidate
    {
        public string? RawJson { get; init; }
        public string? Title { get; init; }
        public string? Content { get; init; }
        public string? Summary { get; init; }
        public List<string> Keywords { get; init; } = [];
        public string? PayloadJson { get; init; }
        public int? Importance { get; init; }
        public double? Confidence { get; init; }
    }
}
