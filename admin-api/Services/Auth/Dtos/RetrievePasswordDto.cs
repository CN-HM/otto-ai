namespace AiAdmin.Services.Auth.Dtos;

/// <summary>鎵惧洖瀵嗙爜璇锋眰DTO</summary>
public class RetrievePasswordDto
{
    /// <summary>鎵嬫満鍙?/summary>
    public string Phone { get; set; } = string.Empty;
    /// <summary>楠岃瘉鐮?/summary>
    public string Code { get; set; } = string.Empty;
    /// <summary>鏂板瘑鐮?/summary>
    public string Password { get; set; } = string.Empty;
    /// <summary>楠岃瘉鐮両D</summary>
    public string CaptchaId { get; set; } = string.Empty;
    /// <summary>Turnstile浠ょ墝</summary>
    public string? TurnstileToken { get; set; }
}

/// <summary>鐭俊楠岃瘉鐮佽姹侱TO</summary>

