namespace AiAdmin.Services.Admin.Dtos;

/// <summary>瀹¤灞炴€у彉鏇碫O</summary>
public class AuditPropertyChangeVo
{
    /// <summary>灞炴€у悕绉?/summary>
    public string? PropertyName { get; set; }
    /// <summary>鍘熷鍊?/summary>
    public string? OriginalValue { get; set; }
    /// <summary>鏂板€?/summary>
    public string? NewValue { get; set; }
}

