using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoCompleteHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;

    public TodoCompleteHandler(AiAdminDbContext db) => _db = db;

    public string ToolCode => McpSystemToolCodes.TodoComplete;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var signalId = request.Arguments["signal_id"]?.GetValue<string>();
        var note = request.Arguments["result_note"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(signalId))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: signal_id" };

        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(s => s.Id == signalId, ct);
        if (signal == null)
            return new McpToolCallResult { Success = false, Message = $"Signal not found: {signalId}" };

        signal.Status = "completed";
        signal.ProcessedAt = DateTime.UtcNow;
        signal.UpdatedAt = DateTime.UtcNow;

        if (!string.IsNullOrWhiteSpace(note))
            signal.SourceText = (signal.SourceText ?? "") + $"\n[Result] {note}";

        await _db.SaveChangesAsync(ct);

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Signal {signalId} marked as completed",
            Data = new JsonObject { ["signal_id"] = signalId, ["status"] = "completed" }
        };
    }
}
