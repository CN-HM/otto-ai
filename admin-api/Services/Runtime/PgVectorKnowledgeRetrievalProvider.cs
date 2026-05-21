using AiAdmin.Services.Knowledge;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public class PgVectorKnowledgeRetrievalProvider : IKnowledgeRetrievalProvider, ITransientDependency
{
    private readonly KnowledgeBaseService _knowledgeBaseService;

    public PgVectorKnowledgeRetrievalProvider(KnowledgeBaseService knowledgeBaseService)
    {
        _knowledgeBaseService = knowledgeBaseService;
    }

    public async Task<KnowledgeRetrievalProviderResult> RetrieveAsync(KnowledgeRetrievalProviderRequest request)
    {
        var hits = new List<KnowledgeRetrievalHit>();
        foreach (var binding in request.Bindings.OrderBy(x => x.Sort ?? 0))
        {
            if (string.IsNullOrWhiteSpace(binding.DatasetId))
                continue;

            var result = await _knowledgeBaseService.SearchChunksAsync([binding.DatasetId],
                request.Query,
                binding.TopK ?? 5,
                binding.MinScore ?? 0.3,
                request.CancellationToken);
            hits.AddRange(result.Select(x => new KnowledgeRetrievalHit
            {
                DatasetId = x.DatasetId,
                DocumentId = x.DocumentId,
                DocumentName = x.DocumentName,
                Content = x.Content,
                Score = x.Score
            }));
        }

        return new KnowledgeRetrievalProviderResult
        {
            Hits = hits.OrderByDescending(x => x.Score).ToList()
        };
    }
}
