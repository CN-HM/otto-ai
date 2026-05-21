using AiAdmin.Data;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Admin.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.AuditLogging;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/audit-logs")]
public class AuditLogController : AiAdminBaseController
{
    private readonly AiAdminDbContext _db;

    public AuditLogController(AiAdminDbContext db)
    {
        _db = db;
    }

    [HttpGet]
    [Authorize]
    [RequirePermission("audit-log:list")]
    public async Task<Result<PageData<AuditLogPageItemVo>>> Page(
        [FromQuery] string? keyword,
        [FromQuery] string? method,
        [FromQuery] string? result,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10)
    {
        page = Math.Max(page, 1);
        limit = Math.Clamp(limit, 1, 100);

        var query = _db.AuditLogs.AsNoTracking().AsQueryable();

        if (!string.IsNullOrWhiteSpace(keyword))
        {
            var trimmedKeyword = keyword.Trim();
            query = query.Where(x =>
                (x.UserName != null && x.UserName.Contains(trimmedKeyword)) ||
                (x.Url != null && x.Url.Contains(trimmedKeyword)) ||
                (x.CorrelationId != null && x.CorrelationId.Contains(trimmedKeyword)) ||
                (x.ClientIpAddress != null && x.ClientIpAddress.Contains(trimmedKeyword)) ||
                (x.ApplicationName != null && x.ApplicationName.Contains(trimmedKeyword)));
        }

        if (!string.IsNullOrWhiteSpace(method))
        {
            var normalizedMethod = method.Trim().ToUpperInvariant();
            query = query.Where(x => x.HttpMethod == normalizedMethod);
        }

        if (string.Equals(result, "error", StringComparison.OrdinalIgnoreCase))
        {
            query = query.Where(x =>
                !string.IsNullOrWhiteSpace(x.Exceptions) ||
                (x.HttpStatusCode.HasValue && x.HttpStatusCode.Value >= 400));
        }
        else if (string.Equals(result, "success", StringComparison.OrdinalIgnoreCase))
        {
            query = query.Where(x =>
                string.IsNullOrWhiteSpace(x.Exceptions) &&
                (!x.HttpStatusCode.HasValue || x.HttpStatusCode.Value < 400));
        }

        var total = await query.CountAsync();
        var auditLogIds = await query
            .OrderByDescending(x => x.ExecutionTime)
            .Select(x => x.Id)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync();

        if (auditLogIds.Count == 0)
        {
            return Result<PageData<AuditLogPageItemVo>>.Ok(new PageData<AuditLogPageItemVo>
            {
                Total = total,
                List = []
            });
        }

        var auditLogs = await _db.AuditLogs
            .AsNoTracking()
            .AsSplitQuery()
            .Where(x => auditLogIds.Contains(x.Id))
            .Include(x => x.Actions)
            .Include(x => x.EntityChanges)
                .ThenInclude(x => x.PropertyChanges)
            .ToListAsync();

        var sortOrder = auditLogIds
            .Select((id, index) => new { id, index })
            .ToDictionary(x => x.id, x => x.index);

        var list = auditLogs
            .OrderBy(x => sortOrder[x.Id])
            .Select(MapAuditLog)
            .ToList();

        return Result<PageData<AuditLogPageItemVo>>.Ok(new PageData<AuditLogPageItemVo>
        {
            Total = total,
            List = list
        });
    }

    private static AuditLogPageItemVo MapAuditLog(AuditLog auditLog)
    {
        var userName = string.IsNullOrWhiteSpace(auditLog.UserName)
            ? GetExtraProperty(auditLog, "aiUserName")
            : auditLog.UserName;

        return new AuditLogPageItemVo
        {
            Id = auditLog.Id.ToString(),
            ApplicationName = auditLog.ApplicationName,
            OperatorId = GetExtraProperty(auditLog, "aiUserId"),
            UserName = userName,
            ClientIpAddress = auditLog.ClientIpAddress,
            BrowserInfo = auditLog.BrowserInfo,
            CorrelationId = auditLog.CorrelationId,
            HttpMethod = auditLog.HttpMethod,
            HttpStatusCode = auditLog.HttpStatusCode,
            Url = auditLog.Url,
            ExecutionTime = auditLog.ExecutionTime,
            ExecutionDuration = auditLog.ExecutionDuration,
            HasException = !string.IsNullOrWhiteSpace(auditLog.Exceptions),
            Exceptions = auditLog.Exceptions,
            Comments = auditLog.Comments,
            ActionCount = auditLog.Actions.Count,
            EntityChangeCount = auditLog.EntityChanges.Count,
            Actions = auditLog.Actions
                .OrderByDescending(x => x.ExecutionTime)
                .Select(x => new AuditLogActionVo
                {
                    ServiceName = x.ServiceName,
                    MethodName = x.MethodName,
                    Parameters = x.Parameters,
                    ExecutionTime = x.ExecutionTime,
                    ExecutionDuration = x.ExecutionDuration
                })
                .ToList(),
            EntityChanges = auditLog.EntityChanges
                .OrderByDescending(x => x.ChangeTime)
                .Select(x => new AuditEntityChangeVo
                {
                    ChangeType = x.ChangeType.ToString(),
                    EntityTypeFullName = x.EntityTypeFullName,
                    EntityId = x.EntityId,
                    ChangeTime = x.ChangeTime,
                    PropertyChanges = x.PropertyChanges
                        .Select(change => new AuditPropertyChangeVo
                        {
                            PropertyName = change.PropertyName,
                            OriginalValue = change.OriginalValue,
                            NewValue = change.NewValue
                        })
                        .ToList()
                })
                .ToList()
        };
    }

    private static string? GetExtraProperty(AuditLog auditLog, string key)
    {
        if (!auditLog.ExtraProperties.TryGetValue(key, out var value) || value == null)
        {
            return null;
        }

        return value.ToString();
    }
}
