namespace AiAdmin.Protocol.Runtime;

/// <summary>
/// MCP（Model Context Protocol）状态
/// 缓存MCP协议握手结果和工具列表
/// </summary>
public class McpState
{
    /// <summary>MCP初始化结果，包含服务器能力信息</summary>
    public object? InitializeResult { get; set; }

    /// <summary>缓存的工具列表，用于响应tools/list请求</summary>
    public List<object> CachedTools { get; } = [];

    /// <summary>下一个请求ID，用于JSON-RPC请求</summary>
    public int NextRequestId { get; set; } = 10000;
}

