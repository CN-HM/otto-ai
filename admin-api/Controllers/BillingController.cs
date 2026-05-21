using AiAdmin.Infrastructure;
using AiAdmin.Services.Billing;
using AiAdmin.Services.Billing.Dtos;
using AiAdmin.Services.Billing.Orders;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("/billing")]
public class BillingController : AiAdminBaseController
{
    private readonly BillingService _billingService;
    private readonly BillingOrderService _billingOrderService;

    public BillingController(BillingService billingService, BillingOrderService billingOrderService)
    {
        _billingService = billingService;
        _billingOrderService = billingOrderService;
    }

    [HttpGet("me/summary")]
    [Authorize]
    public async Task<Result<BillingSummaryDto>> GetMySummary(CancellationToken cancellationToken)
    {
        var summary = await _billingService.GetUserSummaryAsync(CurrentUserId, cancellationToken);
        if (summary == null)
        {
            return Result<BillingSummaryDto>.Error("用户订阅信息不存在");
        }

        return Result<BillingSummaryDto>.Ok(summary);
    }

    [HttpGet("plans")]
    [Authorize]
    public async Task<Result<List<BillingPlanItemDto>>> GetPlans(CancellationToken cancellationToken)
    {
        var plans = await _billingService.GetPlanListAsync(cancellationToken);
        return Result<List<BillingPlanItemDto>>.Ok(plans);
    }

    [HttpPost("orders")]
    [Authorize]
    public async Task<Result<BillingOrderDetailDto>> CreateOrder([FromBody] CreateBillingOrderDto dto, CancellationToken cancellationToken)
    {
        var result = await _billingOrderService.CreateOrderAsync(CurrentUserId, dto, cancellationToken);
        return Result<BillingOrderDetailDto>.Ok(result);
    }

    [HttpGet("orders")]
    [Authorize]
    public async Task<Result<PageData<BillingOrderItemDto>>> GetOrders(
        [FromQuery] string? status,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10,
        CancellationToken cancellationToken = default)
    {
        var (list, total) = await _billingOrderService.GetUserOrderPageAsync(CurrentUserId, status, page, limit, cancellationToken);
        return Result.Page(list, total);
    }

    [HttpGet("orders/{id}")]
    [Authorize]
    public async Task<Result<BillingOrderDetailDto>> GetOrderDetail(string id, CancellationToken cancellationToken)
    {
        var order = await _billingOrderService.GetUserOrderDetailAsync(CurrentUserId, id, cancellationToken);
        if (order == null)
        {
            return Result<BillingOrderDetailDto>.Error("Error:OrderNotFound");
        }

        return Result<BillingOrderDetailDto>.Ok(order);
    }

    [HttpPost("orders/{id}/pay")]
    [Authorize]
    public async Task<Result<BillingOrderPayResultDto>> PayOrder(string id, [FromBody] BillingOrderPayDto dto, CancellationToken cancellationToken)
    {
        var result = await _billingOrderService.StartPaymentAsync(CurrentUserId, id, dto, cancellationToken);
        return Result<BillingOrderPayResultDto>.Ok(result);
    }

    [HttpPost("orders/{id}/cancel")]
    [Authorize]
    public async Task<Result<object>> CancelOrder(string id, CancellationToken cancellationToken)
    {
        await _billingOrderService.CancelOrderAsync(CurrentUserId, id, cancellationToken);
        return Result<object>.Ok();
    }

    [HttpPost("usage/report")]
    [ServiceAuth]
    public async Task<Result<BillingUsageReportResultDto>> ReportUsage([FromBody] BillingUsageReportDto dto, CancellationToken cancellationToken)
    {
        var result = await _billingService.ReportUsageAsync(dto, cancellationToken);
        return Result<BillingUsageReportResultDto>.Ok(result);
    }
}
