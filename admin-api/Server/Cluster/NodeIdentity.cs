namespace AiAdmin.Server.Cluster;

/// <summary>
/// 节点身份信息记录
/// 包含节点ID、公共地址、端口配置和能力标志
/// </summary>
/// <param name="NodeId">节点唯一标识</param>
/// <param name="DeviceWebSocketPath">设备WebSocket路径</param>
/// <param name="MqttPort">MQTT服务端口</param>
/// <param name="UdpPort">UDP服务端口</param>
/// <param name="EnableMqtt">是否启用MQTT</param>
/// <param name="EnableDeviceWebSocket">是否启用设备WebSocket</param>
/// <param name="EnableUdp">是否启用UDP</param>
/// <param name="StartedAtUtc">节点启动时间</param>
public sealed record NodeIdentity(
    string NodeId,
    string DeviceWebSocketPath,
    int MqttPort,
    int UdpPort,
    bool EnableMqtt,
    bool EnableDeviceWebSocket,
    bool EnableUdp,
    DateTimeOffset StartedAtUtc);
