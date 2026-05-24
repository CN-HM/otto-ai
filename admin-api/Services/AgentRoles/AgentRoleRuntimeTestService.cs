using System.Diagnostics;
using System.Text;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Memory;
using AiAdmin.Services.Memory.Dtos;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using AiAdmin.Services.Voice;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.AgentRoles;

public sealed class AgentRoleRuntimeTestRequestDto
{
    public string? AgentRoleId { get; set; }
    public string? AgentRoleCode { get; set; }
    public string? AgentRoleReleaseId { get; set; }
    public string? SessionId { get; set; }
    public string? DeviceId { get; set; }
    public string? UserText { get; set; }
    public string? AudioBase64 { get; set; }
    public string? AudioFormat { get; set; }
    public string? Language { get; set; }
    public string? ResponseFormat { get; set; }
}

public sealed class AgentRoleRuntimeTestResultDto
{
    public string SessionId { get; set; } = string.Empty;
    public string InputMode { get; set; } = "text";
    public string? AgentRoleId { get; set; }
    public string? AgentRoleCode { get; set; }
    public string? AgentRoleName { get; set; }
    public string? AgentRoleReleaseId { get; set; }
    public string? AgentRoleVersion { get; set; }
    public string? RuntimeConfigSource { get; set; }
    public string? DeviceId { get; set; }
    public string? Transcript { get; set; }
    public string? ReplyText { get; set; }
    public AgentRoleRuntimeTestStageDto AsrStage { get; set; } = AgentRoleRuntimeTestStageDto.Skipped();
    public AgentRoleRuntimeTestStageDto MemoryRetrievalStage { get; set; } = AgentRoleRuntimeTestStageDto.Skipped();
    public AgentRoleRuntimeTestStageDto KnowledgeRetrievalStage { get; set; } = AgentRoleRuntimeTestStageDto.Skipped();
    public AgentRoleRuntimeTestStageDto LlmStage { get; set; } = AgentRoleRuntimeTestStageDto.Skipped();
    public AgentRoleRuntimeTestStageDto TtsStage { get; set; } = AgentRoleRuntimeTestStageDto.Skipped();
    public AgentRoleRuntimeTestStageDto MemoryExtractionStage { get; set; } = AgentRoleRuntimeTestStageDto.Skipped();
    public AsrRecognitionResponseDto? Asr { get; set; }
    public AgentRoleRuntimeTestKnowledgeDto? Knowledge { get; set; }
    public MemoryRuntimeContextDto? MemoryBefore { get; set; }
    public LlmChatResponseDto? Llm { get; set; }
    public TtsSynthesisResponseDto? Tts { get; set; }
    public int MemoryChangedCount { get; set; }
    public MemoryRuntimeContextDto? MemoryAfter { get; set; }
    public List<StageExecutionTraceDto> StageTraces { get; set; } = [];
    public List<string> Warnings { get; set; } = [];
}

public sealed class AgentRoleRuntimeTestStageDto
{
    public string Status { get; set; } = "skipped";
    public long DurationMs { get; set; }
    public string? ErrorMessage { get; set; }
    public StageExecutionTraceDto? Trace { get; set; }

    public static AgentRoleRuntimeTestStageDto Skipped(string? reason = null)
    {
        return new AgentRoleRuntimeTestStageDto
        {
            Status = "skipped",
            ErrorMessage = reason
        };
    }
}

public sealed class AgentRoleRuntimeTestKnowledgeDto
{
    public bool HasBindings { get; set; }
    public bool HasHits { get; set; }
    public string? FallbackReplyText { get; set; }
    public string? InjectedSystemPrompt { get; set; }
    public List<AgentRoleRuntimeTestKnowledgeHitDto> Hits { get; set; } = [];
}

public sealed class AgentRoleRuntimeTestKnowledgeHitDto
{
    public string? DatasetId { get; set; }
    public string? DocumentId { get; set; }
    public string? DocumentName { get; set; }
    public string? Content { get; set; }
    public double Score { get; set; }
}

