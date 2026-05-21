using System.Security.Cryptography;
using System.Text.Json;
using AiAdmin.Config;
using AiAdmin.Protocol.Runtime;
using AiAdmin.Server.Cluster;
using AiAdmin.Server.HostedServices;
using AiAdmin.Services.Memory;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Settings;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;

namespace AiAdmin.Protocol.Mqtt;

/// <summary>
/// MQTT消息分发器
/// 根据消息type字段路由到不同处理器：hello、goodbye、mcp
/// 其他消息转发到Python WebSocket服务
/// </summary>
public class MqttMessageDispatcher
{
    /// <summary>运行时配置选项</summary>
    private readonly IoTRuntimeOptions _options;
    
    /// <summary>服务提供者</summary>
    private readonly IServiceProvider _serviceProvider;
    
    /// <summary>作用域工厂</summary>
    private readonly IServiceScopeFactory _serviceScopeFactory;
    
    /// <summary>节点身份提供者</summary>
    private readonly INodeIdentityProvider _nodeIdentityProvider;

    private readonly IServerAddressProvider _serverAddressProvider;
    private readonly ILoggerFactory _loggerFactory;
    
    /// <summary>日志记录器</summary>
    private readonly ILogger<MqttMessageDispatcher> _logger;

    /// <summary>创建消息分发器实例</summary>
    public MqttMessageDispatcher(
        IOptions<IoTRuntimeOptions> options,
        IServiceProvider serviceProvider,
        IServiceScopeFactory serviceScopeFactory,
        INodeIdentityProvider nodeIdentityProvider,
        IServerAddressProvider serverAddressProvider,
        ILoggerFactory loggerFactory,
        ILogger<MqttMessageDispatcher> logger)
    {
        _options = options.Value;
        _serviceProvider = serviceProvider;
        _serviceScopeFactory = serviceScopeFactory;
        _nodeIdentityProvider = nodeIdentityProvider;
        _serverAddressProvider = serverAddressProvider;
        _loggerFactory = loggerFactory;
        _logger = logger;
    }

