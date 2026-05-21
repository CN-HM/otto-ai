using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// OTA固件实体
/// 存储设备固件版本信息，支持ESP32等设备的OTA升级管理
/// </summary>
[Table("ai_ota")]
public class AiOta
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("firmware_name")]
    [MaxLength(100)]
    public string? FirmwareName { get; set; }

    [Column("type")]
    [MaxLength(50)]
    public string? Type { get; set; }

    [Column("version")]
    [MaxLength(50)]
    public string? Version { get; set; }

    [Column("size")]
    public long? Size { get; set; }

    [Column("remark")]
    [MaxLength(500)]
    public string? Remark { get; set; }

    [Column("firmware_path")]
    [MaxLength(255)]
    public string? FirmwarePath { get; set; }

    [Column("sort")]
    public int Sort { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("update_date")]
    public DateTime? UpdateDate { get; set; }
}
