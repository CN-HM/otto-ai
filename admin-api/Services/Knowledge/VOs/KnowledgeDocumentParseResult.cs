namespace AiAdmin.Services.Knowledge.VOs;

public sealed class KnowledgeDocumentParseResult
{
    public string Content { get; init; } = string.Empty;
    public string? MetadataJson { get; init; }
}
