using AiAdmin.Data;
using AiAdmin.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Notifications;

public class TodoScanBackgroundJob : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly TodoExecutionService _todoExecutionService;
    private readonly ILogger<TodoScanBackgroundJob> _logger;

    public TodoScanBackgroundJob(
        AiAdminDbContext db,
        TodoExecutionService todoExecutionService,
        ILogger<TodoScanBackgroundJob> logger)
    {
        _db = db;
        _todoExecutionService = todoExecutionService;
        _logger = logger;
    }

    public async Task ScanAndExecuteAsync(CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        var dueTodos = await _db.AiRuntimeSignals
            .Where(x => x.SignalType == "todo"
                && (x.Status == "pending" || x.Status == "scheduled")
                && x.ScheduledAt <= now
                && x.RetryCount < 3)
            .OrderBy(x => x.ScheduledAt)
            .Take(20)
            .ToListAsync(cancellationToken);

        if (dueTodos.Count == 0)
            return;

        _logger.LogInformation("Found {Count} due todos to execute", dueTodos.Count);

        foreach (var todo in dueTodos)
        {
            try
            {
                await _todoExecutionService.ExecuteAsync(todo, cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, "Failed to execute todo {TodoId}", todo.Id);
            }
        }
    }
}
