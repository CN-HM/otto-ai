namespace AiAdmin.Services.Device.Dtos;

/// <summary>IoT绉诲姩绔澶嘍TO</summary>
public class IotDeviceDto
{
    /// <summary>璁惧ID</summary>
    public string? Id { get; set; }
    /// <summary>MAC鍦板潃</summary>
    public string? MacAddress { get; set; }
    /// <summary>璁惧鍒悕</summary>
    public string? Alias { get; set; }
    /// <summary>鏅鸿兘浣撹鑹睞D</summary>
    public string? AgentRoleId { get; set; }
    /// <summary>鏅鸿兘浣撹鑹插悕绉?/summary>
    public string? AgentRoleName { get; set; }
    /// <summary>鏅鸿兘浣撹鑹插彂甯冪増鏈琁D</summary>
    public string? AgentRoleReleaseId { get; set; }
    /// <summary>鏅鸿兘浣撹鑹插彂甯冪増鏈?/summary>
    public string? AgentRoleVersion { get; set; }
    /// <summary>寮€鍙戞澘绫诲瀷</summary>
    public string? Board { get; set; }
    /// <summary>搴旂敤鐗堟湰</summary>
    public string? AppVersion { get; set; }
    /// <summary>鏄惁鍦ㄧ嚎</summary>
    public bool IsOnline { get; set; }
    /// <summary>鏈€鍚庤繛鎺ユ椂闂?/summary>
    public DateTime? LastConnectedAt { get; set; }
    /// <summary>鑷姩鏇存柊</summary>
    public short AutoUpdate { get; set; }
}

/// <summary>璁惧鏇存柊DTO</summary>

