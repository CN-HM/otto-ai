using AiAdmin.Config;
using AiAdmin.Infrastructure;
using AiAdmin.Protocol.Runtime;
using AiAdmin.Server.Cluster;
using AiAdmin.Server.Endpoints;
using AiAdmin.Server.HostedServices;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Settings;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace AiAdmin.Controllers;

/// <summary>
/// 服务端管理控制器
/// 提供与Python服务端通信、服务端列表查询功能
/// </summary>
[ApiController]
[Route("admin/server")]
public class ServerController : AiAdminBaseController
{
    private readonly IoTRuntimeOptions _runtimeOptions;
    private readonly INodeIdentityProvider _nodeIdentityProvider;
    private readonly IServerAddressProvider _serverAddressProvider;
    private readonly DeviceConnectionManager _deviceConnectionManager;
    private readonly MqttBrokerService _mqttBrokerService;
    private readonly UdpHostedService _udpHostedService;
    private readonly NodeHeartbeatHostedService _nodeHeartbeatHostedService;
    private readonly DeviceWebSocketHostedService _deviceWebSocketHostedService;
    private readonly DeviceWebSocketEndpoint _deviceWebSocketEndpoint;
    private readonly ConversationRuntimeTraceAggregator _conversationRuntimeTraceAggregator;
    private readonly RuntimeReadinessService _runtimeReadinessService;

    public ServerController(
        IOptions<IoTRuntimeOptions> runtimeOptions,
        INodeIdentityProvider nodeIdentityProvider,
        IServerAddressProvider serverAddressProvider,
        DeviceConnectionManager deviceConnectionManager,
        MqttBrokerService mqttBrokerService,
        UdpHostedService udpHostedService,
        NodeHeartbeatHostedService nodeHeartbeatHostedService,
        DeviceWebSocketHostedService deviceWebSocketHostedService,
        DeviceWebSocketEndpoint deviceWebSocketEndpoint,
        ConversationRuntimeTraceAggregator conversationRuntimeTraceAggregator,
        RuntimeReadinessService runtimeReadinessService)
    {
        _runtimeOptions = runtimeOptions.Value;
        _nodeIdentityProvider = nodeIdentityProvider;
        _serverAddressProvider = serverAddressProvider;
        _deviceConnectionManager = deviceConnectionManager;
        _mqttBrokerService = mqttBrokerService;
        _udpHostedService = udpHostedService;
        _nodeHeartbeatHostedService = nodeHeartbeatHostedService;
        _deviceWebSocketHostedService = deviceWebSocketHostedService;
        _deviceWebSocketEndpoint = deviceWebSocketEndpoint;
        _conversationRuntimeTraceAggregator = conversationRuntimeTraceAggregator;
        _runtimeReadinessService = runtimeReadinessService;
    }

