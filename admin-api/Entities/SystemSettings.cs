using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("system_settings")]
public class SystemSettings
{
    [Key]
    [Column("id")]
    public long Id { get; set; }

    [Column("server_listen_ip")]
    [MaxLength(100)]
    public string ServerListenIp { get; set; } = "0.0.0.0";

    [Column("server_public_host")]
    [MaxLength(255)]
    public string ServerPublicHost { get; set; } = string.Empty;

    [Column("server_port")]
    public int ServerPort { get; set; } = 8000;

    [Column("server_http_port")]
    public int ServerHttpPort { get; set; } = 8003;

    [Column("server_vision_port")]
    public int ServerVisionPort { get; set; } = 8003;

    [Column("server_secret")]
    [MaxLength(256)]
    public string ServerSecret { get; set; } = string.Empty;

    [Column("allow_user_register")]
    public bool AllowUserRegister { get; set; }

    [Column("frontend_url")]
    [MaxLength(500)]
    public string FrontendUrl { get; set; } = string.Empty;

    [Column("log_format", TypeName = "text")]
    public string LogFormat { get; set; } = string.Empty;

    [Column("log_format_file", TypeName = "text")]
    public string LogFormatFile { get; set; } = string.Empty;

    [Column("log_level")]
    [MaxLength(32)]
    public string LogLevel { get; set; } = "INFO";

    [Column("log_dir")]
    [MaxLength(255)]
    public string LogDir { get; set; } = string.Empty;

    [Column("log_file")]
    [MaxLength(255)]
    public string LogFile { get; set; } = string.Empty;

    [Column("data_dir")]
    [MaxLength(255)]
    public string DataDir { get; set; } = string.Empty;

    [Column("delete_audio")]
    public bool DeleteAudio { get; set; } = true;

    [Column("close_connection_no_voice_time")]
    public int CloseConnectionNoVoiceTime { get; set; } = 120;

    [Column("tts_timeout")]
    public int TtsTimeout { get; set; } = 10;

    [Column("enable_wakeup_words_response_cache")]
    public bool EnableWakeupWordsResponseCache { get; set; }

    [Column("enable_greeting")]
    public bool EnableGreeting { get; set; } = true;

    [Column("enable_stop_tts_notify")]
    public bool EnableStopTtsNotify { get; set; }

    [Column("stop_tts_notify_voice")]
    [MaxLength(500)]
    public string StopTtsNotifyVoice { get; set; } = string.Empty;

    [Column("exit_commands", TypeName = "text")]
    public string ExitCommands { get; set; } = string.Empty;

    [Column("iot_protocol_config", TypeName = "jsonb")]
    public string IoTProtocolConfig { get; set; } = "{}";

    [Column("wakeup_words", TypeName = "text")]
    public string WakeupWords { get; set; } = string.Empty;

    [Column("device_max_output_size")]
    public int? DeviceMaxOutputSize { get; set; }

    [Column("voiceprint_url")]
    [MaxLength(500)]
    public string VoiceprintUrl { get; set; } = string.Empty;

    [Column("voiceprint_similarity_threshold")]
    public double? VoiceprintSimilarityThreshold { get; set; }

    [Column("billing_default_plan_code")]
    [MaxLength(64)]
    public string BillingDefaultPlanCode { get; set; } = "trial_monthly";

    [Column("billing_reset_timezone")]
    [MaxLength(64)]
    public string BillingResetTimezone { get; set; } = "Asia/Taipei";

    [Column("billing_low_balance_ratio")]
    public decimal BillingLowBalanceRatio { get; set; } = 0.1m;

    [Column("billing_exhaustion_remind_cooldown_hours")]
    public int BillingExhaustionRemindCooldownHours { get; set; } = 12;

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
