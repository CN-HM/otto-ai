using System.Text.Json.Nodes;
using AiAdmin.Data;
using AiAdmin.Services.AgentRoles;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Entities;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public sealed class DeviceMcpRuntimeSnapshot
{
    public object InitializeResult { get; init; } = new
    {
        protocolVersion = "2024-11-05",
        capabilities = new
        {
            tools = new
            {
                listChanged = false
            }
        },
        serverInfo = new
        {
            name = "ai-admin",
            version = "local-runtime"
        }
    };

    public List<object> Tools { get; init; } = [];
}

public class DeviceMcpRuntimeService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly AgentRoleRuntimeResolver _agentRoleRuntimeResolver;

    public DeviceMcpRuntimeService(AiAdminDbContext db, AgentRoleRuntimeResolver agentRoleRuntimeResolver)
    {
        _db = db;
        _agentRoleRuntimeResolver = agentRoleRuntimeResolver;
    }

    public async Task<DeviceMcpRuntimeSnapshot> BuildForCredentialAsync(string? credentialId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(credentialId))
            return new DeviceMcpRuntimeSnapshot();

        var device = await _db.AiDevices.AsNoTracking().FirstOrDefaultAsync(x => x.CredentialId == credentialId.Trim(), cancellationToken);
        return device == null
            ? new DeviceMcpRuntimeSnapshot()
            : await BuildForDeviceBindingAsync(device, cancellationToken);
    }

    public async Task<DeviceMcpRuntimeSnapshot> BuildForDeviceIdAsync(string? deviceId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(deviceId))
            return new DeviceMcpRuntimeSnapshot();

        var device = await _db.AiDevices.AsNoTracking().FirstOrDefaultAsync(x => x.Id == deviceId.Trim(), cancellationToken);
        return device == null
            ? new DeviceMcpRuntimeSnapshot()
            : await BuildForDeviceBindingAsync(device, cancellationToken);
    }

    public async Task<List<object>> GetDeviceToolsAsync(string? deviceId, CancellationToken cancellationToken = default)
    {
        var snapshot = await BuildForDeviceIdAsync(deviceId, cancellationToken);
        return snapshot.Tools;
    }

    private async Task<DeviceMcpRuntimeSnapshot> BuildForDeviceBindingAsync(AiDevice device, CancellationToken cancellationToken)
    {
        if (!string.IsNullOrWhiteSpace(device.AgentRoleId))
            return await BuildForAgentRoleAsync(device.AgentRoleId, device.AgentRoleReleaseId, cancellationToken);

        return new DeviceMcpRuntimeSnapshot();
    }

    private async Task<DeviceMcpRuntimeSnapshot> BuildForAgentRoleAsync(string? agentRoleId, string? agentRoleReleaseId, CancellationToken cancellationToken)
    {
        var normalizedAgentRoleId = agentRoleId?.Trim();
        if (string.IsNullOrWhiteSpace(normalizedAgentRoleId))
            return new DeviceMcpRuntimeSnapshot();

        var descriptor = await _agentRoleRuntimeResolver.ResolveAsync(normalizedAgentRoleId,
            null,
            agentRoleReleaseId,
            cancellationToken);

        return new DeviceMcpRuntimeSnapshot
        {
            Tools = BuildTools(descriptor.PluginMappings, descriptor.ContextProviders)
        };
    }

    private static List<object> BuildTools(IReadOnlyList<AgentRolePluginMappingDto> pluginMappings, IReadOnlyList<AgentRoleContextProviderDto> contextProviders)
    {
        var tools = new List<object>();

        foreach (var mapping in pluginMappings)
        {
            if (string.IsNullOrWhiteSpace(mapping.PluginId))
                continue;

            tools.Add(new
            {
                name = BuildPluginToolName(mapping.PluginId, mapping.ProviderCode),
                description = $"Agent role plugin {mapping.PluginId}",
                inputSchema = BuildInputSchema(mapping.ParamInfo),
                annotations = new
                {
                    kind = "plugin",
                    pluginId = mapping.PluginId,
                    providerCode = mapping.ProviderCode
                }
            });
        }

        for (var index = 0; index < contextProviders.Count; index++)
        {
            var provider = contextProviders[index];
            tools.Add(new
            {
                name = $"context_provider_{index + 1}",
                description = string.IsNullOrWhiteSpace(provider.Url)
                    ? "Agent role context provider"
                    : $"Agent role context provider {provider.Url}",
                inputSchema = new
                {
                    type = "object",
                    properties = new { }
                },
                annotations = new
                {
                    kind = "context_provider",
                    url = provider.Url
                }
            });
        }

        return tools;
    }

    private static string BuildPluginToolName(string pluginId, string? providerCode)
    {
        var normalizedPluginId = pluginId.Trim();
        var normalizedProviderCode = providerCode?.Trim();
        return string.IsNullOrWhiteSpace(normalizedProviderCode)
            ? normalizedPluginId
            : $"{normalizedProviderCode}.{normalizedPluginId}";
    }

    private static object BuildInputSchema(string? paramInfo)
    {
        if (string.IsNullOrWhiteSpace(paramInfo))
        {
            return new
            {
                type = "object",
                properties = new { }
            };
        }

        try
        {
            var node = JsonNode.Parse(paramInfo);
            if (node is not JsonObject jsonObject)
            {
                return new
                {
                    type = "object",
                    properties = new { }
                };
            }

            var properties = new JsonObject();
            foreach (var entry in jsonObject)
            {
                properties[entry.Key] = BuildPropertySchema(entry.Value);
            }

            return new JsonObject
            {
                ["type"] = "object",
                ["properties"] = properties
            };
        }
        catch
        {
            return new
            {
                type = "object",
                properties = new { }
            };
        }
    }

    private static JsonObject BuildPropertySchema(JsonNode? node)
    {
        var schema = new JsonObject
        {
            ["type"] = InferSchemaType(node)
        };

        if (node != null)
            schema["default"] = node.DeepClone();

        return schema;
    }

    private static string InferSchemaType(JsonNode? node)
    {
        return node switch
        {
            JsonArray => "array",
            JsonObject => "object",
            JsonValue value when value.TryGetValue(out bool _) => "boolean",
            JsonValue value when value.TryGetValue(out int _) => "integer",
            JsonValue value when value.TryGetValue(out long _) => "integer",
            JsonValue value when value.TryGetValue(out decimal _) => "number",
            JsonValue value when value.TryGetValue(out double _) => "number",
            JsonValue value when value.TryGetValue(out float _) => "number",
            _ => "string"
        };
    }
}
