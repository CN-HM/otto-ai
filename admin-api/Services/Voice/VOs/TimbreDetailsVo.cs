namespace AiAdmin.Services.Voice.Dtos;

/// <summary>音色详情VO</summary>
public class TimbreDetailsVo
{
    /// <summary>音色ID</summary>
    public string? Id { get; set; }
    /// <summary>语言</summary>
    public string? Languages { get; set; }
    /// <summary>音色名称</summary>
    public string? Name { get; set; }
    /// <summary>备注</summary>
    public string? Remark { get; set; }
    /// <summary>参考音频</summary>
    public string? ReferenceAudio { get; set; }
    /// <summary>参考文本</summary>
    public string? ReferenceText { get; set; }
    /// <summary>排序</summary>
    public int? Sort { get; set; }
    /// <summary>Provider Code</summary>
    public string? ProviderCode { get; set; }
    /// <summary>Provider Name</summary>
    public string? ProviderName { get; set; }
    /// <summary>TTS Profile ID</summary>
    public string? TtsProfileId { get; set; }
    /// <summary>TTS音色</summary>
    public string? TtsVoice { get; set; }
    /// <summary>音色演示</summary>
    public string? VoiceDemo { get; set; }
}


