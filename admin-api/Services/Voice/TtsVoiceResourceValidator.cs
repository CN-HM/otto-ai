using AiAdmin.Entities;

namespace AiAdmin.Services.Voice;

public static class TtsVoiceResourceValidator
{
    public static void EnsureMatchesProfileResource(AiTtsProfile profile, AiTtsVoice voice, string actionName)
    {
        var profileResourceId = NormalizeOptional(profile.ResourceId);
        var voiceResourceId = ExtractResourceId(voice.Remark);
        if (profileResourceId == null || voiceResourceId == null)
            return;

        if (!string.Equals(profileResourceId, voiceResourceId, StringComparison.OrdinalIgnoreCase))
        {
            throw new InvalidOperationException($"{actionName}失败：所选 TTS 音色的 ResourceID（{voiceResourceId}）与 TTS Profile 的 resource_id（{profileResourceId}）不一致。请重新同步并选择同一 TTS Profile 资源下的音色，或修正 TTS Profile 的 resource_id。");
        }
    }

    private static string? ExtractResourceId(string? remark)
    {
        var normalized = NormalizeOptional(remark);
        if (normalized == null)
            return null;

        foreach (var segment in normalized.Split('|', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
        {
            if (!segment.StartsWith("ResourceID", StringComparison.OrdinalIgnoreCase)
                && !segment.StartsWith("ResourceId", StringComparison.OrdinalIgnoreCase)
                && !segment.StartsWith("resource_id", StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            var separatorIndex = segment.IndexOf('：');
            if (separatorIndex < 0)
                separatorIndex = segment.IndexOf(':');
            if (separatorIndex < 0 || separatorIndex + 1 >= segment.Length)
                continue;

            var value = NormalizeOptional(segment[(separatorIndex + 1)..]);
            if (value != null)
                return value;
        }

        return null;
    }

    private static string? NormalizeOptional(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
