using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.Services.McpTools.Handlers;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.McpTools;

public class McpToolDispatcher : ITransientDependency
{
    private readonly McpToolHandlerRegistry _registry;

    public McpToolDispatcher(McpToolHandlerRegistry registry) => _registry = registry;

    public async Task<McpToolCallResult> DispatchAsync(
        string toolCode,
        McpToolCallRequest request,
        CancellationToken ct)
    {
        var handler = _registry.Get(toolCode);
        if (handler == null)
            return new McpToolCallResult
            {
                Success = false,
                Message = $"Unknown tool: {toolCode}. Available: {string.Join(", ", _registry.AllCodes())}"
            };

        return await handler.ExecuteAsync(request, ct);
    }
}
