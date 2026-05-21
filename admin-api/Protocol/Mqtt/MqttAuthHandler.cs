using System.Text;
using System.Text.Json;
using AiAdmin.Services.Runtime;

namespace AiAdmin.Protocol.Mqtt;

/// <summary>
/// MQTT连接认证处理器
/// 验证设备连接的HMAC-SHA256签名，解析客户端ID和IP信息
/// 客户端ID格式：{groupId}@@@{mac_no_colon}@@@{uuid}
/// </summary>
public class MqttAuthHandler
{
    private readonly DeviceCredentialService _deviceCredentialService;

    /// <summary>日志记录器</summary>
    private readonly ILogger<MqttAuthHandler> _logger;

    /// <summary>
    /// 创建认证处理器实例
    /// </summary>
    public MqttAuthHandler(DeviceCredentialService deviceCredentialService, ILogger<MqttAuthHandler> logger)
    {
        _deviceCredentialService = deviceCredentialService;
        _logger = logger;
    }

    /// <summary>
    /// 验证MQTT连接凭据
    /// </summary>
    /// <param name="clientId">客户端ID，格式：{groupId}@@@{mac_no_colon}@@@{uuid}</param>
    /// <param name="username">用户名，Base64编码的JSON，包含设备IP</param>
    /// <param name="password">密码，HMAC-SHA256签名</param>
    /// <returns>验证成功返回设备凭据，失败返回null</returns>
    public async Task<MqttDeviceCredentials?> ValidateAsync(string clientId, string? username, string? password, CancellationToken cancellationToken = default)
    {
        // 解析客户端ID格式
        var parts = clientId.Split("@@@", StringSplitOptions.None);
        if (parts.Length != 3)
        {
            _logger.LogDebug("Invalid clientId format: {ClientId}", clientId);
            return null;
        }

        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
        {
            _logger.LogDebug("MQTT username/password missing for {ClientId}", clientId);
            return null;
        }

        // 解析MAC地址（将下划线替换为冒号）
        var macAddress = DeviceCredentialService.NormalizeDeviceId(parts[1].Replace("_", ":", StringComparison.Ordinal));
        var uuid = parts[2];
        var groupId = parts[0];

        // 从用户名解析设备IP
        string? deviceIp = null;
        string? credentialId = null;
        if (!string.IsNullOrEmpty(username))
        {
            try
            {
                var decoded = Encoding.UTF8.GetString(Convert.FromBase64String(username));
                using var doc = JsonDocument.Parse(decoded);
                if (doc.RootElement.TryGetProperty("ip", out var ipElement))
                {
                    deviceIp = ipElement.GetString();
                }

                if (doc.RootElement.TryGetProperty("credentialId", out var credentialIdElement))
                {
                    credentialId = credentialIdElement.GetString();
                }
            }
            catch (Exception ex)
            {
                _logger.LogDebug(ex, "Failed to decode MQTT username payload for {ClientId}", clientId);
            }
        }

        if (string.IsNullOrWhiteSpace(credentialId))
        {
            _logger.LogDebug("MQTT credentialId missing for {ClientId}", clientId);
            return null;
        }

        var device = await _deviceCredentialService.FindByCredentialIdAsync(credentialId, cancellationToken);
        if (device == null || string.IsNullOrWhiteSpace(device.CredentialSecret))
        {
            _logger.LogDebug("MQTT credential not found for {ClientId}", clientId);
            return null;
        }

        var normalizedStoredMac = DeviceCredentialService.NormalizeDeviceId(device.MacAddress);
        if (!string.Equals(normalizedStoredMac, macAddress, StringComparison.Ordinal))
        {
            _logger.LogDebug("MQTT credential MAC mismatch for {ClientId}", clientId);
            return null;
        }

        var content = $"{clientId}|{username}";
        var expectedSig = DeviceCredentialService.ComputeBase64Hmac(device.CredentialSecret, content);
        if (!string.Equals(password, expectedSig, StringComparison.Ordinal))
        {
            _logger.LogDebug("MQTT HMAC verification failed for {ClientId}", clientId);
            return null;
        }

        return new MqttDeviceCredentials(clientId, macAddress, uuid, groupId, credentialId, deviceIp);
    }
}
