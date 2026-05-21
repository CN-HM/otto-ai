using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Orchestration;

namespace AiAdmin.Services.Runtime.Execution;

internal sealed class DoubaoAsrExecutionOptions
{
    public required string WsUrl { get; init; }
    public required string ResourceId { get; init; }
    public string? ApiKey { get; init; }
    public string? AppId { get; init; }
    public string? AccessToken { get; init; }
    public string AudioFormat { get; init; } = "wav";
    public string Codec { get; init; } = "raw";
    public int SampleRate { get; init; } = 16000;
    public int Bits { get; init; } = 16;
    public int Channels { get; init; } = 1;
    public int ChunkDurationMs { get; init; } = 200;
    public int ChunkSizeBytes { get; init; } = 8192;
    public string? Language { get; init; }
    public string? Context { get; init; }
    public JsonObject RequestOptions { get; init; } = new();
}

internal sealed class DoubaoTtsExecutionOptions
{
    public required string WsUrl { get; init; }
    public string ResourceId { get; init; } = "seed-tts-2.0";
    public string? ApiKey { get; init; }
    public string? AppId { get; init; }
    public string? AccessToken { get; init; }
    public required string VoiceType { get; init; }
    public string Encoding { get; init; } = "mp3";
    public int SampleRate { get; init; } = 24000;
    public int? BitRate { get; init; }
    public int? SpeechRate { get; init; }
    public int? LoudnessRate { get; init; }
    public string? UsageReturn { get; init; }
    public JsonObject AudioOptionFields { get; init; } = new();
    public JsonObject ReqParamFields { get; init; } = new();
    public JsonObject Additions { get; init; } = new();
}

internal static class DoubaoSpeechExecutionOptionsBinder
{
    public static DoubaoAsrExecutionOptions BindAsr(JsonObject? config)
    {
        var requestOptions = new JsonObject();
        CopyBool(config, requestOptions, "enable_nonstream");
        CopyBool(config, requestOptions, "enable_itn");
        CopyBool(config, requestOptions, "enable_punc");
        CopyBool(config, requestOptions, "enable_ddc");
        CopyBool(config, requestOptions, "show_utterances");
        CopyBool(config, requestOptions, "show_speech_rate");
        CopyBool(config, requestOptions, "show_volume");
        CopyBool(config, requestOptions, "enable_lid");
        CopyBool(config, requestOptions, "enable_emotion_detection");
        CopyBool(config, requestOptions, "enable_gender_detection");
        CopyBool(config, requestOptions, "enable_accelerate_text");
        CopyString(config, requestOptions, "result_type");
        CopyString(config, requestOptions, "ssd_version");
        CopyString(config, requestOptions, "output_zh_variant");
        CopyInt(config, requestOptions, "accelerate_score");
        CopyInt(config, requestOptions, "vad_segment_duration");
        CopyInt(config, requestOptions, "end_window_size");
        CopyInt(config, requestOptions, "force_to_speech_time");
        CopyString(config, requestOptions, "sensitive_words_filter");

        return new DoubaoAsrExecutionOptions
        {
            WsUrl = RequireString(config, "豆包 ASR 模型配置缺少 ws_url", "ws_url", "wsUrl"),
            ResourceId = RequireString(config, "豆包 ASR 模型配置缺少 resource_id", "resource_id"),
            ApiKey = ExecutionJsonHelper.GetString(config, "api_key", "x_api_key", "x-api-key"),
            AppId = ExecutionJsonHelper.GetString(config, "appid"),
            AccessToken = ExecutionJsonHelper.GetString(config, "access_token"),
            AudioFormat = ExecutionJsonHelper.GetString(config, "audio_format", "format") ?? "wav",
            Codec = ExecutionJsonHelper.GetString(config, "codec") ?? "raw",
            SampleRate = ExecutionJsonHelper.GetInt(config, "sample_rate", "rate") ?? 16000,
            Bits = ExecutionJsonHelper.GetInt(config, "bits") ?? 16,
            Channels = ExecutionJsonHelper.GetInt(config, "channels", "channel") ?? 1,
            ChunkDurationMs = ExecutionJsonHelper.GetInt(config, "chunk_duration_ms") ?? 200,
            ChunkSizeBytes = ExecutionJsonHelper.GetInt(config, "chunk_size_bytes") ?? 8192,
            Language = ExecutionJsonHelper.GetString(config, "language"),
            Context = ExecutionJsonHelper.GetString(config, "context"),
            RequestOptions = requestOptions
        };
    }

