using System.Text.Json;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace AiAdmin.Services.Auth;

/// <summary>
/// Cloudflare Turnstile 验证服务
/// </summary>
public class TurnstileService
{
    private readonly TurnstileOptions _options;
    private readonly ILogger<TurnstileService> _logger;
    private readonly HttpClient _httpClient;

    private const string VerifyUrl = "https://challenges.cloudflare.com/turnstile/v0/siteverify";

    public TurnstileService(HttpClient httpClient, IOptions<TurnstileOptions> options, ILogger<TurnstileService> logger)
    {
        _httpClient = httpClient;
        _options = options.Value;
        _logger = logger;
    }

    /// <summary>
    /// 验证 Turnstile token
    /// </summary>
    /// <param name="token">前端传来的 token</param>
    /// <param name="remoteIp">用户 IP（可选）</param>
    /// <returns>验证是否通过</returns>
    public async Task<(bool Success, string? Error)> VerifyAsync(string? token, string? remoteIp = null)
    {
        // 未启用时直接通过
        if (!_options.Enabled)
        {
            _logger.LogDebug("Turnstile verification is disabled, skipping validation");
            return (true, null);
        }

        if (string.IsNullOrWhiteSpace(token))
        {
            return (false, "请完成人机验证");
        }

        try
        {
            var formData = new Dictionary<string, string>
            {
                ["secret"] = _options.SecretKey,
                ["response"] = token
            };

            if (!string.IsNullOrEmpty(remoteIp))
            {
                formData["remoteip"] = remoteIp;
            }

            var response = await _httpClient.PostAsync(VerifyUrl, new FormUrlEncodedContent(formData));
            var json = await response.Content.ReadAsStringAsync();

            var result = JsonSerializer.Deserialize<TurnstileVerifyResponse>(json, new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

            if (result == null)
            {
                _logger.LogWarning("Turnstile response parsing failed: {Json}", json);
                return (false, "人机验证响应解析失败");
            }

            if (!result.Success)
            {
                var errors = result.ErrorCodes != null ? string.Join(", ", result.ErrorCodes) : "unknown";
                _logger.LogWarning("Turnstile verification failed: {Errors}", errors);
                return (false, "人机验证失败，请重试");
            }

            return (true, null);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Turnstile verification error");
            return (false, "人机验证服务异常");
        }
    }

    /// <summary>
    /// 获取 Site Key（供前端使用）
    /// </summary>
    public string? GetSiteKey() => _options.Enabled ? _options.SiteKey : null;
}
