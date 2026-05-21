namespace AiAdmin.Services.Device.Dtos;

/// <summary>璁惧閰嶇綉鍑瘉DTO</summary>
public class DeviceProvisioningCredentialDto
{
    /// <summary>璁惧瀹炰綋ID</summary>
    public string? DeviceEntityId { get; set; }
    /// <summary>璁惧ID</summary>
    public string? DeviceId { get; set; }
    /// <summary>鍑瘉ID</summary>
    public string? CredentialId { get; set; }
    /// <summary>鍑瘉瀵嗛挜</summary>
    public string? CredentialSecret { get; set; }
    /// <summary>閰嶇綉鏈嶅姟UUID</summary>
    public string? ProvisioningServiceUuid { get; set; }
    /// <summary>閰嶇綉鐗瑰緛UUID</summary>
    public string? ProvisioningCharacteristicUuid { get; set; }
    /// <summary>淇″皝JSON</summary>
    public string? EnvelopeJson { get; set; }
    /// <summary>娑堟伅</summary>
    public string? Message { get; set; }
}

/// <summary>璁惧鑷瘉韬唤杩斿洖DTO</summary>

