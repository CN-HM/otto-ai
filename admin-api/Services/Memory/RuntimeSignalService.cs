using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Memory.Dtos;
using AiAdmin.Services.Runtime;
using Hangfire;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Memory;

public class RuntimeSignalService : ITransientDependency
{
    private readonly AiAdminDbContext _db;

    public RuntimeSignalService(AiAdminDbContext db)
    {
        _db = db;
    }

    public async Task<(List<RuntimeSignalDto> List, long Total)> GetPageAsync(RuntimeSignalListQuery query, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var page = Math.Max(query.Page ?? 1, 1);
        var limit = Math.Clamp(query.Limit ?? 10, 1, 100);
        var q = _db.AiRuntimeSignals.AsNoTracking().AsQueryable();
        if (!isSuperAdmin)
        {
            q = q.Where(x => x.UserId == currentUserId);
        }

        var signalType = NormalizeOptionalText(query.SignalType);
        if (signalType != null)
            q = q.Where(x => x.SignalType == signalType);

        var status = NormalizeOptionalText(query.Status);
        if (status != null)
            q = q.Where(x => x.Status == status);

        var severity = NormalizeOptionalText(query.Severity);
        if (severity != null)
            q = q.Where(x => x.Severity == severity);

        var keyword = NormalizeOptionalText(query.Keyword);
        if (keyword != null)
        {
            q = q.Where(x => (x.SourceText != null && x.SourceText.Contains(keyword))
                || (x.SignalCode != null && x.SignalCode.Contains(keyword))
                || (x.SessionId != null && x.SessionId.Contains(keyword))
                || (x.DeviceId != null && x.DeviceId.Contains(keyword)));
        }

        var total = await q.LongCountAsync(cancellationToken);
        var list = await q.OrderByDescending(x => x.CreatedAt)
            .Skip((page - 1) * limit)
            .Take(limit)
            .Select(x => ToDto(x))
            .ToListAsync(cancellationToken);
        return (list, total);
    }

    public async Task<RuntimeSignalDto> UpdateStatusAsync(string id, RuntimeSignalStatusUpdateDto dto, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(x => x.Id == id, cancellationToken)
            ?? throw new InvalidOperationException("Error:RuntimeSignalNotFound");
        if (!isSuperAdmin && signal.UserId != currentUserId)
            throw new UnauthorizedAccessException("Error:RuntimeSignalAccessDenied");

        var status = RuntimeSignalStatuses.Parse(dto.Status);
        signal.Status = RuntimeSignalStatuses.ToStorageValue(status);
        signal.ErrorMessage = NormalizeOptionalText(dto.ErrorMessage);
        signal.ScheduledAt = dto.ScheduledAt ?? signal.ScheduledAt;
        signal.ProcessedAt = RuntimeSignalStatuses.IsTerminal(status) ? DateTime.UtcNow : signal.ProcessedAt;
        signal.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
        return ToDto(signal);
    }

    public async Task DeleteTodoAsync(string id, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(x => x.Id == id, cancellationToken)
            ?? throw new InvalidOperationException("Error:RuntimeSignalNotFound");
        if (!isSuperAdmin && signal.UserId != currentUserId)
            throw new UnauthorizedAccessException("Error:RuntimeSignalAccessDenied");

        if (!string.Equals(signal.SignalType, RuntimeSignalTypes.Todo, StringComparison.OrdinalIgnoreCase))
            throw new InvalidOperationException("仅允许删除待办信号");

        _db.AiRuntimeSignals.Remove(signal);
        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task ScheduleWakeupIfNeededAsync(AiRuntimeSignal signal)
    {
        if (!string.IsNullOrEmpty(signal.WakeupJobId))
        {
            BackgroundJob.Delete(signal.WakeupJobId);
            signal.WakeupJobId = null;
        }

        if (signal.ScheduledAt.HasValue && signal.ScheduledAt.Value > DateTime.UtcNow
            && signal.Status != "completed" && signal.Status != "ignored" && signal.Status != "failed")
        {
            signal.WakeupJobId = BackgroundJob.Schedule<AgentWakeupJob>(
                job => job.WakeAsync(signal.Id),
                signal.ScheduledAt.Value);
            await _db.SaveChangesAsync();
        }
    }

    public async Task CancelWakeupIfExistsAsync(AiRuntimeSignal signal)
    {
        if (!string.IsNullOrEmpty(signal.WakeupJobId))
        {
            BackgroundJob.Delete(signal.WakeupJobId);
            signal.WakeupJobId = null;
            await _db.SaveChangesAsync();
        }
    }

    private static RuntimeSignalDto ToDto(AiRuntimeSignal signal)
    {
        return new RuntimeSignalDto
        {
            Id = signal.Id,
            SignalType = signal.SignalType,
            SignalCode = signal.SignalCode,
            Severity = signal.Severity,
            Status = signal.Status,
            UserId = signal.UserId,
            DeviceId = signal.DeviceId,
            AgentRoleId = signal.AgentRoleId,
            SessionId = signal.SessionId,
            SourceRunId = signal.SourceRunId,
            SourceText = signal.SourceText,
            PayloadJson = signal.PayloadJson,
            ScheduledAt = FormatDateTime(signal.ScheduledAt),
            ProcessedAt = FormatDateTime(signal.ProcessedAt),
            DedupeKey = signal.DedupeKey,
            RetryCount = signal.RetryCount,
            ErrorMessage = signal.ErrorMessage,
            CreatedAt = FormatDateTime(signal.CreatedAt) ?? string.Empty,
            UpdatedAt = FormatDateTime(signal.UpdatedAt)
        };
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private static string? FormatDateTime(DateTime? value)
    {
        return value?.ToString("yyyy-MM-dd HH:mm:ss");
    }
}
