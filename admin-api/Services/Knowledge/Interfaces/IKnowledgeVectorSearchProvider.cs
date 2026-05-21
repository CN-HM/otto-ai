using AiAdmin.Services.Knowledge.Dtos;
using AiAdmin.Services.Knowledge.VOs;

namespace AiAdmin.Services.Knowledge.Interfaces;

public interface IKnowledgeVectorSearchProvider
{
    Task<IReadOnlyList<KnowledgeSearchHit>> SearchAsync(KnowledgeVectorSearchRequest request, CancellationToken cancellationToken = default);
    Task SaveChunkEmbeddingAsync(string chunkId, IReadOnlyList<float> embedding, CancellationToken cancellationToken = default);
}
