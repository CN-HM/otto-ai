using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

[ExposeServices(typeof(ISystemPromptVariableProvider))]
public class DeviceVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["device_id"] = new() { Name = "device_id", Category = "设备", Description = "设备唯一 ID", Example = "DEVICE_A1B2C3" },
        ["device_name"] = new() { Name = "device_name", Category = "设备", Description = "设备别名", Example = "客厅小智" },
        ["device_model"] = new() { Name = "device_model", Category = "设备", Description = "硬件板型", Example = "ESP32-S3" },
        ["device_app_version"] = new() { Name = "device_app_version", Category = "设备", Description = "固件版本", Example = "v2.1.0" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        if (context.Device == null)
            return Task.FromResult<string?>(null);

        var value = variableName switch
        {
            "device_id" => context.Device.Id,
            "device_name" => context.Device.Alias,
            "device_model" => context.Device.Board,
            "device_app_version" => context.Device.AppVersion,
            _ => null
        };

        return Task.FromResult(value);
    }
}