    [HttpGet("runtime-status")]
    [Authorize]
    public async Task<Result<RuntimeStatusDto>> GetRuntimeStatus()
    {
        var node = _nodeIdentityProvider.Current;
        var address = await _serverAddressProvider.GetSnapshotAsync(HttpContext.RequestAborted);
        var connections = _deviceConnectionManager.GetAll();
        var onlineDeviceCount = connections.Count;
        var activeConversationCount = connections.Count(connection => connection.Bridge != null);
        var aliveConversationCount = connections.Count(connection => connection.Bridge?.IsAlive == true);
        var udpSessionCount = connections.Count(connection => connection.Udp != null);
        var traceSnapshot = _conversationRuntimeTraceAggregator.GetSnapshot();
        var readinessSnapshot = await _runtimeReadinessService.GetSnapshotAsync(HttpContext.RequestAborted);
        var runtimeHost = address.PublicHost;
        var httpBaseUrl = string.IsNullOrWhiteSpace(runtimeHost)
            ? "未配置对外地址"
            : _serverAddressProvider.BuildProvisioningApiBaseUrl(Request, runtimeHost);
        var deviceWebSocketUrl = string.IsNullOrWhiteSpace(runtimeHost)
            ? "未配置对外地址"
            : _serverAddressProvider.BuildRequestWebSocketUrl(Request, runtimeHost, _deviceWebSocketEndpoint.Path);
        var mqttEndpoint = string.IsNullOrWhiteSpace(runtimeHost)
            ? "未配置对外地址"
            : $"{runtimeHost}:{node.MqttPort}";
        var udpEndpoint = string.IsNullOrWhiteSpace(runtimeHost)
            ? "未配置对外地址"
            : $"{runtimeHost}:{node.UdpPort}";

        var services = new List<RuntimeServiceStatusDto>
        {
            CreateServiceStatus(
                "mqtt",
                "MQTT Broker",
                "MQTT",
                !_runtimeOptions.Enabled || !_runtimeOptions.EnableMqtt ? "未启用" : _mqttBrokerService.IsRunning ? "监听中" : "未就绪",
                !_runtimeOptions.Enabled || !_runtimeOptions.EnableMqtt ? "secondary" : _mqttBrokerService.IsRunning ? "success" : "warn",
                mqttEndpoint,
                $"在线设备 {onlineDeviceCount} 台，本地会话 {aliveConversationCount} 条"),
            CreateServiceStatus(
                "udp",
                "UDP Audio",
                "UDP",
                !_runtimeOptions.Enabled || !_runtimeOptions.EnableUdp ? "未启用" : _udpHostedService.IsRunning ? "监听中" : "未就绪",
                !_runtimeOptions.Enabled || !_runtimeOptions.EnableUdp ? "secondary" : _udpHostedService.IsRunning ? "success" : "warn",
                udpEndpoint,
                $"当前 UDP 会话 {udpSessionCount} 个"),
            CreateServiceStatus(
                "device-websocket",
                "Device WebSocket",
                "WebSocket",
                !_runtimeOptions.Enabled || !_runtimeOptions.EnableDeviceWebSocket ? "未启用" : _deviceWebSocketHostedService.IsRunning ? "支架模式" : "未就绪",
                !_runtimeOptions.Enabled || !_runtimeOptions.EnableDeviceWebSocket ? "secondary" : "warn",
                deviceWebSocketUrl,
                _deviceWebSocketHostedService.IsRunning ? "端点已挂载，当前仍为协议迁移支架实现" : "设备直连 WebSocket 尚未进入可用状态"),
            CreateServiceStatus(
                "heartbeat",
                "Cluster Heartbeat",
                "Redis",
                !_runtimeOptions.Enabled ? "未启用" : _nodeHeartbeatHostedService.IsRunning ? "运行中" : "未就绪",
                !_runtimeOptions.Enabled ? "secondary" : _nodeHeartbeatHostedService.IsRunning ? "success" : "warn",
                node.NodeId,
                _nodeHeartbeatHostedService.LastHeartbeatAtUtc.HasValue
                    ? $"最近心跳 {_nodeHeartbeatHostedService.LastHeartbeatAtUtc:yyyy-MM-dd HH:mm:ss} UTC"
                    : "尚未写入首个节点心跳"),
            CreateServiceStatus(
                "conversation-runtime",
                "Conversation Runtime",
                "Local",
                !_runtimeOptions.Enabled
                    ? "未启用"
                    : aliveConversationCount > 0
                        ? "有活跃会话"
                        : activeConversationCount > 0
                            ? "处理中"
                            : "就绪",
                !_runtimeOptions.Enabled
                    ? "secondary"
                    : aliveConversationCount > 0
                        ? "success"
                        : activeConversationCount > 0
                            ? "info"
                            : "success",
                $"IdleTimeout={_runtimeOptions.LocalSpeechIdleTimeoutMs}ms",
                $"本地语音切句 {_runtimeOptions.LocalSpeechIdleTimeoutMs} ms，当前会话 {activeConversationCount} 条，阶段成功 {traceSnapshot.SuccessfulStageCount} / 失败 {traceSnapshot.FailedStageCount} / 回退 {traceSnapshot.FallbackStageCount}"),
            CreateServiceStatus(
                "http-api",
                "Admin API",
                "HTTP",
                "运行中",
                "success",
                httpBaseUrl,
                $"节点 {node.NodeId} 已启动，运行时总开关 {(_runtimeOptions.Enabled ? "开启" : "关闭")}")
        };

        var result = new RuntimeStatusDto(
            node.NodeId,
            _runtimeOptions.Enabled,
            node.StartedAtUtc,
            onlineDeviceCount,
            activeConversationCount,
            aliveConversationCount,
            udpSessionCount,
            _runtimeOptions.LocalSpeechIdleTimeoutMs,
            services,
            traceSnapshot,
            readinessSnapshot);

        return Result<RuntimeStatusDto>.Ok(result);
    }

    private static RuntimeServiceStatusDto CreateServiceStatus(
        string key,
        string name,
        string protocol,
        string statusText,
        string severity,
        string endpoint,
        string description)
    {
        return new RuntimeServiceStatusDto(key, name, protocol, statusText, severity, endpoint, description);
    }

}

public sealed record RuntimeStatusDto(
    string NodeId,
    bool RuntimeEnabled,
    DateTimeOffset NodeStartedAtUtc,
    int OnlineDeviceCount,
    int ActiveConversationCount,
    int AliveConversationCount,
    int UdpSessionCount,
    int LocalSpeechIdleTimeoutMs,
    IReadOnlyList<RuntimeServiceStatusDto> Services,
    ConversationRuntimeTraceSnapshotDto? ConversationTrace,
    RuntimeReadinessSnapshotDto? Readiness);

public sealed record RuntimeServiceStatusDto(
    string Key,
    string Name,
    string Protocol,
    string StatusText,
    string Severity,
    string Endpoint,
    string Description);
