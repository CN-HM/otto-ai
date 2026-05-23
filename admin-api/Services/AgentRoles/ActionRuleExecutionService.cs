using System.Text;
using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.AgentRoles;

public class ActionRuleExecutionService : ITransientDependency
{
    private static readonly JsonSerializerOptions JsonOptions = new() { PropertyNameCaseInsensitive = true };
    private const double DefaultConfidenceThreshold = 0.7;
    private const int DefaultImportanceThreshold = 3;

    private readonly AiAdminDbContext _db;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly IGuidGenerator _guidGenerator;

    public ActionRuleExecutionService(
        AiAdminDbContext db,
        IConversationStageExecutionService conversationStageExecutionService,
        IGuidGenerator guidGenerator)
    {
        _db = db;
        _conversationStageExecutionService = conversationStageExecutionService;
        _guidGenerator = guidGenerator;
    }

    public async Task<List<ActionRuleExecutionResult>> ExecuteSyncAsync(
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string? sessionId,
        string userText,
        string assistantText,
        CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(agentRole.Id) || string.IsNullOrWhiteSpace(userText))
            return [];

        var rules = await _db.AiActionRules.AsNoTracking()
            .Where(x => x.AgentRoleId == agentRole.Id && x.IsEnabled)
            .OrderBy(x => x.CreatedAt)
            .ToListAsync(cancellationToken);

        if (rules.Count == 0)
            return [];

        var results = new List<ActionRuleExecutionResult>();
        var llmProfileId = agentRole.LlmProfileId;
        if (string.IsNullOrWhiteSpace(llmProfileId))
            return [];

        foreach (var rule in rules)
        {
            try
            {
                var candidates = await ExtractCandidatesAsync(
                    orchestrationRequest, llmProfileId, rule, userText, assistantText, cancellationToken);

                foreach (var candidate in candidates)
                {
                    var signal = await SaveRuntimeSignalAsync(
                        agentRole, device, sessionId, rule, candidate, cancellationToken);
                    results.Add(new ActionRuleExecutionResult
                    {
                        SignalId = signal.SignalId,
                        ActionType = rule.ActionType,
                        SourceText = candidate.Content ?? string.Empty,
                        Created = signal.Created
                    });
                }
            }
            catch
            {
                // Silently skip failed rule extractions
            }
        }

