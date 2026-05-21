using System.Globalization;
using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Services.Knowledge.Interfaces;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Memory;

public class PgVectorMemoryVectorSearchProvider : IMemoryVectorSearchProvider, ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IKnowledgeEmbeddingProvider _embeddingProvider;

    public PgVectorMemoryVectorSearchProvider(AiAdminDbContext db, IKnowledgeEmbeddingProvider embeddingProvider)
    {
        _db = db;
        _embeddingProvider = embeddingProvider;
    }

    public async Task<IReadOnlyList<MemoryVectorSearchHit>> SearchAsync(MemoryVectorSearchRequest request, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(request.LibraryId) || string.IsNullOrWhiteSpace(request.Query))
            return [];

        var embedding = await _embeddingProvider.EmbedAsync(request.Query, null, cancellationToken);
        var limit = Math.Clamp(request.TopK, 1, 100);
        var now = DateTime.UtcNow;

        var query = _db.AiMemoryRecords.AsNoTracking()
            .Where(x => x.LibraryId == request.LibraryId
                        && x.Status == "active"
                        && x.EmbeddingDimension == embedding.Values.Length
                        && x.EmbeddingModelId == embedding.ModelConfigId
                        && x.EmbeddingJson != null);
        if (!request.IncludeExpired)
            query = query.Where(x => x.ExpiresAt == null || x.ExpiresAt > now);
        var entityId = NormalizeOptional(request.EntityId);
        if (!string.IsNullOrWhiteSpace(entityId))
            query = query.Where(x => x.EntityId == entityId);
        var sessionId = NormalizeOptional(request.SessionId);
        if (!string.IsNullOrWhiteSpace(sessionId))
            query = query.Where(x => x.SessionId == sessionId);
        var recordType = NormalizeOptional(request.RecordType);
        if (!string.IsNullOrWhiteSpace(recordType))
            query = query.Where(x => x.RecordType == recordType);
        if (request.MinImportance.HasValue)
            query = query.Where(x => x.Importance >= request.MinImportance.Value);

        var candidateLimit = Math.Max(limit * 20, limit);
        var candidates = await query
            .OrderByDescending(x => x.IsPinned)
            .ThenByDescending(x => x.Importance)
            .ThenByDescending(x => x.UpdatedAt ?? x.CreatedAt)
            .Take(candidateLimit)
            .ToListAsync(cancellationToken);
        if (candidates.Count == 0)
            return [];

        return candidates
            .Select(record => new MemoryVectorSearchHit
            {
                Record = record,
                Score = CalculateCosineSimilarity(embedding.Values, ParseEmbedding(record.EmbeddingJson))
            })
            .Where(x => x.Score >= request.MinScore)
            .OrderByDescending(x => x.Record.IsPinned)
            .ThenByDescending(x => x.Score)
            .ThenByDescending(x => x.Record.Importance)
            .ThenByDescending(x => x.Record.UpdatedAt ?? x.Record.CreatedAt)
            .Take(limit)
            .ToList();
    }

    public async Task SaveRecordEmbeddingAsync(string recordId, IReadOnlyList<float> embedding, CancellationToken cancellationToken = default)
    {
        try
        {
            await _db.Database.ExecuteSqlRawAsync(
                "UPDATE ai_memory_record SET embedding = {0}::vector WHERE id = {1}",
                [ToVectorSqlLiteral(embedding), recordId],
                cancellationToken);
        }
        catch (PostgresException ex) when (string.Equals(ex.SqlState, PostgresErrorCodes.UndefinedColumn, StringComparison.Ordinal))
        {
        }
    }

    private static IReadOnlyList<float> ParseEmbedding(string? embeddingJson)
    {
        if (string.IsNullOrWhiteSpace(embeddingJson))
            return [];
        try
        {
            return JsonSerializer.Deserialize<List<float>>(embeddingJson) ?? [];
        }
        catch
        {
            return [];
        }
    }

    private static double CalculateCosineSimilarity(IReadOnlyList<float> left, IReadOnlyList<float> right)
    {
        if (left.Count == 0 || right.Count == 0 || left.Count != right.Count)
            return 0;

        double dot = 0;
        double leftNorm = 0;
        double rightNorm = 0;
        for (var i = 0; i < left.Count; i++)
        {
            dot += left[i] * right[i];
            leftNorm += left[i] * left[i];
            rightNorm += right[i] * right[i];
        }

        if (leftNorm <= 0 || rightNorm <= 0)
            return 0;

        return dot / (Math.Sqrt(leftNorm) * Math.Sqrt(rightNorm));
    }

    private static string ToVectorSqlLiteral(IReadOnlyList<float> vector)
    {
        return "[" + string.Join(',', vector.Select(x => x.ToString("0.########", CultureInfo.InvariantCulture))) + "]";
    }

    private static string? NormalizeOptional(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

}
