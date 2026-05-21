namespace AiAdmin.Services.Billing.Dtos;

/// <summary>绠＄悊鍛樻爣璁拌鍗曞凡鏀粯DTO</summary>
public class AdminMarkOrderPaidDto
{
    /// <summary>浜ゆ槗鍙?/summary>
    public string? TransactionNo { get; set; }
    /// <summary>鏀粯鏃堕棿</summary>
    public DateTime? PaidAt { get; set; }
    /// <summary>澶囨敞</summary>
    public string? Remark { get; set; }
}

