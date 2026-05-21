namespace AiAdmin.Services.Billing.Payments;

public class BillingPaymentCreateRequest
{
    public string OrderId { get; set; } = string.Empty;
    public string OrderNo { get; set; } = string.Empty;
    public long UserId { get; set; }
    public decimal Amount { get; set; }
    public string CurrencyCode { get; set; } = "DEMO";
    public string? ReturnUrl { get; set; }
}


