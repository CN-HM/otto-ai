namespace AiAdmin.Services.Knowledge.Dtos;

/// <summary>鍛戒腑鍒囩墖</summary>
public class HitVoDto
{
    /// <summary>鍒囩墖ID</summary>
    public string Id { get; set; } = string.Empty;
    /// <summary>鍐呭</summary>
    public string Content { get; set; } = string.Empty;
    /// <summary>鐩镐技搴?/summary>
    public double Similarity { get; set; }
    /// <summary>鏂囨。ID</summary>
    public string? DocumentId { get; set; }
    /// <summary>鏁版嵁闆咺D</summary>
    public string? DatasetId { get; set; }
    /// <summary>鏂囨。鍚嶇О</summary>
    public string? DocumentName { get; set; }
}

/// <summary>鏂囨。鑱氬悎淇℃伅</summary>

