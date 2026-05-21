using AiAdmin.Infrastructure;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Billing.Payments;

public class BillingPaymentProviderRegistry : ITransientDependency
{
    private readonly Dictionary<string, IBillingPaymentProvider> _providers;

    public BillingPaymentProviderRegistry(IEnumerable<IBillingPaymentProvider> providers)
    {
        _providers = providers.ToDictionary(x => x.ProviderCode, StringComparer.OrdinalIgnoreCase);
    }

    public IBillingPaymentProvider GetRequiredProvider(string providerCode)
    {
        if (string.IsNullOrWhiteSpace(providerCode))
        {
            throw new InvalidOperationException("Error:PaymentProviderRequired");
        }

        if (_providers.TryGetValue(providerCode, out var provider))
        {
            return provider;
        }

        throw new LocalizedBusinessException("Error:PaymentProviderNotFound", ("providerCode", providerCode));
    }
}
