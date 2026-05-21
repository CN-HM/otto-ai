namespace AiAdmin.Services.Memory.Dtos;

public class MemoryLibraryListQuery
{
    /// <summary>页码</summary>
    public int? Page { get; set; }
    /// <summary>每页条数</summary>
    public int? Limit { get; set; }
    /// <summary>关键词</summary>
    public string? Keyword { get; set; }
    /// <summary>智能体ID</summary>
    public string? AgentId { get; set; }
    /// <summary>状态</summary>
    public short? Status { get; set; }
}

public class MemoryLibraryUpsertDto
{
    /// <summary>智能体ID</summary>
    public string? AgentId { get; set; }
    /// <summary>编码</summary>
    public string? Code { get; set; }
    /// <summary>名称</summary>
    public string Name { get; set; } = string.Empty;
    /// <summary>描述</summary>
    public string? Description { get; set; }
    /// <summary>状态</summary>
    public int? Status { get; set; }
    /// <summary>是否默认</summary>
    public int? IsDefault { get; set; }
    /// <summary>实体作用域</summary>
    public string? EntityScope { get; set; }
    /// <summary>记忆模型ID</summary>
    public string? MemoryModelId { get; set; }
    /// <summary>检索配置</summary>
    public MemoryRetrievalConfigDto? RetrievalConfig { get; set; }
    /// <summary>写入配置</summary>
    public MemoryWriteConfigDto? WriteConfig { get; set; }
    /// <summary>排序</summary>
    public int? Sort { get; set; }
}

public class MemoryLibraryDto
{
    /// <summary>记忆库ID</summary>
    public string? Id { get; set; }
    /// <summary>用户ID</summary>
    public long? UserId { get; set; }
    /// <summary>智能体ID</summary>
    public string? AgentId { get; set; }
    /// <summary>编码</summary>
    public string? Code { get; set; }
    /// <summary>名称</summary>
    public string? Name { get; set; }
    /// <summary>描述</summary>
    public string? Description { get; set; }
    /// <summary>状态</summary>
    public int? Status { get; set; }
    /// <summary>是否默认</summary>
    public int? IsDefault { get; set; }
    /// <summary>实体作用域</summary>
    public string? EntityScope { get; set; }
    /// <summary>记忆模型ID</summary>
    public string? MemoryModelId { get; set; }
    /// <summary>检索配置</summary>
    public MemoryRetrievalConfigDto? RetrievalConfig { get; set; }
    /// <summary>写入配置</summary>
    public MemoryWriteConfigDto? WriteConfig { get; set; }
    /// <summary>排序</summary>
    public int? Sort { get; set; }
    /// <summary>创建人</summary>
    public long? Creator { get; set; }
    /// <summary>创建时间</summary>
    public string? CreatedAt { get; set; }
    /// <summary>更新人</summary>
    public long? Updater { get; set; }
    /// <summary>更新时间</summary>
    public string? UpdatedAt { get; set; }
}

public class MemoryRetrievalConfigDto
{
    /// <summary>召回数量</summary>
    public int TopK { get; set; } = 5;
    /// <summary>最小相似度</summary>
    public double MinScore { get; set; } = 0.35;
    /// <summary>是否启用意图召回</summary>
    public bool IntentRecall { get; set; } = true;
    /// <summary>是否启用查询改写</summary>
    public bool QueryRewrite { get; set; }
    /// <summary>是否启用重排</summary>
    public bool Rerank { get; set; }
}

public class MemoryWriteConfigDto
{
    /// <summary>是否自动写入</summary>
    public bool AutoWrite { get; set; } = true;
    /// <summary>是否自动提取</summary>
    public bool AutoExtract { get; set; } = true;
    /// <summary>默认存活天数，0 表示永不过期</summary>
    public int TtlDays { get; set; }
    /// <summary>最低重要性</summary>
    public int MinImportance { get; set; } = 1;
    /// <summary>重要性阈值</summary>
    public int ImportanceThreshold { get; set; } = 3;
    /// <summary>是否去重</summary>
    public bool Deduplicate { get; set; } = true;
}

