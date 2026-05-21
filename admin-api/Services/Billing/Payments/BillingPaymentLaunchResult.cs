using AiAdmin.Services.Billing;

namespace AiAdmin.Services.Billing.Payments;

public class BillingPaymentLaunchResult
{
    public string ProviderCode { get; set; } = string.Empty;
    public string Status { get; set; } = BillingOrderStatuses.ToStorageValue(BillingOrderStatus.Pending);
    public string? ActionType { get; set; }
    public string? PayUrl { get; set; }
    public string? ExternalTradeNo { get; set; }
    public DateTime? ExpireAt { get; set; }
    public string? Message { get; set; }
    public string? PayloadJson { get; set; }
}