    /// <summary>
    /// 分发MQTT消息到对应处理器
    /// </summary>
    /// <param name="device">设备连接</param>
    /// <param name="payload">消息内容</param>
    public async Task DispatchAsync(DeviceConnection device, string payload)
    {
        try
        {
            using var doc = JsonDocument.Parse(payload);
            var type = doc.RootElement.TryGetProperty("type", out var typeElement) ? typeElement.GetString() : null;

            // 根据消息类型路由
            switch (type)
            {
                case "hello":
                    // 开始语音会话握手
                    await HandleHelloAsync(device, doc.RootElement);
                    break;
                case "goodbye":
                    // 结束语音会话
                    await HandleGoodbyeAsync(device);
                    break;
                case "mcp":
                    // MCP协议消息
                    await HandleMcpResponseAsync(device, doc.RootElement);
                    break;
                default:
                    // 其他消息转发到Python服务
                    if (device.Bridge != null)
                    {
                        await device.Bridge.SendJsonAsync(payload);
                    }
                    break;
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error dispatching MQTT message for {Mac}", device.MacAddress);
        }
    }

    /// <summary>
    /// 初始化MCP工具（占位，实际初始化在hello握手时完成）
    /// </summary>
    public Task InitializeMcpToolsAsync(DeviceConnection device)
    {
        return InitializeMcpStateInternalAsync(device);
    }

    /// <summary>
    /// 处理hello消息，建立语音会话
    /// 1. 验证协议版本
    /// 2. 创建UDP会话和加密密钥
    /// 3. 建立WebSocket桥接到Python服务
    /// 4. 完成握手后向设备返回UDP配置
    /// </summary>
    private async Task HandleHelloAsync(DeviceConnection device, JsonElement root)
    {
        // 验证协议版本（只支持版本3）
        var version = root.TryGetProperty("version", out var versionElement) ? versionElement.GetInt32() : 0;
        if (version != 3)
        {
            _logger.LogWarning("Unsupported protocol version {Version} from {Mac}", version, device.MacAddress);
            var broker = _serviceProvider.GetRequiredService<MqttBrokerService>();
            await broker.PublishToDeviceAsync(device,
                JsonSerializer.Serialize(new { type = "error", message = "Unsupported protocol version" }));
            return;
        }

        // 清理旧连接（如果有）
        if (device.Bridge != null)
        {
            await device.Bridge.DisposeAsync();
            device.Bridge = null;
        }

        // 生成AES-128加密密钥，创建UDP会话
        var aesKey = RandomNumberGenerator.GetBytes(16);
        var udpSession = new UdpSession
        {
            AesKey = aesKey,
            ConnectionId = device.ConnectionId
        };
        device.Udp = udpSession;

        // 获取必要的服务实例
        var brokerService = _serviceProvider.GetRequiredService<MqttBrokerService>();
        var udpService = _serviceProvider.GetRequiredService<UdpHostedService>();
        var node = _nodeIdentityProvider.Current;

        var audioParameters = ParseAudioParameters(root);
        var audioParamsPayload = root.TryGetProperty("audio_params", out var audioParamsElement)
            ? JsonSerializer.Deserialize<object>(audioParamsElement.GetRawText())
            : null;
        var localSessionId = Guid.NewGuid().ToString("N");
        device.Bridge = new LocalConversationBridge(
            device,
            sessionId: localSessionId,
            audioParameters,
            _options.LocalSpeechIdleTimeoutMs,
            sendMqttMessageAsync: json => brokerService.PublishToDeviceAsync(device, json),
            sendUdpAudio: (opus, ts) => udpService.SendToDevice(device, opus, ts),
            _serviceScopeFactory,
            _loggerFactory.CreateLogger<LocalConversationBridge>());
        udpSession.SessionId = localSessionId;

        // 注册桥接关闭事件（通话结束时清理）
        device.Bridge.OnClosed += () =>
        {
            var seconds = (DateTime.UtcNow - udpSession.StartTime).TotalSeconds;
            _logger.LogInformation(
                "Call ended: {Mac} Session: {Session} Duration: {Duration:F1}s",
                device.MacAddress,
                udpSession.SessionId,
                seconds);
            _ = FinalizeMemorySessionAsync(udpSession.SessionId, "bridge_closed", CancellationToken.None);
            // 向设备发送goodbye消息
            _ = brokerService.PublishToDeviceAsync(device,
                JsonSerializer.Serialize(new { type = "goodbye", session_id = udpSession.SessionId }));
            // 清理会话路由
            _ = UpdateDeviceRouteAsync(device.MacAddress, device.ClientId, null, node.NodeId, CancellationToken.None);
            device.Bridge = null;
            device.Udp = null;
        };

        try
        {
            await FinalizeHelloAsync(device,
                udpSession,
                node.NodeId,
                brokerService,
                audioParamsPayload);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to establish call for {Mac}", device.MacAddress);
            // 发送错误消息给设备
            await brokerService.PublishToDeviceAsync(device,
                JsonSerializer.Serialize(new { type = "error", message = "Failed to connect to service" }));
            // 清理资源
            if (device.Bridge != null)
            {
                await device.Bridge.DisposeAsync();
                device.Bridge = null;
            }
            device.Udp = null;
        }
    }

    private async Task FinalizeHelloAsync(DeviceConnection device, UdpSession udpSession, string nodeId, MqttBrokerService brokerService, object? audioParamsPayload)
    {
        var nonce = GenerateUdpHeader(0, 0, 0, device.ConnectionId);
        udpSession.Nonce = nonce;
        await UpdateDeviceRouteAsync(device.MacAddress, device.ClientId, udpSession.SessionId, nodeId, CancellationToken.None);

        var address = await _serverAddressProvider.GetSnapshotAsync();
        if (_serverAddressProvider.IsLocalOnlyHost(address.PublicHost))
        {
            throw new InvalidOperationException("Error:UdpRuntimeHostInvalid");
        }

        var deviceReply = JsonSerializer.Serialize(new
        {
            type = "hello",
            version = 3,
            session_id = udpSession.SessionId,
            transport = "udp",
            udp = new
            {
                server = address.PublicHost,
                publicHost = address.PublicHost,
                port = _nodeIdentityProvider.Current.UdpPort,
                udpPort = _nodeIdentityProvider.Current.UdpPort,
                encryption = "aes-128-ctr",
                key = Convert.ToHexString(udpSession.AesKey).ToLowerInvariant(),
                nonce = Convert.ToHexString(nonce).ToLowerInvariant()
            },
            audio_params = audioParamsPayload
        });

        await brokerService.PublishToDeviceAsync(device, deviceReply);
    }

    private static DeviceAudioParameters ParseAudioParameters(JsonElement root)
    {
        if (!root.TryGetProperty("audio_params", out var audioParams) || audioParams.ValueKind != JsonValueKind.Object)
            return new DeviceAudioParameters();

        return new DeviceAudioParameters
        {
            Format = ReadOptionalString(audioParams, "format") ?? "opus",
            SampleRate = ReadOptionalInt(audioParams, "sample_rate") ?? 16000,
            Channels = ReadOptionalInt(audioParams, "channels") ?? 1,
            FrameDurationMs = ReadOptionalInt(audioParams, "frame_duration") ?? 60
        };
    }

    private static string? ReadOptionalString(JsonElement element, string propertyName)
    {
        if (!element.TryGetProperty(propertyName, out var value) || value.ValueKind != JsonValueKind.String)
            return null;
        var text = value.GetString()?.Trim();
        return string.IsNullOrWhiteSpace(text) ? null : text;
    }

    private static int? ReadOptionalInt(JsonElement element, string propertyName)
    {
        if (!element.TryGetProperty(propertyName, out var value))
            return null;
        if (value.ValueKind == JsonValueKind.Number && value.TryGetInt32(out var number))
            return number;
        if (value.ValueKind == JsonValueKind.String && int.TryParse(value.GetString(), out var parsed))
            return parsed;
        return null;
    }

    /// <summary>
    /// 处理goodbye消息，结束语音会话
    /// 清理WebSocket桥接和UDP会话，更新路由
    /// </summary>
    private async Task HandleGoodbyeAsync(DeviceConnection device)
    {
        var nodeId = _nodeIdentityProvider.Current.NodeId;
        var sessionId = device.Udp?.SessionId;
        
        // 关闭WebSocket桥接
        if (device.Bridge != null)
        {
            await device.Bridge.DisposeAsync();
            device.Bridge = null;
        }

        // 清理UDP会话
        device.Udp = null;
        
        // 更新路由（移除session_id，但保持device路由）
        await FinalizeMemorySessionAsync(sessionId, "goodbye", CancellationToken.None);
        await UpdateDeviceRouteAsync(device.MacAddress, device.ClientId, null, nodeId, CancellationToken.None);
    }

    private async Task FinalizeMemorySessionAsync(string? sessionId, string reason, CancellationToken cancellationToken)
    {
        if (string.IsNullOrWhiteSpace(sessionId))
            return;

        try
        {
            using var scope = _serviceScopeFactory.CreateScope();
            var memoryConversationSessionService = scope.ServiceProvider.GetRequiredService<MemoryConversationSessionService>();
            await memoryConversationSessionService.FinalizeSessionAsync(sessionId, reason, cancellationToken);
        }
        catch (Exception ex)
        {
            _logger.LogWarning(ex, "Failed to finalize memory conversation session {SessionId}", sessionId);
        }
    }

    /// <summary>
    /// 处理MCP协议消息响应
    /// 将消息转发到Python服务
    /// </summary>
    private async Task HandleMcpResponseAsync(DeviceConnection device, JsonElement root)
    {
        if (!root.TryGetProperty("payload", out var payload) || payload.ValueKind != JsonValueKind.Object)
            return;

        var method = ReadOptionalString(payload, "method");
        if (string.IsNullOrWhiteSpace(method))
            return;

        if (string.Equals(method, "notifications/initialized", StringComparison.OrdinalIgnoreCase))
            return;

        if (device.Mcp.InitializeResult == null)
            await InitializeMcpStateInternalAsync(device);

        if (!payload.TryGetProperty("id", out var idElement))
            return;

        var requestId = DeserializeJsonValue(idElement);
        if (string.Equals(method, "initialize", StringComparison.OrdinalIgnoreCase))
        {
            await PublishMcpPayloadAsync(device, new
            {
                jsonrpc = "2.0",
                id = requestId,
                result = device.Mcp.InitializeResult
            });
            return;
        }

        if (string.Equals(method, "tools/list", StringComparison.OrdinalIgnoreCase))
        {
            await PublishMcpPayloadAsync(device, new
            {
                jsonrpc = "2.0",
                id = requestId,
                result = new
                {
                    tools = device.Mcp.CachedTools
                }
            });
            return;
        }

        await PublishMcpPayloadAsync(device, new
        {
            jsonrpc = "2.0",
            id = requestId,
            error = new
            {
                code = -32601,
                message = $"MCP method not implemented: {method}"
            }
        });
    }

    private async Task InitializeMcpStateInternalAsync(DeviceConnection device)
    {
        try
        {
            using var scope = _serviceScopeFactory.CreateScope();
            var runtimeService = scope.ServiceProvider.GetRequiredService<DeviceMcpRuntimeService>();
            var snapshot = await runtimeService.BuildForCredentialAsync(device.CredentialId, CancellationToken.None);
            device.Mcp.InitializeResult = snapshot.InitializeResult;
            device.Mcp.CachedTools.Clear();
            device.Mcp.CachedTools.AddRange(snapshot.Tools);
            _logger.LogDebug("MCP tools initialized for {Mac}, count={Count}", device.MacAddress, snapshot.Tools.Count);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to initialize MCP tools for {Mac}", device.MacAddress);
            device.Mcp.InitializeResult ??= new
            {
                protocolVersion = "2024-11-05",
                capabilities = new
                {
                    tools = new
                    {
                        listChanged = false
                    }
                },
                serverInfo = new
                {
                    name = "ai-admin",
                    version = "local-runtime"
                }
            };
            device.Mcp.CachedTools.Clear();
        }
    }

    private async Task PublishMcpPayloadAsync(DeviceConnection device, object payload)
    {
        var broker = _serviceProvider.GetRequiredService<MqttBrokerService>();
        await broker.PublishToDeviceAsync(device, JsonSerializer.Serialize(new
        {
            type = "mcp",
            payload
        }));
    }

    private static object? DeserializeJsonValue(JsonElement element)
    {
        return JsonSerializer.Deserialize<object>(element.GetRawText());
    }

    /// <summary>
    /// 更新设备路由信息到分布式会话目录
    /// 用于集群中定位设备所在的节点
    /// </summary>
    private async Task UpdateDeviceRouteAsync(
        string deviceId,
        string clientId,
        string? sessionId,
        string nodeId,
        CancellationToken cancellationToken)
    {
        using var scope = _serviceScopeFactory.CreateScope();
        var onlineStateService = scope.ServiceProvider.GetRequiredService<OnlineStateService>();
        await onlineStateService.UpdateDeviceRouteAsync(deviceId, clientId, sessionId, nodeId, cancellationToken);
    }

    /// <summary>
    /// 生成UDP包头（16字节）
    /// 格式：[version:1][reserved:1][length:2][connectionId:4][timestamp:4][sequence:4]
    /// </summary>
    private static byte[] GenerateUdpHeader(int length, uint timestamp, uint sequence, uint connectionId)
    {
        var header = new byte[16];
        header[0] = 1; // 版本号
        header[2] = (byte)(length >> 8);
        header[3] = (byte)(length & 0xFF);
        header[4] = (byte)(connectionId >> 24);
        header[5] = (byte)((connectionId >> 16) & 0xFF);
        header[6] = (byte)((connectionId >> 8) & 0xFF);
        header[7] = (byte)(connectionId & 0xFF);
        header[8] = (byte)(timestamp >> 24);
        header[9] = (byte)((timestamp >> 16) & 0xFF);
        header[10] = (byte)((timestamp >> 8) & 0xFF);
        header[11] = (byte)(timestamp & 0xFF);
        header[12] = (byte)(sequence >> 24);
        header[13] = (byte)((sequence >> 16) & 0xFF);
        header[14] = (byte)((sequence >> 8) & 0xFF);
        header[15] = (byte)(sequence & 0xFF);
        return header;
    }
}
