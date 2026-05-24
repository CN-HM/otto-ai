using System.Text;
using System.Text.Json.Nodes;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles;
using AiAdmin.Services.Memory;
using AiAdmin.Services.Memory.Dtos;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using AiAdmin.Services.Voice;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public sealed class DeviceConversationTurnRequest
{
    public string CredentialId { get; init; } = string.Empty;
    public string MacAddress { get; init; } = string.Empty;
    public string SessionId { get; init; } = string.Empty;
    public byte[] WaveAudio { get; init; } = [];
    public int SampleRate { get; init; } = 16000;
    public int Channels { get; init; } = 1;
    public List<StageExecutionTraceDto> StageTraces { get; init; } = [];
}

public sealed class DeviceConversationTranscriptRequest
{
    public string CredentialId { get; init; } = string.Empty;
    public string MacAddress { get; init; } = string.Empty;
    public string SessionId { get; init; } = string.Empty;
    public string Transcript { get; init; } = string.Empty;
    public List<StageExecutionTraceDto> StageTraces { get; init; } = [];
}

public sealed class DeviceConversationTurnResult
{
    public string Transcript { get; init; } = string.Empty;
    public string ReplyText { get; init; } = string.Empty;
    public byte[] TtsPcm16Le { get; init; } = [];
    public int SampleRate { get; init; } = 16000;
    public int Channels { get; init; } = 1;
    public List<StageExecutionTraceDto> StageTraces { get; init; } = [];
}

public sealed class DeviceConversationReplyAudioSegment
{
    public string Text { get; init; } = string.Empty;
    public byte[] TtsPcm16Le { get; init; } = [];
    public int SampleRate { get; init; } = 16000;
    public int Channels { get; init; } = 1;
}

