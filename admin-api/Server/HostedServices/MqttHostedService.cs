using AiAdmin.Config;
using AiAdmin.Server.Cluster;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.HostedServices;

/// <summary>
/// MQTT托管服务（占位/支架服务）
/// 注意：实际的MQTT Broker功能由 MqttBrokerService 提供
/// 本服务仅用于配置验证和日志记录
/// </summary>
public class MqttHostedService : IHostedService
{
    /// <summary>运行时配置选项</summary>
    private readonly IoTRuntimeOptions _options;
    
    /// <summary>节点身份提供者</summary>
    private readonly INodeIdentityProvider _nodeIdentityProvider;
    
    /// <summary>日志记录器</summary>
    private readonly ILogger<MqttHostedService> _logger;

    /// <summary>创建MQTT托管服务实例</summary>
    public MqttHostedService(
        IOptions<IoTRuntimeOptions> options,
        INodeIdentityProvider nodeIdentityProvider,
        ILogger<MqttHostedService> logger)
    {
        _options = options.Value;
        _nodeIdentityProvider = nodeIdentityProvider;
        _logger = logger;
    }

    /// <summary>
    /// 启动MQTT服务（仅记录日志，实际服务由MqttBrokerService提供）
    /// </summary>
    public Task StartAsync(CancellationToken cancellationToken)
    {
        if (!_options.Enabled || !_options.EnableMqtt)
        {
            return Task.CompletedTask;
        }

        var node = _nodeIdentityProvider.Current;
        _logger.LogInformation(
            "IoT MQTT runtime scaffold enabled on node {NodeId} at port {Port}",
            node.NodeId,
            _options.MqttPort);
        return Task.CompletedTask;
    }

    /// <summary>
    /// 停止MQTT服务
    /// </summary>
    public Task StopAsync(CancellationToken cancellationToken)
    {
        if (_options.Enabled && _options.EnableMqtt)
        {
            _logger.LogInformation("IoT MQTT runtime scaffold stopped");
        }

        return Task.CompletedTask;
    }
}
