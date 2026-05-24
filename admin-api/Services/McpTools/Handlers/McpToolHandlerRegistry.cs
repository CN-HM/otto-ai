using System.Collections.Generic;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.McpTools.Handlers;

public class McpToolHandlerRegistry : ITransientDependency
{
    private readonly Dictionary<string, IMcpToolHandler> _handlers;

    public McpToolHandlerRegistry(IEnumerable<IMcpToolHandler> handlers)
    {
        _handlers = handlers.ToDictionary(h => h.ToolCode, h => h);
    }

    public IMcpToolHandler? Get(string toolCode)
        => _handlers.TryGetValue(toolCode, out var handler) ? handler : null;

    public bool Exists(string toolCode) => _handlers.ContainsKey(toolCode);

    public IEnumerable<string> AllCodes() => _handlers.Keys;
}
