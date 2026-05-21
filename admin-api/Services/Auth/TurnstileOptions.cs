namespace AiAdmin.Services.Auth;

/// <summary>
/// Cloudflare Turnstile 配置选项
/// </summary>
public class TurnstileOptions
{
    /// <summary>是否启用验证（开发环境可关闭）</summary>
    public bool Enabled { get; set; }

    /// <summary>Site Key（前端使用，公开）</summary>
    public string SiteKey { get; set; } = string.Empty;

    /// <summary>Secret Key（后端使用，保密）</summary>
    public string SecretKey { get; set; } = string.Empty;
}
