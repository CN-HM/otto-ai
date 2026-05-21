namespace AiAdmin.Services.Knowledge.Dtos;

/// <summary>鏈嶅姟绔姩浣淒TO</summary>
public class EmitServerActionDto
{
    /// <summary>鐩爣WebSocket</summary>
    public string TargetWs { get; set; } = string.Empty;
    /// <summary>鍔ㄤ綔</summary>
    public string Action { get; set; } = string.Empty;
}

