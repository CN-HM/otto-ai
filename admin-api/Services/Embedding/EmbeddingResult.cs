namespace AiAdmin.Services.Embedding;

public sealed class EmbeddingResult
{
    public string ModelConfigId { get; init; } = string.Empty;
    public float[] Values { get; init; } = [];
}
