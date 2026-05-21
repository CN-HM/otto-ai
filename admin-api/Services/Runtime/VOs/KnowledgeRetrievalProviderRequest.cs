using AiAdmin.Services.AgentRoles.Dtos;

namespace AiAdmin.Services.Runtime;

public sealed class KnowledgeRetrievalProviderRequest
{
    public string Query { get; init; } = string.Empty;
    public IReadOnlyList<AgentRoleKnowledgeBindingDto> Bindings { get; init; } = [];
    public CancellationToken CancellationToken { get; init; }
}
