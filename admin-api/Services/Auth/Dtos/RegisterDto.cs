namespace AiAdmin.Services.Auth.Dtos;

/// <summary>鐢ㄦ埛娉ㄥ唽璇锋眰DTO</summary>
public class RegisterDto
{
    /// <summary>鐢ㄦ埛鍚?/summary>
    public string? Username { get; set; }
    /// <summary>瀵嗙爜</summary>
    public string? Password { get; set; }
    /// <summary>鎵嬫満鍙?/summary>
    public string Phone { get; set; } = string.Empty;
    /// <summary>鐭俊楠岃瘉鐮?/summary>
    public string Code { get; set; } = string.Empty;
    /// <summary>Turnstile浠ょ墝</summary>
    public string? TurnstileToken { get; set; }
}

/// <summary>鐢ㄦ埛璇︽儏DTO</summary>

