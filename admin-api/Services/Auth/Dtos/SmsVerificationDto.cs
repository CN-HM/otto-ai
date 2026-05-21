namespace AiAdmin.Services.Auth.Dtos;

/// <summary>鐭俊楠岃瘉鐮佽姹侱TO</summary>
public class SmsVerificationDto
{
    /// <summary>鎵嬫満鍙?/summary>
    public string Phone { get; set; } = string.Empty;
    /// <summary>鍥惧舰楠岃瘉鐮?/summary>
    public string Captcha { get; set; } = string.Empty;
    /// <summary>楠岃瘉鐮両D</summary>
    public string CaptchaId { get; set; } = string.Empty;
}

/// <summary>鐢ㄦ埛娉ㄥ唽璇锋眰DTO</summary>

