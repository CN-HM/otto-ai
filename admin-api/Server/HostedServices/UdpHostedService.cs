using System.Net.Sockets;
using System.Security.Cryptography;
using AiAdmin.Config;
using AiAdmin.Protocol.Runtime;
using Microsoft.Extensions.Options;

namespace AiAdmin.Server.HostedServices;

/// <summary>
/// UDP音频服务托管服务
/// 处理设备与后端之间的Opus音频流
/// 使用AES-128-CTR加密，支持双向音频传输
/// </summary>
public class UdpHostedService : IHostedService
{
    /// <summary>UDP包头大小（16字节）</summary>
    private const int HeaderSize = 16;
    
    /// <summary>运行时配置选项</summary>
    private readonly IoTRuntimeOptions _options;
    
    /// <summary>设备连接管理器</summary>
    private readonly DeviceConnectionManager _connections;
    
    /// <summary>日志记录器</summary>
    private readonly ILogger<UdpHostedService> _logger;
    
    /// <summary>UDP客户端</summary>
    private UdpClient? _udp;
    
    /// <summary>取消令牌源</summary>
    private CancellationTokenSource? _cts;
    
    /// <summary>接收任务</summary>
    private Task? _receiveTask;

    /// <summary>服务运行状态</summary>
    public bool IsRunning { get; private set; }

    /// <summary>创建UDP音频服务实例</summary>
    public UdpHostedService(
        IOptions<IoTRuntimeOptions> options,
        DeviceConnectionManager connections,
        ILogger<UdpHostedService> logger)
    {
        _options = options.Value;
        _connections = connections;
        _logger = logger;
    }

    /// <summary>
    /// 启动UDP服务，监听指定端口
    /// 启动后台接收循环处理音频包
    /// </summary>
    public Task StartAsync(CancellationToken cancellationToken)
    {
        if (!_options.Enabled || !_options.EnableUdp)
        {
            _logger.LogInformation("UDP runtime disabled");
            return Task.CompletedTask;
        }

        // 创建取消令牌源
        _cts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        // 创建UDP客户端并绑定端口
        _udp = new UdpClient(_options.UdpPort);
        // 启动接收循环
        _receiveTask = Task.Run(() => ReceiveLoopAsync(_cts.Token), _cts.Token);
        IsRunning = true;
        _logger.LogInformation("UDP audio service started on port {Port}", _options.UdpPort);
        return Task.CompletedTask;
    }

    /// <summary>
    /// 停止UDP服务，关闭套接字和接收循环
    /// </summary>
    public async Task StopAsync(CancellationToken cancellationToken)
    {
        IsRunning = false;
        // 发送取消信号
        _cts?.Cancel();
        // 关闭UDP套接字
        _udp?.Close();
        // 等待接收任务完成
        if (_receiveTask != null)
        {
            try
            {
                await _receiveTask;
            }
            catch (OperationCanceledException)
            {
            }
        }

        _udp?.Dispose();
        if (_options.Enabled && _options.EnableUdp)
        {
            _logger.LogInformation("UDP audio service stopped");
        }
    }

    /// <summary>
    /// 发送Opus音频数据到设备
    /// 加密音频数据并构建UDP包发送
    /// </summary>
    /// <param name="device">目标设备</param>
    /// <param name="opusData">Opus编码的音频数据</param>
    /// <param name="timestamp">音频时间戳</param>
    public void SendToDevice(DeviceConnection device, byte[] opusData, uint timestamp)
    {
        if (_udp == null || device.Udp?.RemoteEndpoint == null)
        {
            return;
        }

        var udpSession = device.Udp;
        // 原子递增序列号
        var sequence = (uint)Interlocked.Increment(ref udpSession.LocalSequenceInt);
        // 加密音频数据
        var encrypted = EncryptAesCtr(opusData, udpSession.AesKey, udpSession.Nonce, sequence);

        // 构建UDP包（16字节头 + 加密音频）
        var packet = new byte[HeaderSize + encrypted.Length];
        packet[0] = 1; // 版本号
        var length = encrypted.Length;
        packet[2] = (byte)(length >> 8);
        packet[3] = (byte)(length & 0xFF);
        var connectionId = udpSession.ConnectionId;
        // 连接ID（4字节）
        packet[4] = (byte)(connectionId >> 24);
        packet[5] = (byte)((connectionId >> 16) & 0xFF);
        packet[6] = (byte)((connectionId >> 8) & 0xFF);
        packet[7] = (byte)(connectionId & 0xFF);
        // 时间戳（4字节）
        packet[8] = (byte)(timestamp >> 24);
        packet[9] = (byte)((timestamp >> 16) & 0xFF);
        packet[10] = (byte)((timestamp >> 8) & 0xFF);
        packet[11] = (byte)(timestamp & 0xFF);
        // 序列号（4字节）
        packet[12] = (byte)(sequence >> 24);
        packet[13] = (byte)((sequence >> 16) & 0xFF);
        packet[14] = (byte)((sequence >> 8) & 0xFF);
        packet[15] = (byte)(sequence & 0xFF);
        // 复制加密音频数据
        Buffer.BlockCopy(encrypted, 0, packet, HeaderSize, encrypted.Length);

        try
        {
            _udp.Send(packet, packet.Length, udpSession.RemoteEndpoint);
        }
        catch (Exception ex)
        {
            _logger.LogDebug(ex, "Failed to send UDP to {Mac}", device.MacAddress);
        }
    }

