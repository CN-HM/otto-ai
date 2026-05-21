namespace AiAdmin.Services.Admin.Dtos;

/// <summary>绯荤粺璁剧疆DTO</summary>
public class AdminSystemSettingsDto
{
    /// <summary>鏈嶅姟鍣ㄨ缃?/summary>
    public AdminSystemServerSettingsDto Server { get; set; } = new();
    /// <summary>鏃ュ織璁剧疆</summary>
    public AdminSystemLogSettingsDto Log { get; set; } = new();
    /// <summary>杩愯鏃惰缃?/summary>
    public AdminSystemRuntimeSettingsDto Runtime { get; set; } = new();
    /// <summary>璁¤垂璁剧疆</summary>
    public AdminSystemBillingSettingsDto Billing { get; set; } = new();
}

/// <summary>鏈嶅姟鍣ㄨ缃瓺TO</summary>

