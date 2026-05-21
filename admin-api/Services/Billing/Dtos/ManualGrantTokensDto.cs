namespace AiAdmin.Services.Billing.Dtos;

/// <summary>鎵嬪姩鎺堜簣Token DTO</summary>
public class ManualGrantTokensDto
{
    /// <summary>Token鏁伴噺</summary>
    public long Tokens { get; set; }
    /// <summary>澶囨敞</summary>
    public string? Remark { get; set; }
}

