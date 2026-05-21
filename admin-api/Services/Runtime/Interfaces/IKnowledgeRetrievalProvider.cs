namespace AiAdmin.Services.Runtime;

public interface IKnowledgeRetrievalProvider
{
    Task<KnowledgeRetrievalProviderResult> RetrieveAsync(KnowledgeRetrievalProviderRequest request);
}
