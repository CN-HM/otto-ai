namespace AiAdmin.Services.Device.Dtos;

/// <summary>璁惧鏇存柊DTO</summary>
public class DeviceUpdateDto
{
    /// <summary>鑷姩鏇存柊</summary>
    public int? AutoUpdate { get; set; }
    /// <summary>璁惧鍒悕</summary>
    public string? Alias { get; set; }
    /// <summary>鏅鸿兘浣撹鑹睞D</summary>
    public string? AgentRoleId { get; set; }
    /// <summary>鏅鸿兘浣撹鑹插彂甯冪増鏈琁D</summary>
    public string? AgentRoleReleaseId { get; set; }
}

/// <summary>璁惧閰嶇綉鍑瘉绛惧彂DTO</summary>
