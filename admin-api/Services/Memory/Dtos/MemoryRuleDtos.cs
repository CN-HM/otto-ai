using AiAdmin.Services.Memory;

namespace AiAdmin.Services.Memory.Dtos;

public class MemoryRuleUpsertDto
{
    /// <summary>规则类型</summary>
    public MemoryRuleType RuleType { get; set; } = MemoryRuleType.Node;
    /// <summary>规则名称</summary>
    public string RuleName { get; set; } = string.Empty;
    /// <summary>指令说明</summary>
    public string? Instruction { get; set; }
    /// <summary>存活天数</summary>
    public int? TtlDays { get; set; }
    /// <summary>是否启用</summary>
    public int? IsEnabled { get; set; }
}

public class MemoryRuleDto
{
    /// <summary>规则ID</summary>
    public string? Id { get; set; }
    /// <summary>记忆库ID</summary>
    public string? LibraryId { get; set; }
    /// <summary>规则类型</summary>
    public MemoryRuleType? RuleType { get; set; }
    /// <summary>规则名称</summary>
    public string? RuleName { get; set; }
    /// <summary>指令说明</summary>
    public string? Instruction { get; set; }
    /// <summary>存活天数</summary>
    public int? TtlDays { get; set; }
    /// <summary>是否启用</summary>
    public int? IsEnabled { get; set; }
    /// <summary>创建人</summary>
    public long? Creator { get; set; }
    /// <summary>创建时间</summary>
    public string? CreatedAt { get; set; }
    /// <summary>更新人</summary>
    public long? Updater { get; set; }
    /// <summary>更新时间</summary>
    public string? UpdatedAt { get; set; }
}
