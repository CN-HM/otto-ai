namespace AiAdmin.Protocol.Runtime;

/// <summary>
/// 设备连接实体，表示一个在线设备的完整连接状态
/// 包含MQTT连接信息、MAC地址、WebSocket桥接、UDP会话和MCP状态
/// </summary>
public class DeviceConnection
{
    /// <summary>MQTT客户端ID，格式：{groupId}@@@{mac_no_colon}@@@{uuid}</summary>
    public required string ClientId { get; init; }

    /// <summary>设备MAC地址，用于唯一标识设备</summary>
    public required string MacAddress { get; init; }

    /// <summary>设备UUID，固件生成的唯一标识</summary>
    public required string Uuid { get; init; }

    /// <summary>设备分组ID，用于多租户场景</summary>
    public required string GroupId { get; init; }

    /// <summary>设备长期凭证ID，用于连接审计与凭证轮换</summary>
    public required string CredentialId { get; init; }

    /// <summary>设备IP地址，从MQTT用户名中解析</summary>
    public string? DeviceIp { get; init; }

    /// <summary>连接ID，用于UDP包路由，每个连接唯一</summary>
    public uint ConnectionId { get; init; }

    /// <summary>连接建立时间</summary>
    public DateTime ConnectedAt { get; init; } = DateTime.UtcNow;

    /// <summary>设备响应Topic，用于向设备推送消息</summary>
    public string ReplyTopic => $"devices/p2p/{MacAddress.Replace(":", "_", StringComparison.Ordinal)}";

    /// <summary>WebSocket桥接，连接Python服务的WebSocket通道</summary>
    public IDeviceConversationBridge? Bridge { get; set; }

    /// <summary>UDP会话信息，包含加密密钥和序列号</summary>
    public UdpSession? Udp { get; set; }

    /// <summary>MCP协议状态，缓存工具列表和初始化结果</summary>
    public McpState Mcp { get; } = new();
}

