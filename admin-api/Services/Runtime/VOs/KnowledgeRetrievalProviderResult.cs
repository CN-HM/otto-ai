namespace AiAdmin.Services.Runtime;

public sealed class KnowledgeRetrievalProviderResult
{
    public IReadOnlyList<KnowledgeRetrievalHit> Hits { get; init; } = [];
}
