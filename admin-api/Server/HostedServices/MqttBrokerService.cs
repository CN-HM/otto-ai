using System.Text;
using AiAdmin.Config;
using AiAdmin.Protocol.Mqtt;
using AiAdmin.Protocol.Runtime;
using AiAdmin.Server.Cluster;
using AiAdmin.Services.Runtime;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using MQTTnet;
using MQTTnet.Protocol;
using MQTTnet.Server;

namespace AiAdmin.Server.HostedServices;

/// <summary>
/// MQTT Broker托管服务，使用MQTTnet嵌入式Broker
/// 处理设备连接认证、消息分发、连接生命周期管理
/// 支持主动-主动集群部署，通过Redis进行会话路由
/// </summary>
public class MqttBrokerService : IHostedService
{
    /// <summary>IoT运行时配置选项</summary>
    private readonly IoTRuntimeOptions _options;
    
    /// <summary>设备连接管理器，存储所有在线设备</summary>
    private readonly DeviceConnectionManager _connections;
    
    /// <summary>MQTT认证处理器</summary>
    private readonly MqttAuthHandler _authHandler;
    
    /// <summary>MQTT消息分发器</summary>
    private readonly MqttMessageDispatcher _dispatcher;
    
    /// <summary>服务作用域工厂，用于在单例中解析作用域服务</summary>
    private readonly IServiceScopeFactory _serviceScopeFactory;
    
    /// <summary>节点身份提供者</summary>
    private readonly INodeIdentityProvider _nodeIdentityProvider;
    
    /// <summary>日志记录器</summary>
    private readonly ILogger<MqttBrokerService> _logger;
    
    /// <summary>MQTT服务器实例</summary>
    private MqttServer? _server;
    
    /// <summary>保活检查定时器</summary>
    private Timer? _keepAliveTimer;

    /// <summary>
    /// MQTT Broker运行时状态
    /// </summary>
    public bool IsRunning { get; private set; }

    /// <summary>
    /// 创建MQTT Broker服务实例
    /// </summary>
    public MqttBrokerService(
        IOptions<IoTRuntimeOptions> options,
        DeviceConnectionManager connections,
        MqttAuthHandler authHandler,
        MqttMessageDispatcher dispatcher,
        IServiceScopeFactory serviceScopeFactory,
        INodeIdentityProvider nodeIdentityProvider,
        ILogger<MqttBrokerService> logger)
    {
        _options = options.Value;
        _connections = connections;
        _authHandler = authHandler;
        _dispatcher = dispatcher;
        _serviceScopeFactory = serviceScopeFactory;
        _nodeIdentityProvider = nodeIdentityProvider;
        _logger = logger;
    }

    /// <summary>
    /// 启动MQTT Broker，监听指定端口
    /// 注册连接认证、连接/断开事件、消息拦截处理器
    /// </summary>
    public async Task StartAsync(CancellationToken cancellationToken)
    {
        if (!_options.Enabled || !_options.EnableMqtt)
        {
            _logger.LogInformation("MQTT runtime disabled");
            return;
        }

        // 配置MQTT服务器选项
        var optionsBuilder = new MqttServerOptionsBuilder()
            .WithDefaultEndpoint()
            .WithDefaultEndpointPort(_options.MqttPort)
            .WithDefaultCommunicationTimeout(TimeSpan.FromSeconds(_options.KeepAliveSeconds));

        // 创建MQTT服务器实例
        _server = new MqttFactory().CreateMqttServer(optionsBuilder.Build());
        
        // 注册事件处理器
        _server.ValidatingConnectionAsync += OnValidatingConnectionAsync;
        _server.ClientConnectedAsync += OnClientConnectedAsync;
        _server.ClientDisconnectedAsync += OnClientDisconnectedAsync;
        _server.InterceptingPublishAsync += OnInterceptingPublishAsync;

        // 启动服务器
        await _server.StartAsync();
        IsRunning = true;
        _logger.LogInformation("MQTT broker started on port {Port}", _options.MqttPort);
        
        // 启动保活检查定时器
        _keepAliveTimer = new Timer(_ => CheckKeepAlive(), null, TimeSpan.FromSeconds(10), TimeSpan.FromSeconds(5));
    }

    /// <summary>
    /// 停止MQTT Broker，关闭所有连接和WebSocket桥接
    /// </summary>
    public async Task StopAsync(CancellationToken cancellationToken)
    {
        IsRunning = false;
        _keepAliveTimer?.Dispose();

        // 清理所有连接的WebSocket桥接
        foreach (var connection in _connections.GetAll())
        {
            if (connection.Bridge != null)
            {
                await connection.Bridge.DisposeAsync();
            }
        }

        // 停止MQTT服务器
        if (_server != null)
        {
            await _server.StopAsync();
            _logger.LogInformation("MQTT broker stopped");
        }
    }

    /// <summary>
    /// 向指定设备发布MQTT消息
    /// </summary>
    /// <param name="device">目标设备连接</param>
    /// <param name="payload">消息内容</param>
    public async Task PublishToDeviceAsync(DeviceConnection device, string payload)
    {
        if (_server == null)
        {
            return;
        }

        // 构建MQTT应用消息
        var message = new MqttApplicationMessageBuilder()
            .WithTopic(device.ReplyTopic)
            .WithPayload(payload)
            .WithQualityOfServiceLevel(MqttQualityOfServiceLevel.AtMostOnce)
            .Build();
        
        // 注入消息到服务器，由服务器推送到设备
        await _server.InjectApplicationMessage(new InjectedMqttApplicationMessage(message));
    }

