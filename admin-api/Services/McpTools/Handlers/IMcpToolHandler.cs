using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.McpTools.Handlers;

public interface IMcpToolHandler : ITransientDependency
{
    string ToolCode { get; }
    Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct);
}
