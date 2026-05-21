using System.Diagnostics;
using System.Text;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public sealed class AgentRoleKnowledgeRetrievalRequest
{
    public AgentRoleRuntimeDescriptorDto AgentRole { get; init; } = new();
    public string Query { get; init; } = string.Empty;
    public ConversationOrchestrationRequestDto OrchestrationRequest { get; init; } = new();
}

public sealed class AgentRoleKnowledgeRetrievalResult
{
    public bool HasBindings { get; init; }
    public bool HasHits { get; init; }
    public IReadOnlyList<KnowledgeRetrievalHit> Hits { get; init; } = [];
    public string? InjectedSystemPrompt { get; init; }
    public string? FallbackReplyText { get; init; }
    public StageExecutionTraceDto StageTrace { get; init; } = new();
}

public class AgentRoleKnowledgeRetrievalService : ITransientDependency
{
    private readonly IKnowledgeRetrievalProvider _knowledgeRetrievalProvider;

    public AgentRoleKnowledgeRetrievalService(IKnowledgeRetrievalProvider knowledgeRetrievalProvider)
    {
        _knowledgeRetrievalProvider = knowledgeRetrievalProvider;
    }

    public async Task<AgentRoleKnowledgeRetrievalResult> RetrieveAsync(AgentRoleKnowledgeRetrievalRequest request, CancellationToken cancellationToken = default)
    {
        var stopwatch = Stopwatch.StartNew();
        var trace = CreateTrace(request.OrchestrationRequest, request.AgentRole);
        var bindings = request.AgentRole.KnowledgeBindings
            .Where(x => x.Enabled != false && !string.IsNullOrWhiteSpace(x.DatasetId))
            .OrderBy(x => x.Sort ?? 0)
            .ThenBy(x => x.Id ?? 0)
            .ToList();

        if (bindings.Count == 0)
        {
            CompleteTrace(trace, stopwatch.ElapsedMilliseconds, true);
            return new AgentRoleKnowledgeRetrievalResult
            {
                HasBindings = false,
                HasHits = false,
                InjectedSystemPrompt = request.AgentRole.SystemPrompt,
                StageTrace = trace
            };
        }

        var retrievalResult = await _knowledgeRetrievalProvider.RetrieveAsync(new KnowledgeRetrievalProviderRequest
        {
            Query = request.Query,
            Bindings = bindings,
            CancellationToken = cancellationToken
        });
        var hits = retrievalResult.Hits
            .Where(x => !string.IsNullOrWhiteSpace(x.Content))
            .Take(bindings.Max(x => x.MaxChunks ?? 5))
            .ToList();

        CompleteTrace(trace, stopwatch.ElapsedMilliseconds, true);
        if (hits.Count == 0)
        {
            return new AgentRoleKnowledgeRetrievalResult
            {
                HasBindings = true,
                HasHits = false,
                InjectedSystemPrompt = request.AgentRole.SystemPrompt,
                FallbackReplyText = NormalizeOptionalText(request.AgentRole.KnowledgeNoHitFallbackText),
                StageTrace = trace
            };
        }

        var injectedPrompt = BuildInjectedPrompt(request.AgentRole.SystemPrompt, hits);
        return new AgentRoleKnowledgeRetrievalResult
        {
            HasBindings = true,
            HasHits = true,
            Hits = hits,
            InjectedSystemPrompt = injectedPrompt,
            StageTrace = trace
        };
    }

    private static StageExecutionTraceDto CreateTrace(ConversationOrchestrationRequestDto request, AgentRoleRuntimeDescriptorDto agentRole)
    {
        return new StageExecutionTraceDto
        {
            SessionId = request.SessionId,
            DeviceId = request.DeviceId,
            AgentRoleId = agentRole.Id,
            AgentRoleCode = agentRole.Code,
            AgentRoleVersion = agentRole.CurrentVersion,
            AgentRoleReleaseId = agentRole.CurrentReleaseId,
            AgentRoleConfigSource = agentRole.RuntimeConfigSource,
            Stage = ConversationRuntimeObservationCodes.Stages.Rag,
            RequestedInvocationMode = request.RequestedInvocationMode ?? "non_streaming",
            PlannedInvocationMode = "non_streaming",
            ActualInvocationMode = "non_streaming",
            FallbackMode = agentRole.FallbackMode
        };
    }

    private static void CompleteTrace(StageExecutionTraceDto trace, long durationMs, bool succeeded)
    {
        trace.DurationMs = durationMs;
        trace.Succeeded = succeeded;
    }

    private static string BuildInjectedPrompt(string? systemPrompt, IReadOnlyList<KnowledgeRetrievalHit> hits)
    {
        var builder = new StringBuilder();
        var normalizedSystemPrompt = NormalizeOptionalText(systemPrompt);
        if (!string.IsNullOrWhiteSpace(normalizedSystemPrompt))
            builder.AppendLine(normalizedSystemPrompt);
        builder.AppendLine();
        builder.AppendLine("以下是知识库检索命中的上下文。回答时必须优先依据这些内容；如果内容不足以回答，请明确说明无法从已绑定知识库确认。");
        foreach (var hit in hits)
        {
            builder.AppendLine();
            builder.AppendLine($"[知识库:{hit.DatasetId} 文档:{hit.DocumentName ?? hit.DocumentId ?? "-"} 相似度:{hit.Score:0.###}]");
            builder.AppendLine(hit.Content.Trim());
        }
        return builder.ToString().Trim();
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
