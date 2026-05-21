namespace AiAdmin.Services.Billing.Dtos;

/// <summary>管理员订阅项DTO</summary>
public class AdminBillingSubscriptionItemDto
{
    /// <summary>用户ID</summary>
    public long UserId { get; set; }
    /// <summary>用户名</summary>
    public string Username { get; set; } = string.Empty;
    /// <summary>手机号</summary>
    public string? Mobile { get; set; }
    /// <summary>套餐代码</summary>
    public string? PlanCode { get; set; }
    /// <summary>套餐名称</summary>
    public string? PlanName { get; set; }
    /// <summary>订阅状态</summary>
    public string? SubscriptionStatus { get; set; }
    /// <summary>周期Key</summary>
    public string? PeriodKey { get; set; }
    /// <summary>总额度（Token）</summary>
    public long TotalTokens { get; set; }
    /// <summary>已消耗额度（Token）</summary>
    public long ConsumedTokens { get; set; }
    /// <summary>剩余额度（Token）</summary>
    public long RemainingTokens { get; set; }
    /// <summary>周期结束时间</summary>
    public string? PeriodEndAt { get; set; }
    /// <summary>是否低余额</summary>
    public bool IsLowBalance { get; set; }
    /// <summary>是否额度耗尽</summary>
    public bool IsExhausted { get; set; }
}
