namespace AiAdmin.Services.Admin.Dtos;

/// <summary>运行时设置DTO</summary>
public class AdminSystemRuntimeSettingsDto
{
    /// <summary>是否删除音频文件</summary>
    public bool DeleteAudio { get; set; }
    /// <summary>无语音时关闭连接时间（秒）</summary>
    public int CloseConnectionNoVoiceTime { get; set; }
    /// <summary>TTS超时时间</summary>
    public int TtsTimeout { get; set; }
    /// <summary>是否启用唤醒词响应缓存</summary>
    public bool EnableWakeupWordsResponseCache { get; set; }
    /// <summary>是否启用问候语</summary>
    public bool EnableGreeting { get; set; }
    /// <summary>是否启用停止TTS通知</summary>
    public bool EnableStopTtsNotify { get; set; }
    /// <summary>停止TTS通知语音</summary>
    public string StopTtsNotifyVoice { get; set; } = string.Empty;
    /// <summary>退出命令</summary>
    public string ExitCommands { get; set; } = string.Empty;
    /// <summary>小智配置</summary>
    public string IoTProtocolConfig { get; set; } = string.Empty;
    /// <summary>唤醒词</summary>
    public string WakeupWords { get; set; } = string.Empty;
    /// <summary>设备最大输出大小</summary>
    public int? DeviceMaxOutputSize { get; set; }
    /// <summary>声纹服务URL</summary>
    public string VoiceprintUrl { get; set; } = string.Empty;
    /// <summary>声纹相似度阈值</summary>
    public double? VoiceprintSimilarityThreshold { get; set; }
}

