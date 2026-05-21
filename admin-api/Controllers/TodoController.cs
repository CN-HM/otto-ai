using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Notifications;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.Guids;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/todos")]
[Authorize]
public class TodoController : AiAdminBaseController
{
    private readonly Data.AiAdminDbContext _db;
    private readonly TodoExecutionService _todoExecutionService;
    private readonly IGuidGenerator _guidGenerator;

    public TodoController(Data.AiAdminDbContext db, TodoExecutionService todoExecutionService, IGuidGenerator guidGenerator)
    {
        _db = db;
        _todoExecutionService = todoExecutionService;
        _guidGenerator = guidGenerator;
    }

    [HttpPost]
    [RequirePermission("memory-library:list")]
    public async Task<Result<object>> Create([FromBody] CreateTodoDto dto, CancellationToken cancellationToken)
    {
        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N"),
            SignalType = "todo",
            SignalCode = dto.Title?.Trim(),
            Severity = "medium",
            Status = dto.ScheduledAt != null && dto.ScheduledAt > now ? "scheduled" : "pending",
            UserId = dto.UserId,
            DeviceId = dto.DeviceId?.Trim(),
            AgentRoleId = dto.AgentRoleId?.Trim(),
            SourceText = dto.Content?.Trim(),
            ScheduledAt = dto.ScheduledAt ?? now,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(cancellationToken);
        return Result<object>.Ok(new { id = signal.Id });
    }

    [HttpPost("{id}/execute")]
    [RequirePermission("memory-library:list")]
    public async Task<Result<object>> Execute(string id, CancellationToken cancellationToken)
    {
        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(x => x.Id == id, cancellationToken)
            ?? throw new InvalidOperationException("Error:TodoNotFound");

        if (signal.SignalType != "todo")
            return Result<object>.Error("仅支持执行待办类型的信号");

        if (signal.Status is "completed" or "ignored")
            return Result<object>.Error("待办已完成或已忽略，无需重复执行");

        await _todoExecutionService.ExecuteAsync(signal, cancellationToken);
        return Result<object>.Ok(new { id = signal.Id, status = signal.Status });
    }
}

public class CreateTodoDto
{
    public string? Title { get; set; }
    public string? Content { get; set; }
    public DateTime? ScheduledAt { get; set; }
    public long? UserId { get; set; }
    public string? DeviceId { get; set; }
    public string? AgentRoleId { get; set; }
}
