using System.Text;

namespace AiAdmin.Services.Runtime;

internal sealed class ConversationStreamingSentenceBuffer
{
    private readonly StringBuilder _buffer = new();

    public IReadOnlyList<string> Append(string? textDelta)
    {
        if (string.IsNullOrWhiteSpace(textDelta))
            return [];

        _buffer.Append(textDelta);
        return DrainCompletedSentences();
    }

    public string? FlushRemaining()
    {
        var value = Normalize(_buffer.ToString());
        _buffer.Clear();
        return value;
    }

    private List<string> DrainCompletedSentences()
    {
        var results = new List<string>();
        var text = _buffer.ToString();
        var start = 0;

        for (var index = 0; index < text.Length; index++)
        {
            if (!IsSentenceBoundary(text[index]))
                continue;

            var segment = Normalize(text[start..(index + 1)]);
            if (!string.IsNullOrWhiteSpace(segment))
                results.Add(segment);
            start = index + 1;
        }

        if (start <= 0)
            return results;

        _buffer.Clear();
        if (start < text.Length)
            _buffer.Append(text[start..]);

        return results;
    }

    private static bool IsSentenceBoundary(char ch)
    {
        return ch is '.' or '!' or '?' or '。' or '！' or '？' or ';' or '；' or '\n';
    }

    private static string? Normalize(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
