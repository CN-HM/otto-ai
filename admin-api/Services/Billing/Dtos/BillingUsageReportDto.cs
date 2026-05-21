namespace AiAdmin.Services.Billing.Dtos;

/// <summary>鐢ㄩ噺涓婃姤DTO</summary>
public class BillingUsageReportDto
{
    /// <summary>MAC鍦板潃</summary>
    public string MacAddress { get; set; } = string.Empty;
    /// <summary>浼氳瘽ID</summary>
    public string? SessionId { get; set; }
    /// <summary>鏈嶅姟绫诲瀷</summary>
    public string ServiceType { get; set; } = string.Empty;
    /// <summary>鎻愪緵鍟嗕唬鐮?/summary>
    public string? ProviderCode { get; set; }
    /// <summary>妯″瀷閰嶇疆ID</summary>
    public string? ModelConfigId { get; set; }
    /// <summary>鍗曚綅绫诲瀷</summary>
    public string UnitType { get; set; } = string.Empty;
    /// <summary>鍘熷鐢ㄩ噺</summary>
    public decimal RawUnits { get; set; }
    /// <summary>鏍囧噯鍖朤oken鏁?/summary>
    public long? NormalizedTokens { get; set; }
    /// <summary>鍘熷鐢ㄩ噺JSON</summary>
    public string? RawUsageJson { get; set; }
    /// <summary>骞傜瓑鎬ey</summary>
    public string IdempotencyKey { get; set; } = string.Empty;
    /// <summary>涓婃姤鏃堕棿鎴?/summary>
    public long? ReportTime { get; set; }
}

/// <summary>鐢ㄩ噺涓婃姤缁撴灉DTO</summary>

