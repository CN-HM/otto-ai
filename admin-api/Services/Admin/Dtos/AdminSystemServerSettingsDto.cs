namespace AiAdmin.Services.Admin.Dtos;

/// <summary>鏈嶅姟鍣ㄨ缃瓺TO</summary>
public class AdminSystemServerSettingsDto
{
    /// <summary>鐩戝惉IP鍦板潃</summary>
    public string ListenIp { get; set; } = string.Empty;
    /// <summary>璁惧涓嶶I瀵瑰鍦板潃</summary>
    public string PublicHost { get; set; } = string.Empty;
    /// <summary>鏈嶅姟鍣ㄧ鍙?/summary>
    public int Port { get; set; }
    /// <summary>HTTP绔彛</summary>
    public int HttpPort { get; set; }
    /// <summary>瑙嗚绔彛</summary>
    public int VisionPort { get; set; }
    /// <summary>鏈嶅姟鍣ㄥ瘑閽?/summary>
    public string Secret { get; set; } = string.Empty;
    /// <summary>鏄惁鍏佽鐢ㄦ埛娉ㄥ唽</summary>
    public bool AllowUserRegister { get; set; }
    /// <summary>鍓嶇URL鍦板潃</summary>
    public string FrontendUrl { get; set; } = string.Empty;
}

/// <summary>鏃ュ織璁剧疆DTO</summary>

