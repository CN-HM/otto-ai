using AiAdmin.Services.Knowledge.VOs;

namespace AiAdmin.Services.Knowledge.Interfaces;

public interface IKnowledgeChunker
{
    IReadOnlyList<KnowledgeChunk> Chunk(string content);
}
