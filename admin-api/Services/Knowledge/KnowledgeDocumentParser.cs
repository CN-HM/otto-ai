using AiAdmin.Entities;
using AiAdmin.Services.Knowledge.Interfaces;
using AiAdmin.Services.Knowledge.VOs;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Knowledge;

public class PlainTextKnowledgeDocumentParser : IKnowledgeDocumentParser, ITransientDependency
{
    private static readonly HashSet<string> SupportedFileTypes = new(StringComparer.OrdinalIgnoreCase)
    {
        "txt",
        "md",
        "markdown",
        "json",
        "csv",
        "log"
    };

    public bool CanParse(AiRagKnowledgeDocument document)
    {
        var fileType = NormalizeFileType(document.FileType);
        return SupportedFileTypes.Contains(fileType)
               && !string.IsNullOrWhiteSpace(document.SourceContent);
    }

    public Task<KnowledgeDocumentParseResult> ParseAsync(AiRagKnowledgeDocument document, CancellationToken cancellationToken = default)
    {
        var content = document.SourceContent;
        if (string.IsNullOrWhiteSpace(content))
            throw new InvalidOperationException("文档原始内容不存在，无法解析");

        return Task.FromResult(new KnowledgeDocumentParseResult
        {
            Content = content.Trim(),
            MetadataJson = document.ParserConfig
        });
    }

    private static string NormalizeFileType(string? fileType)
    {
        return fileType?.Trim().TrimStart('.').ToLowerInvariant() ?? string.Empty;
    }
}
