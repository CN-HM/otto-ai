using System.Text.Json.Serialization;
using AiAdmin.Infrastructure;

namespace AiAdmin.Entities;

[JsonConverter(typeof(JsonStringEnumConverter<ProviderScope>))]
public enum ProviderScope
{
    Asr = 1,
    Tts = 2,
    Llm = 3,
    Emb = 4
}

public static class ProviderScopeConverter
{
    public static string ToStorageValue(ProviderScope scope)
    {
        return scope switch
        {
            ProviderScope.Asr => "asr",
            ProviderScope.Tts => "tts",
            ProviderScope.Llm => "llm",
            ProviderScope.Emb => "mem",
            _ => throw new LocalizedBusinessException("Error:UnsupportedProviderScope", ("scope", scope))
        };
    }

    public static string ToLabel(ProviderScope scope)
    {
        return scope switch
        {
            ProviderScope.Asr => "ASR",
            ProviderScope.Tts => "TTS",
            ProviderScope.Llm => "LLM",
            ProviderScope.Emb => "Emb",
            _ => throw new LocalizedBusinessException("Error:UnsupportedProviderScope", ("scope", scope))
        };
    }

    public static ProviderScope Parse(string? value)
    {
        var normalized = value?.Trim();
        if (string.IsNullOrWhiteSpace(normalized))
            throw new InvalidOperationException("Error:ProviderScopeRequired");

        return normalized.ToLowerInvariant() switch
        {
            "asr" => ProviderScope.Asr,
            "tts" => ProviderScope.Tts,
            "llm" => ProviderScope.Llm,
            "mem" or "embedding" => ProviderScope.Emb,
            _ => throw new LocalizedBusinessException("Error:UnsupportedProviderScope", ("scope", normalized))
        };
    }

    public static ProviderScope? ParseOptional(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : Parse(normalized);
    }
}
