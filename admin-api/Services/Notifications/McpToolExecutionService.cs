using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Auth;
using AiAdmin.Services.McpTools;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Notifications;

public class McpToolExecutionService : ITransientDependency
{
    private readonly SmsService _smsService;
    private readonly EmailService _emailService;
    private readonly ILogger<McpToolExecutionService> _logger;

    public McpToolExecutionService(SmsService smsService, EmailService emailService, ILogger<McpToolExecutionService> logger)
    {
        _smsService = smsService;
        _emailService = emailService;
        _logger = logger;
    }

    public async Task<string> ExecuteAsync(string toolName, JsonObject arguments, CancellationToken cancellationToken = default)
    {
        if (!McpSystemTools.TryParse(toolName, out var toolKind))
        {
            throw new InvalidOperationException($"Unknown MCP tool: {toolName}");
        }

        return await ExecuteAsync(toolKind, arguments, cancellationToken);
    }

    public async Task<string> ExecuteAsync(McpSystemToolKind toolKind, JsonObject arguments, CancellationToken cancellationToken = default)
    {
        _logger.LogInformation("Executing MCP tool {ToolName} with args {Args}", McpSystemTools.GetCode(toolKind), arguments.ToJsonString());

        return toolKind switch
        {
            McpSystemToolKind.SendSms => await ExecuteSendSmsAsync(arguments, cancellationToken),
            McpSystemToolKind.SendEmail => await ExecuteSendEmailAsync(arguments, cancellationToken),
            _ => throw new InvalidOperationException($"Unknown MCP tool: {toolKind}")
        };
    }

    private async Task<string> ExecuteSendSmsAsync(JsonObject args, CancellationToken cancellationToken)
    {
        var phone = GetRequiredString(args, "phone");
        var content = GetRequiredString(args, "content");
        return await _smsService.SendNotificationAsync(phone, content, cancellationToken);
    }

    private async Task<string> ExecuteSendEmailAsync(JsonObject args, CancellationToken cancellationToken)
    {
        var to = GetRequiredString(args, "to");
        var subject = GetRequiredString(args, "subject");
        var body = GetRequiredString(args, "body");
        return await _emailService.SendAsync(to, subject, body, cancellationToken);
    }

    private static string GetRequiredString(JsonObject args, string key)
    {
        if (!args.TryGetPropertyValue(key, out var node) || node == null)
            throw new InvalidOperationException($"Missing required argument: {key}");
        return node.ToString();
    }
}
