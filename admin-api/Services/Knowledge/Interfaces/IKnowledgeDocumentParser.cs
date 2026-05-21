using AiAdmin.Entities;
using AiAdmin.Services.Knowledge.VOs;

namespace AiAdmin.Services.Knowledge.Interfaces;

public interface IKnowledgeDocumentParser
{
    bool CanParse(AiRagKnowledgeDocument document);
    Task<KnowledgeDocumentParseResult> ParseAsync(AiRagKnowledgeDocument document, CancellationToken cancellationToken = default);
}
