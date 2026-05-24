using AiAdmin.Entities;
using AiAdmin.Infrastructure;
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
    private readonly IGuidGenerator _guidGenerator;

    public TodoController(Data.AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
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
