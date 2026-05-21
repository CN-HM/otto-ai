using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private async Task SeedSystemSettings()
    {
        var settings = await _db.SystemSettings.FirstOrDefaultAsync();
        if (settings == null)
        {
            _db.SystemSettings.Add(Services.Settings.SystemSettingsService.CreateDefault());
            await _db.SaveChangesAsync();
            return;
        }

        var defaults = Services.Settings.SystemSettingsService.CreateDefault();
        var changed = false;

        void Ensure<T>(Func<T> get, Action<T> set, T def)
        {
            if (EqualityComparer<T>.Default.Equals(get(), default) || (get() is string s && string.IsNullOrWhiteSpace(s)))
            {
                set(def);
                changed = true;
            }
        }

        Ensure(() => settings.ServerListenIp, v => settings.ServerListenIp = v, defaults.ServerListenIp);
        Ensure(() => settings.ServerPublicHost, v => settings.ServerPublicHost = v, defaults.ServerPublicHost);
        Ensure(() => settings.ServerPort, v => settings.ServerPort = v, defaults.ServerPort);
        Ensure(() => settings.ServerHttpPort, v => settings.ServerHttpPort = v, defaults.ServerHttpPort);
        Ensure(() => settings.ServerVisionPort, v => settings.ServerVisionPort = v, defaults.ServerVisionPort);
        Ensure(() => settings.ServerSecret, v => settings.ServerSecret = v, defaults.ServerSecret);
        Ensure(() => settings.FrontendUrl, v => settings.FrontendUrl = v, defaults.FrontendUrl);
        Ensure(() => settings.LogFormat, v => settings.LogFormat = v, defaults.LogFormat);
        Ensure(() => settings.LogFormatFile, v => settings.LogFormatFile = v, defaults.LogFormatFile);
        Ensure(() => settings.LogLevel, v => settings.LogLevel = v, defaults.LogLevel);
        Ensure(() => settings.LogDir, v => settings.LogDir = v, defaults.LogDir);
        Ensure(() => settings.LogFile, v => settings.LogFile = v, defaults.LogFile);
        Ensure(() => settings.DataDir, v => settings.DataDir = v, defaults.DataDir);
        Ensure(() => settings.StopTtsNotifyVoice, v => settings.StopTtsNotifyVoice = v, defaults.StopTtsNotifyVoice);
        Ensure(() => settings.ExitCommands, v => settings.ExitCommands = v, defaults.ExitCommands);
        Ensure(() => settings.IoTProtocolConfig, v => settings.IoTProtocolConfig = v, defaults.IoTProtocolConfig);
        Ensure(() => settings.WakeupWords, v => settings.WakeupWords = v, defaults.WakeupWords);

        if (changed)
        {
            settings.UpdateDate = DateTime.UtcNow;
            await _db.SaveChangesAsync();
        }
    }
}
