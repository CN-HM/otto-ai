namespace AiAdmin.Services.Device.Dtos;

/// <summary>璁惧鑷瘉韬唤杩斿洖DTO</summary>
public class DeviceBootstrapStatusDto
{
    /// <summary>璁惧瀹炰綋ID</summary>
    public string? DeviceEntityId { get; set; }
    /// <summary>璁惧ID</summary>
    public string? DeviceId { get; set; }
    /// <summary>鏄惁宸茬粦瀹?/summary>
    public bool IsBound { get; set; }
    /// <summary>鏅鸿兘浣撹鑹睞D</summary>
    public string? AgentRoleId { get; set; }
    /// <summary>娑堟伅</summary>
    public string? Message { get; set; }
}

/// <summary>璁惧鎵嬪姩娣诲姞DTO</summary>
