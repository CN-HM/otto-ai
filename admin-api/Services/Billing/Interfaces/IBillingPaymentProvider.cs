namespace AiAdmin.Services.Billing.Payments;

public interface IBillingPaymentProvider
{
    string ProviderCode { get; }

    Task<BillingPaymentLaunchResult> CreatePaymentAsync(BillingPaymentCreateRequest request, CancellationToken cancellationToken = default);
}
