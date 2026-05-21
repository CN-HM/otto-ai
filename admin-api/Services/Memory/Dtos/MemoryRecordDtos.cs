namespace AiAdmin.Services.Memory.Dtos;

public class MemoryRecordPageQuery
{
    /// <summary>页码</summary>
    public int? Page { get; set; }
    /// <summary>每页条数</summary>
    public int? Limit { get; set; }
    /// <summary>记录类型</summary>
    public string? RecordType { get; set; }
    /// <summary>关键词</summary>
    public string? Keyword { get; set; }
    /// <summary>是否包含过期记录</summary>
    public int? IncludeExpired { get; set; }
}

public class MemoryRecordUpsertDto
{
    /// <summary>智能体ID</summary>
    public string? AgentId { get; set; }
    /// <summary>设备ID</summary>
    public string? DeviceId { get; set; }
    /// <summary>用户ID</summary>
    public long? UserId { get; set; }
    /// <summary>实体ID</summary>
    public string EntityId { get; set; } = string.Empty;
    /// <summary>会话ID</summary>
    public string? SessionId { get; set; }
    /// <summary>规则ID</summary>
    public string? RuleId { get; set; }
    /// <summary>规则编码</summary>
    public string? RuleCode { get; set; }
    /// <summary>实体范围</summary>
    public string? EntityScope { get; set; }
    /// <summary>记录类型</summary>
    public string RecordType { get; set; } = "node";
    /// <summary>标题</summary>
    public string? Title { get; set; }
    /// <summary>内容</summary>
    public string Content { get; set; } = string.Empty;
    /// <summary>摘要</summary>
    public string? Summary { get; set; }
    /// <summary>关键词</summary>
    public object? Keywords { get; set; }
    /// <summary>附加载荷JSON</summary>
    public object? PayloadJson { get; set; }
    /// <summary>归并键</summary>
    public string? CanonicalKey { get; set; }
    /// <summary>内容哈希</summary>
    public string? ContentHash { get; set; }
    /// <summary>重要度</summary>
    public int? Importance { get; set; }
    /// <summary>置信度</summary>
    public double? Confidence { get; set; }
    /// <summary>是否置顶</summary>
    public int? IsPinned { get; set; }
    /// <summary>来源</summary>
    public string? Source { get; set; }
    /// <summary>来源聊天记录ID</summary>
    public string? SourceChatHistoryId { get; set; }
    /// <summary>来源对话轮次ID</summary>
    public string? SourceTurnId { get; set; }
    /// <summary>来源提取任务ID</summary>
    public string? SourceRunId { get; set; }
    /// <summary>过期时间</summary>
    public DateTime? ExpiresAt { get; set; }
}

public class MemoryRecordDto
{
    /// <summary>记录ID</summary>
    public string? Id { get; set; }
    /// <summary>记忆库ID</summary>
    public string? LibraryId { get; set; }
    /// <summary>智能体ID</summary>
    public string? AgentId { get; set; }
    /// <summary>设备ID</summary>
    public string? DeviceId { get; set; }
    /// <summary>用户ID</summary>
    public long? UserId { get; set; }
    /// <summary>实体ID</summary>
    public string? EntityId { get; set; }
    /// <summary>会话ID</summary>
    public string? SessionId { get; set; }
    /// <summary>规则ID</summary>
    public string? RuleId { get; set; }
    /// <summary>规则编码</summary>
    public string? RuleCode { get; set; }
    /// <summary>实体范围</summary>
    public string? EntityScope { get; set; }
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
    /// <summary>归并键</summary>
    public string? CanonicalKey { get; set; }
    /// <summary>内容哈希</summary>
    public string? ContentHash { get; set; }
    public string? EmbeddingModelId { get; set; }
    public int EmbeddingDimension { get; set; }
    public bool HasEmbedding { get; set; }
    public List<float> EmbeddingPreview { get; set; } = [];
    /// <summary>重要度</summary>
    public int? Importance { get; set; }
    /// <summary>置信度</summary>
    public double? Confidence { get; set; }
    /// <summary>是否置顶</summary>
    public int? IsPinned { get; set; }
    /// <summary>状态</summary>
    public string? Status { get; set; }
    /// <summary>来源</summary>
    public string? Source { get; set; }
    /// <summary>来源聊天记录ID</summary>
    public string? SourceChatHistoryId { get; set; }
    /// <summary>来源对话轮次ID</summary>
    public string? SourceTurnId { get; set; }
    /// <summary>来源提取任务ID</summary>
    public string? SourceRunId { get; set; }
    /// <summary>合并来源记录ID</summary>
    public object? MergedFromRecordIds { get; set; }
    /// <summary>替代记录ID</summary>
    public string? SupersededByRecordId { get; set; }
    /// <summary>版本</summary>
    public int? Revision { get; set; }
    /// <summary>过期时间</summary>
    public string? ExpiresAt { get; set; }
    /// <summary>最后访问时间</summary>
    public string? LastAccessedAt { get; set; }
    /// <summary>创建时间</summary>
    public string? CreatedAt { get; set; }
    /// <summary>更新时间</summary>
    public string? UpdatedAt { get; set; }
}
