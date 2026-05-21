namespace AiAdmin.Services.Billing.Dtos;

/// <summary>璁㈠崟璇︽儏DTO</summary>
public class BillingOrderDetailDto : BillingOrderItemDto
{
    /// <summary>鍦板尯浠ｇ爜</summary>
    public string RegionCode { get; set; } = string.Empty;
    /// <summary>鍙栨秷鏃堕棿</summary>
    public string? CancelledAt { get; set; }
    /// <summary>鏈€鏂颁氦鏄撳彿</summary>
    public string? LatestTransactionNo { get; set; }
    /// <summary>鏈€鏂版敮浠樼姸鎬?/summary>
    public string? LatestPaymentStatus { get; set; }
    /// <summary>鏄惁鍙敮浠?/summary>
    public bool CanPay { get; set; }
    /// <summary>鏄惁鍙彇娑?/summary>
    public bool CanCancel { get; set; }
}

/// <summary>璁㈠崟鏀粯缁撴灉DTO</summary>

