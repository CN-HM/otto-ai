using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.Services.Runtime;
using Hangfire;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools.Handlers;

public class HealthFollowupCreateHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public HealthFollowupCreateHandler(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public string ToolCode => McpSystemToolCodes.HealthFollowupCreate;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var title = request.Arguments["title"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();
        var followupType = request.Arguments["followup_type"]?.GetValue<string>();
        var scheduledAtStr = request.Arguments["scheduled_at"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(title))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: title" };

        DateTime scheduledAt;
        if (!string.IsNullOrWhiteSpace(scheduledAtStr) && DateTime.TryParse(scheduledAtStr, out var parsed))
            scheduledAt = DateTime.SpecifyKind(parsed, DateTimeKind.Utc);
        else
            scheduledAt = DateTime.UtcNow.AddHours(2);

        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N")[..32],
            SignalType = "health_followup",
            SignalCode = title,
            Severity = "normal",
            Status = scheduledAt > now ? "scheduled" : "pending",
            SourceText = content,
            ScheduledAt = scheduledAt,
            PayloadJson = followupType != null ? $"{{\"followup_type\":\"{followupType}\"}}" : null,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId,
            SessionId = request.SessionId,
            UserId = request.UserId,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(ct);

        if (scheduledAt > now)
        {
            signal.WakeupJobId = BackgroundJob.Schedule<AgentWakeupJob>(
                job => job.WakeAsync(signal.Id),
                scheduledAt);
            await _db.SaveChangesAsync(ct);
        }

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Created health followup: {title} (scheduled at {scheduledAt:O})",
            Data = new JsonObject
            {
                ["signal_id"] = signal.Id,
                ["scheduled_at"] = scheduledAt.ToString("O")
            }
        };
    }
}
