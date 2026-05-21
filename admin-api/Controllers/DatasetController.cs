using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Knowledge;
using AiAdmin.Services.Knowledge.Dtos;
using Volo.Abp.Guids;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Controllers;

/// <summary>
/// 知识库（数据集）管理控制器
/// 提供知识库CRUD、文档管理功能
/// </summary>
[ApiController]
[Route("datasets")]
public class DatasetController : AiAdminBaseController
{
    private static readonly HashSet<string> InlineTextFileTypes = new(StringComparer.OrdinalIgnoreCase)
    {
        "txt",
        "md",
        "markdown",
        "json",
        "csv",
        "log"
    };

    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;
    private readonly KnowledgeBaseService _knowledgeBaseService;

    /// <summary>创建知识库控制器实例</summary>
    public DatasetController(AiAdminDbContext db, IGuidGenerator guidGenerator, KnowledgeBaseService knowledgeBaseService)
    {
        _db = db;
        _guidGenerator = guidGenerator;
        _knowledgeBaseService = knowledgeBaseService;
    }

    /// <summary>分页查询知识库列表</summary>
    [HttpGet]
    [Authorize]
    public async Task<Result<PageData<KnowledgeBaseDto>>> GetPageList(
        [FromQuery] string? name,
        [FromQuery] int page = 1,
        [FromQuery] int page_size = 10)
    {
        var q = _db.AiRagDatasets.AsQueryable();
        if (!IsSuperAdmin)
            q = q.Where(x => x.Creator == CurrentUserId);
        if (!string.IsNullOrEmpty(name))
            q = q.Where(x => x.Name.Contains(name));

        var total = await q.CountAsync();
        var items = await q
            .OrderByDescending(x => x.CreatedAt)
            .Skip((page - 1) * page_size)
            .Take(page_size)
            .ToListAsync();

        var list = items.Select(ToDto).ToList();
        return Result<PageData<KnowledgeBaseDto>>.Ok(new PageData<KnowledgeBaseDto> { Total = total, List = list });
    }

    /// <summary>根据知识库ID获取知识库详情</summary>
    [HttpGet("{dataset_id}")]
    [Authorize]
    public async Task<Result<KnowledgeBaseDto>> GetByDatasetId(string dataset_id)
    {
        var (x, error) = await ResolveOwnedEntityAsync<AiRagDataset, KnowledgeBaseDto>(
            _db.AiRagDatasets,
            d => d.DatasetId == dataset_id || d.Id == dataset_id,
            d => d.Creator,
            "知识库");
        if (error != null) return error;
        return Result<KnowledgeBaseDto>.Ok(ToDto(x));
    }

    [HttpGet("embedding-model-options")]
    [Authorize]
    public async Task<Result<List<OptionItemDto>>> GetEmbeddingModelOptions(CancellationToken cancellationToken)
    {
        var options = await _db.AiEmbeddingProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .OrderByDescending(x => x.IsDefault)
            .ThenBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .Select(x => new OptionItemDto
            {
                Value = x.Id,
                Label = x.Name,
                Description = x.Description
            })
            .ToListAsync(cancellationToken);
        return Result<List<OptionItemDto>>.Ok(options);
    }

    /// <summary>创建知识库</summary>
    [HttpPost]
    [Authorize]
    public async Task<Result<KnowledgeBaseDto>> PostDatasets([FromBody] KnowledgeBaseDto dto, CancellationToken cancellationToken)
    {
        var entity = new AiRagDataset
        {
            Id = _guidGenerator.Create().ToString("N"),
            DatasetId = dto.DatasetId ?? _guidGenerator.Create().ToString("N"),
            Name = dto.Name ?? string.Empty,
            Avatar = dto.Avatar,
            Description = dto.Description,
            Permission = dto.Permission ?? "public",
            ChunkMethod = dto.ChunkMethod,
            ParserConfig = dto.ParserConfig,
            Status = (short)(dto.Status ?? 1),
            Creator = CurrentUserId,
            CreatedAt = DateTime.UtcNow,
            Updater = CurrentUserId,
            UpdatedAt = DateTime.UtcNow
        };
        _db.AiRagDatasets.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return Result<KnowledgeBaseDto>.Ok(ToDto(entity));
    }

    /// <summary>更新知识库</summary>
    [HttpPut("{dataset_id}")]
    [Authorize]
    public async Task<Result<KnowledgeBaseDto>> PutDatasets(string dataset_id, [FromBody] KnowledgeBaseDto dto, CancellationToken cancellationToken)
    {
        var (entity, error) = await ResolveOwnedEntityAsync<AiRagDataset, KnowledgeBaseDto>(
            _db.AiRagDatasets,
            d => d.DatasetId == dataset_id || d.Id == dataset_id,
            d => d.Creator,
            "知识库");
        if (error != null) return error;

        entity.Name = dto.Name ?? entity.Name;
        entity.Avatar = dto.Avatar ?? entity.Avatar;
        entity.Description = dto.Description ?? entity.Description;
        entity.Permission = dto.Permission ?? entity.Permission;
        entity.ChunkMethod = dto.ChunkMethod ?? entity.ChunkMethod;
        entity.ParserConfig = dto.ParserConfig ?? entity.ParserConfig;
        entity.Status = (short)(dto.Status ?? entity.Status);
        entity.Updater = CurrentUserId;
        entity.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
        return Result<KnowledgeBaseDto>.Ok(ToDto(entity));
    }

