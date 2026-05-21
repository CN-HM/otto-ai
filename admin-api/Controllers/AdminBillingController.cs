using AiAdmin.Infrastructure;
using AiAdmin.Services.Billing;
using AiAdmin.Services.Billing.Dtos;
using AiAdmin.Services.Billing.Orders;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/billing")]
[Authorize]
public class AdminBillingController : AiAdminBaseController
{
    private readonly BillingService _billingService;
    private readonly BillingOrderService _billingOrderService;

    public AdminBillingController(BillingService billingService, BillingOrderService billingOrderService)
    {
        _billingService = billingService;
        _billingOrderService = billingOrderService;
    }

    [HttpGet("plans")]
    [RequirePermission("billing-plan:list")]
    public async Task<Result<List<BillingPlanItemDto>>> GetPlans(CancellationToken cancellationToken)
    {
        var plans = await _billingService.GetPlanListAsync(cancellationToken);
        return Result<List<BillingPlanItemDto>>.Ok(plans);
    }

    [HttpGet("subscriptions")]
    [RequirePermission("billing-subscription:list")]
    public async Task<Result<PageData<AdminBillingSubscriptionItemDto>>> GetSubscriptions(
        [FromQuery] string? mobile,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10,
        CancellationToken cancellationToken = default)
    {
        var (list, total) = await _billingService.GetAdminSubscriptionPageAsync(mobile, page, limit, cancellationToken);
        return Result.Page(list, total);
    }

    [HttpGet("usage")]
    [RequirePermission("billing-usage:list")]
    public async Task<Result<PageData<AdminBillingUsageItemDto>>> GetUsage(
        [FromQuery] string? keyword,
        [FromQuery] string? serviceType,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10,
        CancellationToken cancellationToken = default)
    {
        var (list, total) = await _billingService.GetAdminUsagePageAsync(keyword, serviceType, page, limit, cancellationToken);
        return Result.Page(list, total);
    }

    [HttpGet("users/{userId}/summary")]
    [RequirePermission("billing-subscription:list")]
    public async Task<Result<BillingSummaryDto>> GetUserSummary(long userId, CancellationToken cancellationToken)
    {
        var summary = await _billingService.GetUserSummaryAsync(userId, cancellationToken);
        if (summary == null)
        {
            return Result<BillingSummaryDto>.Error("用户订阅信息不存在");
        }

        return Result<BillingSummaryDto>.Ok(summary);
    }

    [HttpPost("users/{userId}/grant-tokens")]
    [RequirePermission("billing-subscription:manual-adjust")]
    public async Task<Result<object>> GrantTokens(long userId, [FromBody] ManualGrantTokensDto dto, CancellationToken cancellationToken)
    {
        await _billingService.GrantTokensAsync(userId, dto.Tokens, dto.Remark, CurrentUserId, cancellationToken);
        return Result<object>.Ok();
    }

    [HttpGet("orders")]
    [RequirePermission("billing-order:list")]
    public async Task<Result<PageData<AdminBillingOrderItemDto>>> GetOrders(
        [FromQuery] string? keyword,
        [FromQuery] string? status,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10,
        CancellationToken cancellationToken = default)
    {
        var (list, total) = await _billingOrderService.GetAdminOrderPageAsync(keyword, status, page, limit, cancellationToken);
        return Result.Page(list, total);
    }

    [HttpPost("orders/{id}/mark-paid")]
    [RequirePermission("billing-order:mark-paid")]
    public async Task<Result<BillingOrderDetailDto>> MarkOrderPaid(string id, [FromBody] AdminMarkOrderPaidDto dto, CancellationToken cancellationToken)
    {
        var result = await _billingOrderService.MarkOrderPaidAsync(id, dto, CurrentUserId, cancellationToken);
        return Result<BillingOrderDetailDto>.Ok(result);
    }
}
