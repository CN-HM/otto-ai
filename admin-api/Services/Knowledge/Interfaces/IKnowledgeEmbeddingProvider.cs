using AiAdmin.Services.Embedding;

namespace AiAdmin.Services.Knowledge.Interfaces;

public interface IKnowledgeEmbeddingProvider
{
    Task<EmbeddingResult> EmbedAsync(string text, string? embeddingModelId, CancellationToken cancellationToken = default);
}
