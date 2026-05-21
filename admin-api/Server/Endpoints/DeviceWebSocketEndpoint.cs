using System.Net.WebSockets;
using AiAdmin.Config;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.Endpoints;

/// <summary>
/// 设备WebSocket端点处理器
/// 处理设备直连WebSocket连接（支架实现，尚未完全迁移）
/// 当前实现仅返回错误，实际功能需从mqtt-gateway迁移
/// </summary>
public class DeviceWebSocketEndpoint(
    IOptions<IoTRuntimeOptions> options,
    ILogger<DeviceWebSocketEndpoint> logger)
{
    private readonly IoTRuntimeOptions _options = options.Value;
    private readonly ILogger<DeviceWebSocketEndpoint> _logger = logger;

    /// <summary>WebSocket端点路径</summary>
    public PathString Path => new(_options.DeviceWebSocketPath);

    /// <summary>是否启用设备WebSocket端点</summary>
    public bool IsEnabled => _options.Enabled && _options.EnableDeviceWebSocket;

    /// <summary>
    /// 处理WebSocket连接请求
    /// 当前为支架实现，直接关闭连接并返回未实现错误
    /// </summary>
    public async Task HandleAsync(HttpContext context)
    {
        // 检查是否为WebSocket升级请求
        if (!context.WebSockets.IsWebSocketRequest)
        {
            context.Response.StatusCode = StatusCodes.Status426UpgradeRequired;
            return;
        }

        // 接受WebSocket连接
        using var socket = await context.WebSockets.AcceptWebSocketAsync();
        
        // 记录警告日志，提示尚未实现
        _logger.LogWarning("IoT device WebSocket runtime scaffold received a connection before protocol migration was implemented");
        
        // 关闭连接并返回策略违规错误
        await socket.CloseAsync(
            WebSocketCloseStatus.PolicyViolation,
            "IoT device WebSocket runtime scaffold is not implemented yet.",
            context.RequestAborted);
    }
}
