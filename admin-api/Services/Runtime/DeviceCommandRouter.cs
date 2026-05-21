using AiAdmin.Server.Cluster;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

/// <summary>
/// 设备命令路由器，支持主动-主动集群部署
/// 根据设备ID从Redis查询路由信息，判断设备是否归属当前节点
/// 用于管理后台向设备推送命令时的集群路由决策
/// </summary>
public class DeviceCommandRouter : ITransientDependency
{
    /// <summary>分布式会话目录（Redis），存储设备-节点路由映射</summary>
    private readonly IDistributedSessionDirectory _sessionDirectory;
    
    /// <summary>当前节点身份提供者</summary>
    private readonly INodeIdentityProvider _nodeIdentityProvider;

    /// <summary>创建设备命令路由器实例</summary>
    public DeviceCommandRouter(
        IDistributedSessionDirectory sessionDirectory,
        INodeIdentityProvider nodeIdentityProvider)
    {
        _sessionDirectory = sessionDirectory;
        _nodeIdentityProvider = nodeIdentityProvider;
    }

    /// <summary>
    /// 获取设备的路由信息
    /// </summary>
    /// <param name="deviceId">设备ID（MAC地址）</param>
    /// <returns>路由信息，包含节点ID、客户端ID、会话ID</returns>
    public Task<SessionRouteInfo?> GetRouteByDeviceIdAsync(string deviceId, CancellationToken cancellationToken = default)
    {
        return _sessionDirectory.GetSessionRouteByDeviceIdAsync(deviceId, cancellationToken);
    }

    /// <summary>
    /// 判断设备是否归属于当前节点
    /// 用于集群中决定是否本地处理或转发请求给其他节点
    /// </summary>
    /// <param name="deviceId">设备ID（MAC地址）</param>
    /// <returns>true表示设备在当前节点，false表示在其他节点或离线</returns>
    public async Task<bool> IsOwnedByCurrentNodeAsync(string deviceId, CancellationToken cancellationToken = default)
    {
        // 从Redis获取设备路由
        var route = await _sessionDirectory.GetSessionRouteByDeviceIdAsync(deviceId, cancellationToken);
        // 判断路由中的节点ID是否与当前节点相同
        return route != null && string.Equals(route.NodeId, _nodeIdentityProvider.Current.NodeId, StringComparison.Ordinal);
    }
}
