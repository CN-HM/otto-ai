namespace AiAdmin.Services.Billing.Dtos;

/// <summary>璁¤垂璁㈠崟椤笵TO</summary>
public class BillingOrderItemDto
{
    /// <summary>璁㈠崟ID</summary>
    public string Id { get; set; } = string.Empty;
    /// <summary>璁㈠崟缂栧彿</summary>
    public string OrderNo { get; set; } = string.Empty;
    /// <summary>濂楅ID</summary>
    public string PlanId { get; set; } = string.Empty;
    /// <summary>濂楅浠ｇ爜</summary>
    public string? PlanCode { get; set; }
    /// <summary>濂楅鍚嶇О</summary>
    public string? PlanName { get; set; }
    /// <summary>璁㈠崟绫诲瀷</summary>
    public string OrderType { get; set; } = string.Empty;
    /// <summary>鏀粯鎻愪緵鍟嗕唬鐮?/summary>
    public string ProviderCode { get; set; } = string.Empty;
    /// <summary>璐у竵浠ｇ爜</summary>
    public string CurrencyCode { get; set; } = string.Empty;
    /// <summary>閲戦</summary>
    public decimal Amount { get; set; }
    /// <summary>鎺堜簣Token鏁?/summary>
    public long GrantedTokens { get; set; }
    /// <summary>璁㈠崟鐘舵€?/summary>
    public string Status { get; set; } = string.Empty;
    /// <summary>澶栭儴浜ゆ槗鍙?/summary>
    public string? ExternalTradeNo { get; set; }
    /// <summary>鏀粯鏃堕棿</summary>
    public string? PaidAt { get; set; }
    /// <summary>婵€娲绘椂闂?/summary>
    public string? ActivatedAt { get; set; }
    /// <summary>鍒涘缓鏃ユ湡</summary>
    public string? CreateDate { get; set; }
}

/// <summary>璁㈠崟璇︽儏DTO</summary>

