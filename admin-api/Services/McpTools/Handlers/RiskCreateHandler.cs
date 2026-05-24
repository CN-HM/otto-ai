using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools.Handlers;

public class RiskCreateHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public RiskCreateHandler(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public string ToolCode => McpSystemToolCodes.RiskCreate;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var title = request.Arguments["title"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();
        var severity = request.Arguments["severity"]?.GetValue<string>() ?? "high";
        var evidence = request.Arguments["evidence"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(title))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: title" };

        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N")[..32],
            SignalType = "risk",
            SignalCode = title,
            Severity = severity,
            Status = "pending",
            SourceText = content,
            PayloadJson = evidence != null ? $"{{\"evidence\":\"{evidence}\"}}" : null,
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
            Message = $"Created risk: {title}",
            Data = new JsonObject { ["signal_id"] = signal.Id, ["severity"] = severity }
        };
    }
}
