using AiAdmin.Config;
using AiAdmin.Server.Cluster;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.HostedServices;

/// <summary>
/// 节点心跳托管服务，定期向Redis更新节点心跳
/// 用于集群中节点发现和故障检测
/// </summary>
public class NodeHeartbeatHostedService : BackgroundService
{
    /// <summary>分布式会话目录（Redis）</summary>
    private readonly IDistributedSessionDirectory _sessionDirectory;
    
    /// <summary>节点身份提供者</summary>
    private readonly INodeIdentityProvider _nodeIdentityProvider;
    
    /// <summary>运行时配置选项</summary>
    private readonly IoTRuntimeOptions _options;
    
    /// <summary>日志记录器</summary>
    private readonly ILogger<NodeHeartbeatHostedService> _logger;

    /// <summary>运行时状态</summary>
    public bool IsRunning { get; private set; }

    /// <summary>最后一次心跳时间</summary>
    public DateTimeOffset? LastHeartbeatAtUtc { get; private set; }

    /// <summary>创建节点心跳托管服务实例</summary>
    public NodeHeartbeatHostedService(
        IDistributedSessionDirectory sessionDirectory,
        INodeIdentityProvider nodeIdentityProvider,
        IOptions<IoTRuntimeOptions> options,
        ILogger<NodeHeartbeatHostedService> logger)
    {
        _sessionDirectory = sessionDirectory;
        _nodeIdentityProvider = nodeIdentityProvider;
        _options = options.Value;
        _logger = logger;
    }

    /// <summary>
    /// 心跳循环，定期更新节点心跳到Redis
    /// 间隔由配置选项 NodeHeartbeatSeconds 控制
    /// </summary>
    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        if (!_options.Enabled)
        {
            _logger.LogInformation("IoT runtime disabled, heartbeat not started");
            return;
        }

        var node = _nodeIdentityProvider.Current;
        var interval = TimeSpan.FromSeconds(_options.NodeHeartbeatSeconds);

        _logger.LogInformation("IoT runtime heartbeat started for node {NodeId}", node.NodeId);

        IsRunning = true;

        try
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    await _sessionDirectory.UpdateNodeHeartbeatAsync(stoppingToken);
                    LastHeartbeatAtUtc = DateTimeOffset.UtcNow;
                }
                catch (Exception ex) when (ex is not OperationCanceledException)
                {
                    _logger.LogWarning(ex, "Heartbeat update failed, will retry in {Interval}s", _options.NodeHeartbeatSeconds);
                }

                await Task.Delay(interval, stoppingToken);
            }
        }
        catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
        {
        }
        finally
        {
            IsRunning = false;
        }
    }
}
