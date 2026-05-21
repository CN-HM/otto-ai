namespace AiAdmin.Services.Memory.Dtos;

public class MemorySearchDto
{
    /// <summary>实体ID</summary>
    public string? EntityId { get; set; }
    /// <summary>会话ID</summary>
    public string? SessionId { get; set; }
    /// <summary>查询文本</summary>
    public string? Query { get; set; }
    /// <summary>记录类型</summary>
    public string? RecordType { get; set; }
    /// <summary>最大结果数</summary>
    public int? MaxResults { get; set; }
    public double? MinScore { get; set; }
    /// <summary>最小重要度</summary>
    public int? MinImportance { get; set; }
    /// <summary>是否包含过期记录</summary>
    public int? IncludeExpired { get; set; }
}

public class MemorySearchHitDto
{
    /// <summary>记录ID</summary>
    public string? Id { get; set; }
    /// <summary>实体ID</summary>
    public string? EntityId { get; set; }
    /// <summary>会话ID</summary>
    public string? SessionId { get; set; }
    /// <summary>规则ID</summary>
    public string? RuleId { get; set; }
    /// <summary>记录类型</summary>
    public string? RecordType { get; set; }
    /// <summary>标题</summary>
    public string? Title { get; set; }
    /// <summary>内容</summary>
    public string? Content { get; set; }
    /// <summary>摘要</summary>
    public string? Summary { get; set; }
    /// <summary>关键词</summary>
    public object? Keywords { get; set; }
    /// <summary>附加载荷JSON</summary>
    public object? PayloadJson { get; set; }
    public string? EmbeddingModelId { get; set; }
    public int EmbeddingDimension { get; set; }
    public bool HasEmbedding { get; set; }
    /// <summary>重要度</summary>
    public int? Importance { get; set; }
    /// <summary>是否置顶</summary>
    public int? IsPinned { get; set; }
    /// <summary>匹配分数</summary>
    public double Score { get; set; }
    /// <summary>过期时间</summary>
    public string? ExpiresAt { get; set; }
    /// <summary>更新时间</summary>
    public string? UpdatedAt { get; set; }
}

public class MemorySearchResultDto
{
    /// <summary>记忆库ID</summary>
    public string? LibraryId { get; set; }
    /// <summary>实体ID</summary>
    public string? EntityId { get; set; }
    /// <summary>查询文本</summary>
    public string? Query { get; set; }
    public double MinScore { get; set; }
    /// <summary>总命中数</summary>
    public int Total { get; set; }
    /// <summary>命中记录列表</summary>
    public List<MemorySearchHitDto> Hits { get; set; } = [];
}
