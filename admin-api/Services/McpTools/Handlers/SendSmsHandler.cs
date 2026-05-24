using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.Auth;
using AiAdmin.Services.McpTools.Dtos;

namespace AiAdmin.Services.McpTools.Handlers;

public class SendSmsHandler : IMcpToolHandler
{
    private readonly SmsService _smsService;

    public SendSmsHandler(SmsService smsService) => _smsService = smsService;

    public string ToolCode => McpSystemToolCodes.SendSms;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var phone = request.Arguments["phone"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(phone))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: phone" };
        if (string.IsNullOrWhiteSpace(content))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: content" };

        try
        {
            var result = await _smsService.SendNotificationAsync(phone, content, ct);
            return new McpToolCallResult { Success = true, Message = result };
        }
        catch (Exception ex)
        {
            return new McpToolCallResult { Success = false, Message = $"SMS send failed: {ex.Message}" };
        }
    }
}
