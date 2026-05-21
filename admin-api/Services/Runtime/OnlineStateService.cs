using AiAdmin.Server.Cluster;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

/// <summary>
/// 在线状态服务，管理设备在线/离线状态和集群路由
/// 协调分布式会话目录和设备运行时服务，支持主动-主动集群部署
/// </summary>
public class OnlineStateService : ITransientDependency
{
    /// <summary>分布式会话目录（Redis）</summary>
    private readonly IDistributedSessionDirectory _sessionDirectory;
    
    /// <summary>设备运行时服务（数据库操作）</summary>
    private readonly DeviceRuntimeService _deviceRuntimeService;

    /// <summary>创建在线状态服务实例</summary>
    public OnlineStateService(
        IDistributedSessionDirectory sessionDirectory,
        DeviceRuntimeService deviceRuntimeService)
    {
        _sessionDirectory = sessionDirectory;
        _deviceRuntimeService = deviceRuntimeService;
    }

    /// <summary>
    /// 标记设备在线
    /// 注册集群路由并更新数据库在线状态
    /// </summary>
    /// <param name="deviceId">设备ID（MAC地址）</param>
    /// <param name="clientId">MQTT客户端ID</param>
    /// <param name="sessionId">语音会话ID（可为null）</param>
    /// <param name="macAddress">MAC地址</param>
    /// <param name="nodeId">当前节点ID</param>
    public async Task MarkDeviceOnlineAsync(
        string deviceId,
        string clientId,
        string? sessionId,
        string macAddress,
        string nodeId,
        CancellationToken cancellationToken = default)
    {
        // 注册集群路由（用于其他节点转发请求）
        await UpdateDeviceRouteAsync(deviceId, clientId, sessionId, nodeId, cancellationToken);
        // 更新数据库在线状态
        await _deviceRuntimeService.SetDeviceOnlineAsync(macAddress, cancellationToken);
    }

    /// <summary>
    /// 更新设备集群路由
    /// 用于hello/goodbye时更新会话状态，或设备重连时更新节点归属
    /// </summary>
    public Task UpdateDeviceRouteAsync(
        string deviceId,
        string clientId,
        string? sessionId,
        string nodeId,
        CancellationToken cancellationToken = default)
    {
        var route = new SessionRouteInfo(nodeId, deviceId, clientId, sessionId, DateTimeOffset.UtcNow);
        return _sessionDirectory.RegisterSessionRouteAsync(route, cancellationToken);
    }

    /// <summary>
    /// 标记设备离线
    /// 清理集群路由并更新数据库离线状态
    /// </summary>
    public async Task MarkDeviceOfflineAsync(
        string deviceId,
        string clientId,
        string? sessionId,
        string macAddress,
        string nodeId,
        CancellationToken cancellationToken = default)
    {
        // 移除集群路由
        await _sessionDirectory.RemoveSessionRouteAsync(
            new SessionRouteInfo(nodeId, deviceId, clientId, sessionId, DateTimeOffset.UtcNow), 
            cancellationToken);
        // 更新数据库离线状态
        await _deviceRuntimeService.SetDeviceOfflineAsync(macAddress, cancellationToken);
    }
}
