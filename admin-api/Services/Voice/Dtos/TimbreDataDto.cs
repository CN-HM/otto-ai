namespace AiAdmin.Services.Voice.Dtos;

/// <summary>音色数据DTO（新增/修改）</summary>
public class TimbreDataDto
{
    /// <summary>语言</summary>
    public string Languages { get; set; } = string.Empty;
    /// <summary>音色名称</summary>
    public string Name { get; set; } = string.Empty;
    /// <summary>备注</summary>
    public string? Remark { get; set; }
    /// <summary>参考音频</summary>
    public string? ReferenceAudio { get; set; }
    /// <summary>参考文本</summary>
    public string? ReferenceText { get; set; }
    /// <summary>排序</summary>
    public int? Sort { get; set; }
    /// <summary>TTS Profile ID</summary>
    public string TtsProfileId { get; set; } = string.Empty;
    /// <summary>TTS音色</summary>
    public string TtsVoice { get; set; } = string.Empty;
    /// <summary>音色演示</summary>
    public string? VoiceDemo { get; set; }
}

