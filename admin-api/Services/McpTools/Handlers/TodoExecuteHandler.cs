using System;
using System.Linq;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoExecuteHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly McpToolDispatcher _dispatcher;

    public TodoExecuteHandler(AiAdminDbContext db, McpToolDispatcher dispatcher)
    {
        _db = db;
        _dispatcher = dispatcher;
    }

    public string ToolCode => McpSystemToolCodes.TodoExecute;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var signalId = request.Arguments["signal_id"]?.GetValue<string>();
        var channel = request.Arguments["notification_channel"]?.GetValue<string>();
        var message = request.Arguments["notification_message"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(signalId))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: signal_id" };
        if (string.IsNullOrWhiteSpace(channel))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: notification_channel (sms|email)" };

        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(s => s.Id == signalId, ct);
        if (signal == null)
            return new McpToolCallResult { Success = false, Message = $"Signal not found: {signalId}" };

        var finishStatuses = new[] { "completed", "ignored" };
        if (finishStatuses.Contains(signal.Status))
            return new McpToolCallResult { Success = false, Message = $"Signal already finished: {signal.Status}" };

        signal.Status = "processing";
        signal.ProcessedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(ct);

        var notifyArgs = new JsonObject();
        string toolCode;

        if (channel == "sms")
        {
            toolCode = McpSystemToolCodes.SendSms;
            notifyArgs["phone"] = signal.PayloadJson != null
                ? JsonNode.Parse(signal.PayloadJson)?["phone"]?.GetValue<string>() ?? ""
                : "";
            notifyArgs["content"] = message ?? signal.SourceText ?? "Reminder";
        }
        else if (channel == "email")
        {
            toolCode = McpSystemToolCodes.SendEmail;
            notifyArgs["to"] = signal.PayloadJson != null
                ? JsonNode.Parse(signal.PayloadJson)?["email"]?.GetValue<string>() ?? ""
                : "";
            notifyArgs["subject"] = signal.SignalCode ?? "Reminder";
            notifyArgs["body"] = message ?? signal.SourceText ?? "Reminder";
        }
        else
        {
            signal.Status = "failed";
            signal.ErrorMessage = $"Unknown notification channel: {channel}";
            await _db.SaveChangesAsync(ct);
            return new McpToolCallResult { Success = false, Message = $"Unknown channel: {channel}. Use sms or email." };
        }

        var dispatchRequest = new McpToolCallRequest
        {
            ToolCode = toolCode,
            Arguments = notifyArgs,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId
        };

        var result = await _dispatcher.DispatchAsync(toolCode, dispatchRequest, ct);

        signal.Status = result.Success ? "completed" : "failed";
        signal.ErrorMessage = result.Success ? null : result.Message;
        signal.RetryCount = result.Success ? signal.RetryCount : signal.RetryCount + 1;
        await _db.SaveChangesAsync(ct);

        return result;
    }
}
