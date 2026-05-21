namespace AiAdmin.Services.Auth.Dtos;

/// <summary>鑿滃崟椤笵TO</summary>
public class MenuItemDto
{
    /// <summary>鑿滃崟鍚嶇О</summary>
    public string? Name { get; set; }
    /// <summary>鑿滃崟璺緞</summary>
    public string? Path { get; set; }
    /// <summary>鑿滃崟鍥炬爣</summary>
    public string? Icon { get; set; }
    /// <summary>瀛愯彍鍗曞垪琛?/summary>
    public List<MenuItemDto>? Children { get; set; }
}

