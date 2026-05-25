using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Admin.Dtos;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Settings;

public class SystemSettingsService : ITransientDependency
{
    public const long SingletonId = 1;
    public const string ServerBaseCacheKey = "config:server-base";
    public const string HttpServerBaseCacheKey = ServerBaseCacheKey + ":http";
    public const string HttpsServerBaseCacheKey = ServerBaseCacheKey + ":https";

    private readonly AiAdminDbContext _db;
    private readonly IDistributedCache _cache;

    public SystemSettingsService(AiAdminDbContext db, IDistributedCache cache)
    {
        _db = db;
        _cache = cache;
    }

    public async Task<SystemSettings> GetOrCreateAsync(bool tracking = true, CancellationToken cancellationToken = default)
    {
        var query = tracking ? _db.SystemSettings.AsQueryable() : _db.SystemSettings.AsNoTracking();
        var settings = await query.FirstOrDefaultAsync(x => x.Id == SingletonId, cancellationToken);
        if (settings != null)
        {
            return settings;
        }

        if (!tracking)
        {
            return CreateDefault();
        }

        settings = CreateDefault();
        _db.SystemSettings.Add(settings);
        await _db.SaveChangesAsync(cancellationToken);
        return settings;
    }

    public async Task<AdminSystemSettingsDto> GetAdminSettingsAsync(CancellationToken cancellationToken = default)
    {
        var settings = await GetOrCreateAsync(false, cancellationToken);
        return ToAdminDto(settings);
    }

    public async Task UpdateAdminSettingsAsync(AdminSystemSettingsDto dto, long? userId, CancellationToken cancellationToken = default)
    {
        var settings = await GetOrCreateAsync(true, cancellationToken);
        Apply(settings, dto, userId);
        await _db.SaveChangesAsync(cancellationToken);
        await _cache.RemoveAsync(ServerBaseCacheKey, cancellationToken);
        await _cache.RemoveAsync(HttpServerBaseCacheKey, cancellationToken);
        await _cache.RemoveAsync(HttpsServerBaseCacheKey, cancellationToken);
    }

    public static AdminSystemSettingsDto ToAdminDto(SystemSettings settings)
    {
        return new AdminSystemSettingsDto
        {
            Server = new AdminSystemServerSettingsDto
            {
                ListenIp = settings.ServerListenIp,
                PublicHost = settings.ServerPublicHost,
                Port = settings.ServerPort,
                HttpPort = settings.ServerHttpPort,
                VisionPort = settings.ServerVisionPort,
                Secret = settings.ServerSecret,
                AllowUserRegister = settings.AllowUserRegister,
                FrontendUrl = settings.FrontendUrl
            },
            Log = new AdminSystemLogSettingsDto
            {
                LogFormat = settings.LogFormat,
                LogFormatFile = settings.LogFormatFile,
                LogLevel = settings.LogLevel,
                LogDir = settings.LogDir,
                LogFile = settings.LogFile,
                DataDir = settings.DataDir
            },
            Runtime = new AdminSystemRuntimeSettingsDto
            {
                DeleteAudio = settings.DeleteAudio,
                CloseConnectionNoVoiceTime = settings.CloseConnectionNoVoiceTime,
                TtsTimeout = settings.TtsTimeout,
                EnableWakeupWordsResponseCache = settings.EnableWakeupWordsResponseCache,
                EnableGreeting = settings.EnableGreeting,
                EnableStopTtsNotify = settings.EnableStopTtsNotify,
                StopTtsNotifyVoice = settings.StopTtsNotifyVoice,
                ExitCommands = settings.ExitCommands,
                IoTProtocolConfig = settings.IoTProtocolConfig,
                WakeupWords = settings.WakeupWords,
                DeviceMaxOutputSize = settings.DeviceMaxOutputSize,
                VoiceprintUrl = settings.VoiceprintUrl,
                VoiceprintSimilarityThreshold = settings.VoiceprintSimilarityThreshold
            },
            Billing = new AdminSystemBillingSettingsDto
            {
                DefaultPlanCode = settings.BillingDefaultPlanCode,
                ResetTimezone = settings.BillingResetTimezone,
                LowBalanceRatio = settings.BillingLowBalanceRatio,
                ExhaustionRemindCooldownHours = settings.BillingExhaustionRemindCooldownHours
            }
        };
    }

