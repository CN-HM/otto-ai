using System.Net;

namespace AiAdmin.Protocol.Runtime;

/// <summary>
/// UDP音频会话，管理设备与后端之间的UDP音频传输
/// 使用AES-128-CTR加密，包含序列号管理防止重放攻击
/// </summary>
public class UdpSession
{
    /// <summary>AES-128加密密钥，16字节</summary>
    public required byte[] AesKey { get; init; }

    /// <summary>加密随机数，16字节，用于CTR模式</summary>
    public byte[] Nonce { get; set; } = new byte[16];

    /// <summary>连接ID，用于UDP包路由匹配</summary>
    public required uint ConnectionId { get; init; }

    /// <summary>语音会话ID，由Python服务生成，hello握手后设置</summary>
    public string? SessionId { get; set; }

    /// <summary>设备远程UDP端点，接收包时更新</summary>
    public IPEndPoint? RemoteEndpoint { get; set; }

    /// <summary>本地发送序列号，原子递增</summary>
    public int LocalSequenceInt;

    /// <summary>远程接收序列号，用于防重放</summary>
    public uint RemoteSequence { get; set; }

    /// <summary>音频起始序列号，用于同步</summary>
    public uint AudioSequenceStart { get; set; }

    /// <summary>会话开始时间</summary>
    public DateTime StartTime { get; init; } = DateTime.UtcNow;
}

