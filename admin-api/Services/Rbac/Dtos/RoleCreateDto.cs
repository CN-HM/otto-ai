namespace AiAdmin.Services.Rbac.Dtos;

/// <summary>瑙掕壊鍒涘缓璇锋眰DTO</summary>
public class RoleCreateDto
{
    /// <summary>瑙掕壊鍚嶇О</summary>
    public string Name { get; set; } = string.Empty;
    /// <summary>瑙掕壊浠ｇ爜</summary>
    public string Code { get; set; } = string.Empty;
    /// <summary>澶囨敞</summary>
    public string? Remark { get; set; }
    /// <summary>鐘舵€?/summary>
    public short Status { get; set; } = 1;
    /// <summary>鎺掑簭</summary>
    public int Sort { get; set; }
}

/// <summary>瑙掕壊鏇存柊璇锋眰DTO</summary>

