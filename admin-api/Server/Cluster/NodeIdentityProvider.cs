using AiAdmin.Config;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.Cluster;

/// <summary>
/// 节点身份提供者实现
/// 从配置构建节点身份信息，未指定NodeId时使用机器名
/// </summary>
public class NodeIdentityProvider : INodeIdentityProvider
{
    /// <summary>
    /// 创建节点身份提供者实例
    /// 从IoTRuntimeOptions读取配置构建节点身份
    /// </summary>
    public NodeIdentityProvider(IOptions<IoTRuntimeOptions> options)
    {
        var runtime = options.Value;
        var startedAt = DateTimeOffset.UtcNow;
        // 未配置NodeId时使用机器名作为默认值
        var nodeId = string.IsNullOrWhiteSpace(runtime.NodeId)
            ? Environment.MachineName
            : runtime.NodeId.Trim();

        Current = new NodeIdentity(
            nodeId,
            runtime.DeviceWebSocketPath.Trim(),
            runtime.MqttPort,
            runtime.UdpPort,
            runtime.EnableMqtt,
            runtime.EnableDeviceWebSocket,
            runtime.EnableUdp,
            startedAt);
    }

    /// <summary>当前节点身份信息</summary>
    public NodeIdentity Current { get; }
}
