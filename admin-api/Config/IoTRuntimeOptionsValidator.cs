using Microsoft.Extensions.Options;

namespace AiAdmin.Config;

/// <summary>
/// IoT运行时配置验证器
/// 在应用启动时验证配置项的合法性和一致性
/// </summary>
public class IoTRuntimeOptionsValidator : IValidateOptions<IoTRuntimeOptions>
{
    /// <summary>
    /// 验证配置选项
    /// </summary>
    /// <param name="name">选项名称</param>
    /// <param name="options">配置选项实例</param>
    /// <returns>验证结果</returns>
    public ValidateOptionsResult Validate(string? name, IoTRuntimeOptions options)
    {
        // 运行时禁用时跳过验证
        if (!options.Enabled)
        {
            return ValidateOptionsResult.Success;
        }

        var errors = new List<string>();

        // 验证Redis键前缀不能为空
        if (string.IsNullOrWhiteSpace(options.KeyPrefix))
        {
            errors.Add($"{IoTRuntimeOptions.SectionName}:KeyPrefix 不能为空。");
        }

        // 验证心跳间隔必须大于0
        if (options.NodeHeartbeatSeconds <= 0)
        {
            errors.Add($"{IoTRuntimeOptions.SectionName}:NodeHeartbeatSeconds 必须大于 0。");
        }

        // 验证心跳TTL必须大于等于心跳间隔
        if (options.NodeHeartbeatTtlSeconds < options.NodeHeartbeatSeconds)
        {
            errors.Add($"{IoTRuntimeOptions.SectionName}:NodeHeartbeatTtlSeconds 不能小于 NodeHeartbeatSeconds。");
        }

        // 验证路由TTL必须大于0
        if (options.SessionRouteTtlSeconds <= 0)
        {
            errors.Add($"{IoTRuntimeOptions.SectionName}:SessionRouteTtlSeconds 必须大于 0。");
        }

        // 验证MQTT端口范围
        if (options.EnableMqtt && (options.MqttPort < 1 || options.MqttPort > 65535))
        {
            errors.Add($"{IoTRuntimeOptions.SectionName}:MqttPort 必须在 1 到 65535 之间。");
        }

        // 验证UDP配置
        if (options.EnableUdp)
        {
            // UDP端口范围
            if (options.UdpPort < 1 || options.UdpPort > 65535)
            {
                errors.Add($"{IoTRuntimeOptions.SectionName}:UdpPort 必须在 1 到 65535 之间。");
            }
        }

        if (options.LocalSpeechIdleTimeoutMs <= 0)
        {
            errors.Add($"{IoTRuntimeOptions.SectionName}:LocalSpeechIdleTimeoutMs 必须大于 0。");
        }

        // 验证设备WebSocket路径
        if (options.EnableDeviceWebSocket)
        {
            if (string.IsNullOrWhiteSpace(options.DeviceWebSocketPath))
            {
                errors.Add($"{IoTRuntimeOptions.SectionName}:DeviceWebSocketPath 不能为空。");
            }
            else if (!options.DeviceWebSocketPath.StartsWith('/'))
            {
                errors.Add($"{IoTRuntimeOptions.SectionName}:DeviceWebSocketPath 必须以 '/' 开头。");
            }
        }

        // 返回验证结果
        return errors.Count == 0
            ? ValidateOptionsResult.Success
            : ValidateOptionsResult.Fail(errors);
    }
}