    public static DoubaoTtsExecutionOptions BindTts(
        JsonObject? config,
        string? requestedVoice = null,
        string? requestedEncoding = null,
        double? requestedSpeed = null,
        IReadOnlyDictionary<string, object?>? overrideOptions = null)
    {
        var overrideConfig = BuildOverrideConfig(overrideOptions);
        var audioOptionFields = new JsonObject();
        CopyBool(config, audioOptionFields, "enable_timestamp");
        CopyBool(config, audioOptionFields, "enable_subtitle");
        CopyString(config, audioOptionFields, "emotion");
        CopyInt(config, audioOptionFields, "emotion_scale");
        CopyBool(overrideConfig, audioOptionFields, "enable_timestamp");
        CopyBool(overrideConfig, audioOptionFields, "enable_subtitle");
        CopyString(overrideConfig, audioOptionFields, "emotion");
        CopyInt(overrideConfig, audioOptionFields, "emotion_scale");

        var reqParamFields = new JsonObject();
        CopyNode(config, reqParamFields, "mix_speaker");
        CopyString(overrideConfig, reqParamFields, "model");
        CopyNode(overrideConfig, reqParamFields, "mix_speaker");

        var additions = new JsonObject();
        CopyAdditions(config, additions, "enable_language_detector");
        CopyAdditions(config, additions, "disable_markdown_filter");
        CopyAdditions(config, additions, "disable_emoji_filter");
        CopyAdditions(config, additions, "explicit_language");
        CopyAdditions(config, additions, "context_language");
        CopyAdditions(config, additions, "explicit_dialect");
        CopyAdditions(config, additions, "cache_config");
        CopyAdditions(config, additions, "post_process");
        CopyAdditions(config, additions, "context_texts");
        CopyAdditions(config, additions, "section_id");
        CopyAdditions(config, additions, "use_tag_parser");
        CopyAdditions(overrideConfig, additions, "enable_language_detector");
        CopyAdditions(overrideConfig, additions, "disable_markdown_filter");
        CopyAdditions(overrideConfig, additions, "disable_emoji_filter");
        CopyAdditions(overrideConfig, additions, "explicit_language");
        CopyAdditions(overrideConfig, additions, "context_language");
        CopyAdditions(overrideConfig, additions, "explicit_dialect");
        CopyAdditions(overrideConfig, additions, "cache_config");
        CopyAdditions(overrideConfig, additions, "post_process");
        CopyAdditions(overrideConfig, additions, "context_texts");
        CopyAdditions(overrideConfig, additions, "section_id");
        CopyAdditions(overrideConfig, additions, "use_tag_parser");
        MergeAdditionsObject(overrideConfig, additions);

        return new DoubaoTtsExecutionOptions
        {
            WsUrl = RequireString(config, "豆包 TTS 模型配置缺少 ws_url", "ws_url", "wsUrl"),
            ResourceId = ExecutionJsonHelper.GetString(overrideConfig, "resource_id")
                ?? ExecutionJsonHelper.GetString(config, "resource_id")
                ?? "seed-tts-2.0",
            ApiKey = ExecutionJsonHelper.GetString(config, "api_key", "x_api_key", "x-api-key"),
            AppId = ExecutionJsonHelper.GetString(config, "appid"),
            AccessToken = ExecutionJsonHelper.GetString(config, "access_token"),
            VoiceType = requestedVoice
                ?? throw new InvalidOperationException("豆包 TTS 合成缺少音色，请在智能体角色中选择 TTS 音色。"),
            Encoding = requestedEncoding
                ?? ExecutionJsonHelper.GetString(overrideConfig, "encoding", "format", "response_format")
                ?? ExecutionJsonHelper.GetString(config, "encoding", "format", "response_format")
                ?? "mp3",
            SampleRate = ExecutionJsonHelper.GetInt(overrideConfig, "sample_rate")
                ?? ExecutionJsonHelper.GetInt(config, "sample_rate")
                ?? 24000,
            BitRate = ExecutionJsonHelper.GetInt(overrideConfig, "bit_rate")
                ?? ExecutionJsonHelper.GetInt(config, "bit_rate"),
            SpeechRate = ResolveSpeechRate(config, overrideConfig, requestedSpeed),
            LoudnessRate = ExecutionJsonHelper.GetInt(overrideConfig, "loudness_rate", "volume")
                ?? ExecutionJsonHelper.GetInt(config, "loudness_rate", "volume"),
            UsageReturn = ExecutionJsonHelper.GetString(overrideConfig, "usage_return", "x_control_require_usage_tokens_return")
                ?? ExecutionJsonHelper.GetString(config, "usage_return", "x_control_require_usage_tokens_return"),
            AudioOptionFields = audioOptionFields,
            ReqParamFields = reqParamFields,
            Additions = additions
        };
    }

