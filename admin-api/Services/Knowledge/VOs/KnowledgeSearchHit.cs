namespace AiAdmin.Services.Knowledge.VOs;

public sealed class KnowledgeSearchHit
{
    public string Id { get; set; } = string.Empty;
    public string DatasetId { get; set; } = string.Empty;
    public string DocumentId { get; set; } = string.Empty;
    public string? DocumentName { get; set; }
    public string Content { get; set; } = string.Empty;
    public double Score { get; set; }
}
