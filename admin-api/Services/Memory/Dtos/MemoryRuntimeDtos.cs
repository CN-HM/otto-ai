namespace AiAdmin.Services.Memory.Dtos;

public class MemoryRuntimeContextDto
{
    /// <summary>记忆库ID</summary>
    public string? LibraryId { get; set; }
    /// <summary>记忆库名称</summary>
    public string? LibraryName { get; set; }
    /// <summary>实体作用域</summary>
    public string? EntityScope { get; set; }
    /// <summary>实体ID</summary>
    public string? EntityId { get; set; }
    /// <summary>召回数量</summary>
    public int TopK { get; set; }
    /// <summary>最小分数阈值</summary>
    public double? MinScore { get; set; }
    /// <summary>是否启用意图召回</summary>
    public bool IntentRecall { get; set; }
    /// <summary>是否启用查询改写</summary>
    public bool QueryRewrite { get; set; }
    /// <summary>是否启用重排</summary>
    public bool Rerank { get; set; }
    /// <summary>召回记录列表</summary>
    public List<MemorySearchHitDto> Records { get; set; } = [];
}
