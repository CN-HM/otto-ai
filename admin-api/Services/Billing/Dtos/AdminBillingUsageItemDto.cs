namespace AiAdmin.Services.Billing.Dtos;

/// <summary>绠＄悊鍛樼敤閲忛」DTO</summary>
public class AdminBillingUsageItemDto
{
    /// <summary>鐢ㄩ噺ID</summary>
    public string Id { get; set; } = string.Empty;
    /// <summary>鐢ㄦ埛ID</summary>
    public long UserId { get; set; }
    /// <summary>鐢ㄦ埛鍚?/summary>
    public string? Username { get; set; }
    /// <summary>鎵嬫満鍙?/summary>
    public string? Mobile { get; set; }
    /// <summary>鏅鸿兘浣揑D</summary>
    public string? AgentId { get; set; }
    /// <summary>璁惧ID</summary>
    public string? DeviceId { get; set; }
    /// <summary>浼氳瘽ID</summary>
    public string? SessionId { get; set; }
    /// <summary>鏈嶅姟绫诲瀷</summary>
    public string ServiceType { get; set; } = string.Empty;
    /// <summary>鎻愪緵鍟嗕唬鐮?/summary>
    public string? ProviderCode { get; set; }
    /// <summary>鍗曚綅绫诲瀷</summary>
    public string UnitType { get; set; } = string.Empty;
    /// <summary>鍘熷鐢ㄩ噺</summary>
    public decimal RawUnits { get; set; }
    /// <summary>鏍囧噯鍖朤oken鏁?/summary>
    public long NormalizedTokens { get; set; }
    /// <summary>鎵ｈ垂鐘舵€?/summary>
    public string? ChargeStatus { get; set; }
    /// <summary>鍙戠敓鏃堕棿</summary>
    public string? HappenedAt { get; set; }
}

/// <summary>鎵嬪姩鎺堜簣Token DTO</summary>

