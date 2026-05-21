namespace AiAdmin.Protocol.Mqtt;

/// <summary>
/// MQTT设备凭据记录
/// 存储设备认证成功后的解析信息
/// </summary>
/// <param name="ClientId">MQTT客户端ID，格式：{groupId}@@@{mac_no_colon}@@@{uuid}</param>
/// <param name="MacAddress">设备MAC地址（已还原冒号分隔）</param>
/// <param name="Uuid">设备UUID</param>
/// <param name="GroupId">设备分组ID</param>
/// <param name="CredentialId">设备长期凭证ID</param>
/// <param name="DeviceIp">设备IP地址（从用户名解析，可能为null）</param>
public sealed record MqttDeviceCredentials(
    string ClientId,
    string MacAddress,
    string Uuid,
    string GroupId,
    string CredentialId,
    string? DeviceIp);
