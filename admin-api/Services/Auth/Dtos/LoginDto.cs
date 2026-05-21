namespace AiAdmin.Services.Auth.Dtos;

/// <summary>鐧诲綍璇锋眰DTO</summary>
public class LoginDto
{
    /// <summary>鐢ㄦ埛鍚?/summary>
    public string Username { get; set; } = string.Empty;
    /// <summary>瀵嗙爜</summary>
    public string Password { get; set; } = string.Empty;
    /// <summary>鐭俊楠岃瘉鐮?/summary>
    public string? MobileCaptcha { get; set; }
    /// <summary>楠岃瘉鐮両D</summary>
    public string? CaptchaId { get; set; }
    /// <summary>Turnstile浠ょ墝</summary>
    public string? TurnstileToken { get; set; }
}

/// <summary>鐧诲綍浠ょ墝鍝嶅簲DTO</summary>

