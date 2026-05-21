namespace AiAdmin.Services.Runtime.Execution;

using AiAdmin.Entities;

public class ProviderAdapterMatch
{
    public bool IsMatch { get; init; }
    public string ResolutionMode { get; init; } = "unresolved";
    public string? ResolutionDetail { get; init; }

    public static ProviderAdapterMatch None()
    {
        return new ProviderAdapterMatch();
    }

    public static ProviderAdapterMatch ByProviderFamily(string? providerFamily)
    {
        return Create("provider_family", providerFamily);
    }

    public static ProviderAdapterMatch ByProviderCode(string? providerCode)
    {
        return Create("provider_code", providerCode);
    }

    public static ProviderAdapterMatch ByProviderType(ProviderType providerType)
    {
        return Create("provider_type", ProviderTypeConverter.ToStorageValue(providerType));
    }

    public static ProviderAdapterMatch ByCapabilityTag(string? capabilityTag)
    {
        return Create("capability_tag", capabilityTag);
    }

    public static ProviderAdapterMatch ByFallback(string? detail)
    {
        return Create("fallback", detail);
    }

    private static ProviderAdapterMatch Create(string resolutionMode, string? resolutionDetail)
    {
        return new ProviderAdapterMatch
        {
            IsMatch = true,
            ResolutionMode = resolutionMode,
            ResolutionDetail = NormalizeValue(resolutionDetail)
        };
    }

    private static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
