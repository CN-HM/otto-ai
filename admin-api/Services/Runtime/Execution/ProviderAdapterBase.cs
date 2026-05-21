namespace AiAdmin.Services.Runtime.Execution;

using AiAdmin.Entities;

public abstract class ProviderAdapterBase
{
    protected static ProviderAdapterMatch MatchByProviderType(ProviderType? providerType, params ProviderType[] supportedTypes)
    {
        if (providerType.HasValue && supportedTypes.Contains(providerType.Value))
        {
            return ProviderAdapterMatch.ByProviderType(providerType.Value);
        }

        return ProviderAdapterMatch.None();
    }

    protected static ProviderAdapterMatch MatchByProviderFamily(string? providerFamily, params string[] supportedFamilies)
    {
        var normalized = NormalizeValue(providerFamily);
        if (!string.IsNullOrWhiteSpace(normalized)
            && supportedFamilies.Any(x => string.Equals(x, normalized, StringComparison.OrdinalIgnoreCase)))
        {
            return ProviderAdapterMatch.ByProviderFamily(normalized);
        }

        return ProviderAdapterMatch.None();
    }

    protected static ProviderAdapterMatch MatchByProviderCode(string? providerCode, params string[] supportedCodes)
    {
        var normalized = NormalizeValue(providerCode);
        if (!string.IsNullOrWhiteSpace(normalized)
            && supportedCodes.Any(x => string.Equals(x, normalized, StringComparison.OrdinalIgnoreCase)))
        {
            return ProviderAdapterMatch.ByProviderCode(normalized);
        }

        return ProviderAdapterMatch.None();
    }

    protected static ProviderAdapterMatch MatchByCapabilityTag(IEnumerable<string>? capabilityTags, params string[] supportedTags)
    {
        if (capabilityTags == null)
            return ProviderAdapterMatch.None();

        var matchedTag = capabilityTags.FirstOrDefault(tag => supportedTags.Any(x => string.Equals(x, tag, StringComparison.OrdinalIgnoreCase)));
        return string.IsNullOrWhiteSpace(matchedTag)
            ? ProviderAdapterMatch.None()
            : ProviderAdapterMatch.ByCapabilityTag(matchedTag);
    }

    protected static ProviderAdapterMatch FirstMatch(params ProviderAdapterMatch[] matches)
    {
        return matches.FirstOrDefault(x => x.IsMatch) ?? ProviderAdapterMatch.None();
    }

    protected static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
