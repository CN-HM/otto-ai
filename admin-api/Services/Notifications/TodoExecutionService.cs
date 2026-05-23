using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.McpTools;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Notifications;

public class TodoExecutionService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly AgentRoleRuntimeResolver _agentRoleRuntimeResolver;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly McpToolExecutionService _mcpToolExecutionService;
    private readonly ILogger<TodoExecutionService> _logger;

    public TodoExecutionService(
        AiAdminDbContext db,
        AgentRoleRuntimeResolver agentRoleRuntimeResolver,
        IConversationStageExecutionService conversationStageExecutionService,
        McpToolExecutionService mcpToolExecutionService,
        ILogger<TodoExecutionService> logger)
    {
        _db = db;
        _agentRoleRuntimeResolver = agentRoleRuntimeResolver;
        _conversationStageExecutionService = conversationStageExecutionService;
        _mcpToolExecutionService = mcpToolExecutionService;
        _logger = logger;
    }

    public async Task ExecuteAsync(AiRuntimeSignal signal, CancellationToken cancellationToken = default)
    {
        signal.Status = "processing";
        signal.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);

        try
        {
            var agentRole = await ResolveAgentRoleAsync(signal, cancellationToken);
            var user = await _db.SysUsers.AsNoTracking().FirstOrDefaultAsync(x => x.Id == signal.UserId, cancellationToken);

            var notificationTools = agentRole.PluginMappings
                .Where(m => !string.IsNullOrWhiteSpace(m.PluginId))
                .Select(m => McpSystemTools.TryParse(m.PluginId, out var kind) ? (McpSystemToolKind?)kind : null)
                .Where(kind => kind.HasValue && McpSystemTools.IsNotificationTool(kind.Value))
                .Select(kind => kind!.Value)
                .Distinct()
                .ToList();

            if (notificationTools.Count == 0)
            {
                signal.Status = "failed";
                signal.ErrorMessage = "Agent 角色未配置通知类 MCP 工具（send-sms / send-email）";
                signal.UpdatedAt = DateTime.UtcNow;
                await _db.SaveChangesAsync(cancellationToken);
                return;
            }

            var systemPrompt = BuildSystemPrompt(agentRole, notificationTools, user, signal);
            var userMessage = BuildUserMessage(signal);

            var orchestration = new ConversationOrchestrationRequestDto
            {
                AgentRoleId = agentRole.Id,
                AgentRoleCode = agentRole.Code,
                AgentRoleReleaseId = agentRole.CurrentReleaseId,
                SessionId = signal.SessionId ?? signal.Id,
                DeviceId = signal.DeviceId,
                LlmProfileId = agentRole.LlmProfileId,
                RequestedInvocationMode = "non_streaming",
                PreferStreaming = false
            };

            var llmRequest = new LlmChatRequestDto
            {
                SystemPrompt = systemPrompt,
                Temperature = 0.3,
                MaxTokens = 800,
                Stream = false,
                Messages =
                [
                    new LlmChatMessageDto { Role = "user", Content = userMessage }
                ]
            };

            var response = await _conversationStageExecutionService.ChatAsync(orchestration, llmRequest, cancellationToken);
            var llmText = response.Text?.Trim() ?? string.Empty;

            var toolCall = ParseToolCall(llmText);
            if (toolCall == null)
            {
                signal.Status = "failed";
                signal.ErrorMessage = $"LLM 未返回有效的工具调用指令。原始响应：{llmText[..Math.Min(llmText.Length, 200)]}";
                signal.UpdatedAt = DateTime.UtcNow;
                await _db.SaveChangesAsync(cancellationToken);
                return;
            }

            if (!McpSystemTools.TryParse(toolCall.Value.Tool, out var toolKind) || !notificationTools.Contains(toolKind))
            {
                signal.Status = "failed";
                signal.ErrorMessage = $"LLM 返回了未配置或不支持的 MCP 工具：{toolCall.Value.Tool}";
                signal.UpdatedAt = DateTime.UtcNow;
                await _db.SaveChangesAsync(cancellationToken);
                return;
            }

            var result = await _mcpToolExecutionService.ExecuteAsync(toolKind, toolCall.Value.Args, cancellationToken);

            signal.Status = "completed";
            signal.ProcessedAt = DateTime.UtcNow;
            signal.ErrorMessage = null;
            signal.UpdatedAt = DateTime.UtcNow;
            _logger.LogInformation("Todo {TodoId} executed successfully: {Result}", signal.Id, result);
        }
        catch (Exception ex)
        {
            signal.Status = "failed";
            signal.RetryCount++;
            signal.ErrorMessage = ex.Message;
            signal.ScheduledAt = DateTime.UtcNow.AddMinutes(5);
            signal.UpdatedAt = DateTime.UtcNow;
            _logger.LogWarning(ex, "Todo {TodoId} execution failed, retry {Retry}", signal.Id, signal.RetryCount);
        }

        await _db.SaveChangesAsync(cancellationToken);
    }

    private async Task<AgentRoleRuntimeDescriptorDto> ResolveAgentRoleAsync(AiRuntimeSignal signal, CancellationToken cancellationToken)
    {
        if (!string.IsNullOrWhiteSpace(signal.AgentRoleId))
        {
            return await _agentRoleRuntimeResolver.ResolveAsync(signal.AgentRoleId, null, null, cancellationToken);
        }

        var device = await _db.AiDevices.AsNoTracking().FirstOrDefaultAsync(x => x.Id == signal.DeviceId, cancellationToken);
        if (device != null && !string.IsNullOrWhiteSpace(device.AgentRoleId))
        {
            return await _agentRoleRuntimeResolver.ResolveAsync(device.AgentRoleId, null, device.AgentRoleReleaseId, cancellationToken);
        }

        throw new InvalidOperationException("待办未关联 Agent 角色，无法执行通知");
    }

    private static string BuildSystemPrompt(AgentRoleRuntimeDescriptorDto agentRole, IReadOnlyCollection<McpSystemToolKind> tools, SysUser? user, AiRuntimeSignal signal)
    {
        var roleName = agentRole.DisplayName ?? agentRole.Name ?? "智能助手";
        var roleDesc = agentRole.Description ?? "";
        var systemPrompt = agentRole.SystemPrompt ?? "";

        var userInfo = new List<string>();
        if (!string.IsNullOrWhiteSpace(user?.Mobile)) userInfo.Add($"手机号：{user!.Mobile}");
        if (!string.IsNullOrWhiteSpace(user?.Email)) userInfo.Add($"邮箱：{user!.Email}");

        var sb = new StringBuilder();
        sb.AppendLine($"你是「{roleName}」的通知执行助手。{roleDesc}");
        sb.AppendLine();
        sb.AppendLine("你的角色设定：");
        sb.AppendLine(systemPrompt);
        sb.AppendLine();
        sb.AppendLine("当前需要执行一条待办通知。你可以使用以下工具：");
        sb.AppendLine();
        if (tools.Contains(McpSystemToolKind.SendSms))
            sb.AppendLine("- send-sms(phone, content)：发送短信通知，phone 为手机号，content 为短信内容");
        if (tools.Contains(McpSystemToolKind.SendEmail))
            sb.AppendLine("- send-email(to, subject, body)：发送邮件通知，to 为收件人邮箱，subject 为邮件主题，body 为 HTML 邮件正文");
        sb.AppendLine();
        sb.AppendLine("用户信息：");
        sb.AppendLine(string.Join("\n", userInfo));
        sb.AppendLine();
        sb.AppendLine("请根据待办内容和角色设定，选择合适的通知方式，生成通知文案，并以 JSON 格式返回工具调用指令。");
        sb.AppendLine();
        sb.AppendLine("返回格式（严格 JSON，不要包含其他文字）：");
        sb.AppendLine("{\"tool\": \"send-sms\", \"args\": {\"phone\": \"手机号\", \"content\": \"通知内容\"}}");
        sb.AppendLine("或");
        sb.AppendLine("{\"tool\": \"send-email\", \"args\": {\"to\": \"邮箱\", \"subject\": \"主题\", \"body\": \"HTML正文\"}}");
        sb.AppendLine();
        sb.AppendLine("注意：");
        sb.AppendLine($"1. 通知内容要体现「{roleName}」的角色风格");
        sb.AppendLine("2. 短信内容简洁（70字以内），邮件可以详细");
        sb.AppendLine("3. 如果用户没有对应联系方式，选择可用的渠道");
        sb.AppendLine("4. 只返回 JSON，不要输出 Markdown 代码块或其他文字");

        return sb.ToString();
    }

    private static string BuildUserMessage(AiRuntimeSignal signal)
    {
        var title = signal.SignalCode ?? "待办事项";
        var content = signal.SourceText ?? "";
        var scheduledAt = signal.ScheduledAt?.ToString("yyyy-MM-dd HH:mm") ?? "立即";

        return $"""
待办标题：{title}
待办内容：{content}
计划执行时间：{scheduledAt}

请执行这条待办的通知。
""";
    }

    private static (string Tool, JsonObject Args)? ParseToolCall(string llmText)
    {
        try
        {
            var json = llmText.Trim();
            if (json.StartsWith("```"))
            {
                var lines = json.Split('\n');
                json = string.Join('\n', lines[1..^1]).Trim();
            }

            var node = JsonNode.Parse(json);
            if (node is not JsonObject obj) return null;

            var tool = obj["tool"]?.ToString();
            var args = obj["args"]?.AsObject();
            if (string.IsNullOrWhiteSpace(tool) || args == null) return null;

            return (tool, args);
        }
        catch
        {
            return null;
        }
    }
}
