namespace AiAdmin.Server.Cluster;

/// <summary>
/// 会话路由信息记录，存储在Redis中
/// 用于集群中定位设备所在的节点，支持三种路由维度
/// </summary>
/// <param name="NodeId">节点ID，设备当前连接的节点</param>
/// <param name="DeviceId">设备ID（MAC地址）</param>
/// <param name="ClientId">MQTT客户端ID</param>
/// <param name="SessionId">语音会话ID（可为null，表示只有MQTT连接无语音会话）</param>
/// <param name="UpdatedAtUtc">路由更新时间</param>
public sealed record SessionRouteInfo(
    string NodeId,
    string DeviceId,
    string ClientId,
    string? SessionId,
    DateTimeOffset UpdatedAtUtc);
