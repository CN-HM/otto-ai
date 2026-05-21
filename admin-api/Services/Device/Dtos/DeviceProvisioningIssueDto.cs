namespace AiAdmin.Services.Device.Dtos;

/// <summary>璁惧閰嶇綉鍑瘉绛惧彂DTO</summary>
public class DeviceProvisioningIssueDto
{
    /// <summary>MAC鍦板潃</summary>
    public string? MacAddress { get; set; }
    /// <summary>璁惧鍒悕</summary>
    public string? Alias { get; set; }
    /// <summary>寮€鍙戞澘绫诲瀷</summary>
    public string? Board { get; set; }
    /// <summary>搴旂敤鐗堟湰</summary>
    public string? AppVersion { get; set; }
    /// <summary>鏅鸿兘浣撹鑹睞D</summary>
    public string? AgentRoleId { get; set; }
    /// <summary>鏅鸿兘浣撹鑹插彂甯冪増鏈琁D</summary>
    public string? AgentRoleReleaseId { get; set; }
    /// <summary>鏄惁杞崲鍑瘉</summary>
    public bool RotateCredential { get; set; } = true;
}

/// <summary>璁惧閰嶇綉鍑瘉DTO</summary>
