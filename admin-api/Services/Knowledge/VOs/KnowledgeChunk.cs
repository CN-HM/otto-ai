namespace AiAdmin.Services.Knowledge.VOs;

public sealed class KnowledgeChunk
{
    public int Index { get; init; }
    public string Content { get; init; } = string.Empty;
    public int TokenCount { get; init; }
}
