namespace AiAdmin.Services.Auth.Dtos;

/// <summary>公共配置响应DTO（登录后获取）</summary>
public class PubConfigDto
{
    /// <summary>菜单列表</summary>
    public List<MenuItemDto> Menus { get; set; } = [];
    /// <summary>是否允许用户注册</summary>
    public bool AllowUserRegister { get; set; }
    /// <summary>Turnstile站点密钥</summary>
    public string? TurnstileSiteKey { get; set; }
}

