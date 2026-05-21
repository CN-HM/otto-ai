using AiAdmin.Services.Knowledge.Interfaces;
using AiAdmin.Services.Knowledge.VOs;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Knowledge;

public class DefaultKnowledgeChunker : IKnowledgeChunker, ITransientDependency
{
    private const int MaxChunkLength = 800;
    private const int OverlapLength = 120;

    public IReadOnlyList<KnowledgeChunk> Chunk(string content)
    {
        var normalized = NormalizeContent(content);
        if (string.IsNullOrWhiteSpace(normalized))
            return [];

        var chunks = new List<KnowledgeChunk>();
        var index = 0;
        var offset = 0;
        while (offset < normalized.Length)
        {
            var length = Math.Min(MaxChunkLength, normalized.Length - offset);
            var end = FindBreakPosition(normalized, offset, length);
            var text = normalized[offset..end].Trim();
            if (!string.IsNullOrWhiteSpace(text))
            {
                chunks.Add(new KnowledgeChunk
                {
                    Index = index++,
                    Content = text,
                    TokenCount = EstimateTokenCount(text)
                });
            }

            if (end >= normalized.Length)
                break;
            offset = Math.Max(end - OverlapLength, offset + 1);
        }

        return chunks;
    }

    private static string NormalizeContent(string content)
    {
        return string.Join('\n', content.Replace("\r\n", "\n")
            .Replace('\r', '\n')
            .Split('\n')
            .Select(x => x.Trim())
            .Where(x => !string.IsNullOrWhiteSpace(x)));
    }

    private static int FindBreakPosition(string content, int offset, int length)
    {
        var proposedEnd = offset + length;
        if (proposedEnd >= content.Length)
            return content.Length;

        var window = content[offset..proposedEnd];
        var breakIndex = Math.Max(window.LastIndexOf('\n'), Math.Max(window.LastIndexOf('。'), window.LastIndexOf('.')));
        if (breakIndex > MaxChunkLength / 2)
            return offset + breakIndex + 1;
        return proposedEnd;
    }

    private static int EstimateTokenCount(string content)
    {
        return Math.Max(1, content.Length / 2);
    }
}
