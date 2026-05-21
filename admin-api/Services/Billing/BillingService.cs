using System.Globalization;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Billing.Dtos;
using AiAdmin.Services.Settings;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;
using Volo.Abp.Uow;

namespace AiAdmin.Services.Billing;

public class BillingService : ITransientDependency
{
    private const string DefaultPlanCode = "trial_monthly";
    private const string DefaultResetTimezone = "Asia/Taipei";
    private const decimal DefaultLowBalanceRatio = 0.1m;
    private const int DefaultExhaustionRemindCooldownHours = 12;

    private readonly AiAdminDbContext _db;
    private readonly SystemSettingsService _systemSettingsService;
    private readonly IGuidGenerator _guidGenerator;
    private readonly IUnitOfWorkManager _unitOfWorkManager;

    public BillingService(AiAdminDbContext db, SystemSettingsService systemSettingsService, IGuidGenerator guidGenerator, IUnitOfWorkManager unitOfWorkManager)
    {
        _db = db;
        _systemSettingsService = systemSettingsService;
        _guidGenerator = guidGenerator;
        _unitOfWorkManager = unitOfWorkManager;
    }

    public async Task EnsureDefaultSubscriptionForUserAsync(long userId, long? operatorId = null, CancellationToken cancellationToken = default)
    {
        var activeSubscriptionStatus = BillingSubscriptionStatuses.ToStorageValue(BillingSubscriptionStatus.Active);
        if (await _db.AiUserSubscriptions.AnyAsync(x => x.UserId == userId && x.Status == activeSubscriptionStatus, cancellationToken))
        {
            await EnsureCurrentPeriodAsync(userId, cancellationToken);
            return;
        }

        var plan = await GetDefaultPlanAsync(cancellationToken);
        if (plan == null)
        {
            return;
        }

        var now = DateTime.UtcNow;
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false, cancellationToken);
        var (periodStartAtUtc, periodEndAtUtc, periodKey) = GetCurrentPeriodRange(now, systemSettings.BillingResetTimezone);
        var subscriptionId = _guidGenerator.Create().ToString("N");
        var subscription = new AiUserSubscription
        {
            Id = subscriptionId,
            UserId = userId,
            PlanId = plan.Id,
            Status = activeSubscriptionStatus,
            StartAt = now,
            EndAt = periodEndAtUtc,
            NextRenewAt = periodEndAtUtc,
            AutoRenew = true,
            Source = "register",
            Creator = operatorId ?? userId,
            CreateDate = now,
            Updater = operatorId ?? userId,
            UpdateDate = now
        };

        var totalTokens = plan.IncludedTokens + plan.BonusTokens;
        var period = new AiSubscriptionPeriod
        {
            Id = _guidGenerator.Create().ToString("N"),
            SubscriptionId = subscriptionId,
            UserId = userId,
            PeriodKey = periodKey,
            PeriodStartAt = periodStartAtUtc,
            PeriodEndAt = periodEndAtUtc,
            PlanTokens = plan.IncludedTokens,
            PurchasedTokens = 0,
            GiftedTokens = plan.BonusTokens,
            ConsumedTokens = 0,
            RemainingTokens = totalTokens,
            CreateDate = now,
            UpdateDate = now
        };

