namespace AiAdmin.Services.Knowledge.Dtos;

/// <summary>鐭ヨ瘑搴撴枃妗TO</summary>
public class KnowledgeFilesDto
{
    /// <summary>鏂囨。ID</summary>
    public string? Id { get; set; }
    /// <summary>鏂囨。ID</summary>
    public string? DocumentId { get; set; }
    /// <summary>鏁版嵁闆咺D</summary>
    public string? DatasetId { get; set; }
    /// <summary>鍚嶇О</summary>
    public string? Name { get; set; }
    /// <summary>鏂囦欢绫诲瀷</summary>
    public string? FileType { get; set; }
    /// <summary>鏂囦欢澶у皬</summary>
    public long? FileSize { get; set; }
    /// <summary>鏂囦欢璺緞</summary>
    public string? FilePath { get; set; }
    /// <summary>杩涘害</summary>
    public double? Progress { get; set; }
    /// <summary>鏉ユ簮绫诲瀷</summary>
    public string? SourceType { get; set; }
    /// <summary>鍒嗗潡鏂规硶</summary>
    public string? ChunkMethod { get; set; }
    /// <summary>瑙ｆ瀽閰嶇疆</summary>
    public object? ParserConfig { get; set; }
    /// <summary>鐘舵€?/summary>
    public string? Status { get; set; }
    /// <summary>杩愯鐘舵€?/summary>
    public string? Run { get; set; }
    /// <summary>鍒涘缓浜?/summary>
    public long? Creator { get; set; }
    /// <summary>鍒涘缓鏃堕棿</summary>
    public string? CreatedAt { get; set; }
    /// <summary>鏇存柊浜?/summary>
    public long? Updater { get; set; }
    /// <summary>鏇存柊鏃堕棿</summary>
    public string? UpdatedAt { get; set; }
    /// <summary>鍒嗗潡鏁伴噺</summary>
    public long? ChunkCount { get; set; }
    /// <summary>Token鏁伴噺</summary>
    public long? TokenCount { get; set; }
    /// <summary>閿欒淇℃伅</summary>
    public string? Error { get; set; }
}

/// <summary>鎵归噺鏂囨。鎿嶄綔璇锋眰</summary>

