namespace AiAdmin.Services.Knowledge.Dtos;

public class KnowledgeTextImportDto
{
    public string? Title { get; set; }
    public string Content { get; set; } = string.Empty;
    public string? Source { get; set; }
    public object? Metadata { get; set; }
}

public class KnowledgeChunkDto
{
    public string Id { get; set; } = string.Empty;
    public string DatasetId { get; set; } = string.Empty;
    public string DocumentId { get; set; } = string.Empty;
    public int ChunkIndex { get; set; }
    public string? Title { get; set; }
    public string Content { get; set; } = string.Empty;
    public int TokenCount { get; set; }
    public string? Status { get; set; }
    public string? ErrorMessage { get; set; }
    public string? CreatedAt { get; set; }
}
