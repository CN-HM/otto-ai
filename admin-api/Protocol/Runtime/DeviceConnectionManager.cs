using System.Collections.Concurrent;

namespace AiAdmin.Protocol.Runtime;

/// <summary>
/// 设备连接管理器（单例）
/// 提供MAC地址、连接ID、客户端ID三重索引，支持快速路由查找
/// 处理设备重连时的旧连接清理
/// </summary>
public class DeviceConnectionManager
{
    /// <summary>按MAC地址索引，支持大小写不敏感查找</summary>
    private readonly ConcurrentDictionary<string, DeviceConnection> _byMac = new(StringComparer.OrdinalIgnoreCase);
    
    /// <summary>按连接ID索引，用于UDP包路由</summary>
    private readonly ConcurrentDictionary<uint, DeviceConnection> _byConnectionId = new();
    
    /// <summary>按MQTT客户端ID索引</summary>
    private readonly ConcurrentDictionary<string, DeviceConnection> _byClientId = new(StringComparer.Ordinal);

    /// <summary>当前在线设备数量</summary>
    public int OnlineCount => _byMac.Count;

    /// <summary>
    /// 生成唯一的连接ID，用于UDP包路由
    /// 确保不与其他在线连接冲突
    /// </summary>
    /// <returns>新的连接ID</returns>
    public uint GenerateConnectionId()
    {
        uint id;
        do
        {
            id = (uint)Random.Shared.Next(1, int.MaxValue);
        }
        while (_byConnectionId.ContainsKey(id));

        return id;
    }

    /// <summary>
    /// 添加设备连接，自动清理同MAC的旧连接（处理重连场景）
    /// </summary>
    /// <param name="connection">新设备连接</param>
    public void Add(DeviceConnection connection)
    {
        // 如果该MAC已有连接，清理旧连接（设备重连）
        if (_byMac.TryRemove(connection.MacAddress, out var old))
        {
            _byConnectionId.TryRemove(old.ConnectionId, out _);
            _byClientId.TryRemove(old.ClientId, out _);
            _ = CleanupConnectionAsync(old);
        }

        _byMac[connection.MacAddress] = connection;
        _byConnectionId[connection.ConnectionId] = connection;
        _byClientId[connection.ClientId] = connection;
    }

    /// <summary>根据MAC地址查找设备连接</summary>
    public DeviceConnection? GetByMac(string macAddress)
    {
        return _byMac.TryGetValue(macAddress, out var connection) ? connection : null;
    }

    /// <summary>根据连接ID查找设备连接（用于UDP路由）</summary>
    public DeviceConnection? GetByConnectionId(uint connectionId)
    {
        return _byConnectionId.TryGetValue(connectionId, out var connection) ? connection : null;
    }

    /// <summary>根据MQTT客户端ID查找设备连接</summary>
    public DeviceConnection? GetByClientId(string clientId)
    {
        return _byClientId.TryGetValue(clientId, out var connection) ? connection : null;
    }

    /// <summary>
    /// 根据客户端ID移除设备连接
    /// 同时清理MAC和连接ID索引
    /// </summary>
    public DeviceConnection? Remove(string clientId)
    {
        if (!_byClientId.TryRemove(clientId, out var connection))
        {
            return null;
        }

        _byMac.TryRemove(connection.MacAddress, out _);
        _byConnectionId.TryRemove(connection.ConnectionId, out _);
        return connection;
    }

    /// <summary>获取所有在线设备连接</summary>
    public IReadOnlyCollection<DeviceConnection> GetAll()
    {
        return _byMac.Values.ToArray();
    }

    /// <summary>
    /// 异步清理连接资源，关闭WebSocket桥接
    /// </summary>
    private static async Task CleanupConnectionAsync(DeviceConnection connection)
    {
        if (connection.Bridge != null)
        {
            await connection.Bridge.DisposeAsync();
        }
    }
}
