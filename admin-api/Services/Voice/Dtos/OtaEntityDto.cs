namespace AiAdmin.Services.Voice.Dtos;

/// <summary>OTA固件实体</summary>
public class OtaEntityDto
{
    /// <summary>固件ID</summary>
    public string? Id { get; set; }
    /// <summary>固件名称</summary>
    public string? FirmwareName { get; set; }
    /// <summary>类型</summary>
    public string? Type { get; set; }
    /// <summary>版本</summary>
    public string? Version { get; set; }
    /// <summary>大小</summary>
    public long? Size { get; set; }
    /// <summary>备注</summary>
    public string? Remark { get; set; }
    /// <summary>固件路径</summary>
    public string? FirmwarePath { get; set; }
    /// <summary>排序</summary>
    public int? Sort { get; set; }
    /// <summary>创建人</summary>
    public long? Creator { get; set; }
    /// <summary>创建日期</summary>
    public string? CreateDate { get; set; }
    /// <summary>更新人</summary>
    public long? Updater { get; set; }
    /// <summary>更新日期</summary>
    public string? UpdateDate { get; set; }
}

/// <summary>声音克隆响应DTO</summary>

