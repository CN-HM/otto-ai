using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools.Dtos;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using MimeKit;
using MimeKit.Text;

namespace AiAdmin.Services.McpTools.Handlers;

public class SendEmailHandler : IMcpToolHandler
{
    private readonly IConfiguration _config;
    private readonly ILogger<SendEmailHandler> _logger;

    public SendEmailHandler(IConfiguration config, ILogger<SendEmailHandler> logger)
    {
        _config = config;
        _logger = logger;
    }

    public string ToolCode => McpSystemToolCodes.SendEmail;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var to = request.Arguments["to"]?.GetValue<string>();
        var subject = request.Arguments["subject"]?.GetValue<string>();
        var body = request.Arguments["body"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(to))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: to" };
        if (string.IsNullOrWhiteSpace(subject))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: subject" };
        if (string.IsNullOrWhiteSpace(body))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: body" };

        try
        {
            using var smtp = new SmtpClient();
            var smtpHost = _config["Email:Host"] ?? "smtp.example.com";
            var smtpPort = int.Parse(_config["Email:Port"] ?? "587");
            var smtpUser = _config["Email:Username"] ?? "";
            var smtpPass = _config["Email:Password"] ?? "";

            await smtp.ConnectAsync(smtpHost, smtpPort, SecureSocketOptions.StartTls, ct);
            await smtp.AuthenticateAsync(smtpUser, smtpPass, ct);

            var message = new MimeMessage();
            message.From.Add(MailboxAddress.Parse(_config["Email:From"] ?? "noreply@otto-ai.local"));
            message.To.Add(MailboxAddress.Parse(to));
            message.Subject = subject;
            message.Body = new TextPart(TextFormat.Plain) { Text = body };

            await smtp.SendAsync(message, ct);
            await smtp.DisconnectAsync(true, ct);

            return new McpToolCallResult { Success = true, Message = "Email sent successfully" };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to send email to {To}", to);
            return new McpToolCallResult { Success = false, Message = $"Email send failed: {ex.Message}" };
        }
    }
}
