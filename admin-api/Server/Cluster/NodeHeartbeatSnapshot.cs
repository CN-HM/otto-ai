namespace AiAdmin.Server.Cluster;

/// <summary>
/// 节点心跳快照记录，存储在Redis中
/// 用于集群中节点发现和故障检测
/// </summary>
/// <param name="NodeId">节点唯一标识</param>
/// <param name="PublicHost">统一对外地址</param>
/// <param name="DeviceWebSocketPath">设备WebSocket路径</param>
/// <param name="MqttPort">MQTT服务端口</param>
/// <param name="UdpPort">UDP服务端口</param>
/// <param name="StartedAtUtc">节点启动时间</param>
/// <param name="UpdatedAtUtc">心跳更新时间</param>
public sealed record NodeHeartbeatSnapshot(
    string NodeId,
    string PublicHost,
    string DeviceWebSocketPath,
    int MqttPort,
    int UdpPort,
    DateTimeOffset StartedAtUtc,
    DateTimeOffset UpdatedAtUtc);
