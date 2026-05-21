namespace AiAdmin.Services.Billing.Dtos;

/// <summary>鐢ㄩ噺涓婃姤缁撴灉DTO</summary>
public class BillingUsageReportResultDto
{
    /// <summary>鏄惁宸茶褰?/summary>
    public bool Recorded { get; set; }
    /// <summary>骞傜瓑鎬ey</summary>
    public string IdempotencyKey { get; set; } = string.Empty;
    /// <summary>鏍囧噯鍖朤oken鏁?/summary>
    public long NormalizedTokens { get; set; }
    /// <summary>宸叉秷鑰桾oken鏁?/summary>
    public long ConsumedTokens { get; set; }
    /// <summary>鍓╀綑Token鏁?/summary>
    public long RemainingTokens { get; set; }
    /// <summary>鏄惁浣庝綑棰?/summary>
    public bool IsLowBalance { get; set; }
    /// <summary>鏄惁棰濆害鑰楀敖</summary>
    public bool IsExhausted { get; set; }
    /// <summary>鎵ｈ垂鐘舵€?/summary>
    public string? ChargeStatus { get; set; }
    /// <summary>鍛ㄦ湡Key</summary>
    public string? PeriodKey { get; set; }
}

/// <summary>绠＄悊鍛樿闃呴」DTO</summary>

