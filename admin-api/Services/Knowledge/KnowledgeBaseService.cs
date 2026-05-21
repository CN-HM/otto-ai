using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Knowledge.Dtos;
using AiAdmin.Services.Knowledge.Interfaces;
using AiAdmin.Services.Knowledge.VOs;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;
using Volo.Abp.Uow;

namespace AiAdmin.Services.Knowledge;

public class KnowledgeBaseService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;
    private readonly IKnowledgeChunker _chunker;
    private readonly IKnowledgeEmbeddingProvider _embeddingProvider;
    private readonly IEnumerable<IKnowledgeDocumentParser> _documentParsers;
    private readonly IKnowledgeVectorSearchProvider _vectorSearchProvider;
    private readonly IUnitOfWorkManager _unitOfWorkManager;
    private readonly ILogger<KnowledgeBaseService> _logger;

    public KnowledgeBaseService(
        AiAdminDbContext db,
        IGuidGenerator guidGenerator,
        IKnowledgeChunker chunker,
        IKnowledgeEmbeddingProvider embeddingProvider,
        IEnumerable<IKnowledgeDocumentParser> documentParsers,
        IKnowledgeVectorSearchProvider vectorSearchProvider,
        IUnitOfWorkManager unitOfWorkManager,
        ILogger<KnowledgeBaseService> logger)
    {
        _db = db;
        _guidGenerator = guidGenerator;
        _chunker = chunker;
        _embeddingProvider = embeddingProvider;
        _documentParsers = documentParsers;
        _vectorSearchProvider = vectorSearchProvider;
        _unitOfWorkManager = unitOfWorkManager;
        _logger = logger;
    }

    public async Task<KnowledgeFilesDto> ImportTextAsync(string datasetId, KnowledgeTextImportDto dto, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var dataset = await GetAccessibleDatasetAsync(datasetId, currentUserId, isSuperAdmin, cancellationToken);
        var content = RequireValue(dto.Content, "知识内容不能为空");
        var now = DateTime.UtcNow;
        var documentId = _guidGenerator.Create().ToString("N");
        var metadataJson = dto.Metadata == null ? null : JsonSerializer.Serialize(dto.Metadata);
        var document = new AiRagKnowledgeDocument
        {
            Id = documentId,
            DatasetId = dataset.DatasetId,
            DocumentId = documentId,
            Name = NormalizeOptionalText(dto.Title) ?? "手动文本",
            Size = Encoding.UTF8.GetByteCount(content),
            FileType = "txt",
            SourceContent = content,
            ChunkMethod = dataset.ChunkMethod ?? "default",
            ParserConfig = metadataJson,
            Status = "INDEXING",
            Creator = currentUserId,
            CreatedAt = now,
            Updater = currentUserId,
            UpdatedAt = now
        };

        _db.AiRagKnowledgeDocuments.Add(document);
        await _db.SaveChangesAsync(cancellationToken);

        try
        {
            await ReplaceDocumentChunksAsync(dataset, document, content, metadataJson, currentUserId, cancellationToken);
            document.ChunkCount = await _db.AiRagKnowledgeChunks.CountAsync(x => x.DatasetId == dataset.DatasetId && x.DocumentId == document.DocumentId && x.Status == "indexed", cancellationToken);
            document.TokenNum = await _db.AiRagKnowledgeChunks.Where(x => x.DatasetId == dataset.DatasetId && x.DocumentId == document.DocumentId && x.Status == "indexed").SumAsync(x => (long)x.TokenCount, cancellationToken);
            document.Status = "DONE";
            document.Progress = 100;
            document.UpdatedAt = DateTime.UtcNow;
            dataset.DocumentCount = await _db.AiRagKnowledgeDocuments.CountAsync(x => x.DatasetId == dataset.DatasetId, cancellationToken);
            await RefreshDatasetStatsAsync(dataset, cancellationToken);
            return MapDocument(document);
        }
        catch (Exception ex)
        {
            DetachChunkChanges();
            document.Status = "FAILED";
            document.Progress = 100;
            document.ErrorMessage = ex.Message;
            document.UpdatedAt = DateTime.UtcNow;
            dataset.DocumentCount = await _db.AiRagKnowledgeDocuments.CountAsync(x => x.DatasetId == dataset.DatasetId, cancellationToken);
            await _db.SaveChangesAsync(cancellationToken);
            throw new InvalidOperationException($"知识文本索引失败：{ex.Message}", ex);
        }
    }

    private async Task<string> ResolveDefaultEmbeddingModelIdAsync(CancellationToken cancellationToken)
    {
        var fallback = await _db.AiEmbeddingProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .Select(x => x.Id)
            .FirstOrDefaultAsync(cancellationToken);
        if (string.IsNullOrWhiteSpace(fallback))
            throw new InvalidOperationException("Error:KnowledgeEmbeddingProfileUnavailable");

        return fallback;
    }

    public async Task<KnowledgeFilesDto> ImportUploadedFileAsync(string datasetId, string name, long size, string? fileType, string? filePath, string? sourceContent, string? chunkMethod, string? parserConfig, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var dataset = await GetAccessibleDatasetAsync(datasetId, currentUserId, isSuperAdmin, cancellationToken);
        var now = DateTime.UtcNow;
        var documentId = _guidGenerator.Create().ToString("N");
        var document = new AiRagKnowledgeDocument
        {
            Id = documentId,
            DatasetId = dataset.DatasetId,
            DocumentId = documentId,
            Name = name,
            Size = size,
            FileType = NormalizeFileType(fileType),
            FilePath = filePath,
            SourceContent = NormalizeOptionalText(sourceContent),
            Progress = 0,
            ChunkMethod = NormalizeOptionalText(chunkMethod) ?? dataset.ChunkMethod ?? "default",
            ParserConfig = NormalizeOptionalText(parserConfig) ?? dataset.ParserConfig,
            Status = "UNSTART",
            Creator = currentUserId,
            CreatedAt = now,
            Updater = currentUserId,
            UpdatedAt = now
        };

        _db.AiRagKnowledgeDocuments.Add(document);
        dataset.DocumentCount += 1;
        dataset.UpdatedAt = now;
        await _db.SaveChangesAsync(cancellationToken);

        return MapDocument(document);
    }

    public async Task<object> ParseDocumentsAsync(string datasetId, IReadOnlyDictionary<string, string[]> payload, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var dataset = await GetAccessibleDatasetAsync(datasetId, currentUserId, isSuperAdmin, cancellationToken);
        var documentIds = GetDocumentIds(payload);
        var query = _db.AiRagKnowledgeDocuments.Where(x => x.DatasetId == dataset.DatasetId);
        if (documentIds.Count > 0)
            query = query.Where(x => documentIds.Contains(x.Id) || (x.DocumentId != null && documentIds.Contains(x.DocumentId)));
        else
            query = query.Where(x => x.Status == "UNSTART");

        var documents = await query.ToListAsync(cancellationToken);
        var queued = 0;
        foreach (var document in documents)
        {
            if (!HasRetryableSource(document))
            {
                document.Status = "FAILED";
                document.Progress = 100;
                document.ErrorMessage = "该文档没有可重试的原始内容，请重新上传文件或重新导入文本";
            }
            else
            {
                document.Status = "UNSTART";
                document.Progress = 0;
                document.ErrorMessage = null;
                queued++;
            }
            document.Updater = currentUserId;
            document.UpdatedAt = DateTime.UtcNow;
        }

        await _db.SaveChangesAsync(cancellationToken);
        return new { total = documents.Count, queued };
    }

    public async Task<object> DeleteDocumentsAsync(string datasetId, IReadOnlyCollection<string> ids, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var dataset = await GetAccessibleDatasetAsync(datasetId, currentUserId, isSuperAdmin, cancellationToken);
        var normalizedIds = ids
            .Where(x => !string.IsNullOrWhiteSpace(x))
            .Select(x => x.Trim())
            .Distinct()
            .ToList();
        if (normalizedIds.Count == 0)
            return new { total = 0 };

        var documents = await _db.AiRagKnowledgeDocuments
            .Where(x => x.DatasetId == dataset.DatasetId && (normalizedIds.Contains(x.Id) || (x.DocumentId != null && normalizedIds.Contains(x.DocumentId))))
            .ToListAsync(cancellationToken);
        if (documents.Count == 0)
            return new { total = 0 };

        var documentKeys = documents
            .SelectMany(x => new[] { x.Id, x.DocumentId })
            .Where(x => !string.IsNullOrWhiteSpace(x))
            .Select(x => x!)
            .Distinct()
            .ToList();

        await _db.AiRagKnowledgeChunks
            .Where(x => x.DatasetId == dataset.DatasetId && documentKeys.Contains(x.DocumentId))
            .ExecuteDeleteAsync(cancellationToken);
        _db.AiRagKnowledgeDocuments.RemoveRange(documents);
        await _db.SaveChangesAsync(cancellationToken);

        dataset.DocumentCount = await _db.AiRagKnowledgeDocuments.CountAsync(x => x.DatasetId == dataset.DatasetId, cancellationToken);
        await RefreshDatasetStatsAsync(dataset, cancellationToken);
        return new { total = documents.Count };
    }

    public async Task<ListVoDto> GetChunksAsync(string datasetId, string documentId, int? page, int? pageSize, string? keywords, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var dataset = await GetAccessibleDatasetAsync(datasetId, currentUserId, isSuperAdmin, cancellationToken);
        var currentPage = Math.Max(1, page ?? 1);
        var limit = Math.Clamp(pageSize ?? 20, 1, 100);
        var query = _db.AiRagKnowledgeChunks.AsNoTracking()
            .Where(x => x.DatasetId == dataset.DatasetId && x.DocumentId == documentId);

        if (!string.IsNullOrWhiteSpace(keywords))
        {
            var keyword = keywords.Trim();
            query = query.Where(x => x.Content.Contains(keyword) || (x.Title != null && x.Title.Contains(keyword)));
        }

        var total = await query.CountAsync(cancellationToken);
        var chunks = await query.OrderBy(x => x.ChunkIndex)
            .Skip((currentPage - 1) * limit)
            .Take(limit)
            .Select(x => new KnowledgeChunkDto
            {
                Id = x.Id,
                DatasetId = x.DatasetId,
                DocumentId = x.DocumentId,
                ChunkIndex = x.ChunkIndex,
                Title = x.Title,
                Content = x.Content,
                TokenCount = x.TokenCount,
                Status = x.Status,
                ErrorMessage = x.ErrorMessage,
                CreatedAt = x.CreatedAt == null ? null : x.CreatedAt.Value.ToString("yyyy-MM-dd HH:mm:ss")
            })
            .ToListAsync(cancellationToken);

        return new ListVoDto { Chunks = chunks.Cast<object>().ToList(), Total = total };
    }

    public async Task<ResultVoDto> RetrievalTestAsync(string datasetId, TestReqDto dto, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken = default)
    {
        var dataset = await GetAccessibleDatasetAsync(datasetId, currentUserId, isSuperAdmin, cancellationToken);
        var query = NormalizeOptionalText(dto.Question) ?? NormalizeOptionalText(GetPropertyValue(dto, "Query"));
        if (string.IsNullOrWhiteSpace(query))
            throw new InvalidOperationException("检索问题不能为空");

        var rewriteQuery = NormalizeOptionalText(dto.RewriteQuery);
        var effectiveQuery = rewriteQuery ?? query;
        var topK = Math.Clamp(dto.TopK ?? 5, 1, 50);
        var threshold = Math.Clamp(dto.Threshold ?? 0.3, 0, 1);

        var hits = await SearchChunksAsync([dataset.DatasetId], effectiveQuery, topK, threshold, cancellationToken);
        return new ResultVoDto
        {
            Query = query,
            EffectiveQuery = effectiveQuery,
            TopK = topK,
            Threshold = threshold,
            RewriteApplied = rewriteQuery != null,
            Chunks = hits.Select(x => new HitVoDto
            {
                Id = x.Id,
                Content = x.Content,
                Similarity = x.Score,
                DocumentId = x.DocumentId,
                DatasetId = x.DatasetId,
                DocumentName = x.DocumentName
            }).ToList(),
            Total = hits.Count,
            DocAggs = []
        };
    }

    public async Task<IReadOnlyList<KnowledgeSearchHit>> SearchChunksAsync(IReadOnlyList<string> datasetIds, string query, int topK, double minScore, CancellationToken cancellationToken = default)
    {
        if (datasetIds.Count == 0)
            return [];

        return await _vectorSearchProvider.SearchAsync(new KnowledgeVectorSearchRequest
        {
            DatasetIds = datasetIds,
            Query = query,
            EmbeddingModelId = null,
            TopK = topK,
            MinScore = minScore
        }, cancellationToken);
    }

    public async Task<int> ProcessPendingDocumentsAsync(int batchSize = 5, CancellationToken cancellationToken = default)
    {
        var documents = await _db.AiRagKnowledgeDocuments
            .Where(x => x.Status == "UNSTART")
            .OrderBy(x => x.CreatedAt)
            .Take(Math.Clamp(batchSize, 1, 20))
            .ToListAsync(cancellationToken);

        var processed = 0;
        foreach (var document in documents)
        {
            var dataset = await _db.AiRagDatasets.FirstOrDefaultAsync(x => x.DatasetId == document.DatasetId, cancellationToken);
            if (dataset == null)
                continue;

            try
            {
                await IndexFileDocumentAsync(dataset, document, document.Updater ?? document.Creator ?? 0, cancellationToken);
                processed++;
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex,
                    "Knowledge document indexing failed for dataset {DatasetId}, document {DocumentId}",
                    document.DatasetId,
                    document.DocumentId ?? document.Id);
            }
        }

        return processed;
    }

    private async Task ReplaceDocumentChunksAsync(AiRagDataset dataset, AiRagKnowledgeDocument document, string content, string? metadataJson, long currentUserId, CancellationToken cancellationToken)
    {
        using var unitOfWork = _unitOfWorkManager.Begin(requiresNew: true, isTransactional: true);
        await _db.AiRagKnowledgeChunks
            .Where(x => x.DatasetId == dataset.DatasetId && x.DocumentId == document.DocumentId)
            .ExecuteDeleteAsync(cancellationToken);

        var chunks = _chunker.Chunk(content);
        var embeddingModelId = await ResolveDefaultEmbeddingModelIdAsync(
            cancellationToken);
        var embeddings = new List<(string ChunkId, float[] Embedding)>();
        foreach (var chunk in chunks)
        {
            var embedding = await _embeddingProvider.EmbedAsync(chunk.Content,
                embeddingModelId,
                cancellationToken);
            var chunkId = _guidGenerator.Create().ToString("N");
            var entity = new AiRagKnowledgeChunk
            {
                Id = chunkId,
                DatasetId = dataset.DatasetId,
                DocumentId = document.DocumentId!,
                ChunkIndex = chunk.Index,
                Title = document.Name,
                Content = chunk.Content,
                ContentHash = ComputeHash(chunk.Content),
                TokenCount = chunk.TokenCount,
                MetadataJson = metadataJson,
                EmbeddingModelId = embedding.ModelConfigId,
                EmbeddingDimension = embedding.Values.Length,
                EmbeddingJson = JsonSerializer.Serialize(embedding.Values),
                Status = "indexed",
                Creator = currentUserId,
                CreatedAt = DateTime.UtcNow,
                Updater = currentUserId,
                UpdatedAt = DateTime.UtcNow
            };
            _db.AiRagKnowledgeChunks.Add(entity);
            embeddings.Add((chunkId, embedding.Values));
        }

        await _db.SaveChangesAsync(cancellationToken);
        foreach (var item in embeddings)
            await _vectorSearchProvider.SaveChunkEmbeddingAsync(item.ChunkId, item.Embedding, cancellationToken);
        await unitOfWork.CompleteAsync(cancellationToken);
    }

    private async Task IndexFileDocumentAsync(AiRagDataset dataset, AiRagKnowledgeDocument document, long currentUserId, CancellationToken cancellationToken)
    {
        document.Status = "INDEXING";
        document.Progress = 10;
        document.ErrorMessage = null;
        document.Updater = currentUserId;
        document.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);

        try
        {
            var parser = _documentParsers.FirstOrDefault(x => x.CanParse(document));
            if (parser == null)
                throw new InvalidOperationException("Error:NoDocumentParserAvailable");
            var parseResult = await parser.ParseAsync(document, cancellationToken);
            var content = RequireValue(parseResult.Content, "文档内容为空，无法解析");
            document.Progress = 40;
            await _db.SaveChangesAsync(cancellationToken);

            await ReplaceDocumentChunksAsync(dataset, document, content, parseResult.MetadataJson ?? document.ParserConfig, currentUserId, cancellationToken);
            document.ChunkCount = await _db.AiRagKnowledgeChunks.CountAsync(x => x.DatasetId == dataset.DatasetId && x.DocumentId == document.DocumentId && x.Status == "indexed", cancellationToken);
            document.TokenNum = await _db.AiRagKnowledgeChunks.Where(x => x.DatasetId == dataset.DatasetId && x.DocumentId == document.DocumentId && x.Status == "indexed").SumAsync(x => (long)x.TokenCount, cancellationToken);
            document.Status = "DONE";
            document.Progress = 100;
            document.Updater = currentUserId;
            document.UpdatedAt = DateTime.UtcNow;
            await RefreshDatasetStatsAsync(dataset, cancellationToken);
        }
        catch (Exception ex)
        {
            DetachChunkChanges();
            document.Status = "FAILED";
            document.Progress = 100;
            document.ErrorMessage = ex.Message;
            document.Updater = currentUserId;
            document.UpdatedAt = DateTime.UtcNow;
            await _db.SaveChangesAsync(cancellationToken);
        }
    }

    private async Task RefreshDatasetStatsAsync(AiRagDataset dataset, CancellationToken cancellationToken)
    {
        dataset.ChunkCount = await _db.AiRagKnowledgeChunks.CountAsync(x => x.DatasetId == dataset.DatasetId && x.Status == "indexed", cancellationToken);
        dataset.TokenNum = await _db.AiRagKnowledgeChunks.Where(x => x.DatasetId == dataset.DatasetId && x.Status == "indexed").SumAsync(x => (long)x.TokenCount, cancellationToken);
        dataset.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
    }

    private void DetachChunkChanges()
    {
        var entries = _db.ChangeTracker.Entries<AiRagKnowledgeChunk>().ToList();
        foreach (var entry in entries)
            entry.State = EntityState.Detached;
    }

    private static bool HasRetryableSource(AiRagKnowledgeDocument document)
    {
        return !string.IsNullOrWhiteSpace(document.SourceContent);
    }

    private async Task<AiRagDataset> GetAccessibleDatasetAsync(string datasetId, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken)
    {
        var dataset = await _db.AiRagDatasets.FirstOrDefaultAsync(x => x.DatasetId == datasetId || x.Id == datasetId, cancellationToken);
        if (dataset == null)
            throw new InvalidOperationException("知识库不存在");
        if (!isSuperAdmin && dataset.Creator != currentUserId)
            throw new InvalidOperationException("无权访问该知识库");
        return dataset;
    }

    private static KnowledgeFilesDto MapDocument(AiRagKnowledgeDocument document)
    {
        return new KnowledgeFilesDto
        {
            Id = document.Id,
            DocumentId = document.DocumentId,
            DatasetId = document.DatasetId,
            Name = document.Name,
            FileSize = document.Size,
            FileType = document.FileType,
            FilePath = document.FilePath,
            Progress = document.Progress,
            ChunkMethod = document.ChunkMethod,
            Status = document.Status,
            Creator = document.Creator,
            CreatedAt = document.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            Updater = document.Updater,
            UpdatedAt = document.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            ChunkCount = document.ChunkCount,
            TokenCount = document.TokenNum,
            Error = document.ErrorMessage
        };
    }

    private static string RequireValue(string? value, string message)
    {
        var normalized = NormalizeOptionalText(value);
        if (string.IsNullOrWhiteSpace(normalized))
            throw new InvalidOperationException(message);
        return normalized;
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private static string? NormalizeFileType(string? fileType)
    {
        var normalized = NormalizeOptionalText(fileType)?.TrimStart('.').ToLowerInvariant();
        return normalized;
    }

    private static List<string> GetDocumentIds(IReadOnlyDictionary<string, string[]> payload)
    {
        var keys = new[] { "documentIds", "document_ids", "ids" };
        return keys.SelectMany(key => payload.TryGetValue(key, out var values) ? values : [])
            .Where(x => !string.IsNullOrWhiteSpace(x))
            .Select(x => x.Trim())
            .Distinct()
            .ToList();
    }

    private static string ComputeHash(string content)
    {
        return Convert.ToHexString(SHA256.HashData(Encoding.UTF8.GetBytes(content))).ToLowerInvariant();
    }

    private static string? GetPropertyValue(object instance, string propertyName)
    {
        return instance.GetType().GetProperty(propertyName)?.GetValue(instance)?.ToString();
    }
}

