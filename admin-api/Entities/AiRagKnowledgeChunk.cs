using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_rag_knowledge_chunk")]
public class AiRagKnowledgeChunk
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("dataset_id")]
    [MaxLength(64)]
    public string DatasetId { get; set; } = string.Empty;

    [Column("document_id")]
    [MaxLength(64)]
    public string DocumentId { get; set; } = string.Empty;

    [Column("chunk_index")]
    public int ChunkIndex { get; set; }

    [Column("title")]
    [MaxLength(255)]
    public string? Title { get; set; }

    [Column("content")]
    public string Content { get; set; } = string.Empty;

    [Column("content_hash")]
    [MaxLength(64)]
    public string ContentHash { get; set; } = string.Empty;

    [Column("token_count")]
    public int TokenCount { get; set; }

    [Column("metadata_json", TypeName = "jsonb")]
    public string? MetadataJson { get; set; }

    [Column("embedding_model_id")]
    [MaxLength(64)]
    public string? EmbeddingModelId { get; set; }

    [Column("embedding_dimension")]
    public int EmbeddingDimension { get; set; }

    [Column("embedding_json", TypeName = "jsonb")]
    public string? EmbeddingJson { get; set; }

    [Column("status")]
    [MaxLength(20)]
    public string Status { get; set; } = "pending";

    [Column("error_message")]
    public string? ErrorMessage { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
