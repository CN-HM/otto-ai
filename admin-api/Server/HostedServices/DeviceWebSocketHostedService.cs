using AiAdmin.Config;
using AiAdmin.Server.Cluster;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.HostedServices;

/// <summary>
/// 设备WebSocket托管服务（占位/支架服务）
/// 用于设备直连WebSocket功能的配置验证和日志记录
/// </summary>
public class DeviceWebSocketHostedService(
    IOptions<IoTRuntimeOptions> options,
    INodeIdentityProvider nodeIdentityProvider,
    ILogger<DeviceWebSocketHostedService> logger) : IHostedService
{
    private readonly IoTRuntimeOptions _options = options.Value;
    private readonly INodeIdentityProvider _nodeIdentityProvider = nodeIdentityProvider;
    private readonly ILogger<DeviceWebSocketHostedService> _logger = logger;

    /// <summary>服务运行状态</summary>
    public bool IsRunning { get; private set; }

    /// <summary>
    /// 启动设备WebSocket服务
    /// </summary>
    public Task StartAsync(CancellationToken cancellationToken)
    {
        if (!_options.Enabled || !_options.EnableDeviceWebSocket)
        {
            return Task.CompletedTask;
        }

        var node = _nodeIdentityProvider.Current;
        IsRunning = true;
        _logger.LogInformation(
            "IoT device WebSocket runtime scaffold enabled on node {NodeId} at path {Path}",
            node.NodeId,
            _options.DeviceWebSocketPath);
        return Task.CompletedTask;
    }

    /// <summary>
    /// 停止设备WebSocket服务
    /// </summary>
    public Task StopAsync(CancellationToken cancellationToken)
    {
        IsRunning = false;
        if (_options.Enabled && _options.EnableDeviceWebSocket)
        {
            _logger.LogInformation("IoT device WebSocket runtime scaffold stopped");
        }

        return Task.CompletedTask;
    }
}
