namespace AiAdmin.Services.Billing.Dtos;

/// <summary>璁㈠崟鏀粯缁撴灉DTO</summary>
public class BillingOrderPayResultDto
{
    /// <summary>璁㈠崟ID</summary>
    public string OrderId { get; set; } = string.Empty;
    /// <summary>璁㈠崟缂栧彿</summary>
    public string OrderNo { get; set; } = string.Empty;
    /// <summary>璁㈠崟鐘舵€?/summary>
    public string Status { get; set; } = string.Empty;
    /// <summary>鏀粯鎻愪緵鍟嗕唬鐮?/summary>
    public string ProviderCode { get; set; } = string.Empty;
    /// <summary>鎿嶄綔绫诲瀷</summary>
    public string? ActionType { get; set; }
    /// <summary>鏀粯URL</summary>
    public string? PayUrl { get; set; }
    /// <summary>澶栭儴浜ゆ槗鍙?/summary>
    public string? ExternalTradeNo { get; set; }
    /// <summary>杩囨湡鏃堕棿</summary>
    public string? ExpireAt { get; set; }
    /// <summary>娑堟伅</summary>
    public string? Message { get; set; }
    /// <summary>杞借嵎JSON</summary>
    public string? PayloadJson { get; set; }
}

/// <summary>绠＄悊鍛樿鍗曢」DTO</summary>

