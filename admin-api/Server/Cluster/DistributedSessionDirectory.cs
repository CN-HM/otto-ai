using System.Text.Json;
using AiAdmin.Config;
using AiAdmin.Services.Settings;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.Cluster;

/// <summary>
/// 分布式会话目录实现，基于Redis分布式缓存
/// 管理设备路由、会话路由和节点心跳，支持主动-主动集群部署
/// </summary>
public class DistributedSessionDirectory : IDistributedSessionDirectory
{
    /// <summary>JSON序列化选项</summary>
    private static readonly JsonSerializerOptions JsonOptions = new(JsonSerializerDefaults.Web);

    /// <summary>分布式缓存（Redis）</summary>
    private readonly IDistributedCache _cache;
    
    /// <summary>节点身份提供者</summary>
    private readonly INodeIdentityProvider _nodeIdentityProvider;

    private readonly IServerAddressProvider _serverAddressProvider;
    
    /// <summary>运行时配置选项</summary>
    private readonly IoTRuntimeOptions _options;

    /// <summary>创建分布式会话目录实例</summary>
    public DistributedSessionDirectory(
        IDistributedCache cache,
        INodeIdentityProvider nodeIdentityProvider,
        IServerAddressProvider serverAddressProvider,
        IOptions<IoTRuntimeOptions> options)
    {
        _cache = cache;
        _nodeIdentityProvider = nodeIdentityProvider;
        _serverAddressProvider = serverAddressProvider;
        _options = options.Value;
    }

    /// <summary>
    /// 更新当前节点的心跳信息到Redis
    /// 用于集群中其他节点发现本节点的存在和能力
    /// </summary>
    public async Task UpdateNodeHeartbeatAsync(CancellationToken cancellationToken = default)
    {
        var node = _nodeIdentityProvider.Current;
        var address = await _serverAddressProvider.GetSnapshotAsync(cancellationToken);
        // 构建节点心跳快照
        var snapshot = new NodeHeartbeatSnapshot(
            node.NodeId,
            address.PublicHost,
            node.DeviceWebSocketPath,
            node.MqttPort,
            node.UdpPort,
            node.StartedAtUtc,
            DateTimeOffset.UtcNow);

        await SetAsync(GetNodeHeartbeatKey(node.NodeId), snapshot, _options.NodeHeartbeatTtlSeconds, cancellationToken);
    }

    /// <summary>
    /// 获取指定节点的心跳信息
    /// </summary>
    /// <param name="nodeId">节点ID</param>
    public Task<NodeHeartbeatSnapshot?> GetNodeHeartbeatAsync(string nodeId, CancellationToken cancellationToken = default)
    {
        return GetAsync<NodeHeartbeatSnapshot>(GetNodeHeartbeatKey(nodeId), cancellationToken);
    }

    /// <summary>
    /// 注册会话路由到Redis
    /// 同时注册设备、客户端和会话三个维度的路由
    /// </summary>
    /// <param name="route">路由信息</param>
    public async Task RegisterSessionRouteAsync(SessionRouteInfo route, CancellationToken cancellationToken = default)
    {
        // 注册设备路由（用于根据MAC地址查找节点）
        await SetAsync(GetDeviceRouteKey(route.DeviceId), route, _options.SessionRouteTtlSeconds, cancellationToken);
        // 注册客户端路由（用于根据clientId查找节点）
        await SetAsync(GetClientRouteKey(route.ClientId), route, _options.SessionRouteTtlSeconds, cancellationToken);
        // 注册会话路由（用于根据sessionId查找节点，仅当有sessionId时）
        if (!string.IsNullOrWhiteSpace(route.SessionId))
        {
            await SetAsync(GetSessionRouteKey(route.SessionId), route, _options.SessionRouteTtlSeconds, cancellationToken);
        }
    }

    /// <summary>根据设备ID获取会话路由</summary>
    public Task<SessionRouteInfo?> GetSessionRouteByDeviceIdAsync(string deviceId, CancellationToken cancellationToken = default)
    {
        return GetAsync<SessionRouteInfo>(GetDeviceRouteKey(deviceId), cancellationToken);
    }

    /// <summary>根据客户端ID获取会话路由</summary>
    public Task<SessionRouteInfo?> GetSessionRouteByClientIdAsync(string clientId, CancellationToken cancellationToken = default)
    {
        return GetAsync<SessionRouteInfo>(GetClientRouteKey(clientId), cancellationToken);
    }

    /// <summary>根据会话ID获取会话路由</summary>
    public Task<SessionRouteInfo?> GetSessionRouteBySessionIdAsync(string sessionId, CancellationToken cancellationToken = default)
    {
        return GetAsync<SessionRouteInfo>(GetSessionRouteKey(sessionId), cancellationToken);
    }

    /// <summary>
    /// 移除会话路由
    /// 同时移除设备、客户端和会话三个维度的路由
    /// </summary>
    public async Task RemoveSessionRouteAsync(SessionRouteInfo route, CancellationToken cancellationToken = default)
    {
        await _cache.RemoveAsync(GetDeviceRouteKey(route.DeviceId), cancellationToken);
        await _cache.RemoveAsync(GetClientRouteKey(route.ClientId), cancellationToken);
        if (!string.IsNullOrWhiteSpace(route.SessionId))
        {
            await _cache.RemoveAsync(GetSessionRouteKey(route.SessionId), cancellationToken);
        }
    }

    /// <summary>
    /// 设置缓存值，带TTL过期时间
    /// </summary>
    private Task SetAsync<T>(string key, T value, int ttlSeconds, CancellationToken cancellationToken)
    {
        return _cache.SetStringAsync(
            key,
            JsonSerializer.Serialize(value, JsonOptions),
            new DistributedCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = TimeSpan.FromSeconds(ttlSeconds)
            },
            cancellationToken);
    }

    /// <summary>
    /// 获取缓存值并反序列化
    /// </summary>
    private async Task<T?> GetAsync<T>(string key, CancellationToken cancellationToken)
    {
        var json = await _cache.GetStringAsync(key, cancellationToken);
        return string.IsNullOrWhiteSpace(json)
            ? default
            : JsonSerializer.Deserialize<T>(json, JsonOptions);
    }

    /// <summary>Redis键：节点心跳</summary>
    private string GetNodeHeartbeatKey(string nodeId) => $"{_options.KeyPrefix}:node:{nodeId}";
    
    /// <summary>Redis键：设备路由</summary>
    private string GetDeviceRouteKey(string deviceId) => $"{_options.KeyPrefix}:route:device:{deviceId}";
    
    /// <summary>Redis键：客户端路由</summary>
    private string GetClientRouteKey(string clientId) => $"{_options.KeyPrefix}:route:client:{clientId}";
    
    /// <summary>Redis键：会话路由</summary>
    private string GetSessionRouteKey(string sessionId) => $"{_options.KeyPrefix}:route:session:{sessionId}";
}
