using System.Text.Json.Serialization;

namespace AiAdmin.Services.Runtime;

[JsonConverter(typeof(JsonStringEnumConverter<PipelineStageType>))]
public enum PipelineStageType
{
    Vad = 1,
    Asr = 2,
    Llm = 3,
    Tts = 4
}

public static class PipelineStageTypeConverter
{
    public static readonly PipelineStageType[] ConversationStages =
    [
        PipelineStageType.Vad,
        PipelineStageType.Asr,
        PipelineStageType.Llm,
        PipelineStageType.Tts
    ];

    public static string ToStorageValue(PipelineStageType stage)
    {
        return stage switch
        {
            PipelineStageType.Vad => "vad",
            PipelineStageType.Asr => "asr",
            PipelineStageType.Llm => "llm",
            PipelineStageType.Tts => "tts",
            _ => throw new InvalidOperationException($"不支持的 PipelineStageType：{stage}")
        };
    }

    public static string ToLabel(PipelineStageType stage)
    {
        return stage switch
        {
            PipelineStageType.Vad => "VAD",
            PipelineStageType.Asr => "ASR",
            PipelineStageType.Llm => "LLM",
            PipelineStageType.Tts => "TTS",
            _ => throw new InvalidOperationException($"不支持的 PipelineStageType：{stage}")
        };
    }

    public static string ToCloudNodeValue(PipelineStageType stage)
    {
        return stage switch
        {
            PipelineStageType.Vad => "cloud_vad",
            PipelineStageType.Asr => "cloud_asr",
            PipelineStageType.Llm => "cloud_llm",
            PipelineStageType.Tts => "cloud_tts",
            _ => throw new InvalidOperationException($"不支持的 PipelineStageType：{stage}")
        };
    }

    public static PipelineStageType Parse(string? value)
    {
        var normalized = value?.Trim();
        if (string.IsNullOrWhiteSpace(normalized))
            throw new InvalidOperationException("PipelineStageType 不能为空");

        return normalized.ToLowerInvariant() switch
        {
            "vad" or "cloud_vad" => PipelineStageType.Vad,
            "asr" or "cloud_asr" => PipelineStageType.Asr,
            "llm" or "cloud_llm" => PipelineStageType.Llm,
            "tts" or "cloud_tts" => PipelineStageType.Tts,
            _ => throw new InvalidOperationException($"不支持的 PipelineStageType：{normalized}")
        };
    }

    public static bool TryParse(string? value, out PipelineStageType stage)
    {
        try
        {
            stage = Parse(value);
            return true;
        }
        catch (InvalidOperationException)
        {
            stage = default;
            return false;
        }
    }
}