    /// <summary>
    /// 连接验证事件处理器
    /// 验证设备凭据，检查连接数限制
    /// </summary>
    private Task OnValidatingConnectionAsync(ValidatingConnectionEventArgs args)
    {
        // 验证设备凭据
        return ValidateConnectionInternalAsync(args);
    }

    private async Task ValidateConnectionInternalAsync(ValidatingConnectionEventArgs args)
    {
        var credentials = await _authHandler.ValidateAsync(args.ClientId, args.UserName, args.Password);
        if (credentials == null)
        {
            args.ReasonCode = MqttConnectReasonCode.BadUserNameOrPassword;
            return;
        }

        // 检查最大连接数限制
        if (_connections.OnlineCount >= _options.MaxConnections)
        {
            args.ReasonCode = MqttConnectReasonCode.ServerBusy;
            return;
        }

        // 存储凭据到会话，供后续使用
        args.SessionItems["credentials"] = credentials;
        args.ReasonCode = MqttConnectReasonCode.Success;
    }

    /// <summary>
    /// 客户端连接成功事件处理器
    /// 创建设备连接，注册到连接管理器，更新在线状态
    /// </summary>
    private async Task OnClientConnectedAsync(ClientConnectedEventArgs args)
    {
        // 检查会话中是否有凭据（由ValidatingConnection设置）
        if (!args.SessionItems.Contains("credentials"))
        {
            return;
        }

        var credentialsObject = args.SessionItems["credentials"];
        if (credentialsObject is not MqttDeviceCredentials credentials)
        {
            return;
        }

        // 生成新的连接ID
        var connectionId = _connections.GenerateConnectionId();
        
        // 创建设备连接对象
        var connection = new DeviceConnection
        {
            ClientId = credentials.ClientId,
            MacAddress = credentials.MacAddress,
            Uuid = credentials.Uuid,
            GroupId = credentials.GroupId,
            CredentialId = credentials.CredentialId,
            DeviceIp = credentials.DeviceIp,
            ConnectionId = connectionId
        };

        // 添加到连接管理器
        _connections.Add(connection);
        _logger.LogInformation("Device connected: {Mac} ({ClientId})", connection.MacAddress, connection.ClientId);

        // 使用作用域解析OnlineStateService（需要DbContext）
        using (var scope = _serviceScopeFactory.CreateScope())
        {
            var onlineStateService = scope.ServiceProvider.GetRequiredService<OnlineStateService>();
            await onlineStateService.MarkDeviceOnlineAsync(
                deviceId: connection.MacAddress,
                clientId: connection.ClientId,
                sessionId: null, // MQTT连接时还没有语音会话
                macAddress: connection.MacAddress,
                nodeId: _nodeIdentityProvider.Current.NodeId);
        }

        // 初始化MCP工具（异步，不阻塞）
        _ = Task.Run(() => _dispatcher.InitializeMcpToolsAsync(connection), cancellationToken: CancellationToken.None);
    }

    /// <summary>
    /// 客户端断开连接事件处理器
    /// 清理连接资源，关闭WebSocket桥接，更新离线状态
    /// </summary>
    private async Task OnClientDisconnectedAsync(ClientDisconnectedEventArgs args)
    {
        // 从连接管理器移除
        var connection = _connections.Remove(args.ClientId);
        if (connection == null)
        {
            return;
        }

        _logger.LogInformation("Device disconnected: {Mac}", connection.MacAddress);

        // 清理WebSocket桥接
        if (connection.Bridge != null)
        {
            await connection.Bridge.DisposeAsync();
        }

        // 更新设备离线状态
        using (var scope = _serviceScopeFactory.CreateScope())
        {
            var onlineStateService = scope.ServiceProvider.GetRequiredService<OnlineStateService>();
            await onlineStateService.MarkDeviceOfflineAsync(
                deviceId: connection.MacAddress,
                clientId: connection.ClientId,
                sessionId: connection.Udp?.SessionId, // 如果有语音会话也清理
                macAddress: connection.MacAddress,
                nodeId: _nodeIdentityProvider.Current.NodeId);
        }
    }

    /// <summary>
    /// 消息发布拦截事件处理器
    /// 拦截设备发布的消息，交由消息分发器处理
    /// </summary>
    private async Task OnInterceptingPublishAsync(InterceptingPublishEventArgs args)
    {
        var segment = args.ApplicationMessage.PayloadSegment;
        if (segment.Count == 0)
        {
            return;
        }

        // 查找对应的设备连接
        var connection = _connections.GetByClientId(args.ClientId);
        if (connection == null)
        {
            return;
        }

        // 解析消息内容并分发
        var payload = Encoding.UTF8.GetString(segment.Array!, segment.Offset, segment.Count);
        await _dispatcher.DispatchAsync(connection, payload);
        
        // 标记消息已处理，阻止继续传播
        args.ProcessPublish = false;
    }

    /// <summary>
    /// 保活检查，记录连接统计信息
    /// </summary>
    private void CheckKeepAlive()
    {
        var active = _connections.GetAll().Count(c => c.Bridge != null);
        _logger.LogDebug("Connections: {Total}, Active calls: {Active}", _connections.OnlineCount, active);
    }
}
