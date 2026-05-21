using System.Net.WebSockets;

namespace AiAdmin.Protocol.Runtime;

/// <summary>
/// WebSocket桥接，连接MQTT设备与Python后端服务
/// 负责协议转换：MQTT消息 ↔ WebSocket消息
/// 处理文本消息（JSON信令）和二进制消息（Opus音频）
/// </summary>
public class WsBridge : IDeviceConversationBridge
{
    /// <summary>底层WebSocket客户端</summary>
    private readonly ClientWebSocket _ws = new();

    /// <summary>关联的设备连接</summary>
    private readonly DeviceConnection _device;

    /// <summary>发送MQTT消息的回调</summary>
    private readonly Func<string, Task> _sendMqttMessageAsync;

    /// <summary>发送UDP音频的回调</summary>
    private readonly Action<byte[], uint> _sendUdpAudio;

    /// <summary>Python服务WebSocket URL</summary>
    private readonly string _wsUrl;

    /// <summary>WebSocket认证令牌</summary>
    private readonly string _authToken;

    /// <summary>取消令牌源，用于关闭接收循环</summary>
    private CancellationTokenSource? _cts;

    /// <summary>WebSocket是否处于打开状态</summary>
    public bool IsAlive => _ws.State == WebSocketState.Open;

    /// <summary>连接关闭事件，外部订阅以清理资源</summary>
    public event Action? OnClosed;

    /// <summary>
    /// 创建WebSocket桥接实例
    /// </summary>
    /// <param name="device">设备连接</param>
    /// <param name="wsUrl">Python服务WebSocket地址</param>
    /// <param name="authToken">认证令牌</param>
    /// <param name="sendMqttMessageAsync">发送MQTT消息回调</param>
    /// <param name="sendUdpAudio">发送UDP音频回调</param>
    public WsBridge(
        DeviceConnection device,
        string wsUrl,
        string authToken,
        Func<string, Task> sendMqttMessageAsync,
        Action<byte[], uint> sendUdpAudio)
    {
        _device = device;
        _wsUrl = wsUrl;
        _authToken = authToken;
        _sendMqttMessageAsync = sendMqttMessageAsync;
        _sendUdpAudio = sendUdpAudio;
    }

    /// <summary>
    /// 连接到Python WebSocket服务并发送hello握手
    /// </summary>
    /// <param name="helloJson">hello消息JSON</param>
    /// <param name="cancellationToken">取消令牌</param>
    /// <returns>Python服务的hello响应，失败返回null</returns>
    public async Task<string?> ConnectAsync(string helloJson, CancellationToken cancellationToken)
    {
        _cts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);

        _ws.Options.SetRequestHeader("device-id", _device.MacAddress);
        _ws.Options.SetRequestHeader("protocol-version", "2");
        _ws.Options.SetRequestHeader("authorization", $"Bearer {_authToken}");
        if (!string.IsNullOrEmpty(_device.Uuid))
        {
            _ws.Options.SetRequestHeader("client-id", _device.Uuid);
        }

        if (!string.IsNullOrEmpty(_device.DeviceIp))
        {
            _ws.Options.SetRequestHeader("x-forwarded-for", _device.DeviceIp);
        }

        await _ws.ConnectAsync(new Uri(_wsUrl), cancellationToken);

        var bytes = System.Text.Encoding.UTF8.GetBytes(helloJson);
        await _ws.SendAsync(bytes, WebSocketMessageType.Text, true, cancellationToken);

        var buffer = new byte[8192];
        var result = await _ws.ReceiveAsync(buffer, cancellationToken);
        if (result.MessageType == WebSocketMessageType.Text)
        {
            var reply = System.Text.Encoding.UTF8.GetString(buffer, 0, result.Count);
            _ = Task.Run(() => ReceiveLoopAsync(_cts.Token), _cts.Token);
            return reply;
        }

