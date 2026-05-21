namespace AiAdmin.Services.Memory;

public sealed class MemoryVectorSearchRequest
{
    public string LibraryId { get; init; } = string.Empty;
    public string Query { get; init; } = string.Empty;
    public string? EntityId { get; init; }
    public string? SessionId { get; init; }
    public string? RuleId { get; init; }
    public string? RecordType { get; init; }
    public bool IncludeExpired { get; init; }
    public int? MinImportance { get; init; }
    public int TopK { get; init; } = 10;
    public double MinScore { get; init; } = 0.1;
}

public sealed class MemoryVectorSearchHit
{
    public Entities.AiMemoryRecord Record { get; init; } = new();
    public double Score { get; init; }
}

public interface IMemoryVectorSearchProvider
{
    Task<IReadOnlyList<MemoryVectorSearchHit>> SearchAsync(MemoryVectorSearchRequest request, CancellationToken cancellationToken = default);
    Task SaveRecordEmbeddingAsync(string recordId, IReadOnlyList<float> embedding, CancellationToken cancellationToken = default);
}
