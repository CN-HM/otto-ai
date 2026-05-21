namespace AiAdmin.Config;

/// <summary>
/// IoT运行时配置选项
/// 控制MQTT Broker、UDP音频服务、集群心跳等功能的配置
/// </summary>
public class IoTRuntimeOptions
{
    /// <summary>配置节名称</summary>
    public const string SectionName = "IoTRuntime";

    /// <summary>是否启用IoT运行时（总开关）</summary>
    public bool Enabled { get; set; }
    
    /// <summary>是否启用HTTP API（设备控制接口）</summary>
    public bool EnableHttpApi { get; set; } = true;
    
    /// <summary>是否启用MQTT服务</summary>
    public bool EnableMqtt { get; set; }
    
    /// <summary>是否启用设备直连WebSocket</summary>
    public bool EnableDeviceWebSocket { get; set; }
    
    /// <summary>是否启用UDP音频服务</summary>
    public bool EnableUdp { get; set; }
    
    /// <summary>节点ID（集群标识，为空则使用机器名）</summary>
    public string NodeId { get; set; } = string.Empty;
    
    /// <summary>设备WebSocket路径</summary>
    public string DeviceWebSocketPath { get; set; } = "/device/ws";
    
    /// <summary>MQTT服务端口（默认1883）</summary>
    public int MqttPort { get; set; } = 1883;
    
    /// <summary>UDP服务端口（默认8884）</summary>
    public int UdpPort { get; set; } = 8884;
    
    /// <summary>MQTT连接签名密钥（HMAC-SHA256）</summary>
    public string SignatureKey { get; set; } = string.Empty;

    public int LocalSpeechIdleTimeoutMs { get; set; } = 900;
    
    /// <summary>最大连接数限制（默认20000）</summary>
    public int MaxConnections { get; set; } = 20_000;
    
    /// <summary>MQTT保活超时（秒，默认300）</summary>
    public int KeepAliveSeconds { get; set; } = 300;
    
    /// <summary>节点心跳间隔（秒，默认10）</summary>
    public int NodeHeartbeatSeconds { get; set; } = 10;
    
    /// <summary>节点心跳TTL（秒，默认30，应大于心跳间隔）</summary>
    public int NodeHeartbeatTtlSeconds { get; set; } = 30;
    
    /// <summary>会话路由TTL（秒，默认90）</summary>
    public int SessionRouteTtlSeconds { get; set; } = 90;
    
    /// <summary>Redis键前缀（默认"AI:runtime"）</summary>
    public string KeyPrefix { get; set; } = "ai:runtime";
}