        return null;
    }

    /// <summary>
    /// WebSocket接收循环，处理来自Python服务的消息
    /// 文本消息转发到MQTT，二进制音频转发到UDP
    /// </summary>
    private async Task ReceiveLoopAsync(CancellationToken cancellationToken)
    {
        var buffer = new byte[65536];
        try
        {
            while (!cancellationToken.IsCancellationRequested && _ws.State == WebSocketState.Open)
            {
                var result = await _ws.ReceiveAsync(buffer, cancellationToken);
                if (result.MessageType == WebSocketMessageType.Close)
                {
                    break;
                }

                if (result.MessageType == WebSocketMessageType.Text)
                {
                    var json = System.Text.Encoding.UTF8.GetString(buffer, 0, result.Count);
                    if (TryHandleMcpFromBridge(json))
                    {
                        continue;
                    }

                    await _sendMqttMessageAsync(json);
                }
                else if (result.MessageType == WebSocketMessageType.Binary)
                {
                    if (result.Count >= 16)
                    {
                        var timestamp = (uint)((buffer[8] << 24) | (buffer[9] << 16) | (buffer[10] << 8) | buffer[11]);
                        var opusLength = (buffer[12] << 24) | (buffer[13] << 16) | (buffer[14] << 8) | buffer[15];
                        if (result.Count >= 16 + opusLength)
                        {
                            var opus = new byte[opusLength];
                            Buffer.BlockCopy(buffer, 16, opus, 0, opusLength);
                            _sendUdpAudio(opus, timestamp);
                        }
                    }
                }
            }
        }
        catch (OperationCanceledException)
        {
        }
        catch (WebSocketException)
        {
        }
        finally
        {
            OnClosed?.Invoke();
        }
    }

    /// <summary>
    /// 尝试处理来自桥接的MCP协议消息
    /// 处理notifications/initialized、tools/list、initialize等MCP方法
    /// </summary>
    /// <param name="json">收到的JSON消息</param>
    /// <returns>是否已处理（阻止继续转发）</returns>
    private bool TryHandleMcpFromBridge(string json)
    {
        try
        {
            using var doc = System.Text.Json.JsonDocument.Parse(json);
            var root = doc.RootElement;
            if (root.TryGetProperty("type", out var typeElement) && typeElement.GetString() == "mcp"
                && root.TryGetProperty("payload", out var payload)
                && payload.TryGetProperty("method", out var method))
            {
                var methodStr = method.GetString();
                if (methodStr == "notifications/initialized")
                {
                    return true;
                }

                if (methodStr == "tools/list" && payload.TryGetProperty("id", out var idElement))
                {
                    var replyJson = System.Text.Json.JsonSerializer.Serialize(new
                    {
                        type = "mcp",
                        payload = new
                        {
                            jsonrpc = "2.0",
                            id = idElement.GetInt32(),
                            result = new { tools = _device.Mcp.CachedTools }
                        }
                    });
                    _ = SendJsonAsync(replyJson);
                    return true;
                }

                if (methodStr == "initialize" && payload.TryGetProperty("id", out var initIdElement))
                {
                    var replyJson = System.Text.Json.JsonSerializer.Serialize(new
                    {
                        type = "mcp",
                        payload = new
                        {
                            jsonrpc = "2.0",
                            id = initIdElement.GetInt32(),
                            result = _device.Mcp.InitializeResult
                        }
                    });
                    _ = SendJsonAsync(replyJson);
                    return true;
                }
            }
        }
        catch
        {
        }

        return false;
    }

    /// <summary>发送JSON文本消息到Python服务</summary>
    public async Task SendJsonAsync(string json)
    {
        if (_ws.State != WebSocketState.Open)
        {
            return;
        }

        var bytes = System.Text.Encoding.UTF8.GetBytes(json);
        await _ws.SendAsync(bytes, WebSocketMessageType.Text, true, _cts?.Token ?? default);
    }

    /// <summary>发送二进制消息到Python服务（用于音频数据）</summary>
    public async Task SendBinaryAsync(byte[] data)
    {
        if (_ws.State != WebSocketState.Open)
        {
            return;
        }

        await _ws.SendAsync(data, WebSocketMessageType.Binary, true, _cts?.Token ?? default);
    }

    /// <summary>异步释放资源，关闭WebSocket连接</summary>
    public async ValueTask DisposeAsync()
    {
        _cts?.Cancel();
        if (_ws.State == WebSocketState.Open)
        {
            try
            {
                await _ws.CloseAsync(WebSocketCloseStatus.NormalClosure, null, CancellationToken.None);
            }
            catch
            {
            }
        }

        _ws.Dispose();
        _cts?.Dispose();
    }
}