        return results;
    }

    private async Task<List<ExtractedActionCandidate>> ExtractCandidatesAsync(
        ConversationOrchestrationRequestDto orchestrationRequest,
        string llmProfileId,
        AiActionRule rule,
        string userText,
        string assistantText,
        CancellationToken cancellationToken)
    {
        var request = new LlmChatRequestDto
        {
            SystemPrompt = BuildExtractionSystemPrompt(rule),
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

        var actionOrchestration = new ConversationOrchestrationRequestDto
        {
            AgentRoleId = orchestrationRequest.AgentRoleId,
            AgentRoleCode = orchestrationRequest.AgentRoleCode,
            AgentRoleReleaseId = orchestrationRequest.AgentRoleReleaseId,
            SessionId = orchestrationRequest.SessionId,
            DeviceId = orchestrationRequest.DeviceId,
            LlmProfileId = llmProfileId,
            RequestedInvocationMode = "non_streaming",
            PreferStreaming = false
        };

        var response = await _conversationStageExecutionService.ChatAsync(actionOrchestration, request, cancellationToken);
        return ParseCandidates(response.Text);
    }

    private async Task<(string SignalId, bool Created)> SaveRuntimeSignalAsync(
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        string? sessionId,
        AiActionRule rule,
        ExtractedActionCandidate candidate,
        CancellationToken cancellationToken)
    {
        var now = DateTime.UtcNow;
        var sourceText = NormalizeOptionalText(candidate.Content);
        var dedupeKey = ComputeHash($"{rule.ActionType}|{rule.Id}|{device.Id}|{sessionId}|{sourceText}".ToLowerInvariant());

        var existing = await _db.AiRuntimeSignals.FirstOrDefaultAsync(
            x => x.DedupeKey == dedupeKey && x.Status != "completed" && x.Status != "ignored",
            cancellationToken);

        if (existing != null)
        {
            existing.UpdatedAt = now;
            await _db.SaveChangesAsync(cancellationToken);
            return (existing.Id, false);
        }

        var scheduledAt = rule.ActionType == "health_followup" ? now.AddHours(2) : now;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N"),
            SignalType = rule.ActionType,
            SignalCode = rule.Name,
            Severity = ResolveSeverity(rule.ActionType, candidate.Importance),
            Status = scheduledAt <= now ? "pending" : "scheduled",
            UserId = device.UserId,
            DeviceId = NormalizeOptionalText(device.Id),
            AgentRoleId = NormalizeOptionalText(agentRole.Id),
            SessionId = NormalizeOptionalText(sessionId),
            SourceText = sourceText,
            PayloadJson = candidate.PayloadJson,
            ScheduledAt = scheduledAt,
            DedupeKey = dedupeKey,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(cancellationToken);
        return (signal.Id, true);
    }

    private static string BuildExtractionSystemPrompt(AiActionRule rule)
    {
        var builder = new StringBuilder();
        builder.AppendLine("你是对话信息抽取器。你只能执行当前这一条规则。只输出 JSON，不要输出 Markdown、解释、代码块或多余文本。");
        builder.AppendLine("不适用或没有值得记录/处理的信息时输出 {\"memories\":[]}。");
        builder.AppendLine("输出格式：{\"memories\":[{\"title\":\"短标题\",\"content\":\"可独立理解的内容\",\"summary\":\"摘要\",\"keywords\":[\"关键词\"],\"payload\":{},\"importance\":1-10,\"confidence\":0-1,\"evidence\":\"来自对话的依据\"}]}。");
        builder.AppendLine("不要保存一次性的闲聊、助手自身表述、无明确长期价值的信息、密码、验证码、访问令牌、银行卡号等敏感凭据。");
        builder.AppendLine($"动作类型：{rule.ActionType}");
        builder.AppendLine($"规则名称：{rule.Name}");
        builder.AppendLine($"规则说明：{NormalizeOptionalText(rule.Instruction) ?? "按规则名称判断"}");

        switch (rule.ActionType)
        {
            case "todo":
                builder.AppendLine("待办事项只输出用户明确交代需要后续执行的任务；必须有清晰任务内容和责任对象，不要把普通聊天当成待办。payload 中尽量包含 task、assignee、dueHint。");
                break;
            case "reminder":
                builder.AppendLine("提醒事项只输出明确要求未来触达的提醒；必须包含提醒内容，并尽量提取时间线索。payload 中尽量包含 reminderText、timeHint、context。");
                break;
            case "risk":
                builder.AppendLine("风险线索只输出安全、情绪、照护、诈骗、异常行为等需要后续处理的信号；不要输出普通闲聊，也不要直接生成通知文案。payload 中尽量包含 riskCategory、riskLevel、evidence、suggestedAction。");
                break;
            case "health_followup":
                builder.AppendLine("健康线索只输出需要后续关怀或回访的信息，如不适症状、用药、睡眠、饮食、复诊；payload 中尽量包含 symptom、followupReason、suggestedDelayHours。");
                break;
        }

        return builder.ToString();
    }

    private static List<ExtractedActionCandidate> ParseCandidates(string? text)
    {
        var json = ExtractJson(text);
        if (string.IsNullOrWhiteSpace(json))
            return [];

        try
        {
            using var document = JsonDocument.Parse(json);
            var root = document.RootElement;

            if (!root.TryGetProperty("memories", out var memories) || memories.ValueKind != JsonValueKind.Array)
                return [];

            var candidates = new List<ExtractedActionCandidate>();
            foreach (var item in memories.EnumerateArray())
            {
                if (item.ValueKind != JsonValueKind.Object)
                    continue;

                var content = GetString(item, "content");
                if (string.IsNullOrWhiteSpace(content))
                    continue;

                var confidence = GetDouble(item, "confidence") ?? 1;
                if (confidence < DefaultConfidenceThreshold)
                    continue;

                var importance = GetInt(item, "importance") ?? DefaultImportanceThreshold;
                if (importance < DefaultImportanceThreshold)
                    continue;

                candidates.Add(new ExtractedActionCandidate
                {
                    Content = content,
                    Importance = importance,
                    Confidence = confidence,
                    PayloadJson = GetRawJson(item, "payload")
                });
            }

            return candidates;
        }
        catch
        {
            return [];
        }
    }

    private static string? ExtractJson(string? text)
    {
        var normalized = NormalizeOptionalText(text);
        if (string.IsNullOrWhiteSpace(normalized))
            return null;

        if (normalized.StartsWith("```", StringComparison.Ordinal))
        {
            var firstLineEnd = normalized.IndexOf('\n');
            var lastFence = normalized.LastIndexOf("```", StringComparison.Ordinal);
            if (firstLineEnd >= 0 && lastFence > firstLineEnd)
                normalized = normalized[(firstLineEnd + 1)..lastFence].Trim();
        }

        var objectStart = normalized.IndexOf('{');
        var arrayStart = normalized.IndexOf('[');
        var startCandidates = new[] { objectStart, arrayStart }.Where(x => x >= 0).ToList();
        if (startCandidates.Count == 0)
            return normalized;

        var start = startCandidates.Min();
        var end = normalized.LastIndexOf(normalized[start] == '{' ? '}' : ']');
        return end > start ? normalized[start..(end + 1)] : normalized[start..];
    }

    private static string BuildConversationInput(string userText, string assistantText)
    {
        if (string.IsNullOrWhiteSpace(assistantText))
            return userText.Trim();
        return $"用户：{userText.Trim()}\n助手：{assistantText.Trim()}";
    }

    private static string ResolveSeverity(string actionType, int? importance)
    {
        var normalizedImportance = Math.Clamp(importance ?? 1, 1, 10);
        if (actionType == "risk" && normalizedImportance >= 8)
            return "critical";
        if (normalizedImportance >= 7)
            return "high";
        if (normalizedImportance >= 4)
            return "medium";
        return "low";
    }

    private static string? GetString(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
            return null;
        return value.ValueKind == JsonValueKind.String ? NormalizeOptionalText(value.GetString()) : value.ToString();
    }

    private static int? GetInt(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
            return null;
        if (value.ValueKind == JsonValueKind.Number && value.TryGetInt32(out var number))
            return number;
        if (value.ValueKind == JsonValueKind.String && int.TryParse(value.GetString(), out number))
            return number;
        return null;
    }

    private static double? GetDouble(JsonElement item, string propertyName)
    {
        if (!item.TryGetProperty(propertyName, out var value))
            return null;
        if (value.ValueKind == JsonValueKind.Number && value.TryGetDouble(out var number))
            return number;
        return value.ValueKind == JsonValueKind.String && double.TryParse(value.GetString(), out number) ? number : null;
    }

    private static string? GetRawJson(JsonElement item, string propertyName)
    {
        return item.TryGetProperty(propertyName, out var value) && value.ValueKind != JsonValueKind.Null ? value.GetRawText() : null;
    }

    private static string ComputeHash(string input)
    {
        var bytes = System.Security.Cryptography.SHA256.HashData(Encoding.UTF8.GetBytes(input));
        return Convert.ToHexString(bytes)[..16];
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private sealed class ExtractedActionCandidate
    {
        public string? Content { get; set; }
        public int? Importance { get; set; }
        public double? Confidence { get; set; }
        public string? PayloadJson { get; set; }
    }
}

public class ActionRuleExecutionResult
{
    public string SignalId { get; set; } = string.Empty;
    public string ActionType { get; set; } = string.Empty;
    public string SourceText { get; set; } = string.Empty;
    public bool Created { get; set; }
}
