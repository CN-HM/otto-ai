using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoCreateHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public TodoCreateHandler(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public string ToolCode => McpSystemToolCodes.TodoCreate;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var title = request.Arguments["title"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();
        var signalType = request.Arguments["signal_type"]?.GetValue<string>() ?? "todo";
        var severity = request.Arguments["severity"]?.GetValue<string>() ?? "normal";
        var scheduledAtStr = request.Arguments["scheduled_at"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(title))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: title" };

        DateTime? scheduledAt = null;
        if (!string.IsNullOrWhiteSpace(scheduledAtStr) && DateTime.TryParse(scheduledAtStr, out var parsed))
            scheduledAt = DateTime.SpecifyKind(parsed, DateTimeKind.Utc);

        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N")[..32],
            SignalType = signalType,
            SignalCode = title,
            Severity = severity,
            Status = scheduledAt.HasValue && scheduledAt > now ? "scheduled" : "pending",
            SourceText = content,
            ScheduledAt = scheduledAt,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId,
            SessionId = request.SessionId,
            UserId = request.UserId,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(ct);

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Created {signalType}: {title}",
            Data = new JsonObject { ["signal_id"] = signal.Id, ["status"] = signal.Status }
        };
    }
}
