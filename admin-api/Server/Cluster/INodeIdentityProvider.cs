namespace AiAdmin.Server.Cluster;

/// <summary>
/// 节点身份提供者接口
/// 提供当前节点的身份信息，用于集群中标识本节点
/// </summary>
public interface INodeIdentityProvider
{
    /// <summary>当前节点身份信息</summary>
    NodeIdentity Current { get; }
}
