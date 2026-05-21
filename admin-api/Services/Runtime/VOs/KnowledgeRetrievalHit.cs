namespace AiAdmin.Services.Runtime;

public sealed class KnowledgeRetrievalHit
{
    public string DatasetId { get; init; } = string.Empty;
    public string? DocumentId { get; init; }
    public string? DocumentName { get; init; }
    public string Content { get; init; } = string.Empty;
    public double Score { get; init; }
}