        var ledger = new AiTokenLedger
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId,
            PeriodId = period.Id,
            ChangeType = "grant",
            DeltaTokens = totalTokens,
            BalanceAfter = totalTokens,
            OperatorId = operatorId ?? userId,
            Remark = $"初始化套餐：{plan.Name}",
            CreateDate = now
        };

        _db.AiUserSubscriptions.Add(subscription);
        _db.AiSubscriptionPeriods.Add(period);
        _db.AiTokenLedgers.Add(ledger);
        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task<AiSubscriptionPeriod?> EnsureCurrentPeriodAsync(long userId, CancellationToken cancellationToken = default)
    {
        var activeSubscriptionStatus = BillingSubscriptionStatuses.ToStorageValue(BillingSubscriptionStatus.Active);
        var activeSubscription = await _db.AiUserSubscriptions
            .OrderByDescending(x => x.CreateDate)
            .FirstOrDefaultAsync(x => x.UserId == userId && x.Status == activeSubscriptionStatus, cancellationToken);
        if (activeSubscription == null)
        {
            await EnsureDefaultSubscriptionForUserAsync(userId, userId, cancellationToken);
            activeSubscription = await _db.AiUserSubscriptions
                .OrderByDescending(x => x.CreateDate)
                .FirstOrDefaultAsync(x => x.UserId == userId && x.Status == activeSubscriptionStatus, cancellationToken);
            if (activeSubscription == null)
            {
                return null;
            }
        }

        var now = DateTime.UtcNow;
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false, cancellationToken);
        var (periodStartAtUtc, periodEndAtUtc, periodKey) = GetCurrentPeriodRange(now, systemSettings.BillingResetTimezone);
        var existingPeriod = await _db.AiSubscriptionPeriods
            .OrderByDescending(x => x.PeriodStartAt)
            .FirstOrDefaultAsync(x => x.UserId == userId && x.SubscriptionId == activeSubscription.Id && x.PeriodKey == periodKey, cancellationToken);
        if (existingPeriod != null)
        {
            return existingPeriod;
        }

        var plan = await _db.AiBillingPlans.FirstOrDefaultAsync(x => x.Id == activeSubscription.PlanId, cancellationToken);
        if (plan == null)
        {
            return null;
        }

        var nowDate = DateTime.UtcNow;
        var totalTokens = plan.IncludedTokens + plan.BonusTokens;
        var period = new AiSubscriptionPeriod
        {
            Id = _guidGenerator.Create().ToString("N"),
            SubscriptionId = activeSubscription.Id,
            UserId = userId,
            PeriodKey = periodKey,
            PeriodStartAt = periodStartAtUtc,
            PeriodEndAt = periodEndAtUtc,
            PlanTokens = plan.IncludedTokens,
            PurchasedTokens = 0,
            GiftedTokens = plan.BonusTokens,
            ConsumedTokens = 0,
            RemainingTokens = totalTokens,
            CreateDate = nowDate,
            UpdateDate = nowDate
        };

        activeSubscription.EndAt = periodEndAtUtc;
        activeSubscription.NextRenewAt = periodEndAtUtc;
        activeSubscription.UpdateDate = nowDate;

        _db.AiSubscriptionPeriods.Add(period);
        _db.AiTokenLedgers.Add(new AiTokenLedger
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId,
            PeriodId = period.Id,
            ChangeType = "grant",
            DeltaTokens = totalTokens,
            BalanceAfter = totalTokens,
            OperatorId = userId,
            Remark = $"月账期重置：{periodKey}",
            CreateDate = nowDate
        });

        await _db.SaveChangesAsync(cancellationToken);
        return period;
    }

    public async Task<BillingSummaryDto?> GetUserSummaryAsync(long userId, CancellationToken cancellationToken = default)
    {
        var user = await _db.SysUsers.AsNoTracking().FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user == null)
        {
            return null;
        }

        var period = await EnsureCurrentPeriodAsync(userId, cancellationToken);
        var activeSubscriptionStatus = BillingSubscriptionStatuses.ToStorageValue(BillingSubscriptionStatus.Active);
        var subscription = await _db.AiUserSubscriptions.AsNoTracking()
            .OrderByDescending(x => x.CreateDate)
            .FirstOrDefaultAsync(x => x.UserId == userId && x.Status == activeSubscriptionStatus, cancellationToken);
        AiBillingPlan? plan = null;
        if (!string.IsNullOrWhiteSpace(subscription?.PlanId))
        {
            plan = await _db.AiBillingPlans.AsNoTracking().FirstOrDefaultAsync(x => x.Id == subscription.PlanId, cancellationToken);
        }

        var totalTokens = (period?.PlanTokens ?? 0) + (period?.PurchasedTokens ?? 0) + (period?.GiftedTokens ?? 0);
        var remaining = period?.RemainingTokens ?? 0;
        var ratio = totalTokens <= 0 ? 0 : Math.Round((decimal)remaining / totalTokens, 4);
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false, cancellationToken);
        var threshold = ResolveLowBalanceRatio(systemSettings);

        return new BillingSummaryDto
        {
            UserId = user.Id,
            Username = user.Username,
            Mobile = user.Mobile,
            SubscriptionId = subscription?.Id,
            SubscriptionStatus = subscription?.Status,
            PlanId = plan?.Id,
            PlanCode = plan?.Code,
            PlanName = plan?.Name,
            PeriodId = period?.Id,
            PeriodKey = period?.PeriodKey,
            PeriodStartAt = period?.PeriodStartAt.ToString("yyyy-MM-dd HH:mm:ss"),
            PeriodEndAt = period?.PeriodEndAt.ToString("yyyy-MM-dd HH:mm:ss"),
            TotalTokens = totalTokens,
            ConsumedTokens = period?.ConsumedTokens ?? 0,
            RemainingTokens = remaining,
            RemainingRatio = ratio,
            IsLowBalance = totalTokens > 0 && ratio <= threshold && remaining > 0,
            IsExhausted = remaining <= 0
        };
    }

    public async Task<List<BillingPlanItemDto>> GetPlanListAsync(CancellationToken cancellationToken = default)
    {
        var plans = await _db.AiBillingPlans.AsNoTracking()
            .Where(x => x.IsEnabled)
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Code)
            .ToListAsync(cancellationToken);
        if (plans.Count == 0)
        {
            return new List<BillingPlanItemDto>();
        }

        var planIds = plans.Select(x => x.Id).ToList();
        var prices = await _db.AiBillingPlanPrices.AsNoTracking()
            .Where(x => planIds.Contains(x.PlanId) && x.IsEnabled)
            .ToListAsync(cancellationToken);

        return plans.Select(plan =>
        {
            var price = prices
                .Where(x => x.PlanId == plan.Id)
                .OrderBy(x => x.Amount)
                .FirstOrDefault();
            return new BillingPlanItemDto
            {
                Id = plan.Id,
                Code = plan.Code,
                Name = plan.Name,
                PlanType = plan.PlanType,
                IncludedTokens = plan.IncludedTokens,
                BonusTokens = plan.BonusTokens,
                CycleMonths = plan.CycleMonths,
                IsDefault = plan.IsDefault,
                IsEnabled = plan.IsEnabled,
                Sort = plan.Sort,
                Remark = plan.Remark,
                Amount = price?.Amount,
                CurrencyCode = price?.CurrencyCode,
                RegionCode = price?.RegionCode,
                ProviderCode = price?.ProviderCode
            };
        }).ToList();
    }

    public async Task<BillingUsageReportResultDto> ReportUsageAsync(BillingUsageReportDto dto, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(dto.IdempotencyKey))
        {
            throw new InvalidOperationException("Error:IdempotencyKeyRequired");
        }

        var existingRecord = await _db.AiUsageRecords.AsNoTracking()
            .FirstOrDefaultAsync(x => x.IdempotencyKey == dto.IdempotencyKey, cancellationToken);
        if (existingRecord != null)
        {
            var existingSummary = await GetUserSummaryAsync(existingRecord.UserId, cancellationToken);
            return new BillingUsageReportResultDto
            {
                Recorded = false,
                IdempotencyKey = dto.IdempotencyKey,
                NormalizedTokens = existingRecord.NormalizedTokens,
                ConsumedTokens = existingSummary?.ConsumedTokens ?? 0,
                RemainingTokens = existingSummary?.RemainingTokens ?? 0,
                IsLowBalance = existingSummary?.IsLowBalance ?? false,
                IsExhausted = existingSummary?.IsExhausted ?? false,
                ChargeStatus = existingRecord.ChargeStatus,
                PeriodKey = existingSummary?.PeriodKey
            };
        }

        var device = await _db.AiDevices.FirstOrDefaultAsync(x => x.MacAddress == dto.MacAddress, cancellationToken);
        if (device == null)
        {
            throw new InvalidOperationException("Error:DeviceNotRegistered");
        }

        long? userId = device.UserId;
        if (userId == null || userId.Value <= 0)
        {
            throw new InvalidOperationException("Error:DeviceUserInvalid");
        }

        await EnsureDefaultSubscriptionForUserAsync(userId.Value, userId.Value, cancellationToken);
        var period = await EnsureCurrentPeriodAsync(userId.Value, cancellationToken);
        if (period == null)
        {
            throw new InvalidOperationException("Error:UserPlanInactive");
        }

        var normalizedTokens = dto.NormalizedTokens.GetValueOrDefault();
        if (normalizedTokens <= 0)
        {
            normalizedTokens = await ConvertToNormalizedTokensAsync(dto, cancellationToken);
        }

        var happenedAt = dto.ReportTime.HasValue
            ? DateTimeOffset.FromUnixTimeSeconds(dto.ReportTime.Value).UtcDateTime
            : DateTime.UtcNow;
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false, cancellationToken);
        var now = DateTime.UtcNow;
        var remainingBefore = period.RemainingTokens;
        var chargedTokens = Math.Max(0, normalizedTokens);
        var remainingAfter = Math.Max(0, remainingBefore - chargedTokens);
        var actualConsumedDelta = remainingBefore - remainingAfter;
        var chargeStatus = remainingBefore <= 0
            ? BillingChargeStatus.Exhausted
            : actualConsumedDelta < chargedTokens
                ? BillingChargeStatus.Partial
                : BillingChargeStatus.Charged;
        var chargeStatusValue = BillingChargeStatuses.ToStorageValue(chargeStatus);

        using var uow = _unitOfWorkManager.Begin(requiresNew: true, isTransactional: true);

        var usageRecord = new AiUsageRecord
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId.Value,
            DeviceId = device.Id,
            SessionId = dto.SessionId,
            ServiceType = string.IsNullOrWhiteSpace(dto.ServiceType) ? "OTHER" : dto.ServiceType.Trim().ToUpperInvariant(),
            ProviderCode = dto.ProviderCode,
            ModelConfigId = dto.ModelConfigId,
            UnitType = string.IsNullOrWhiteSpace(dto.UnitType) ? "tokens" : dto.UnitType.Trim().ToLowerInvariant(),
            RawUnits = dto.RawUnits,
            NormalizedTokens = chargedTokens,
            RawUsageJson = dto.RawUsageJson,
            IdempotencyKey = dto.IdempotencyKey,
            ChargeStatus = chargeStatusValue,
            HappenedAt = happenedAt,
            CreateDate = now
        };

        period.ConsumedTokens += actualConsumedDelta;
        period.RemainingTokens = remainingAfter;
        if (remainingAfter <= 0 && period.ExhaustedAt == null)
        {
            period.ExhaustedAt = now;
        }

        var totalTokens = period.PlanTokens + period.PurchasedTokens + period.GiftedTokens;
        var threshold = ResolveLowBalanceRatio(systemSettings);
        if (totalTokens > 0 && remainingAfter > 0 && (decimal)remainingAfter / totalTokens <= threshold && period.LowBalanceWarnedAt == null)
        {
            period.LowBalanceWarnedAt = now;
        }
        if (remainingAfter <= 0)
        {
            var cooldown = TimeSpan.FromHours(Math.Max(0, ResolveExhaustionRemindCooldownHours(systemSettings)));
            if (period.ExhaustedAt == null || cooldown == TimeSpan.Zero || now - period.ExhaustedAt.Value >= cooldown)
            {
                period.ExhaustedAt = now;
            }
        }
        period.UpdateDate = now;

        _db.AiUsageRecords.Add(usageRecord);
        _db.AiTokenLedgers.Add(new AiTokenLedger
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId.Value,
            PeriodId = period.Id,
            ChangeType = "consume",
            DeltaTokens = -actualConsumedDelta,
            BalanceAfter = remainingAfter,
            UsageRecordId = usageRecord.Id,
            OperatorId = userId.Value,
            Remark = $"{usageRecord.ServiceType}/{usageRecord.UnitType}",
            CreateDate = now
        });

        await _db.SaveChangesAsync(cancellationToken);
        await uow.CompleteAsync(cancellationToken);

        return new BillingUsageReportResultDto
        {
            Recorded = true,
            IdempotencyKey = dto.IdempotencyKey,
            NormalizedTokens = chargedTokens,
            ConsumedTokens = period.ConsumedTokens,
            RemainingTokens = remainingAfter,
            IsLowBalance = totalTokens > 0 && remainingAfter > 0 && (decimal)remainingAfter / totalTokens <= threshold,
            IsExhausted = remainingAfter <= 0,
            ChargeStatus = chargeStatusValue,
            PeriodKey = period.PeriodKey
        };
    }

    public async Task GrantTokensAsync(long userId, long tokens, string? remark, long operatorId, CancellationToken cancellationToken = default)
    {
        if (tokens <= 0)
        {
            throw new InvalidOperationException("Error:TokensMustBePositive");
        }

        await EnsureDefaultSubscriptionForUserAsync(userId, operatorId, cancellationToken);
        var period = await EnsureCurrentPeriodAsync(userId, cancellationToken);
        if (period == null)
        {
            throw new InvalidOperationException("Error:UserPlanInactive");
        }

        var now = DateTime.UtcNow;
        period.GiftedTokens += tokens;
        period.RemainingTokens += tokens;
        period.UpdateDate = now;
        if (period.RemainingTokens > 0)
        {
            period.ExhaustedAt = null;
        }

        _db.AiTokenLedgers.Add(new AiTokenLedger
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId,
            PeriodId = period.Id,
            ChangeType = "manual",
            DeltaTokens = tokens,
            BalanceAfter = period.RemainingTokens,
            OperatorId = operatorId,
            Remark = string.IsNullOrWhiteSpace(remark) ? "后台人工补量" : remark,
            CreateDate = now
        });

        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task<(List<AdminBillingSubscriptionItemDto> List, long Total)> GetAdminSubscriptionPageAsync(string? mobile, int page, int limit, CancellationToken cancellationToken = default)
    {
        var query = _db.SysUsers.AsNoTracking().AsQueryable();
        if (!string.IsNullOrWhiteSpace(mobile))
        {
            query = query.Where(x => x.Username.Contains(mobile) || (x.Mobile != null && x.Mobile.Contains(mobile)));
        }

        var total = await query.CountAsync(cancellationToken);
        var users = await query
            .OrderByDescending(x => x.CreateDate)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        if (users.Count == 0)
        {
            return (new List<AdminBillingSubscriptionItemDto>(), total);
        }

        var userIds = users.Select(x => x.Id).ToList();
        foreach (var userId in userIds)
        {
            await EnsureDefaultSubscriptionForUserAsync(userId, userId, cancellationToken);
        }

        var summaries = new List<AdminBillingSubscriptionItemDto>(users.Count);
        foreach (var user in users)
        {
            var summary = await GetUserSummaryAsync(user.Id, cancellationToken);
            summaries.Add(new AdminBillingSubscriptionItemDto
            {
                UserId = user.Id,
                Username = user.Username,
                Mobile = user.Mobile,
                PlanCode = summary?.PlanCode,
                PlanName = summary?.PlanName,
                SubscriptionStatus = summary?.SubscriptionStatus,
                PeriodKey = summary?.PeriodKey,
                TotalTokens = summary?.TotalTokens ?? 0,
                ConsumedTokens = summary?.ConsumedTokens ?? 0,
                RemainingTokens = summary?.RemainingTokens ?? 0,
                PeriodEndAt = summary?.PeriodEndAt,
                IsLowBalance = summary?.IsLowBalance ?? false,
                IsExhausted = summary?.IsExhausted ?? false
            });
        }

        return (summaries, total);
    }

    public async Task<(List<AdminBillingUsageItemDto> List, long Total)> GetAdminUsagePageAsync(string? keyword, string? serviceType, int page, int limit, CancellationToken cancellationToken = default)
    {
        var userQuery = _db.SysUsers.AsNoTracking().AsQueryable();
        if (!string.IsNullOrWhiteSpace(keyword))
        {
            userQuery = userQuery.Where(x => x.Username.Contains(keyword) || (x.Mobile != null && x.Mobile.Contains(keyword)));
        }

        var allowedUserIds = string.IsNullOrWhiteSpace(keyword)
            ? null
            : await userQuery.Select(x => x.Id).ToListAsync(cancellationToken);

        var query = _db.AiUsageRecords.AsNoTracking().AsQueryable();
        if (allowedUserIds != null)
        {
            query = query.Where(x => allowedUserIds.Contains(x.UserId));
        }
        if (!string.IsNullOrWhiteSpace(serviceType))
        {
            var normalizedServiceType = serviceType.Trim().ToUpperInvariant();
            query = query.Where(x => x.ServiceType == normalizedServiceType);
        }

        var total = await query.CountAsync(cancellationToken);
        var records = await query
            .OrderByDescending(x => x.HappenedAt)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        var userIds = records.Select(x => x.UserId).Distinct().ToList();
        Dictionary<long, SysUser> users = userIds.Count == 0
            ? new Dictionary<long, SysUser>()
            : await _db.SysUsers.AsNoTracking()
                .Where(x => userIds.Contains(x.Id))
                .ToDictionaryAsync(x => x.Id, cancellationToken);

        var list = records.Select(x =>
        {
            users.TryGetValue(x.UserId, out var user);
            return new AdminBillingUsageItemDto
            {
                Id = x.Id,
                UserId = x.UserId,
                Username = user?.Username,
                Mobile = user?.Mobile,
                AgentId = x.AgentId,
                DeviceId = x.DeviceId,
                SessionId = x.SessionId,
                ServiceType = x.ServiceType,
                ProviderCode = x.ProviderCode,
                UnitType = x.UnitType,
                RawUnits = x.RawUnits,
                NormalizedTokens = x.NormalizedTokens,
                ChargeStatus = x.ChargeStatus,
                HappenedAt = x.HappenedAt.ToString("yyyy-MM-dd HH:mm:ss")
            };
        }).ToList();

        return (list, total);
    }

    private async Task<AiBillingPlan?> GetDefaultPlanAsync(CancellationToken cancellationToken)
    {
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false, cancellationToken);
        var defaultPlanCode = string.IsNullOrWhiteSpace(systemSettings.BillingDefaultPlanCode)
            ? DefaultPlanCode
            : systemSettings.BillingDefaultPlanCode.Trim();

        if (string.IsNullOrWhiteSpace(defaultPlanCode))
        {
            defaultPlanCode = DefaultPlanCode;
        }

        var plan = !string.IsNullOrWhiteSpace(defaultPlanCode)
            ? await _db.AiBillingPlans.FirstOrDefaultAsync(x => x.Code == defaultPlanCode && x.IsEnabled, cancellationToken)
            : null;

        return plan ?? await _db.AiBillingPlans.FirstOrDefaultAsync(x => x.IsDefault && x.IsEnabled, cancellationToken);
    }

    private async Task<long> ConvertToNormalizedTokensAsync(BillingUsageReportDto dto, CancellationToken cancellationToken)
    {
        var normalizedServiceType = string.IsNullOrWhiteSpace(dto.ServiceType) ? "OTHER" : dto.ServiceType.Trim().ToUpperInvariant();
        var normalizedUnitType = string.IsNullOrWhiteSpace(dto.UnitType) ? "tokens" : dto.UnitType.Trim().ToLowerInvariant();
        var providerCode = dto.ProviderCode?.Trim();

        var rules = await _db.AiUsageConversionRules.AsNoTracking()
            .Where(x => x.IsEnabled && x.ServiceType == normalizedServiceType && x.UnitType == normalizedUnitType)
            .OrderByDescending(x => x.ProviderCode == providerCode)
            .ToListAsync(cancellationToken);

        var rule = rules.FirstOrDefault(x => string.Equals(x.ProviderCode, providerCode, StringComparison.OrdinalIgnoreCase))
                   ?? rules.FirstOrDefault(x => string.IsNullOrWhiteSpace(x.ProviderCode));

        if (rule == null)
        {
            return (long)Math.Ceiling(dto.RawUnits);
        }

        var raw = dto.RawUnits;
        var tokens = raw * rule.TokensPerUnit;
        return Math.Max(0, (long)Math.Ceiling(tokens));
    }

    private async Task<decimal> GetLowBalanceRatioAsync(CancellationToken cancellationToken)
    {
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false, cancellationToken);
        return ResolveLowBalanceRatio(systemSettings);
    }

    private static (DateTime PeriodStartAtUtc, DateTime PeriodEndAtUtc, string PeriodKey) GetCurrentPeriodRange(DateTime utcNow, string? timeZoneId)
    {
        var timeZone = ResolveTimeZone(timeZoneId);
        var localNow = TimeZoneInfo.ConvertTimeFromUtc(DateTime.SpecifyKind(utcNow, DateTimeKind.Utc), timeZone);
        var localStart = new DateTime(localNow.Year, localNow.Month, 1, 0, 0, 0, DateTimeKind.Unspecified);
        var localEnd = localStart.AddMonths(1);
        var utcStart = TimeZoneInfo.ConvertTimeToUtc(localStart, timeZone);
        var utcEnd = TimeZoneInfo.ConvertTimeToUtc(localEnd, timeZone);
        return (utcStart, utcEnd, $"{localNow:yyyyMM}");
    }

    private static decimal ResolveLowBalanceRatio(SystemSettings systemSettings)
    {
        return systemSettings.BillingLowBalanceRatio > 0
            ? systemSettings.BillingLowBalanceRatio
            : DefaultLowBalanceRatio;
    }

    private static int ResolveExhaustionRemindCooldownHours(SystemSettings systemSettings)
    {
        return systemSettings.BillingExhaustionRemindCooldownHours >= 0
            ? systemSettings.BillingExhaustionRemindCooldownHours
            : DefaultExhaustionRemindCooldownHours;
    }

    private static TimeZoneInfo ResolveTimeZone(string? timeZoneId)
    {
        var candidates = new[]
        {
            timeZoneId?.Trim(),
            DefaultResetTimezone,
            "Taipei Standard Time"
        };

        foreach (var candidate in candidates.Where(x => !string.IsNullOrWhiteSpace(x)).Distinct(StringComparer.OrdinalIgnoreCase))
        {
            try
            {
                return TimeZoneInfo.FindSystemTimeZoneById(candidate!);
            }
            catch
            {
            }
        }

        return TimeZoneInfo.Utc;
    }
}
