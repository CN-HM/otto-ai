using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public class EmptyKnowledgeRetrievalProvider : ITransientDependency
{
    public Task<KnowledgeRetrievalProviderResult> RetrieveAsync(KnowledgeRetrievalProviderRequest request)
    {
        return Task.FromResult(new KnowledgeRetrievalProviderResult());
    }
}
