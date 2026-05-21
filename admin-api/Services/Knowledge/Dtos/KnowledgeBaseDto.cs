namespace AiAdmin.Services.Knowledge.Dtos;

/// <summary>鐭ヨ瘑搴揇TO</summary>
public class KnowledgeBaseDto
{
    /// <summary>鐭ヨ瘑搴揑D</summary>
    public string? Id { get; set; }
    /// <summary>鏁版嵁闆咺D</summary>
    public string? DatasetId { get; set; }
    /// <summary>鍚嶇О</summary>
    public string? Name { get; set; }
    /// <summary>澶村儚</summary>
    public string? Avatar { get; set; }
    /// <summary>鎻忚堪</summary>
    public string? Description { get; set; }
    /// <summary>鏉冮檺</summary>
    public string? Permission { get; set; }
    /// <summary>鍒嗗潡鏂规硶</summary>
    public string? ChunkMethod { get; set; }
    /// <summary>瑙ｆ瀽閰嶇疆</summary>
    public string? ParserConfig { get; set; }
    /// <summary>鍒嗗潡鏁伴噺</summary>
    public long? ChunkCount { get; set; }
    /// <summary>Token鏁伴噺</summary>
    public long? TokenNum { get; set; }
    /// <summary>鐘舵€?/summary>
    public int? Status { get; set; }
    /// <summary>鍒涘缓浜?/summary>
    public long? Creator { get; set; }
    /// <summary>鍒涘缓鏃堕棿</summary>
    public string? CreatedAt { get; set; }
    /// <summary>鏇存柊浜?/summary>
    public long? Updater { get; set; }
    /// <summary>鏇存柊鏃堕棿</summary>
    public string? UpdatedAt { get; set; }
    /// <summary>鏂囨。鏁伴噺</summary>
    public long? DocumentCount { get; set; }
}

/// <summary>鐭ヨ瘑搴撴枃妗TO</summary>