    /// <summary>
    /// UDP接收循环，处理来自设备的音频包
    /// 解密音频并通过WebSocket桥接转发到Python服务
    /// </summary>
    private async Task ReceiveLoopAsync(CancellationToken cancellationToken)
    {
        while (!cancellationToken.IsCancellationRequested)
        {
            try
            {
                // 接收UDP包
                var result = await _udp!.ReceiveAsync(cancellationToken);
                var data = result.Buffer;
                if (data.Length < HeaderSize)
                {
                    continue;
                }

                // 解析包头：连接ID和序列号
                var connectionId = (uint)((data[4] << 24) | (data[5] << 16) | (data[6] << 8) | data[7]);
                var sequence = (uint)((data[12] << 24) | (data[13] << 16) | (data[14] << 8) | data[15]);
                // 查找设备连接
                var connection = _connections.GetByConnectionId(connectionId);
                if (connection?.Udp == null)
                {
                    continue;
                }

                var udpSession = connection.Udp;
                // 更新远程端点（设备可能换了端口）
                udpSession.RemoteEndpoint = result.RemoteEndPoint;
                udpSession.RemoteSequence = sequence;

                if (data.Length <= HeaderSize)
                {
                    continue;
                }

                // 解密音频数据
                var encrypted = data.AsSpan(HeaderSize, data.Length - HeaderSize);
                var decrypted = DecryptAesCtr(encrypted, udpSession.AesKey, udpSession.Nonce, sequence);
                // 转发到Python服务（通过WebSocket桥接）
                if (connection.Bridge is { IsAlive: true })
                {
                    var wsFrame = new byte[HeaderSize + decrypted.Length];
                    Buffer.BlockCopy(data, 0, wsFrame, 0, HeaderSize);
                    Buffer.BlockCopy(decrypted, 0, wsFrame, HeaderSize, decrypted.Length);
                    await connection.Bridge.SendBinaryAsync(wsFrame);
                }
            }
            catch (OperationCanceledException)
            {
                // 正常取消，退出循环
                break;
            }
            catch (SocketException ex) when (ex.SocketErrorCode == SocketError.ConnectionReset)
            {
                // 连接重置，忽略
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error processing UDP audio packet");
            }
        }
    }

    /// <summary>
    /// 使用AES-128-CTR模式解密数据
    /// </summary>
    private static byte[] DecryptAesCtr(ReadOnlySpan<byte> data, byte[] key, byte[] nonce, uint sequence)
    {
        return ApplyAesCtr(data, key, nonce, sequence);
    }

    /// <summary>
    /// 使用AES-128-CTR模式加密数据
    /// </summary>
    private static byte[] EncryptAesCtr(byte[] data, byte[] key, byte[] nonce, uint sequence)
    {
        return ApplyAesCtr(data, key, nonce, sequence);
    }

    /// <summary>
    /// AES-128-CTR加密/解密实现
    /// CTR模式使用AES生成密钥流，与明文异或实现加密/解密
    /// </summary>
    /// <param name="data">输入数据</param>
    /// <param name="key">16字节AES密钥</param>
    /// <param name="nonce">16字节随机数</param>
    /// <param name="sequence">序列号，用于生成初始计数器值</param>
    /// <returns>加密或解密后的数据</returns>
    private static byte[] ApplyAesCtr(ReadOnlySpan<byte> data, byte[] key, byte[] nonce, uint sequence)
    {
        var result = new byte[data.Length];
        using var aes = Aes.Create();
        aes.Key = key;
        aes.Mode = CipherMode.ECB;
        aes.Padding = PaddingMode.None;

        // 构建初始计数器：nonce + sequence（大端序）
        var counter = new byte[16];
        Array.Copy(nonce, counter, 16);
        counter[12] = (byte)(sequence >> 24);
        counter[13] = (byte)((sequence >> 16) & 0xFF);
        counter[14] = (byte)((sequence >> 8) & 0xFF);
        counter[15] = (byte)(sequence & 0xFF);

        // 创建加密器用于生成密钥流
        var encryptor = aes.CreateEncryptor();
        var keystream = new byte[16];
        // 分块处理（CTR模式支持流式处理）
        for (var offset = 0; offset < data.Length; offset += 16)
        {
            // 生成密钥流块
            encryptor.TransformBlock(counter, 0, 16, keystream, 0);
            // 异或操作（加密/解密相同）
            var remaining = Math.Min(16, data.Length - offset);
            for (var i = 0; i < remaining; i++)
            {
                result[offset + i] = (byte)(data[offset + i] ^ keystream[i]);
            }

            // 递增计数器（大整数递增）
            for (var i = 15; i >= 0; i--)
            {
                if (++counter[i] != 0)
                {
                    break;
                }
            }
        }

        return result;
    }
}
