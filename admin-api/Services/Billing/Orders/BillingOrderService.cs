using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Billing;
using AiAdmin.Services.Billing.Dtos;
using AiAdmin.Services.Billing.Payments;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;
using Volo.Abp.Uow;

namespace AiAdmin.Services.Billing.Orders;

public class BillingOrderService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly BillingService _billingService;
    private readonly BillingPaymentProviderRegistry _paymentProviderRegistry;
    private readonly IGuidGenerator _guidGenerator;
    private readonly IUnitOfWorkManager _unitOfWorkManager;

    public BillingOrderService(
        AiAdminDbContext db,
        BillingService billingService,
        BillingPaymentProviderRegistry paymentProviderRegistry,
        IGuidGenerator guidGenerator,
        IUnitOfWorkManager unitOfWorkManager)
    {
        _db = db;
        _billingService = billingService;
        _paymentProviderRegistry = paymentProviderRegistry;
        _guidGenerator = guidGenerator;
        _unitOfWorkManager = unitOfWorkManager;
    }

    public async Task<BillingOrderDetailDto> CreateOrderAsync(long userId, CreateBillingOrderDto dto, CancellationToken cancellationToken = default)
    {
        if (userId <= 0)
        {
            throw new InvalidOperationException("Error:UserNotLoggedIn");
        }

        if (string.IsNullOrWhiteSpace(dto.PlanId))
        {
            throw new InvalidOperationException("Error:PlanRequired");
        }

        var plan = await _db.AiBillingPlans.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == dto.PlanId && x.IsEnabled, cancellationToken);
        if (plan == null)
        {
            throw new InvalidOperationException("Error:PlanUnavailable");
        }

        var providerCode = NormalizeProviderCode(dto.ProviderCode);
        _paymentProviderRegistry.GetRequiredProvider(providerCode);

        await ValidatePlanOrderAsync(userId, plan, cancellationToken);

        var createdOrderStatus = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Created);
        var pendingOrderStatus = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Pending);
        var existingPendingOrder = await _db.AiOrders.AsNoTracking()
            .OrderByDescending(x => x.CreateDate)
            .FirstOrDefaultAsync(
                x => x.UserId == userId
                     && x.PlanId == plan.Id
                     && (x.Status == createdOrderStatus || x.Status == pendingOrderStatus),
                cancellationToken);
        if (existingPendingOrder != null)
        {
            throw new InvalidOperationException("Error:PendingOrderExists");
        }

        var price = await ResolvePlanPriceAsync(plan.Id, providerCode, cancellationToken);
        if (price == null || price.Amount <= 0)
        {
            throw new InvalidOperationException("Error:PlanPriceUnavailable");
        }

        var now = DateTime.UtcNow;
        var order = new AiOrder
        {
            Id = _guidGenerator.Create().ToString("N"),
            OrderNo = GenerateOrderNo(),
            UserId = userId,
            PlanId = plan.Id,
            OrderType = ResolveOrderType(plan.PlanType),
            RegionCode = price.RegionCode,
            CurrencyCode = price.CurrencyCode,
            Amount = price.Amount,
            Status = createdOrderStatus,
            ProviderCode = providerCode,
            Creator = userId,
            CreateDate = now,
            Updater = userId,
            UpdateDate = now
        };

        _db.AiOrders.Add(order);
        await _db.SaveChangesAsync(cancellationToken);

        return await BuildOrderDetailAsync(order.Id, userId, cancellationToken)
               ?? throw new InvalidOperationException("Error:OrderCreateReadbackFailed");
    }

    public async Task<(List<BillingOrderItemDto> List, long Total)> GetUserOrderPageAsync(long userId, string? status, int page, int limit, CancellationToken cancellationToken = default)
    {
        var query = _db.AiOrders.AsNoTracking().Where(x => x.UserId == userId);
        if (!string.IsNullOrWhiteSpace(status))
        {
            var normalizedStatus = BillingOrderStatuses.TryParse(status);
            if (normalizedStatus.HasValue)
            {
                var statusValue = BillingOrderStatuses.ToStorageValue(normalizedStatus.Value);
                query = query.Where(x => x.Status == statusValue);
            }
        }

        var total = await query.CountAsync(cancellationToken);
        var orders = await query
            .OrderByDescending(x => x.CreateDate)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        if (orders.Count == 0)
        {
            return (new List<BillingOrderItemDto>(), total);
        }

        var planIds = orders.Select(x => x.PlanId).Distinct().ToList();
        var plans = await _db.AiBillingPlans.AsNoTracking()
            .Where(x => planIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id, cancellationToken);

        var list = orders.Select(order =>
        {
            plans.TryGetValue(order.PlanId, out var plan);
            return MapOrderItem(order, plan);
        }).ToList();

        return (list, total);
    }

    public Task<BillingOrderDetailDto?> GetUserOrderDetailAsync(long userId, string orderId, CancellationToken cancellationToken = default)
    {
        return BuildOrderDetailAsync(orderId, userId, cancellationToken);
    }

    public async Task<BillingOrderPayResultDto> StartPaymentAsync(long userId, string orderId, BillingOrderPayDto dto, CancellationToken cancellationToken = default)
    {
        var order = await _db.AiOrders.FirstOrDefaultAsync(x => x.Id == orderId && x.UserId == userId, cancellationToken);
        if (order == null)
        {
            throw new InvalidOperationException("Error:OrderNotFound");
        }

        var orderStatus = BillingOrderStatuses.Parse(order.Status);
        if (orderStatus == BillingOrderStatus.Activated)
        {
            throw new InvalidOperationException("Error:OrderAlreadyActivated");
        }

        if (orderStatus == BillingOrderStatus.Cancelled)
        {
            throw new InvalidOperationException("Error:OrderCancelledCannotPay");
        }

        var providerCode = NormalizeProviderCode(dto.ProviderCode ?? order.ProviderCode);
        var provider = _paymentProviderRegistry.GetRequiredProvider(providerCode);
        var now = DateTime.UtcNow;
        var launch = await provider.CreatePaymentAsync(new BillingPaymentCreateRequest
        {
            OrderId = order.Id,
            OrderNo = order.OrderNo,
            UserId = order.UserId,
            Amount = order.Amount,
            CurrencyCode = order.CurrencyCode,
            ReturnUrl = dto.ReturnUrl
        }, cancellationToken);

        order.ProviderCode = providerCode;
        var launchedOrderStatus = BillingOrderStatuses.TryParse(launch.Status) == BillingOrderStatus.Paid
            ? BillingOrderStatus.Paid
            : BillingOrderStatus.Pending;
        order.Status = BillingOrderStatuses.ToStorageValue(launchedOrderStatus);
        order.ExternalTradeNo = launch.ExternalTradeNo ?? order.ExternalTradeNo;
        order.Updater = userId;
        order.UpdateDate = now;
        if (launchedOrderStatus == BillingOrderStatus.Paid)
        {
            order.PaidAt = now;
        }

        _db.AiPaymentTransactions.Add(new AiPaymentTransaction
        {
            Id = _guidGenerator.Create().ToString("N"),
            OrderId = order.Id,
            ProviderCode = providerCode,
            TransactionNo = launch.ExternalTradeNo,
            CallbackPayload = launch.PayloadJson,
            CallbackStatus = launch.Status,
            SignatureVerified = false,
            PaidAt = launchedOrderStatus == BillingOrderStatus.Paid ? now : null,
            CreateDate = now,
            UpdateDate = now
        });

        await _db.SaveChangesAsync(cancellationToken);

        if (launchedOrderStatus == BillingOrderStatus.Paid)
        {
            await ActivateOrderAsync(order, userId, cancellationToken);
        }

        return new BillingOrderPayResultDto
        {
            OrderId = order.Id,
            OrderNo = order.OrderNo,
            Status = order.Status,
            ProviderCode = providerCode,
            ActionType = launch.ActionType,
            PayUrl = launch.PayUrl,
            ExternalTradeNo = launch.ExternalTradeNo,
            ExpireAt = launch.ExpireAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Message = launch.Message,
            PayloadJson = launch.PayloadJson
        };
    }

    public async Task CancelOrderAsync(long userId, string orderId, CancellationToken cancellationToken = default)
    {
        var order = await _db.AiOrders.FirstOrDefaultAsync(x => x.Id == orderId && x.UserId == userId, cancellationToken);
        if (order == null)
        {
            throw new InvalidOperationException("Error:OrderNotFound");
        }

        if (!BillingOrderStatuses.CanPay(BillingOrderStatuses.Parse(order.Status)))
        {
            throw new InvalidOperationException("Error:OrderStatusCannotCancel");
        }

        var now = DateTime.UtcNow;
        order.Status = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Cancelled);
        order.CancelledAt = now;
        order.Updater = userId;
        order.UpdateDate = now;

        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task<(List<AdminBillingOrderItemDto> List, long Total)> GetAdminOrderPageAsync(string? keyword, string? status, int page, int limit, CancellationToken cancellationToken = default)
    {
        var query = _db.AiOrders.AsNoTracking().AsQueryable();
        if (!string.IsNullOrWhiteSpace(status))
        {
            var normalizedStatus = BillingOrderStatuses.TryParse(status);
            if (normalizedStatus.HasValue)
            {
                var statusValue = BillingOrderStatuses.ToStorageValue(normalizedStatus.Value);
                query = query.Where(x => x.Status == statusValue);
            }
        }

        if (!string.IsNullOrWhiteSpace(keyword))
        {
            var matchedUserIds = await _db.SysUsers.AsNoTracking()
                .Where(x => x.Username.Contains(keyword) || (x.Mobile != null && x.Mobile.Contains(keyword)))
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);
            query = query.Where(x => matchedUserIds.Contains(x.UserId)
                                     || x.OrderNo.Contains(keyword)
                                     || (x.ExternalTradeNo != null && x.ExternalTradeNo.Contains(keyword)));
        }

        var total = await query.CountAsync(cancellationToken);
        var orders = await query
            .OrderByDescending(x => x.CreateDate)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        if (orders.Count == 0)
        {
            return (new List<AdminBillingOrderItemDto>(), total);
        }

        var userIds = orders.Select(x => x.UserId).Distinct().ToList();
        var planIds = orders.Select(x => x.PlanId).Distinct().ToList();
        var users = await _db.SysUsers.AsNoTracking()
            .Where(x => userIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id, cancellationToken);
        var plans = await _db.AiBillingPlans.AsNoTracking()
            .Where(x => planIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id, cancellationToken);

        var list = orders.Select(order =>
        {
            users.TryGetValue(order.UserId, out var user);
            plans.TryGetValue(order.PlanId, out var plan);
            return MapAdminOrderItem(order, plan, user);
        }).ToList();

        return (list, total);
    }

    public async Task<BillingOrderDetailDto> MarkOrderPaidAsync(string orderId, AdminMarkOrderPaidDto dto, long operatorId, CancellationToken cancellationToken = default)
    {
        using var uow = _unitOfWorkManager.Begin(requiresNew: true, isTransactional: true);

        var order = await _db.AiOrders.FirstOrDefaultAsync(x => x.Id == orderId, cancellationToken);
        if (order == null)
        {
            throw new InvalidOperationException("Error:OrderNotFound");
        }

        var orderStatus = BillingOrderStatuses.Parse(order.Status);
        if (orderStatus == BillingOrderStatus.Cancelled)
        {
            throw new InvalidOperationException("Error:OrderCancelledCannotConfirm");
        }

        if (orderStatus != BillingOrderStatus.Activated)
        {
            var now = DateTime.UtcNow;
            var paidAt = dto.PaidAt ?? now;
            order.Status = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Paid);
            order.PaidAt = paidAt;
            order.ExternalTradeNo = string.IsNullOrWhiteSpace(dto.TransactionNo)
                ? order.ExternalTradeNo
                : dto.TransactionNo.Trim();
            order.Updater = operatorId;
            order.UpdateDate = now;

            var paymentTransaction = await _db.AiPaymentTransactions
                .OrderByDescending(x => x.CreateDate)
                .FirstOrDefaultAsync(x => x.OrderId == order.Id, cancellationToken);
            if (paymentTransaction == null)
            {
                _db.AiPaymentTransactions.Add(new AiPaymentTransaction
                {
                    Id = _guidGenerator.Create().ToString("N"),
                    OrderId = order.Id,
                    ProviderCode = order.ProviderCode,
                    TransactionNo = order.ExternalTradeNo,
                    CallbackStatus = "manual_paid",
                    SignatureVerified = true,
                    PaidAt = paidAt,
                    CallbackPayload = dto.Remark,
                    CreateDate = now,
                    UpdateDate = now
                });
            }
            else
            {
                paymentTransaction.TransactionNo = order.ExternalTradeNo;
                paymentTransaction.CallbackStatus = "manual_paid";
                paymentTransaction.SignatureVerified = true;
                paymentTransaction.PaidAt = paidAt;
                paymentTransaction.CallbackPayload = dto.Remark;
                paymentTransaction.UpdateDate = now;
            }

            await _db.SaveChangesAsync(cancellationToken);
            await ActivateOrderAsync(order, operatorId, cancellationToken);
        }

        await uow.CompleteAsync(cancellationToken);

        return await BuildOrderDetailAsync(order.Id, null, cancellationToken)
               ?? throw new InvalidOperationException("Error:OrderPaymentConfirmReadbackFailed");
    }

    private async Task ActivateOrderAsync(AiOrder order, long operatorId, CancellationToken cancellationToken)
    {
        if (BillingOrderStatuses.Parse(order.Status) == BillingOrderStatus.Activated)
        {
            return;
        }

        var plan = await _db.AiBillingPlans.FirstOrDefaultAsync(x => x.Id == order.PlanId && x.IsEnabled, cancellationToken);
        if (plan == null)
        {
            throw new InvalidOperationException("Error:OrderPlanUnavailable");
        }

        await _billingService.EnsureDefaultSubscriptionForUserAsync(order.UserId, operatorId, cancellationToken);
        var period = await _billingService.EnsureCurrentPeriodAsync(order.UserId, cancellationToken);
        if (period == null)
        {
            throw new InvalidOperationException("Error:UserPlanInactive");
        }

        var now = DateTime.UtcNow;
        var addedTokens = plan.IncludedTokens + plan.BonusTokens;

        if (order.OrderType == "topup")
        {
            period.PurchasedTokens += addedTokens;
            period.RemainingTokens += addedTokens;
            period.ExhaustedAt = null;
            period.LowBalanceWarnedAt = null;
            period.UpdateDate = now;

            _db.AiTokenLedgers.Add(new AiTokenLedger
            {
                Id = _guidGenerator.Create().ToString("N"),
                UserId = order.UserId,
                PeriodId = period.Id,
                ChangeType = "purchase",
                DeltaTokens = addedTokens,
                BalanceAfter = period.RemainingTokens,
                OrderId = order.Id,
                OperatorId = operatorId,
                Remark = $"订单激活：{order.OrderNo}",
                CreateDate = now
            });
        }
        else
        {
            var activeSubscriptionStatus = BillingSubscriptionStatuses.ToStorageValue(BillingSubscriptionStatus.Active);
            var subscription = await _db.AiUserSubscriptions
                .OrderByDescending(x => x.CreateDate)
                .FirstOrDefaultAsync(x => x.UserId == order.UserId && x.Status == activeSubscriptionStatus, cancellationToken);
            if (subscription == null)
            {
                throw new InvalidOperationException("Error:UserNoUpgradeableSubscription");
            }

            var currentPlan = await _db.AiBillingPlans.FirstOrDefaultAsync(x => x.Id == subscription.PlanId, cancellationToken);
            var currentIncludedTokens = currentPlan?.IncludedTokens ?? 0;
            var currentBonusTokens = currentPlan?.BonusTokens ?? 0;
            var includedDelta = Math.Max(0, plan.IncludedTokens - currentIncludedTokens);
            var bonusDelta = Math.Max(0, plan.BonusTokens - currentBonusTokens);
            var totalDelta = includedDelta + bonusDelta;

            subscription.PlanId = plan.Id;
            subscription.Source = "order";
            subscription.LastOrderId = order.Id;
            subscription.AutoRenew = true;
            subscription.Updater = operatorId;
            subscription.UpdateDate = now;
            subscription.EndAt = period.PeriodEndAt;
            subscription.NextRenewAt = period.PeriodEndAt;

            period.PlanTokens += includedDelta;
            period.GiftedTokens += bonusDelta;
            period.RemainingTokens += totalDelta;
            period.ExhaustedAt = null;
            if (totalDelta > 0)
            {
                period.LowBalanceWarnedAt = null;
            }
            period.UpdateDate = now;

            if (totalDelta > 0)
            {
                _db.AiTokenLedgers.Add(new AiTokenLedger
                {
                    Id = _guidGenerator.Create().ToString("N"),
                    UserId = order.UserId,
                    PeriodId = period.Id,
                    ChangeType = "purchase",
                    DeltaTokens = totalDelta,
                    BalanceAfter = period.RemainingTokens,
                    OrderId = order.Id,
                    OperatorId = operatorId,
                    Remark = $"套餐升级：{order.OrderNo}",
                    CreateDate = now
                });
            }
        }

        order.Status = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Activated);
        order.ActivatedAt = now;
        order.PaidAt ??= now;
        order.Updater = operatorId;
        order.UpdateDate = now;

        await _db.SaveChangesAsync(cancellationToken);
    }

    private async Task ValidatePlanOrderAsync(long userId, AiBillingPlan plan, CancellationToken cancellationToken)
    {
        if (!string.Equals(plan.PlanType, "monthly", StringComparison.OrdinalIgnoreCase))
        {
            return;
        }

        await _billingService.EnsureDefaultSubscriptionForUserAsync(userId, userId, cancellationToken);
        var activeSubscriptionStatus = BillingSubscriptionStatuses.ToStorageValue(BillingSubscriptionStatus.Active);
        var subscription = await _db.AiUserSubscriptions.AsNoTracking()
            .OrderByDescending(x => x.CreateDate)
            .FirstOrDefaultAsync(x => x.UserId == userId && x.Status == activeSubscriptionStatus, cancellationToken);
        if (subscription == null)
        {
            return;
        }

        if (string.Equals(subscription.PlanId, plan.Id, StringComparison.OrdinalIgnoreCase))
        {
            throw new InvalidOperationException("Error:SameMonthEarlyRenewalUnsupported");
        }

        var currentPlan = await _db.AiBillingPlans.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == subscription.PlanId, cancellationToken);
        if (currentPlan == null)
        {
            return;
        }

        var currentPlanTokens = currentPlan.IncludedTokens + currentPlan.BonusTokens;
        var nextPlanTokens = plan.IncludedTokens + plan.BonusTokens;
        if (nextPlanTokens < currentPlanTokens)
        {
            throw new InvalidOperationException("Error:PlanDowngradeUnsupported");
        }
    }

    private async Task<AiBillingPlanPrice?> ResolvePlanPriceAsync(string planId, string providerCode, CancellationToken cancellationToken)
    {
        var prices = await _db.AiBillingPlanPrices.AsNoTracking()
            .Where(x => x.PlanId == planId && x.IsEnabled)
            .OrderByDescending(x => x.ProviderCode == providerCode)
            .ThenBy(x => x.Amount)
            .ToListAsync(cancellationToken);

        return prices.FirstOrDefault(x => string.Equals(x.ProviderCode, providerCode, StringComparison.OrdinalIgnoreCase))
               ?? prices.FirstOrDefault();
    }

    private async Task<BillingOrderDetailDto?> BuildOrderDetailAsync(string orderId, long? userId, CancellationToken cancellationToken)
    {
        var orderQuery = _db.AiOrders.AsNoTracking().AsQueryable();
        orderQuery = userId.HasValue
            ? orderQuery.Where(x => x.Id == orderId && x.UserId == userId.Value)
            : orderQuery.Where(x => x.Id == orderId);

        var order = await orderQuery.FirstOrDefaultAsync(cancellationToken);
        if (order == null)
        {
            return null;
        }

        var plan = await _db.AiBillingPlans.AsNoTracking().FirstOrDefaultAsync(x => x.Id == order.PlanId, cancellationToken);
        var payment = await _db.AiPaymentTransactions.AsNoTracking()
            .OrderByDescending(x => x.CreateDate)
            .FirstOrDefaultAsync(x => x.OrderId == order.Id, cancellationToken);

        var baseItem = MapOrderItem(order, plan);
        return new BillingOrderDetailDto
        {
            Id = baseItem.Id,
            OrderNo = baseItem.OrderNo,
            PlanId = baseItem.PlanId,
            PlanCode = baseItem.PlanCode,
            PlanName = baseItem.PlanName,
            OrderType = baseItem.OrderType,
            ProviderCode = baseItem.ProviderCode,
            RegionCode = order.RegionCode,
            CurrencyCode = baseItem.CurrencyCode,
            Amount = baseItem.Amount,
            GrantedTokens = baseItem.GrantedTokens,
            Status = baseItem.Status,
            ExternalTradeNo = baseItem.ExternalTradeNo,
            PaidAt = baseItem.PaidAt,
            ActivatedAt = baseItem.ActivatedAt,
            CancelledAt = order.CancelledAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            CreateDate = baseItem.CreateDate,
            LatestTransactionNo = payment?.TransactionNo,
            LatestPaymentStatus = payment?.CallbackStatus,
            CanPay = BillingOrderStatuses.CanPay(BillingOrderStatuses.Parse(order.Status)),
            CanCancel = BillingOrderStatuses.CanPay(BillingOrderStatuses.Parse(order.Status))
        };
    }

    private static BillingOrderItemDto MapOrderItem(AiOrder order, AiBillingPlan? plan)
    {
        return new BillingOrderItemDto
        {
            Id = order.Id,
            OrderNo = order.OrderNo,
            PlanId = order.PlanId,
            PlanCode = plan?.Code,
            PlanName = plan?.Name,
            OrderType = order.OrderType,
            ProviderCode = order.ProviderCode,
            CurrencyCode = order.CurrencyCode,
            Amount = order.Amount,
            GrantedTokens = (plan?.IncludedTokens ?? 0) + (plan?.BonusTokens ?? 0),
            Status = order.Status,
            ExternalTradeNo = order.ExternalTradeNo,
            PaidAt = order.PaidAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            ActivatedAt = order.ActivatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            CreateDate = order.CreateDate?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static AdminBillingOrderItemDto MapAdminOrderItem(AiOrder order, AiBillingPlan? plan, SysUser? user)
    {
        return new AdminBillingOrderItemDto
        {
            Id = order.Id,
            OrderNo = order.OrderNo,
            UserId = order.UserId,
            Username = user?.Username,
            Mobile = user?.Mobile,
            PlanId = order.PlanId,
            PlanCode = plan?.Code,
            PlanName = plan?.Name,
            OrderType = order.OrderType,
            ProviderCode = order.ProviderCode,
            CurrencyCode = order.CurrencyCode,
            Amount = order.Amount,
            GrantedTokens = (plan?.IncludedTokens ?? 0) + (plan?.BonusTokens ?? 0),
            Status = order.Status,
            ExternalTradeNo = order.ExternalTradeNo,
            PaidAt = order.PaidAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            ActivatedAt = order.ActivatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            CreateDate = order.CreateDate?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static string NormalizeProviderCode(string? providerCode)
    {
        return string.IsNullOrWhiteSpace(providerCode) ? "demo" : providerCode.Trim().ToLowerInvariant();
    }

    private static string ResolveOrderType(string planType)
    {
        return string.Equals(planType, "topup", StringComparison.OrdinalIgnoreCase) ? "topup" : "subscription";
    }

    private static string GenerateOrderNo()
    {
        return $"BO{DateTime.UtcNow:yyyyMMddHHmmssfff}{Random.Shared.Next(100, 1000)}";
    }
}
