using System.Globalization;
using AiAdmin.Data;
using AiAdmin.Services.Knowledge.Dtos;
using AiAdmin.Services.Knowledge.Interfaces;
using AiAdmin.Services.Knowledge.VOs;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Knowledge;

public class PgVectorKnowledgeVectorSearchProvider : IKnowledgeVectorSearchProvider, ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IKnowledgeEmbeddingProvider _embeddingProvider;

    public PgVectorKnowledgeVectorSearchProvider(AiAdminDbContext db, IKnowledgeEmbeddingProvider embeddingProvider)
    {
        _db = db;
        _embeddingProvider = embeddingProvider;
    }

    public async Task<IReadOnlyList<KnowledgeSearchHit>> SearchAsync(KnowledgeVectorSearchRequest request, CancellationToken cancellationToken = default)
    {
        if (request.DatasetIds.Count == 0 || string.IsNullOrWhiteSpace(request.Query))
            return [];

        var embedding = await _embeddingProvider.EmbedAsync(request.Query, request.EmbeddingModelId, cancellationToken);
        var vectorLiteral = ToVectorSqlLiteral(embedding.Values);
        var limit = Math.Clamp(request.TopK, 1, 50);
        var sql = """
            WITH query_vector AS (
                SELECT {1}::vector AS embedding
            ),
            filtered_chunks AS MATERIALIZED (
                SELECT c.*
                FROM ai_rag_knowledge_chunk c
                WHERE c.dataset_id = ANY({0})
                    AND c.status = 'indexed'
                    AND c.embedding IS NOT NULL
                    AND c.embedding_dimension = {4}
                    AND ({5} IS NULL OR c.embedding_model_id = {5})
            )
            SELECT
                c.id AS "Id",
                c.dataset_id AS "DatasetId",
                c.document_id AS "DocumentId",
                d.name AS "DocumentName",
                c.content AS "Content",
                1 - (c.embedding <=> q.embedding) AS "Score"
            FROM filtered_chunks c
            CROSS JOIN query_vector q
            LEFT JOIN ai_rag_knowledge_document d ON d.document_id = c.document_id
            WHERE 1 - (c.embedding <=> q.embedding) >= {2}
            ORDER BY c.embedding <=> q.embedding
            LIMIT {3}
            """;

        return await _db.Database.SqlQueryRaw<KnowledgeSearchHit>(
                sql,
                request.DatasetIds.ToArray(),
                vectorLiteral,
                request.MinScore,
                limit,
                embedding.Values.Length,
                (object?)embedding.ModelConfigId ?? DBNull.Value)
            .ToListAsync(cancellationToken);
    }

    public async Task SaveChunkEmbeddingAsync(string chunkId, IReadOnlyList<float> embedding, CancellationToken cancellationToken = default)
    {
        await _db.Database.ExecuteSqlRawAsync(
            "UPDATE ai_rag_knowledge_chunk SET embedding = {0}::vector WHERE id = {1}",
            [ToVectorSqlLiteral(embedding), chunkId],
            cancellationToken);
    }

    private static string ToVectorSqlLiteral(IReadOnlyList<float> vector)
    {
        return "[" + string.Join(',', vector.Select(x => x.ToString("0.########", CultureInfo.InvariantCulture))) + "]";
    }
}

