using System.Text.Json;
using AiAdmin.Services.Billing;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Billing.Payments;

public class EcpayBillingPaymentProvider : IBillingPaymentProvider, ITransientDependency
{
    public string ProviderCode => "ecpay";

    public Task<BillingPaymentLaunchResult> CreatePaymentAsync(BillingPaymentCreateRequest request, CancellationToken cancellationToken = default)
    {
        var expireAt = DateTime.UtcNow.AddMinutes(30);
        var payload = new Dictionary<string, object?>
        {
            ["provider"] = ProviderCode,
            ["orderId"] = request.OrderId,
            ["orderNo"] = request.OrderNo,
            ["amount"] = request.Amount,
            ["currencyCode"] = request.CurrencyCode,
            ["returnUrl"] = request.ReturnUrl,
            ["mode"] = "placeholder"
        };

        return Task.FromResult(new BillingPaymentLaunchResult
        {
            ProviderCode = ProviderCode,
            Status = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Pending),
            ActionType = "placeholder",
            ExternalTradeNo = $"ECPAY-{request.OrderNo}",
            ExpireAt = expireAt,
            Message = "Error:EcpayMockPaymentOnly",
            PayloadJson = JsonSerializer.Serialize(payload)
        });
    }
}
