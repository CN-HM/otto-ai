using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoListHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;

    public TodoListHandler(AiAdminDbContext db) => _db = db;

    public string ToolCode => McpSystemToolCodes.TodoList;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var status = request.Arguments["status"]?.GetValue<string>();
        var signalType = request.Arguments["signal_type"]?.GetValue<string>();
        var limit = request.Arguments["limit"]?.GetValue<int>() ?? 10;

        var query = _db.AiRuntimeSignals.AsQueryable();

        if (!string.IsNullOrWhiteSpace(request.AgentRoleId))
            query = query.Where(s => s.AgentRoleId == request.AgentRoleId);

        if (!string.IsNullOrWhiteSpace(status))
            query = query.Where(s => s.Status == status);

        if (!string.IsNullOrWhiteSpace(signalType))
            query = query.Where(s => s.SignalType == signalType);

        query = query.Where(s => s.ScheduledAt == null || s.ScheduledAt <= DateTime.UtcNow);
        query = query.OrderBy(s => s.ScheduledAt ?? s.CreatedAt);
        query = query.Take(Math.Min(limit, 20));

        var signals = await query.Select(s => new
        {
            s.Id,
            s.SignalType,
            s.SignalCode,
            s.Severity,
            s.Status,
            s.SourceText,
            s.ScheduledAt,
            s.CreatedAt
        }).ToListAsync(ct);

        var json = JsonSerializer.Serialize(signals);
        return new McpToolCallResult
        {
            Success = true,
            Message = $"Found {signals.Count} pending signal(s)",
            Data = (JsonNode.Parse(json) as JsonObject)!
        };
    }
}
