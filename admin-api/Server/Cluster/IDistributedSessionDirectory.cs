namespace AiAdmin.Server.Cluster;

/// <summary>
/// 分布式会话目录接口
/// 管理集群节点心跳和设备/会话路由信息
/// 实现基于Redis的分布式状态共享
/// </summary>
public interface IDistributedSessionDirectory
{
    /// <summary>更新当前节点的心跳信息</summary>
    Task UpdateNodeHeartbeatAsync(CancellationToken cancellationToken = default);
    
    /// <summary>获取指定节点的心跳信息</summary>
    Task<NodeHeartbeatSnapshot?> GetNodeHeartbeatAsync(string nodeId, CancellationToken cancellationToken = default);
    
    /// <summary>注册会话路由</summary>
    Task RegisterSessionRouteAsync(SessionRouteInfo route, CancellationToken cancellationToken = default);
    
    /// <summary>根据设备ID获取会话路由</summary>
    Task<SessionRouteInfo?> GetSessionRouteByDeviceIdAsync(string deviceId, CancellationToken cancellationToken = default);
    
    /// <summary>根据客户端ID获取会话路由</summary>
    Task<SessionRouteInfo?> GetSessionRouteByClientIdAsync(string clientId, CancellationToken cancellationToken = default);
    
    /// <summary>根据会话ID获取会话路由</summary>
    Task<SessionRouteInfo?> GetSessionRouteBySessionIdAsync(string sessionId, CancellationToken cancellationToken = default);
    
    /// <summary>移除会话路由</summary>
    Task RemoveSessionRouteAsync(SessionRouteInfo route, CancellationToken cancellationToken = default);
}
