using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Notifications;

public class EmailService : ITransientDependency
{
    private readonly IConfiguration _config;
    private readonly ILogger<EmailService> _logger;

    public EmailService(IConfiguration config, ILogger<EmailService> logger)
    {
        _config = config;
        _logger = logger;
    }

    public async Task<string> SendAsync(string to, string subject, string body, CancellationToken cancellationToken = default)
    {
        var host = _config["Email:Smtp:Host"] ?? throw new InvalidOperationException("SMTP host not configured");
        var port = int.Parse(_config["Email:Smtp:Port"] ?? "587");
        var username = _config["Email:Smtp:Username"] ?? throw new InvalidOperationException("SMTP username not configured");
        var password = _config["Email:Smtp:Password"] ?? throw new InvalidOperationException("SMTP password not configured");
        var from = _config["Email:Smtp:From"] ?? username;
        var fromName = _config["Email:Smtp:FromName"] ?? "AI Admin";

        using var client = new SmtpClient(host, port)
        {
            EnableSsl = true,
            Credentials = new NetworkCredential(username, password)
        };

        using var message = new MailMessage
        {
            From = new MailAddress(from, fromName),
            Subject = subject,
            Body = body,
            IsBodyHtml = true
        };
        message.To.Add(to);

        await client.SendMailAsync(message, cancellationToken);
        _logger.LogInformation("Email sent to {To}, subject: {Subject}", to, subject);
        return $"Email sent successfully to {to}";
    }
}
