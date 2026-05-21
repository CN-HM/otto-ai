using System.Text.Json.Serialization;
using AiAdmin.Infrastructure;

namespace AiAdmin.Entities;

[JsonConverter(typeof(JsonStringEnumConverter<ProviderType>))]
public enum ProviderType
{
    Ark = 1,
    DoubaoSpeech = 2,
    DashScope = 3
}

public static class ProviderTypeConverter
{
    public static string ToStorageValue(ProviderType providerType)
    {
        return providerType switch
        {
            ProviderType.Ark => "ark",
            ProviderType.DoubaoSpeech => "doubao_speech",
            ProviderType.DashScope => "dashscope",
            _ => throw new LocalizedBusinessException("Error:UnsupportedProviderType", ("providerType", providerType))
        };
    }

    public static ProviderType Parse(string? value)
    {
        var normalized = value?.Trim();
        if (string.IsNullOrWhiteSpace(normalized))
            throw new InvalidOperationException("Error:ProviderTypeRequired");

        return normalized.ToLowerInvariant() switch
        {
            "ark" => ProviderType.Ark,
            "doubao_speech" or "doubaospeech" => ProviderType.DoubaoSpeech,
            "dashscope" => ProviderType.DashScope,
            _ => throw new LocalizedBusinessException("Error:UnsupportedProviderType", ("providerType", normalized))
        };
    }

    public static bool TryParse(string? value, out ProviderType providerType)
    {
        try
        {
            providerType = Parse(value);
            return true;
        }
        catch (InvalidOperationException)
        {
            providerType = default;
            return false;
        }
    }
}
