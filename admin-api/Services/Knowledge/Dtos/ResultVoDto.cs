namespace AiAdmin.Services.Knowledge.Dtos;

/// <summary>鍙洖娴嬭瘯缁撴灉</summary>
public class ResultVoDto
{
    /// <summary>鍒囩墖鍒楄〃</summary>
    public List<HitVoDto>? Chunks { get; set; }
    /// <summary>鎬绘暟</summary>
    public int? Total { get; set; }
    /// <summary>鏂囨。鑱氬悎鍒楄〃</summary>
    public List<DocAggVoDto>? DocAggs { get; set; }
    public string? Query { get; set; }
    public string? EffectiveQuery { get; set; }
    public int? TopK { get; set; }
    public double? Threshold { get; set; }
    public bool? RewriteApplied { get; set; }
}

/// <summary>鍒囩墖鍒楄〃鍝嶅簲</summary>

