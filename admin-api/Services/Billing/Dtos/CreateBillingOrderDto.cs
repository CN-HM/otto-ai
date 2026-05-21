namespace AiAdmin.Services.Billing.Dtos;

/// <summary>鍒涘缓璁¤垂璁㈠崟DTO</summary>
public class CreateBillingOrderDto
{
    /// <summary>濂楅ID</summary>
    public string PlanId { get; set; } = string.Empty;
    /// <summary>鏀粯鎻愪緵鍟嗕唬鐮?/summary>
    public string? ProviderCode { get; set; }
}

/// <summary>璁㈠崟鏀粯DTO</summary>

