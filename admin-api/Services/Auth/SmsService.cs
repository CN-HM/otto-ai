using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using Volo.Abp.Guids;

namespace AiAdmin.Services.Auth;

/// <summary>
/// 短信验证码服务（网易云信实现）
/// 提供短信验证码发送和校验功能
/// </summary>
public class SmsService
{
    /// <summary>HTTP客户端</summary>
    private readonly HttpClient _http;
    /// <summary>应用配置</summary>
    private readonly IConfiguration _config;
    /// <summary>日志记录器</summary>
    private readonly ILogger<SmsService> _logger;
    private readonly IGuidGenerator _guidGenerator;

    /// <summary>创建短信服务实例</summary>
    public SmsService(HttpClient httpClient, IConfiguration config, ILogger<SmsService> logger, IGuidGenerator guidGenerator)
    {
        _http = httpClient;
        _config = config;
        _logger = logger;
        _guidGenerator = guidGenerator;
    }

    /// <summary>发送短信验证码</summary>
    public async Task<(bool Success, string Message)> SendCodeAsync(string phone)
    {
        var appKey = _config["Sms:NetEase:AppKey"]!;
        var appSecret = _config["Sms:NetEase:AppSecret"]!;
        var sendUrl = _config["Sms:NetEase:SendUrl"]!;
        var codeLength = _config["Sms:NetEase:CodeLength"] ?? "6";
        var templateId = _config["Sms:NetEase:TemplateId"] ?? "";

        var (nonce, curTime, checkSum) = BuildHeaders(appSecret);

        _logger.LogDebug("SMS Request - AppKey: {AppKey}, Nonce: {Nonce}, CurTime: {CurTime}, CheckSum: {CheckSum}",
            appKey, nonce, curTime, checkSum);

        var request = new HttpRequestMessage(HttpMethod.Post, sendUrl);
        request.Headers.Add("AppKey", appKey);
        request.Headers.Add("Nonce", nonce);
        request.Headers.Add("CurTime", curTime);
        request.Headers.Add("CheckSum", checkSum);

        var formData = new Dictionary<string, string>
        {
            ["mobile"] = phone,
            ["codeLen"] = codeLength
        };

        if (!string.IsNullOrEmpty(templateId))
        {
            formData["templateid"] = templateId;
        }

        request.Content = new FormUrlEncodedContent(formData);

        try
        {
            _logger.LogInformation("Sending SMS to {Phone} via {Url}", phone, sendUrl);
            var response = await _http.SendAsync(request);

            _logger.LogInformation("SMS Response Status: {StatusCode}", response.StatusCode);

            var body = await response.Content.ReadAsStringAsync();
            _logger.LogInformation("NetEase SMS send response: {Body}", body);

            using var doc = JsonDocument.Parse(body);
            var code = doc.RootElement.GetProperty("code").GetInt32();
            if (code == 200)
                return (true, "验证码已发送");

            var msg = doc.RootElement.TryGetProperty("msg", out var msgEl) ? msgEl.GetString() ?? "发送失败" : "发送失败";
            return (false, msg);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "NetEase SMS send failed for {Phone}", phone);
            return (false, "短信发送失败，请稍后重试");
        }
    }

    /// <summary>校验短信验证码</summary>
    public async Task<(bool Success, string Message)> VerifyCodeAsync(string phone, string code)
    {
        var appKey = _config["Sms:NetEase:AppKey"]!;
        var appSecret = _config["Sms:NetEase:AppSecret"]!;
        var verifyUrl = _config["Sms:NetEase:VerifyUrl"]!;

        var (nonce, curTime, checkSum) = BuildHeaders(appSecret);

        var request = new HttpRequestMessage(HttpMethod.Post, verifyUrl);
        request.Headers.Add("AppKey", appKey);
        request.Headers.Add("Nonce", nonce);
        request.Headers.Add("CurTime", curTime);
        request.Headers.Add("CheckSum", checkSum);
        request.Content = new FormUrlEncodedContent(new Dictionary<string, string>
        {
            ["mobile"] = phone,
            ["code"] = code
        });

        try
        {
            var response = await _http.SendAsync(request);
            var body = await response.Content.ReadAsStringAsync();
            _logger.LogInformation("NetEase SMS verify response: {Body}", body);

            using var doc = JsonDocument.Parse(body);
            var resultCode = doc.RootElement.GetProperty("code").GetInt32();
            if (resultCode == 200)
                return (true, "验证成功");

            return (false, resultCode == 413 ? "验证码错误" : "验证码校验失败");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "NetEase SMS verify failed for {Phone}", phone);
            return (false, "验证码校验失败，请稍后重试");
        }
    }

    /// <summary>发送通知短信（使用通知模板）</summary>
    public async Task<string> SendNotificationAsync(string phone, string content, CancellationToken cancellationToken = default)
    {
        var appKey = _config["Sms:NetEase:AppKey"]!;
        var appSecret = _config["Sms:NetEase:AppSecret"]!;
        var sendUrl = _config["Sms:NetEase:SendUrl"]!;
        var notifyTemplateId = _config["Sms:NetEase:NotifyTemplateId"] ?? "";

        var (nonce, curTime, checkSum) = BuildHeaders(appSecret);

        var request = new HttpRequestMessage(HttpMethod.Post, sendUrl);
        request.Headers.Add("AppKey", appKey);
        request.Headers.Add("Nonce", nonce);
        request.Headers.Add("CurTime", curTime);
        request.Headers.Add("CheckSum", checkSum);

        var formData = new Dictionary<string, string>
        {
            ["mobile"] = phone,
            ["templateid"] = notifyTemplateId,
            ["params"] = content
        };

        request.Content = new FormUrlEncodedContent(formData);

        var response = await _http.SendAsync(request, cancellationToken);
        var body = await response.Content.ReadAsStringAsync(cancellationToken);
        _logger.LogInformation("NetEase SMS notification response: {Body}", body);

        using var doc = JsonDocument.Parse(body);
        var code = doc.RootElement.GetProperty("code").GetInt32();
        if (code == 200)
        {
            _logger.LogInformation("SMS notification sent to {Phone}", phone);
            return $"SMS sent successfully to {phone}";
        }

        var msg = doc.RootElement.TryGetProperty("msg", out var msgEl) ? msgEl.GetString() ?? "发送失败" : "发送失败";
        throw new InvalidOperationException($"SMS notification failed: {msg}");
    }

    /// <summary>
    /// 构建网易云信API请求头
    /// 生成Nonce、CurTime、CheckSum（SHA1哈希）
    /// </summary>
    private (string Nonce, string CurTime, string CheckSum) BuildHeaders(string appSecret)
    {
        var nonce = _guidGenerator.Create().ToString("N");
        var curTime = DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString();
        var raw = appSecret + nonce + curTime;
        var hash = SHA1.HashData(Encoding.UTF8.GetBytes(raw));
        var checkSum = Convert.ToHexStringLower(hash);
        return (nonce, curTime, checkSum);
    }
}
