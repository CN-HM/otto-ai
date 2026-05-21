namespace AiAdmin.Services.Auth.Dtos;

/// <summary>鐧诲綍浠ょ墝鍝嶅簲DTO</summary>
public class TokenDto
{
    /// <summary>璁块棶浠ょ墝</summary>
    public string? Token { get; set; }
    /// <summary>杩囨湡鏃堕棿鎴?/summary>
    public long? Expire { get; set; }
    /// <summary>瀹㈡埛绔搱甯?/summary>
    public string? ClientHash { get; set; }
}

/// <summary>淇敼瀵嗙爜璇锋眰DTO</summary>