    private static int? ResolveSpeechRate(JsonObject? config, JsonObject? overrideConfig, double? speed)
    {
        var configured = ExecutionJsonHelper.GetInt(overrideConfig, "speech_rate")
            ?? ExecutionJsonHelper.GetInt(config, "speech_rate");
        if (speed == null)
            return configured;

        var mapped = (int)Math.Round((speed.Value - 1d) * 100d, MidpointRounding.AwayFromZero);
        return Math.Clamp(mapped, -50, 100);
    }

    private static JsonObject BuildOverrideConfig(IReadOnlyDictionary<string, object?>? overrideOptions)
    {
        var result = new JsonObject();
        if (overrideOptions == null)
            return result;

        foreach (var pair in overrideOptions)
        {
            if (string.IsNullOrWhiteSpace(pair.Key) || pair.Value == null)
                continue;

            result[pair.Key] = ExecutionJsonHelper.ToJsonNode(pair.Value);
        }

        return result;
    }

    private static void MergeAdditionsObject(JsonObject source, JsonObject additions)
    {
        if (ModelCapabilityJsonHelper.GetNode(source, "additions") is not JsonObject additionOverrides)
            return;

        foreach (var pair in additionOverrides)
        {
            if (pair.Value != null)
                additions[pair.Key] = pair.Value.DeepClone();
        }
    }

    private static string RequireString(JsonObject? config, string errorMessage, params string[] paths)
    {
        return ExecutionJsonHelper.GetString(config, paths)
            ?? throw new InvalidOperationException(errorMessage);
    }

    private static void CopyBool(JsonObject? source, JsonObject target, string key)
    {
        var value = ExecutionJsonHelper.GetBool(source, key);
        if (value.HasValue)
            target[key] = value.Value;
    }

    private static void CopyInt(JsonObject? source, JsonObject target, string key)
    {
        var value = ExecutionJsonHelper.GetInt(source, key);
        if (value.HasValue)
            target[key] = value.Value;
    }

    private static void CopyString(JsonObject? source, JsonObject target, string key)
    {
        var value = ExecutionJsonHelper.GetString(source, key);
        if (!string.IsNullOrWhiteSpace(value))
            target[key] = value;
    }

    private static void CopyNode(JsonObject? source, JsonObject target, string key)
    {
        if (ModelCapabilityJsonHelper.GetNode(source, key) is { } node)
            target[key] = node.DeepClone();
    }

    private static void CopyAdditions(JsonObject? source, JsonObject additions, string key)
    {
        var node = ModelCapabilityJsonHelper.GetNode(source, $"additions.{key}")
            ?? ModelCapabilityJsonHelper.GetNode(source, key);
        if (node != null)
            additions[key] = node.DeepClone();
    }
}
