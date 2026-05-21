namespace AiAdmin.Services.Knowledge.Dtos;

public sealed class KnowledgeVectorSearchRequest
{
    public IReadOnlyList<string> DatasetIds { get; init; } = [];
    public string Query { get; init; } = string.Empty;
    public string? EmbeddingModelId { get; init; }
    public int TopK { get; init; } = 5;
    public double MinScore { get; init; } = 0.1;
}
