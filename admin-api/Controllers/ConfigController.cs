using System.Text.Json;
using AiAdmin.Config;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Settings;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Options;

namespace AiAdmin.Controllers;

/// <summary>
/// 配置控制器
/// 提供系统参数配置、设备运行时配置查询等功能
/// 兼容 Python 服务的配置接口契约
/// </summary>
[ApiController]
[Route("config")]
public class ConfigController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    /// <summary>分布式缓存（Redis）</summary>
    private readonly IDistributedCache _cache;
    private readonly SystemSettingsService _systemSettingsService;
    private readonly IServerAddressProvider _serverAddressProvider;
    private readonly IModelExecutionConfigResolver _modelExecutionConfigResolver;
    private readonly IoTRuntimeOptions _runtimeOptions;

    /// <summary>创建配置控制器实例</summary>
    public ConfigController(AiAdminDbContext db, IDistributedCache cache, SystemSettingsService systemSettingsService, IServerAddressProvider serverAddressProvider, IModelExecutionConfigResolver modelExecutionConfigResolver, IOptions<IoTRuntimeOptions> runtimeOptions)
    {
        _db = db;
        _cache = cache;
        _systemSettingsService = systemSettingsService;
        _serverAddressProvider = serverAddressProvider;
        _modelExecutionConfigResolver = modelExecutionConfigResolver;
        _runtimeOptions = runtimeOptions.Value;
    }

    /// <summary>服务端获取配置接口（返回嵌套结构，兼容 Python 服务）</summary>
    [HttpPost("server-base")]
    [DeviceCredentialAuth]
    public async Task<Result<object>> GetServerBase()
    {
        var cacheKey = string.Equals(Request.Scheme, "https", StringComparison.OrdinalIgnoreCase)
            ? SystemSettingsService.HttpsServerBaseCacheKey
            : SystemSettingsService.HttpServerBaseCacheKey;
        var cached = await _cache.GetStringAsync(cacheKey);
        if (cached != null)
        {
            var cachedObj = JsonSerializer.Deserialize<Dictionary<string, object?>>(cached);
            return Result<object>.Ok((object)cachedObj!);
        }

        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false);
        if (_serverAddressProvider.IsLocalOnlyHost(systemSettings.ServerPublicHost))
        {
            throw new InvalidOperationException("Error:ExternalRuntimeHostInvalid");
        }

        var nested = BuildServerBaseSettings(systemSettings);

        var defaultRole = await _db.AiAgentRoles
            .Where(x => x.Status == "active")
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.CreatedAt)
            .FirstOrDefaultAsync();
        if (defaultRole != null)
        {
            var vadBootstrapConfig = await ResolveProfileModuleSettingsAsync(defaultRole.VadProfileId);
            var asrBootstrapConfig = await ResolveProfileModuleSettingsAsync(defaultRole.AsrProfileId);
            var selectedModule = new Dictionary<string, string>();

            AddResolvedModuleConfig(nested,
                "VAD",
                defaultRole.VadProfileId,
                vadBootstrapConfig);
            AddResolvedModuleConfig(nested,
                "ASR",
                defaultRole.AsrProfileId,
                asrBootstrapConfig);
            if (!string.IsNullOrWhiteSpace(defaultRole.VadProfileId) && vadBootstrapConfig != null)
            {
                selectedModule["VAD"] = defaultRole.VadProfileId;
            }
            if (!string.IsNullOrWhiteSpace(defaultRole.AsrProfileId) && asrBootstrapConfig != null)
            {
                selectedModule["ASR"] = defaultRole.AsrProfileId;
            }

            nested["selected_module"] = selectedModule;
        }
        else
        {
            nested["selected_module"] = new Dictionary<string, string>();
        }

        nested["prompt"] = BuildPrompt(defaultRole?.DisplayName ?? defaultRole?.Name,
            defaultRole?.SystemPrompt);

        await _cache.SetStringAsync(cacheKey,
            JsonSerializer.Serialize(nested),
            new DistributedCacheEntryOptions { AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(5) });

        return Result<object>.Ok((object)nested);
    }

    private Dictionary<string, object?> BuildServerBaseSettings(SystemSettings settings)
    {
        var publicHost = settings.ServerPublicHost.Trim();
        var websocket = _serverAddressProvider.BuildServerWebSocketUrl(
            publicHost,
            settings.ServerPort,
            string.Equals(Request.Scheme, "https", StringComparison.OrdinalIgnoreCase));
        var visionExplain = BuildExternalUrl(Request.Scheme,
            publicHost,
            settings.ServerVisionPort,
            "/mcp/vision/explain");
        var xiaozhiConfig = TryParseJson(settings.IoTProtocolConfig) ?? settings.IoTProtocolConfig;
        var contextProviders = new List<object?>();

        return new Dictionary<string, object?>
        {
            ["server"] = new Dictionary<string, object?>
            {
                ["ip"] = publicHost,
                ["port"] = settings.ServerPort,
                ["http_port"] = settings.ServerHttpPort,
                ["websocket"] = websocket,
                ["vision_port"] = settings.ServerVisionPort,
                ["vision_explain"] = visionExplain,
                ["timezone_offset"] = FormatTimezoneOffset(TimeZoneInfo.Local.GetUtcOffset(DateTimeOffset.Now)),
                ["auth"] = new Dictionary<string, object?>
                {
                    ["enabled"] = false,
                    ["allowed_devices"] = new List<string>()
                },
                ["mqtt_gateway"] = BuildHostEndpoint(publicHost,
                    _runtimeOptions.MqttPort,
                    _runtimeOptions.Enabled && _runtimeOptions.EnableMqtt),
                ["mqtt_signature_key"] = string.IsNullOrWhiteSpace(_runtimeOptions.SignatureKey)
                    ? null
                    : _runtimeOptions.SignatureKey,
                ["udp_gateway"] = BuildHostEndpoint(publicHost,
                    _runtimeOptions.UdpPort,
                    _runtimeOptions.Enabled && _runtimeOptions.EnableUdp),
                ["secret"] = settings.ServerSecret,
                ["allow_user_register"] = settings.AllowUserRegister,
                ["frontend_url"] = settings.FrontendUrl
            },
            ["log"] = new Dictionary<string, object?>
            {
                ["log_format"] = settings.LogFormat,
                ["log_format_file"] = settings.LogFormatFile,
                ["log_level"] = settings.LogLevel,
                ["log_dir"] = settings.LogDir,
                ["log_file"] = settings.LogFile,
                ["data_dir"] = settings.DataDir
            },
            ["delete_audio"] = settings.DeleteAudio,
            ["close_connection_no_voice_time"] = settings.CloseConnectionNoVoiceTime,
            ["tts_timeout"] = settings.TtsTimeout,
            ["tool_call_timeout"] = 30,
            ["enable_wakeup_words_response_cache"] = settings.EnableWakeupWordsResponseCache,
            ["enable_greeting"] = settings.EnableGreeting,
            ["enable_stop_tts_notify"] = settings.EnableStopTtsNotify,
            ["enable_websocket_ping"] = false,
            ["stop_tts_notify_voice"] = settings.StopTtsNotifyVoice,
            ["tts_audio_send_delay"] = 0,
            ["exit_commands"] = settings.ExitCommands
                .Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
                .ToList(),
            ["iot_protocol_config"] = xiaozhiConfig,
            ["xiaozhi"] = xiaozhiConfig,
            ["wakeup_words"] = settings.WakeupWords
                .Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
                .ToList(),
            ["mcp_endpoint"] = null,
            ["context_providers"] = contextProviders
        };
    }

    private static string? BuildExternalUrl(string scheme,
        string host,
        int port,
        string path)
    {
        if (string.IsNullOrWhiteSpace(host))
        {
            return null;
        }

        var builder = new UriBuilder(scheme,
            host)
        {
            Port = port,
            Path = path
        };

        return builder.Uri.ToString().TrimEnd('/');
    }

    private static string? BuildHostEndpoint(string host,
        int port,
        bool enabled)
    {
        if (!enabled || string.IsNullOrWhiteSpace(host))
        {
            return null;
        }

        return $"{host}:{port}";
    }

    private static string FormatTimezoneOffset(TimeSpan offset)
    {
        var sign = offset < TimeSpan.Zero ? '-' : '+';
        var absoluteOffset = offset.Duration();
        if (absoluteOffset.Minutes == 0 && absoluteOffset.Seconds == 0)
        {
            return $"{sign}{absoluteOffset.Hours}";
        }

        return $"{sign}{absoluteOffset:hh\\:mm}";
    }

    private static string? BuildPrompt(string? agentName, string? systemPrompt)
    {
        if (!string.IsNullOrWhiteSpace(systemPrompt))
        {
            return systemPrompt;
        }

        if (!string.IsNullOrWhiteSpace(agentName))
        {
            return $"你是{agentName}。";
        }

        return null;
    }

    private static void AddResolvedModuleConfig(
        Dictionary<string, object?> result,
        string moduleType,
        string? modelId,
        Dictionary<string, object?>? config)
    {
        var typeConfig = new Dictionary<string, object?>();
        AddResolvedModuleEntry(typeConfig,
            modelId,
            config);
        if (typeConfig.Count > 0)
        {
            result[moduleType] = typeConfig;
        }
    }

    private static void AddResolvedModuleEntry(
        Dictionary<string, object?> target,
        string? modelId,
        Dictionary<string, object?>? config)
    {
        if (string.IsNullOrWhiteSpace(modelId)
            || config == null
            || target.ContainsKey(modelId))
        {
            return;
        }

        target[modelId] = config;
    }

    private async Task<Dictionary<string, object?>?> ResolveProfileModuleSettingsAsync(
        string? profileId,
        Dictionary<string, object?>? overrides = null)
    {
        if (string.IsNullOrWhiteSpace(profileId))
        {
            return null;
        }

        try
        {
            var config = await _modelExecutionConfigResolver.ResolveAsync(profileId);
            return BuildProfileModuleSettings(config,
                overrides);
        }
        catch (InvalidOperationException)
        {
            return null;
        }
    }

    private static Dictionary<string, object?> BuildProfileModuleSettings(
        Services.Runtime.Execution.Dtos.ModelExecutionConfigDto config,
        Dictionary<string, object?>? overrides = null)
    {
        var result = new Dictionary<string, object?>();
        if (config.ConfigObject != null)
        {
            foreach (var item in config.ConfigObject)
            {
                result[item.Key] = ConvertJsonNode(item.Value);
            }
        }

        if (!result.ContainsKey("type"))
        {
            result["type"] = config.ProviderCode ?? config.ModelCode;
        }

        if (overrides != null)
        {
            foreach (var kv in overrides.Where(kv => kv.Value != null))
            {
                result[kv.Key] = kv.Value;
            }
        }

        return result;
    }

    private static object? ConvertJsonElement(JsonElement element)
    {
        return element.ValueKind switch
        {
            JsonValueKind.String => element.GetString(),
            JsonValueKind.Number => element.TryGetInt64(out var l) ? l : element.GetDouble(),
            JsonValueKind.True   => true,
            JsonValueKind.False  => false,
            JsonValueKind.Null   => null,
            JsonValueKind.Array  => element.EnumerateArray().Select(ConvertJsonElement).ToList(),
            JsonValueKind.Object => element.EnumerateObject()
                .ToDictionary(p => p.Name,
                    p => ConvertJsonElement(p.Value)),
            _ => element.ToString()
        };
    }

    private static object? ConvertJsonNode(System.Text.Json.Nodes.JsonNode? node)
    {
        return node switch
        {
            null => null,
            System.Text.Json.Nodes.JsonValue value => value.TryGetValue<JsonElement>(out var element)
                ? ConvertJsonElement(element)
                : value.ToJsonString(),
            System.Text.Json.Nodes.JsonArray array => array.Select(ConvertJsonNode).ToList(),
            System.Text.Json.Nodes.JsonObject obj => obj.ToDictionary(item => item.Key, item => ConvertJsonNode(item.Value)),
            _ => node.ToJsonString()
        };
    }

    private static object? TryParseJson(string? json)
    {
        if (string.IsNullOrEmpty(json)) return null;
        try
        {
            return JsonSerializer.Deserialize<object>(json);
        }
        catch
        {
            return json;
        }
    }

}
