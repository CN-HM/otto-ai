namespace AiAdmin.Services.Admin.Dtos;

/// <summary>瀹¤瀹炰綋鍙樻洿VO</summary>
public class AuditEntityChangeVo
{
    /// <summary>鍙樻洿绫诲瀷</summary>
    public string? ChangeType { get; set; }
    /// <summary>瀹炰綋绫诲瀷鍏ㄥ悕</summary>
    public string? EntityTypeFullName { get; set; }
    /// <summary>瀹炰綋ID</summary>
    public string? EntityId { get; set; }
    /// <summary>鍙樻洿鏃堕棿</summary>
    public DateTime ChangeTime { get; set; }
    /// <summary>灞炴€у彉鏇村垪琛?/summary>
    public List<AuditPropertyChangeVo> PropertyChanges { get; set; } = [];
}

/// <summary>瀹¤灞炴€у彉鏇碫O</summary>

