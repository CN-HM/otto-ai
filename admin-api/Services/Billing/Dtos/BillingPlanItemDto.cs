namespace AiAdmin.Services.Billing.Dtos;

/// <summary>计费套餐项DTO</summary>
public class BillingPlanItemDto
{
    /// <summary>套餐ID</summary>
    public string Id { get; set; } = string.Empty;
    /// <summary>套餐代码</summary>
    public string Code { get; set; } = string.Empty;
    /// <summary>套餐名称</summary>
    public string Name { get; set; } = string.Empty;
    /// <summary>套餐类型</summary>
    public string PlanType { get; set; } = string.Empty;
    /// <summary>包含额度（Token）</summary>
    public long IncludedTokens { get; set; }
    /// <summary>赠送额度（Token）</summary>
    public long BonusTokens { get; set; }
    /// <summary>周期月数</summary>
    public int CycleMonths { get; set; }
    /// <summary>是否默认</summary>
    public bool IsDefault { get; set; }
    /// <summary>是否启用</summary>
    public bool IsEnabled { get; set; }
    /// <summary>排序</summary>
    public int Sort { get; set; }
    /// <summary>备注</summary>
    public string? Remark { get; set; }
    /// <summary>金额</summary>
    public decimal? Amount { get; set; }
    /// <summary>货币代码</summary>
    public string? CurrencyCode { get; set; }
    /// <summary>地区代码</summary>
    public string? RegionCode { get; set; }
    /// <summary>支付提供商代码</summary>
    public string? ProviderCode { get; set; }
}