    public static void Apply(SystemSettings settings, AdminSystemSettingsDto dto, long? userId)
    {
        var now = DateTime.UtcNow;
        if (settings.CreateDate == null)
        {
            settings.CreateDate = now;
        }

        if (settings.Creator == null)
        {
            settings.Creator = userId;
        }

        settings.ServerListenIp = TrimOrDefault(dto.Server.ListenIp, "0.0.0.0");
        settings.ServerPublicHost = TrimOrEmpty(dto.Server.PublicHost);
        settings.ServerPort = dto.Server.Port;
        settings.ServerHttpPort = dto.Server.HttpPort;
        settings.ServerVisionPort = dto.Server.VisionPort;
        settings.ServerSecret = TrimOrEmpty(dto.Server.Secret);
        settings.AllowUserRegister = dto.Server.AllowUserRegister;
        settings.FrontendUrl = TrimOrEmpty(dto.Server.FrontendUrl);

        settings.LogFormat = TrimOrEmpty(dto.Log.LogFormat);
        settings.LogFormatFile = TrimOrEmpty(dto.Log.LogFormatFile);
        settings.LogLevel = TrimOrDefault(dto.Log.LogLevel, "INFO");
        settings.LogDir = TrimOrEmpty(dto.Log.LogDir);
        settings.LogFile = TrimOrEmpty(dto.Log.LogFile);
        settings.DataDir = TrimOrEmpty(dto.Log.DataDir);

        settings.DeleteAudio = dto.Runtime.DeleteAudio;
        settings.CloseConnectionNoVoiceTime = dto.Runtime.CloseConnectionNoVoiceTime;
        settings.TtsTimeout = dto.Runtime.TtsTimeout;
        settings.EnableWakeupWordsResponseCache = dto.Runtime.EnableWakeupWordsResponseCache;
        settings.EnableGreeting = dto.Runtime.EnableGreeting;
        settings.EnableStopTtsNotify = dto.Runtime.EnableStopTtsNotify;
        settings.StopTtsNotifyVoice = TrimOrEmpty(dto.Runtime.StopTtsNotifyVoice);
        settings.ExitCommands = TrimOrEmpty(dto.Runtime.ExitCommands);
        settings.IoTProtocolConfig = string.IsNullOrWhiteSpace(dto.Runtime.IoTProtocolConfig) ? "{}" : dto.Runtime.IoTProtocolConfig.Trim();
        settings.WakeupWords = TrimOrEmpty(dto.Runtime.WakeupWords);
        settings.DeviceMaxOutputSize = dto.Runtime.DeviceMaxOutputSize;
        settings.VoiceprintUrl = TrimOrEmpty(dto.Runtime.VoiceprintUrl);
        settings.VoiceprintSimilarityThreshold = dto.Runtime.VoiceprintSimilarityThreshold;

        settings.BillingDefaultPlanCode = TrimOrDefault(dto.Billing.DefaultPlanCode, "trial_monthly");
        settings.BillingResetTimezone = TrimOrDefault(dto.Billing.ResetTimezone, "Asia/Taipei");
        settings.BillingLowBalanceRatio = dto.Billing.LowBalanceRatio;
        settings.BillingExhaustionRemindCooldownHours = dto.Billing.ExhaustionRemindCooldownHours;
        settings.Updater = userId;
        settings.UpdateDate = now;
    }

    public static SystemSettings CreateDefault()
    {
        var now = DateTime.UtcNow;
        return new SystemSettings
        {
            Id = SingletonId,
            ServerListenIp = "0.0.0.0",
            ServerPublicHost = "localhost",
            ServerPort = 8000,
            ServerHttpPort = 8003,
            ServerVisionPort = 8003,
            ServerSecret = Guid.NewGuid().ToString("N")[..16],
            FrontendUrl = "http://localhost:4200",
            LogFormat = "<green>{time:YYMMDD HH:mm:ss}</green>[<light-blue>{version}-{selected_module}</light-blue>][<light-blue>{extra[tag]}</light-blue>]-<level>{level}</level>-<light-green>{message}</light-green>",
            LogFormatFile = "{time:YYYY-MM-DD HH:mm:ss} - {version}_{selected_module} - {name} - {level} - {extra[tag]} - {message}",
            LogDir = "tmp",
            LogFile = "server.log",
            DataDir = "data",
            StopTtsNotifyVoice = "config/assets/tts_notify.mp3",
            ExitCommands = "退出;关闭",
            IoTProtocolConfig = "{\n  \"type\": \"hello\",\n  \"version\": 1,\n  \"transport\": \"websocket\",\n  \"audio_params\": {\n    \"format\": \"opus\",\n    \"sample_rate\": 16000,\n    \"channels\": 1,\n    \"frame_duration\": 60\n  }\n}",
            WakeupWords = "小爱同学;你好小鑫;你好小新;小美同学;小龙小龙;喵喵同学;小滨小滨;小冰小冰",
            CreateDate = now,
            UpdateDate = now
        };
    }

    private static string TrimOrEmpty(string? value)
    {
        return value?.Trim() ?? string.Empty;
    }

    private static string TrimOrDefault(string? value, string defaultValue)
    {
        var trimmed = value?.Trim();
        return string.IsNullOrWhiteSpace(trimmed) ? defaultValue : trimmed;
    }
}
