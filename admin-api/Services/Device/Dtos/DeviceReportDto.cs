namespace AiAdmin.Services.Device.Dtos;

/// <summary>璁惧鍥轰欢淇℃伅涓婃姤璇锋眰浣?/summary>
public class DeviceReportDto
{
    /// <summary>鐗堟湰</summary>
    public int? Version { get; set; }
    /// <summary>UUID</summary>
    public string? Uuid { get; set; }
    /// <summary>搴旂敤淇℃伅</summary>
    public DeviceApplicationDto? Application { get; set; }
    /// <summary>寮€鍙戞澘淇℃伅</summary>
    public DeviceBoardInfoDto? Board { get; set; }
    /// <summary>MAC鍦板潃</summary>
    public string? Mac_address { get; set; }
    /// <summary>鑺墖鍨嬪彿</summary>
    public string? Chip_model_name { get; set; }
}

/// <summary>璁惧搴旂敤淇℃伅DTO</summary>