    /// <summary>删除单个知识库</summary>
    [HttpDelete("{dataset_id}")]
    [Authorize]
    public async Task<Result<object>> DeleteDatasets(string dataset_id)
    {
        var (entity, error) = await ResolveOwnedEntityAsync<AiRagDataset, object>(
            _db.AiRagDatasets,
            d => d.DatasetId == dataset_id || d.Id == dataset_id,
            d => d.Creator,
            "知识库");
        if (error != null) return error;
        _db.AiRagDatasets.Remove(entity);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>批量删除知识库</summary>
    [HttpDelete("batch")]
    [Authorize]
    public async Task<Result<object>> DeleteBatch([FromQuery] string ids)
    {
        var idList = ids.Split(',').ToList();
        var q = _db.AiRagDatasets
            .Where(x => idList.Contains(x.Id) || idList.Contains(x.DatasetId));
        if (!IsSuperAdmin)
            q = q.Where(x => x.Creator == CurrentUserId);
        var entities = await q.ToListAsync();
        _db.AiRagDatasets.RemoveRange(entities);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    #region 文档管理

    /// <summary>分页查询文档列表</summary>
    [HttpGet("{dataset_id}/documents")]
    [Authorize]
    public async Task<Result<PageData<KnowledgeFilesDto>>> GetDocuments(
        string dataset_id,
        [FromQuery] string? name,
        [FromQuery] string? status,
        [FromQuery] int page = 1,
        [FromQuery] int page_size = 10)
    {
        var (dataset, error) = await ResolveOwnedEntityAsync<AiRagDataset, PageData<KnowledgeFilesDto>>(
            _db.AiRagDatasets,
            d => d.DatasetId == dataset_id || d.Id == dataset_id,
            d => d.Creator,
            "知识库");
        if (error != null) return error;

        var q = _db.AiRagKnowledgeDocuments.Where(x => x.DatasetId == dataset.DatasetId);
        if (!string.IsNullOrEmpty(name))
            q = q.Where(x => x.Name.Contains(name));
        if (!string.IsNullOrEmpty(status))
            q = q.Where(x => x.Status == status);

        var total = await q.CountAsync();
        var items = await q
            .OrderByDescending(x => x.CreatedAt)
            .Skip((page - 1) * page_size)
            .Take(page_size)
            .ToListAsync();

        var list = items.Select(ToDocDto).ToList();
        return Result<PageData<KnowledgeFilesDto>>.Ok(new PageData<KnowledgeFilesDto> { Total = total, List = list });
    }

    /// <summary>按状态分页查询文档列表</summary>
    [HttpGet("{dataset_id}/documents/status/{status}")]
    [Authorize]
    public async Task<Result<PageData<KnowledgeFilesDto>>> GetPageListByStatus(
        string dataset_id, string status,
        [FromQuery] int page = 1, [FromQuery] int page_size = 10)
    {
        var (dataset, error) = await ResolveOwnedEntityAsync<AiRagDataset, PageData<KnowledgeFilesDto>>(
            _db.AiRagDatasets,
            d => d.DatasetId == dataset_id || d.Id == dataset_id,
            d => d.Creator,
            "知识库");
        if (error != null) return error;

        var q = _db.AiRagKnowledgeDocuments
            .Where(x => x.DatasetId == dataset.DatasetId && x.Status == status);

        var total = await q.CountAsync();
        var items = await q
            .OrderByDescending(x => x.CreatedAt)
            .Skip((page - 1) * page_size)
            .Take(page_size)
            .ToListAsync();

        return Result<PageData<KnowledgeFilesDto>>.Ok(new PageData<KnowledgeFilesDto>
        {
            Total = total,
            List = items.Select(ToDocDto).ToList()
        });
    }

    /// <summary>上传文档到知识库</summary>
    [HttpPost("{dataset_id}/documents")]
    [Authorize]
    public async Task<Result<KnowledgeFilesDto>> UploadDocument(
        string dataset_id,
        IFormFile file,
        [FromQuery] string? name,
        [FromQuery] string? chunkMethod,
        [FromQuery] string? parserConfig,
        CancellationToken cancellationToken)
    {
        if (file == null || file.Length == 0) return Result<KnowledgeFilesDto>.Error("文件不能为空");

        var fileType = Path.GetExtension(file.FileName);
        var sourceContent = await TryReadInlineTextContentAsync(file, fileType, cancellationToken);
        if (string.IsNullOrWhiteSpace(sourceContent))
            return Result<KnowledgeFilesDto>.Error("当前仅支持上传 txt/md/markdown/json/csv/log 文本文件");

        var result = await _knowledgeBaseService.ImportUploadedFileAsync(dataset_id,
            name ?? file.FileName,
            file.Length,
            fileType,
            null,
            sourceContent,
            chunkMethod,
            parserConfig,
            CurrentUserId,
            IsSuperAdmin,
            cancellationToken);
        return Result<KnowledgeFilesDto>.Ok(result);
    }

    private static async Task<string?> TryReadInlineTextContentAsync(IFormFile file, string? fileType, CancellationToken cancellationToken)
    {
        var normalized = fileType?.Trim().TrimStart('.').ToLowerInvariant();
        if (string.IsNullOrWhiteSpace(normalized) || !InlineTextFileTypes.Contains(normalized))
            return null;

        using var reader = new StreamReader(file.OpenReadStream());
        var content = await reader.ReadToEndAsync(cancellationToken);
        return string.IsNullOrWhiteSpace(content) ? null : content;
    }

    [HttpPost("{dataset_id}/documents/text")]
    [Authorize]
    public async Task<Result<KnowledgeFilesDto>> ImportText(string dataset_id, [FromBody] KnowledgeTextImportDto payload, CancellationToken cancellationToken)
    {
        var result = await _knowledgeBaseService.ImportTextAsync(dataset_id, payload, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<KnowledgeFilesDto>.Ok(result);
    }

    /// <summary>批量删除文档</summary>
    [HttpDelete("{dataset_id}/documents")]
    [Authorize]
    public async Task<Result<object>> DeleteDocuments(string dataset_id, [FromBody] BatchIdReqDto payload, CancellationToken cancellationToken)
    {
        await _knowledgeBaseService.DeleteDocumentsAsync(dataset_id, payload.Ids, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }

    /// <summary>删除单个文档</summary>
    [HttpDelete("{dataset_id}/documents/{document_id}")]
    [Authorize]
    public async Task<Result<object>> DeleteSingle(string dataset_id, string document_id, CancellationToken cancellationToken)
    {
        await _knowledgeBaseService.DeleteDocumentsAsync(dataset_id, [document_id], CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }

    /// <summary>解析文档（切块）stub</summary>
    [HttpPost("{dataset_id}/chunks")]
    [Authorize]
    public async Task<Result<object>> ParseDocuments(string dataset_id, [FromBody] Dictionary<string, string[]> payload, CancellationToken cancellationToken)
    {
        await _knowledgeBaseService.ParseDocumentsAsync(dataset_id, payload, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }

    /// <summary>列出指定文档的切片 stub</summary>
    [HttpGet("{dataset_id}/documents/{document_id}/chunks")]
    [Authorize]
    public async Task<Result<ListVoDto>> ListChunks(string dataset_id, string document_id,
        [FromQuery] int? page, [FromQuery] int? pageSize, [FromQuery] string? keywords, CancellationToken cancellationToken)
    {
        var result = await _knowledgeBaseService.GetChunksAsync(dataset_id, document_id, page, pageSize, keywords, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<ListVoDto>.Ok(result);
    }

    /// <summary>召回测试 stub</summary>
    [HttpPost("{dataset_id}/retrieval-test")]
    [Authorize]
    public async Task<Result<ResultVoDto>> RetrievalTest(string dataset_id, [FromBody] TestReqDto payload, CancellationToken cancellationToken)
    {
        var result = await _knowledgeBaseService.RetrievalTestAsync(dataset_id, payload, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<ResultVoDto>.Ok(result);
    }

    #endregion

    private static KnowledgeBaseDto ToDto(AiRagDataset x) => new()
    {
        Id = x.Id,
        DatasetId = x.DatasetId,
        Name = x.Name,
        Avatar = x.Avatar,
        Description = x.Description,
        Permission = x.Permission,
        ChunkMethod = x.ChunkMethod,
        ParserConfig = x.ParserConfig,
        ChunkCount = x.ChunkCount,
        TokenNum = x.TokenNum,
        Status = (int)x.Status,
        Creator = x.Creator,
        CreatedAt = x.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
        Updater = x.Updater,
        UpdatedAt = x.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
        DocumentCount = x.DocumentCount
    };

    private static KnowledgeFilesDto ToDocDto(AiRagKnowledgeDocument x) => new()
    {
        Id = x.Id,
        DocumentId = x.DocumentId,
        DatasetId = x.DatasetId,
        Name = x.Name,
        FileSize = x.Size,
        FileType = x.FileType,
        FilePath = x.FilePath,
        Progress = x.Progress,
        ChunkMethod = x.ChunkMethod,
        Status = x.Status,
        Creator = x.Creator,
        CreatedAt = x.CreatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
        Updater = x.Updater,
        UpdatedAt = x.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
        ChunkCount = x.ChunkCount,
        TokenCount = x.TokenNum,
        Error = x.ErrorMessage
    };

}