public class AgentRoleRuntimeTestService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly AgentRoleRuntimeResolver _agentRoleRuntimeResolver;
    private readonly IConversationOrchestrationService _conversationOrchestrationService;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly AgentRoleKnowledgeRetrievalService _agentRoleKnowledgeRetrievalService;
    private readonly MemoryLibraryService _memoryLibraryService;
    private readonly MemoryConversationSessionService _memoryConversationSessionService;

    public AgentRoleRuntimeTestService(
        AiAdminDbContext db,
        AgentRoleRuntimeResolver agentRoleRuntimeResolver,
        IConversationOrchestrationService conversationOrchestrationService,
        IConversationStageExecutionService conversationStageExecutionService,
        AgentRoleKnowledgeRetrievalService agentRoleKnowledgeRetrievalService,
        MemoryLibraryService memoryLibraryService,
        MemoryConversationSessionService memoryConversationSessionService)
    {
        _db = db;
        _agentRoleRuntimeResolver = agentRoleRuntimeResolver;
        _conversationOrchestrationService = conversationOrchestrationService;
        _conversationStageExecutionService = conversationStageExecutionService;
        _agentRoleKnowledgeRetrievalService = agentRoleKnowledgeRetrievalService;
        _memoryLibraryService = memoryLibraryService;
        _memoryConversationSessionService = memoryConversationSessionService;
    }

    public async Task<AgentRoleRuntimeTestResultDto> RunAsync(AgentRoleRuntimeTestRequestDto request, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var sessionId = NormalizeOptionalText(request.SessionId) ?? $"admin-test-{Guid.NewGuid():N}";
        var agentRole = await _agentRoleRuntimeResolver.ResolveAsync(request.AgentRoleId, request.AgentRoleCode, request.AgentRoleReleaseId, cancellationToken);
        var device = await ResolveTestDeviceAsync(request.DeviceId, currentUserId, isSuperAdmin, cancellationToken);
        var orchestration = new ConversationOrchestrationRequestDto
        {
            AgentRoleId = agentRole.Id,
            AgentRoleCode = agentRole.Code,
            AgentRoleReleaseId = agentRole.CurrentReleaseId ?? request.AgentRoleReleaseId,
            SessionId = sessionId,
            DeviceId = device.Id,
            RequestedInvocationMode = "non_streaming",
            PreferStreaming = false
        };
        var plan = await _conversationOrchestrationService.BuildPlanAsync(orchestration, cancellationToken);
        var result = new AgentRoleRuntimeTestResultDto
        {
            SessionId = sessionId,
            AgentRoleId = agentRole.Id,
            AgentRoleCode = agentRole.Code,
            AgentRoleName = agentRole.DisplayName ?? agentRole.Name,
            AgentRoleReleaseId = agentRole.CurrentReleaseId,
            AgentRoleVersion = agentRole.CurrentVersion,
            RuntimeConfigSource = agentRole.RuntimeConfigSource,
            DeviceId = device.Id
        };

        var transcript = NormalizeOptionalText(request.UserText);
        var asrEnabled = plan.Asr != null;
        var ttsEnabled = plan.Tts != null;
        var shouldRunAsr = asrEnabled && !string.IsNullOrWhiteSpace(request.AudioBase64);
        if (!asrEnabled)
        {
            result.AsrStage = AgentRoleRuntimeTestStageDto.Skipped("Pipeline 已禁用 ASR 节点。");
        }
        if (shouldRunAsr)
        {
            result.InputMode = "audio";
            var asrStage = Stopwatch.StartNew();
            try
            {
                result.Asr = await _conversationStageExecutionService.RecognizeAsync(orchestration, new AsrRecognitionRequestDto
                {
                    AudioBase64 = request.AudioBase64 ?? string.Empty,
                    AudioFormat = NormalizeOptionalText(request.AudioFormat) ?? "wav",
                    Language = NormalizeOptionalText(request.Language) ?? NormalizeOptionalText(agentRole.LangCode)
                }, cancellationToken);
                transcript = NormalizeOptionalText(result.Asr.Transcript) ?? transcript;
                result.AsrStage = Success(asrStage, result.Asr.StageTrace);
                AddTrace(result, result.Asr.StageTrace);
            }
            catch (Exception ex)
            {
                result.AsrStage = Failed(asrStage, ex);
                result.Warnings.Add($"ASR 识别失败：{ex.Message}");
                return result;
            }
        }

        result.Transcript = transcript;
        if (string.IsNullOrWhiteSpace(transcript))
        {
            result.Warnings.Add("请输入测试文本，或上传可识别的音频。VAD 不在后台测试链路中执行。");
            return result;
        }

        var memoryStage = Stopwatch.StartNew();
        try
        {
            result.MemoryBefore = await _memoryLibraryService.BuildRuntimeContextAsync(agentRole, device, transcript, sessionId, cancellationToken);
            result.MemoryRetrievalStage = Success(memoryStage, null);
        }
        catch (Exception ex)
        {
            result.MemoryRetrievalStage = Failed(memoryStage, ex);
            result.Warnings.Add($"记忆召回失败：{ex.Message}");
        }

        var knowledgeStage = Stopwatch.StartNew();
        try
        {
            var knowledge = await _agentRoleKnowledgeRetrievalService.RetrieveAsync(new AgentRoleKnowledgeRetrievalRequest
            {
                AgentRole = agentRole,
                Query = transcript,
                OrchestrationRequest = orchestration
            }, cancellationToken);
            result.Knowledge = new AgentRoleRuntimeTestKnowledgeDto
            {
                HasBindings = knowledge.HasBindings,
                HasHits = knowledge.HasHits,
                FallbackReplyText = knowledge.FallbackReplyText,
                InjectedSystemPrompt = knowledge.InjectedSystemPrompt,
                Hits = knowledge.Hits.Select(x => new AgentRoleRuntimeTestKnowledgeHitDto
                {
                    DatasetId = x.DatasetId,
                    DocumentId = x.DocumentId,
                    DocumentName = x.DocumentName,
                    Content = x.Content,
                    Score = x.Score
                }).ToList()
            };
            result.KnowledgeRetrievalStage = Success(knowledgeStage, knowledge.StageTrace);
            AddTrace(result, knowledge.StageTrace);
        }
        catch (Exception ex)
        {
            result.KnowledgeRetrievalStage = Failed(knowledgeStage, ex);
            result.Warnings.Add($"知识库召回失败：{ex.Message}");
        }

        var llmStage = Stopwatch.StartNew();
        try
        {
            result.Llm = await _conversationStageExecutionService.ChatAsync(orchestration, new LlmChatRequestDto
            {
                SystemPrompt = BuildRuntimeSystemPrompt(NormalizeOptionalText(result.Knowledge?.InjectedSystemPrompt) ?? NormalizeOptionalText(agentRole.SystemPrompt), result.MemoryBefore),
                Stream = false,
                Messages =
                [
                    ..BuildKnowledgeFallbackMessages(result.Knowledge),
                    new LlmChatMessageDto
                    {
                        Role = "user",
                        Content = transcript
                    }
                ]
            }, cancellationToken);
            result.ReplyText = NormalizeOptionalText(result.Llm.Text);
            result.LlmStage = Success(llmStage, result.Llm.StageTrace);
            AddTrace(result, result.Llm.StageTrace);
        }
        catch (Exception ex)
        {
            result.LlmStage = Failed(llmStage, ex);
            result.Warnings.Add($"LLM 回复失败：{ex.Message}");
            return result;
        }

        if (string.IsNullOrWhiteSpace(result.ReplyText))
        {
            result.Warnings.Add("LLM 未返回有效回复，已停止 TTS 和记忆写入。 ");
            return result;
        }

        if (!ttsEnabled)
        {
            result.TtsStage = AgentRoleRuntimeTestStageDto.Skipped("Pipeline 已禁用 TTS 节点。");
        }
        else
        {
            var ttsStage = Stopwatch.StartNew();
            try
            {
                var voice = await ResolveTtsVoiceAsync(agentRole.TtsVoiceId, plan.Tts?.ProfileId, cancellationToken);
                result.Tts = await _conversationStageExecutionService.SynthesizeAsync(orchestration, new TtsSynthesisRequestDto
                {
                    Text = result.ReplyText,
                    Voice = voice,
                    ResponseFormat = NormalizeOptionalText(request.ResponseFormat) ?? "wav"
                }, cancellationToken);
                result.TtsStage = Success(ttsStage, result.Tts.StageTrace);
                AddTrace(result, result.Tts.StageTrace);
            }
            catch (Exception ex)
            {
                result.TtsStage = Failed(ttsStage, ex);
                result.Warnings.Add($"TTS 合成失败：{ex.Message}");
            }
        }

        var extractionStage = Stopwatch.StartNew();
        try
        {
            await _memoryConversationSessionService.AppendTurnAsync(agentRole, device, orchestration, sessionId, transcript, result.ReplyText, cancellationToken);
            result.MemoryExtractionStage = Success(extractionStage, null);
            result.Warnings.Add("本轮对话已加入会话缓冲，请点击“结束会话并抽取记忆”后统一写入记忆。");
        }
        catch (Exception ex)
        {
            result.MemoryExtractionStage = Failed(extractionStage, ex);
            result.Warnings.Add($"记忆会话缓冲失败：{ex.Message}");
        }

        return result;
    }

    public async Task FinalizeSessionAsync(string? sessionId, CancellationToken cancellationToken = default)
    {
        await _memoryConversationSessionService.FinalizeSessionAsync(sessionId, "admin_runtime_test", cancellationToken);
    }

    private async Task<AiDevice> ResolveTestDeviceAsync(string? deviceId, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken)
    {
        var normalizedDeviceId = NormalizeOptionalText(deviceId);
        if (!string.IsNullOrWhiteSpace(normalizedDeviceId))
        {
            var device = await _db.AiDevices.AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == normalizedDeviceId || x.MacAddress == normalizedDeviceId, cancellationToken);
            if (device != null)
            {
                if (!isSuperAdmin && device.UserId.HasValue && device.UserId.Value != currentUserId)
                {
                    throw new UnauthorizedAccessException("Error:AgentRoleRuntimeTestAccessDenied");
                }

                return device;
            }

            return new AiDevice
            {
                Id = normalizedDeviceId,
                UserId = currentUserId,
                MacAddress = normalizedDeviceId
            };
        }

        return new AiDevice
        {
            Id = $"admin-test-{currentUserId}",
            UserId = currentUserId,
            MacAddress = $"admin-test-{currentUserId}"
        };
    }

    private async Task<string?> ResolveTtsVoiceAsync(string? ttsVoiceId, string? ttsProfileId, CancellationToken cancellationToken)
    {
        var normalizedId = NormalizeOptionalText(ttsVoiceId);
        if (string.IsNullOrWhiteSpace(normalizedId))
        {
            return null;
        }

        var ttsVoice = await _db.AiTtsVoices.AsNoTracking().FirstOrDefaultAsync(x => x.Id == normalizedId, cancellationToken);
        if (ttsVoice == null)
        {
            return null;
        }

        if (!string.IsNullOrWhiteSpace(ttsProfileId)
            && !string.Equals(ttsVoice.TtsProfileId, ttsProfileId, StringComparison.OrdinalIgnoreCase))
        {
            throw new LocalizedBusinessException("Error:TtsVoiceProfileMismatchDetailed",
                ("ttsProfileId", ttsProfileId),
                ("voiceProfileId", ttsVoice.TtsProfileId ?? "-"));
        }

        if (!string.IsNullOrWhiteSpace(ttsProfileId))
        {
            var profile = await _db.AiTtsProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == ttsProfileId, cancellationToken);
            if (profile != null)
                TtsVoiceResourceValidator.EnsureMatchesProfileResource(profile, ttsVoice, "TTS 合成");
        }

        return NormalizeOptionalText(ttsVoice.TtsVoice);
    }

    private static string? BuildRuntimeSystemPrompt(string? baseSystemPrompt, MemoryRuntimeContextDto? memoryContext)
    {
        var normalizedBase = NormalizeOptionalText(baseSystemPrompt);
        var memoryRecords = memoryContext?.Records
            .Where(x => !string.IsNullOrWhiteSpace(x.Content))
            .Take(memoryContext.TopK > 0 ? memoryContext.TopK : 5)
            .ToList() ?? [];
        if (memoryRecords.Count == 0)
        {
            return normalizedBase;
        }

        var builder = new StringBuilder();
        if (!string.IsNullOrWhiteSpace(normalizedBase))
        {
            builder.AppendLine(normalizedBase);
            builder.AppendLine();
        }

        builder.AppendLine("以下是系统已保存的长期记忆。回答时应优先结合这些记忆，但不要主动暴露记忆来源或内部字段。");
        foreach (var record in memoryRecords)
        {
            builder.AppendLine();
            builder.AppendLine($"[记忆:{record.RecordType ?? "memory"} 重要度:{record.Importance ?? 0} 相似度:{record.Score:0.###}]");
            if (!string.IsNullOrWhiteSpace(record.Title))
            {
                builder.AppendLine(record.Title.Trim());
            }

            builder.AppendLine(record.Content!.Trim());
        }

        return builder.ToString().Trim();
    }

    private static LlmChatMessageDto[] BuildKnowledgeFallbackMessages(AgentRoleRuntimeTestKnowledgeDto? knowledge)
    {
        var fallbackText = NormalizeOptionalText(knowledge is { HasBindings: true, HasHits: false }
            ? knowledge.FallbackReplyText
            : null);
        if (fallbackText == null)
        {
            return [];
        }

        return
        [
            new LlmChatMessageDto
            {
                Role = "system",
                Content = $"本轮已绑定知识库但没有检索命中。如果用户是在询问知识、事实、文档内容，请围绕以下兜底口径自然回复：{fallbackText}。如果用户是在发出指令、设置提醒、创建待办等操作性请求，请正常回应，不要使用兜底话术。"
            }
        ];
    }

    private static AgentRoleRuntimeTestStageDto Success(Stopwatch stopwatch, StageExecutionTraceDto? trace)
    {
        stopwatch.Stop();
        return new AgentRoleRuntimeTestStageDto
        {
            Status = "success",
            DurationMs = stopwatch.ElapsedMilliseconds,
            Trace = trace
        };
    }

    private static AgentRoleRuntimeTestStageDto Failed(Stopwatch stopwatch, Exception exception)
    {
        stopwatch.Stop();
        return new AgentRoleRuntimeTestStageDto
        {
            Status = "failed",
            DurationMs = stopwatch.ElapsedMilliseconds,
            ErrorMessage = exception.Message,
            Trace = exception.Data[ConversationRuntimeObservationCodes.ExceptionDataKeys.StageTrace] as StageExecutionTraceDto
        };
    }

    private static void AddTrace(AgentRoleRuntimeTestResultDto result, StageExecutionTraceDto? trace)
    {
        if (trace != null)
        {
            result.StageTraces.Add(trace);
        }
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
