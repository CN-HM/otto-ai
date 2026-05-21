namespace AiAdmin.Services.Admin.Dtos;

/// <summary>计费设置DTO</summary>
public class AdminSystemBillingSettingsDto
{
    /// <summary>默认套餐代码</summary>
    public string DefaultPlanCode { get; set; } = string.Empty;
    /// <summary>重置时区</summary>
    public string ResetTimezone { get; set; } = string.Empty;
    /// <summary>低余额比例阈值</summary>
    public decimal LowBalanceRatio { get; set; }
    /// <summary>额度耗尽提醒冷却时间（小时）</summary>
    public int ExhaustionRemindCooldownHours { get; set; }
}