public class DeviceConversationRuntimeService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly AgentRoleRuntimeResolver _agentRoleRuntimeResolver;
    private readonly IConversationOrchestrationService _conversationOrchestrationService;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly AgentRoleKnowledgeRetrievalService _agentRoleKnowledgeRetrievalService;
    private readonly MemoryLibraryService _memoryLibraryService;
    private readonly MemoryConversationSessionService _memoryConversationSessionService;
    private readonly ConversationToolLoop _toolLoop;
    private readonly ConversationRuntimeTraceAggregator _traceAggregator;
    private readonly ILogger<DeviceConversationRuntimeService> _logger;

    public DeviceConversationRuntimeService(
        AiAdminDbContext db,
        AgentRoleRuntimeResolver agentRoleRuntimeResolver,
        IConversationOrchestrationService conversationOrchestrationService,
        IConversationStageExecutionService conversationStageExecutionService,
        AgentRoleKnowledgeRetrievalService agentRoleKnowledgeRetrievalService,
        MemoryLibraryService memoryLibraryService,
        MemoryConversationSessionService memoryConversationSessionService,
        ConversationToolLoop toolLoop,
        ConversationRuntimeTraceAggregator traceAggregator,
        ILogger<DeviceConversationRuntimeService> logger)
    {
        _db = db;
        _agentRoleRuntimeResolver = agentRoleRuntimeResolver;
        _conversationOrchestrationService = conversationOrchestrationService;
        _conversationStageExecutionService = conversationStageExecutionService;
        _agentRoleKnowledgeRetrievalService = agentRoleKnowledgeRetrievalService;
        _memoryLibraryService = memoryLibraryService;
        _memoryConversationSessionService = memoryConversationSessionService;
        _toolLoop = toolLoop;
        _traceAggregator = traceAggregator;
        _logger = logger;
    }

    public async Task<DeviceConversationTurnResult?> ExecuteTurnAsync(DeviceConversationTurnRequest request, CancellationToken cancellationToken = default)
    {
        return await ExecuteTurnStreamingAsync(request, null, cancellationToken);
    }

    public async Task<IAsrRecognitionSession> CreateRecognitionSessionAsync(
        DeviceConversationTranscriptRequest request,
        Func<AsrRecognitionStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default)
    {
        var device = await ResolveDeviceAsync(request.CredentialId, request.MacAddress, cancellationToken)
            ?? throw new InvalidOperationException("Error:DeviceCredentialInvalid");
        if (string.IsNullOrWhiteSpace(device.AgentRoleId))
            throw new InvalidOperationException("Error:DeviceAgentRoleNotBound");

        var agentRole = await _agentRoleRuntimeResolver.ResolveAsync(device.AgentRoleId,
            null,
            device.AgentRoleReleaseId,
            cancellationToken);

        var orchestrationRequest = CreateStreamingOrchestrationRequest(new ConversationOrchestrationRequestDto
        {
            AgentRoleId = NormalizeOptionalText(device.AgentRoleId),
            AgentRoleReleaseId = NormalizeOptionalText(device.AgentRoleReleaseId),
            SessionId = NormalizeOptionalText(request.SessionId),
            DeviceId = device.Id,
            RequestedInvocationMode = "streaming",
            PreferStreaming = true
        });

        return await _conversationStageExecutionService.CreateRecognitionSessionAsync(orchestrationRequest,
            new AsrRecognitionRequestDto
            {
                AudioFormat = "pcm",
                Language = NormalizeOptionalText(agentRole.LangCode)
            },
            onEvent,
            cancellationToken);
    }

    public async Task<DeviceConversationTurnResult?> ExecuteTurnStreamingAsync(DeviceConversationTurnRequest request, Func<DeviceConversationReplyAudioSegment, CancellationToken, Task>? onReplySegment, CancellationToken cancellationToken = default)
    {
        if (request.WaveAudio.Length == 0)
        {
            RecordTurn(request, null, [], false, ConversationRuntimeObservationCodes.TurnOutcomes.EmptyAudioInput, ConversationRuntimeObservationCodes.FailureReasons.InputEmpty);
            return null;
        }

        string? deviceId = null;
        var stageTraces = new List<StageExecutionTraceDto>();
        var stageTraceLock = new object();
        var failureReason = ConversationRuntimeObservationCodes.FailureReasons.DeviceNotFound;

        try
        {
            var device = await ResolveDeviceAsync(request, cancellationToken)
                ?? throw new InvalidOperationException("Error:DeviceCredentialInvalid");
            deviceId = device.Id;
            failureReason = ConversationRuntimeObservationCodes.FailureReasons.AgentUnbound;
            if (string.IsNullOrWhiteSpace(device.AgentRoleId))
                throw new InvalidOperationException("Error:DeviceAgentRoleNotBound");

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.AgentNotFound;
            var agentRole = await _agentRoleRuntimeResolver.ResolveAsync(device.AgentRoleId,
                null,
                device.AgentRoleReleaseId,
                cancellationToken);

            var effectiveLangCode = NormalizeOptionalText(agentRole.LangCode);
            var effectiveSystemPrompt = NormalizeOptionalText(agentRole.SystemPrompt);
            var effectiveTtsVoiceId = NormalizeOptionalText(agentRole.TtsVoiceId);

            var orchestrationRequest = new ConversationOrchestrationRequestDto
            {
                AgentRoleId = NormalizeOptionalText(device.AgentRoleId),
                AgentRoleReleaseId = NormalizeOptionalText(device.AgentRoleReleaseId),
                SessionId = NormalizeOptionalText(request.SessionId),
                DeviceId = device.Id,
                RequestedInvocationMode = "non_streaming",
                PreferStreaming = false
            };
            var streamingOrchestrationRequest = CreateStreamingOrchestrationRequest(orchestrationRequest);
            var plan = await _conversationOrchestrationService.BuildPlanAsync(orchestrationRequest, cancellationToken);

            var asrResponse = await _conversationStageExecutionService.RecognizeAsync(orchestrationRequest,
                new AsrRecognitionRequestDto
                {
                    AudioBase64 = Convert.ToBase64String(request.WaveAudio),
                    AudioFormat = "wav",
                    Language = effectiveLangCode
                },
                cancellationToken);
            AddStageTraceThreadSafe(stageTraceLock, stageTraces, asrResponse.StageTrace);
            var transcript = NormalizeOptionalText(asrResponse.Transcript);
            if (string.IsNullOrWhiteSpace(transcript))
            {
                RecordTurn(request, device.Id, stageTraces, false, ConversationRuntimeObservationCodes.TurnOutcomes.EmptyTranscript, ConversationRuntimeObservationCodes.FailureReasons.EmptyTranscript);
                return null;
            }

            var replyResult = await ExecuteReplyPipelineAsync(
                agentRole,
                device,
                orchestrationRequest,
                streamingOrchestrationRequest,
                transcript,
                effectiveSystemPrompt,
                effectiveTtsVoiceId,
                onReplySegment,
                stageTraces,
                stageTraceLock,
                cancellationToken);
            if (replyResult == null)
            {
                RecordTurn(request, device.Id, stageTraces, false, ConversationRuntimeObservationCodes.TurnOutcomes.EmptyReplyText, ConversationRuntimeObservationCodes.FailureReasons.EmptyReplyText);
                return null;
            }

            await AppendMemoryConversationTurnAsync(agentRole,
                device,
                orchestrationRequest,
                request.SessionId,
                transcript,
                replyResult.ReplyText);

            RecordTurn(request, device.Id, stageTraces, true, ConversationRuntimeObservationCodes.TurnOutcomes.Completed);

            return new DeviceConversationTurnResult
            {
                Transcript = transcript,
                ReplyText = replyResult.ReplyText,
                TtsPcm16Le = replyResult.TtsPcm16Le,
                SampleRate = replyResult.SampleRate,
                Channels = replyResult.Channels,
                StageTraces = stageTraces
            };
        }
        catch (Exception ex)
        {
            AddTraceFromException(stageTraces, ex);
            var resolvedFailureReason = ResolveTurnFailureReason(failureReason, stageTraces, ex, cancellationToken);
            RecordTurn(request,
                deviceId,
                stageTraces,
                false,
                ResolveTurnOutcome(resolvedFailureReason),
                resolvedFailureReason,
                ResolveTurnErrorCode(stageTraces, ex));
            throw;
        }
    }

    public async Task<DeviceConversationTurnResult?> ExecuteTranscriptStreamingAsync(
        DeviceConversationTranscriptRequest request,
        Func<DeviceConversationReplyAudioSegment, CancellationToken, Task>? onReplySegment,
        CancellationToken cancellationToken = default)
    {
        var transcript = NormalizeOptionalText(request.Transcript);
        if (string.IsNullOrWhiteSpace(transcript))
            return null;

        var stageTraces = request.StageTraces;
        var stageTraceLock = new object();

        var device = await ResolveDeviceAsync(request.CredentialId, request.MacAddress, cancellationToken)
            ?? throw new InvalidOperationException("Error:DeviceCredentialInvalid");
        if (string.IsNullOrWhiteSpace(device.AgentRoleId))
            throw new InvalidOperationException("Error:DeviceAgentRoleNotBound");

        var agentRole = await _agentRoleRuntimeResolver.ResolveAsync(device.AgentRoleId,
            null,
            device.AgentRoleReleaseId,
            cancellationToken);

        var orchestrationRequest = new ConversationOrchestrationRequestDto
        {
            AgentRoleId = NormalizeOptionalText(device.AgentRoleId),
            AgentRoleReleaseId = NormalizeOptionalText(device.AgentRoleReleaseId),
            SessionId = NormalizeOptionalText(request.SessionId),
            DeviceId = device.Id,
            RequestedInvocationMode = "non_streaming",
            PreferStreaming = false
        };
        var streamingOrchestrationRequest = CreateStreamingOrchestrationRequest(orchestrationRequest);
        var replyResult = await ExecuteReplyPipelineAsync(
            agentRole,
            device,
            orchestrationRequest,
            streamingOrchestrationRequest,
            transcript,
            NormalizeOptionalText(agentRole.SystemPrompt),
            NormalizeOptionalText(agentRole.TtsVoiceId),
            onReplySegment,
            stageTraces,
            stageTraceLock,
            cancellationToken);
        if (replyResult == null)
            return null;

        await AppendMemoryConversationTurnAsync(agentRole,
            device,
            orchestrationRequest,
            request.SessionId,
            transcript,
            replyResult.ReplyText);

        return new DeviceConversationTurnResult
        {
            Transcript = transcript,
            ReplyText = replyResult.ReplyText,
            TtsPcm16Le = replyResult.TtsPcm16Le,
            SampleRate = replyResult.SampleRate,
            Channels = replyResult.Channels,
            StageTraces = stageTraces
        };
    }

    private async Task<DeviceConversationTurnResult?> ExecuteReplyPipelineAsync(
        AgentRoles.Dtos.AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        ConversationOrchestrationRequestDto streamingOrchestrationRequest,
        string transcript,
        string? effectiveSystemPrompt,
        string? effectiveTtsVoiceId,
        Func<DeviceConversationReplyAudioSegment, CancellationToken, Task>? onReplySegment,
        List<StageExecutionTraceDto> stageTraces,
        object stageTraceLock,
        CancellationToken cancellationToken)
    {
        var memoryContext = await _memoryLibraryService.BuildRuntimeContextAsync(agentRole,
            device,
            query: transcript,
            sessionId: orchestrationRequest.SessionId,
            cancellationToken: cancellationToken);
        var ragResponse = await _agentRoleKnowledgeRetrievalService.RetrieveAsync(new AgentRoleKnowledgeRetrievalRequest
        {
            AgentRole = agentRole,
            Query = transcript,
            OrchestrationRequest = orchestrationRequest
        }, cancellationToken);
        AddStageTraceThreadSafe(stageTraceLock, stageTraces, ragResponse.StageTrace);

        var plan = await _conversationOrchestrationService.BuildPlanAsync(streamingOrchestrationRequest, cancellationToken);
        if (plan.Llm == null)
            throw new InvalidOperationException("当前 Pipeline 已禁用 LLM 节点，无法生成回复");
        var ttsEnabled = plan.Tts != null;
        var replyText = NormalizeOptionalText(ragResponse is { HasBindings: true, HasHits: false }
            ? ragResponse.FallbackReplyText
            : null);
        var audioSegments = new List<byte[]>();
        var outputSampleRate = 16000;
        var outputChannels = 1;
        var ttsVoice = await ResolveTtsVoiceAsync(effectiveTtsVoiceId, plan.Tts?.ProfileId, cancellationToken);

        if (string.IsNullOrWhiteSpace(replyText))
        {
            var toolDefinitions = await BuildActiveToolDefinitionsAsync(cancellationToken);
            var toolContext = new ConversationContext
            {
                AgentRoleId = agentRole.Id,
                DeviceId = device.Id,
                SessionId = orchestrationRequest.SessionId,
                UserId = device.UserId
            };

            var toolMessages = new List<LlmChatMessageDto>
            {
                new() { Role = "user", Content = transcript }
            };

            var effectiveSystemPromptResolved = NormalizeOptionalText(ragResponse.InjectedSystemPrompt) ?? effectiveSystemPrompt;
            var systemPrompt = BuildRuntimeSystemPrompt(effectiveSystemPromptResolved, memoryContext);

            var toolLoopResult = await _toolLoop.RunAsync(
                orchestrationRequest,
                systemPrompt,
                toolMessages,
                toolDefinitions,
                toolContext,
                cancellationToken);

            replyText = NormalizeOptionalText(toolLoopResult.FinalReply);
        }

        if (string.IsNullOrWhiteSpace(replyText))
            return null;

        if (ttsEnabled)
        {
            var ttsResponse = await _conversationStageExecutionService.SynthesizeAsync(streamingOrchestrationRequest,
                CreateTtsRequest(ttsVoice, replyText, "wav"),
                cancellationToken);
            AddStageTraceThreadSafe(stageTraceLock, stageTraces, ttsResponse.StageTrace);
            if (string.IsNullOrWhiteSpace(ttsResponse.AudioBase64))
                return null;

            var pcmSegment = DeviceAudioCodec.ExtractPcm16Le(Convert.FromBase64String(ttsResponse.AudioBase64),
                ttsResponse.Format,
                out outputSampleRate,
                out outputChannels);
            audioSegments.Add(pcmSegment);

            if (onReplySegment != null)
            {
                await onReplySegment(new DeviceConversationReplyAudioSegment
                {
                    Text = replyText,
                    TtsPcm16Le = pcmSegment,
                    SampleRate = outputSampleRate,
                    Channels = outputChannels
                }, cancellationToken);
            }
        }

        var pcm16Le = CombineAudioSegments(audioSegments);
        if (string.IsNullOrWhiteSpace(replyText))
            return null;

        return new DeviceConversationTurnResult
        {
            Transcript = transcript,
            ReplyText = replyText,
            TtsPcm16Le = pcm16Le,
            SampleRate = outputSampleRate,
            Channels = outputChannels,
            StageTraces = stageTraces
        };
    }

    private static void AddStageTraceThreadSafe(object syncRoot, List<StageExecutionTraceDto> traces, StageExecutionTraceDto? trace)
    {
        if (trace == null)
            return;

        lock (syncRoot)
        {
            traces.Add(trace);
        }
    }

    private async Task<List<McpToolDefinition>> BuildActiveToolDefinitionsAsync(CancellationToken cancellationToken)
    {
        var tools = await _db.AiMcpTools
            .AsNoTracking()
            .Where(x => x.Status == "active")
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Code)
            .ToListAsync(cancellationToken);

        return tools.Select(tool =>
        {
            JsonObject? schema = null;
            if (!string.IsNullOrWhiteSpace(tool.ParamSchema))
            {
                try { schema = JsonNode.Parse(tool.ParamSchema) as JsonObject; }
                catch { }
            }

            return new McpToolDefinition
            {
                Name = tool.Code,
                Description = tool.Description ?? tool.Name,
                InputSchema = schema
            };
        }).ToList();
    }

    private async Task AppendMemoryConversationTurnAsync(
        AgentRoles.Dtos.AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string? sessionId,
        string transcript,
        string replyText)
    {
        try
        {
            await _memoryConversationSessionService.AppendTurnAsync(agentRole,
                device,
                orchestrationRequest,
                sessionId,
                transcript,
                replyText);
        }
        catch (Exception ex)
        {
            _logger.LogWarning(ex, "Failed to append memory conversation turn for device {DeviceId}, session {SessionId}", device.Id, sessionId);
        }
    }

    private void RecordTurn(DeviceConversationTurnRequest request, string? deviceId, List<StageExecutionTraceDto> stageTraces, bool succeeded, string outcome, string? failureReason = null, string? errorCode = null)
    {
        _traceAggregator.RecordTurn(request.SessionId, deviceId, stageTraces, succeeded, outcome, failureReason, errorCode);
    }

    private static void AddTraceFromException(List<StageExecutionTraceDto> traces, Exception exception)
    {
        if (exception.Data[ConversationRuntimeObservationCodes.ExceptionDataKeys.StageTrace] is StageExecutionTraceDto trace && !traces.Contains(trace))
            traces.Add(trace);
    }

    private static string ResolveTurnFailureReason(string fallbackFailureReason, IReadOnlyList<StageExecutionTraceDto> traces, Exception exception, CancellationToken cancellationToken)
    {
        var traceFailureReason = traces.LastOrDefault(trace => !trace.Succeeded)?.FailureReason;
        if (!string.IsNullOrWhiteSpace(traceFailureReason))
            return traceFailureReason;
        if (exception is TimeoutException)
            return ConversationRuntimeObservationCodes.FailureReasons.Timeout;
        if (exception is TaskCanceledException && !cancellationToken.IsCancellationRequested)
            return ConversationRuntimeObservationCodes.FailureReasons.Timeout;
        if (exception is OperationCanceledException)
            return ConversationRuntimeObservationCodes.FailureReasons.Cancelled;
        return fallbackFailureReason;
    }

    private static string ResolveTurnOutcome(string failureReason)
    {
        return failureReason switch
        {
            ConversationRuntimeObservationCodes.FailureReasons.DeviceNotFound => ConversationRuntimeObservationCodes.TurnOutcomes.DeviceNotFound,
            ConversationRuntimeObservationCodes.FailureReasons.AgentUnbound => ConversationRuntimeObservationCodes.TurnOutcomes.AgentUnbound,
            ConversationRuntimeObservationCodes.FailureReasons.AgentNotFound => ConversationRuntimeObservationCodes.TurnOutcomes.AgentNotFound,
            ConversationRuntimeObservationCodes.FailureReasons.Cancelled => ConversationRuntimeObservationCodes.TurnOutcomes.TurnCancelled,
            ConversationRuntimeObservationCodes.FailureReasons.Timeout => ConversationRuntimeObservationCodes.TurnOutcomes.TurnTimedOut,
            _ => ConversationRuntimeObservationCodes.TurnOutcomes.StageExecutionFailed
        };
    }

    private static string ResolveTurnErrorCode(IReadOnlyList<StageExecutionTraceDto> traces, Exception exception)
    {
        var traceErrorCode = traces.LastOrDefault(trace => !trace.Succeeded)?.ErrorCode;
        return string.IsNullOrWhiteSpace(traceErrorCode) ? exception.GetType().Name : traceErrorCode;
    }

    private async Task<AiDevice?> ResolveDeviceAsync(DeviceConversationTurnRequest request, CancellationToken cancellationToken)
    {
        return await ResolveDeviceAsync(request.CredentialId, request.MacAddress, cancellationToken);
    }

    private async Task<AiDevice?> ResolveDeviceAsync(string? credentialId, string? macAddress, CancellationToken cancellationToken)
    {
        if (!string.IsNullOrWhiteSpace(credentialId))
        {
            var byCredential = await _db.AiDevices.AsNoTracking().FirstOrDefaultAsync(x => x.CredentialId == credentialId, cancellationToken);
            if (byCredential != null)
                return byCredential;
        }

        var normalizedMac = NormalizeOptionalText(DeviceCredentialService.NormalizeDeviceId(macAddress));
        if (string.IsNullOrWhiteSpace(normalizedMac))
            return null;
        return await _db.AiDevices.AsNoTracking().FirstOrDefaultAsync(x => x.MacAddress == normalizedMac, cancellationToken);
    }

    private static byte[] NormalizeTtsAudioChunk(byte[] audioBytes, string? format, out int sampleRate, out int channels)
    {
        sampleRate = 16000;
        channels = 1;
        var normalizedFormat = NormalizeOptionalText(format) ?? "pcm";
        if (string.Equals(normalizedFormat, "pcm", StringComparison.OrdinalIgnoreCase))
            return audioBytes;

        return DeviceAudioCodec.ExtractPcm16Le(audioBytes, normalizedFormat, out sampleRate, out channels);
    }

    private async Task<string?> ResolveTtsVoiceAsync(string? ttsVoiceId, string? ttsProfileId, CancellationToken cancellationToken)
    {
        var normalizedId = NormalizeOptionalText(ttsVoiceId);
        if (string.IsNullOrWhiteSpace(normalizedId))
            return null;

        var ttsVoice = await _db.AiTtsVoices.AsNoTracking().FirstOrDefaultAsync(x => x.Id == normalizedId, cancellationToken);
        if (ttsVoice != null)
        {
            if (!string.IsNullOrWhiteSpace(ttsProfileId)
                && !string.Equals(ttsVoice.TtsProfileId, ttsProfileId, StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException($"设备绑定的 TTS 音色不属于当前 TTS Profile。当前编排 ProfileId={ttsProfileId}，音色 ProfileId={ttsVoice.TtsProfileId ?? "-"}。请重新选择同一 TTS Profile 下的音色。");
            }

            if (!string.IsNullOrWhiteSpace(ttsProfileId))
            {
                var profile = await _db.AiTtsProfiles.AsNoTracking().FirstOrDefaultAsync(x => x.Id == ttsProfileId, cancellationToken);
                if (profile != null)
                    TtsVoiceResourceValidator.EnsureMatchesProfileResource(profile, ttsVoice, "TTS 合成");
            }

            return NormalizeOptionalText(ttsVoice.TtsVoice);
        }

        return null;
    }

    private static TtsSynthesisRequestDto CreateTtsRequest(string? voice, string? text = null, string responseFormat = "wav")
    {
        return new TtsSynthesisRequestDto
        {
            Text = text ?? string.Empty,
            Voice = voice,
            ResponseFormat = responseFormat
        };
    }

    private static ConversationOrchestrationRequestDto CreateStreamingOrchestrationRequest(ConversationOrchestrationRequestDto request)
    {
        return new ConversationOrchestrationRequestDto
        {
            AgentRoleId = request.AgentRoleId,
            AgentRoleCode = request.AgentRoleCode,
            AgentRoleReleaseId = request.AgentRoleReleaseId,
            SessionId = request.SessionId,
            DeviceId = request.DeviceId,
            VadProfileId = request.VadProfileId,
            AsrProfileId = request.AsrProfileId,
            LlmProfileId = request.LlmProfileId,
            TtsProfileId = request.TtsProfileId,
            RequestedInvocationMode = "streaming",
            PreferStreaming = true
        };
    }

    private static LlmChatMessageDto[] BuildKnowledgeFallbackMessages(AgentRoleKnowledgeRetrievalResult? ragResponse)
    {
        var fallbackText = NormalizeOptionalText(ragResponse is { HasBindings: true, HasHits: false }
            ? ragResponse.FallbackReplyText
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

    private static byte[] CombineAudioSegments(IReadOnlyList<byte[]> segments)
    {
        if (segments.Count == 0)
            return [];
        if (segments.Count == 1)
            return segments[0];

        var totalLength = 0;
        foreach (var segment in segments)
            totalLength += segment.Length;

        var buffer = new byte[totalLength];
        var offset = 0;
        foreach (var segment in segments)
        {
            Buffer.BlockCopy(segment, 0, buffer, offset, segment.Length);
            offset += segment.Length;
        }

        return buffer;
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

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
