namespace AiAdmin.Services.Knowledge.Dtos;

/// <summary>鍙洖娴嬭瘯璇锋眰</summary>
public class TestReqDto
{
    /// <summary>闂</summary>
    public string Question { get; set; } = string.Empty;
    public string? Query { get; set; }
    public string? RewriteQuery { get; set; }
    public int? TopK { get; set; }
    public double? Threshold { get; set; }
    /// <summary>椤电爜</summary>
    public int? Page { get; set; }
    /// <summary>鏄惁楂樹寒</summary>
    public bool? Highlight { get; set; }
}

/// <summary>鍛戒腑鍒囩墖</summary>

