using AiAdmin.Infrastructure;

namespace AiAdmin.Services.BindingConfigs;

public static class BindingConfigKinds
{
    public const string Integration = "integration";
    public const string Asr = "asr";
    public const string Vad = "vad";
    public const string Llm = "llm";
    public const string Tts = "tts";
    public const string Embedding = "embedding";

    public static readonly string[] All = [Integration, Asr, Vad, Llm, Tts, Embedding];

    public static string Normalize(string kind)
    {
        var normalized = kind.Trim().ToLowerInvariant();
        if (All.Contains(normalized))
        {
            return normalized;
        }

        throw new LocalizedBusinessException("Error:UnsupportedBindingConfigKind", ("kind", kind));
    }
}
