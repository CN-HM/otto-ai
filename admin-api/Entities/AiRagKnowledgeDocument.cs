using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// RAG知识库文档实体
/// 存储知识库中的文档信息，支持向量化检索和分块管理
/// </summary>
[Table("ai_rag_knowledge_document")]
public class AiRagKnowledgeDocument
{
    [Key]
    [Column("id")]
    [MaxLength(64)]
    public string Id { get; set; } = string.Empty;

    [Column("dataset_id")]
    [MaxLength(64)]
    public string DatasetId { get; set; } = string.Empty;

    [Column("document_id")]
    [MaxLength(64)]
    public string? DocumentId { get; set; }

    [Column("name")]
    [MaxLength(255)]
    public string Name { get; set; } = string.Empty;

    [Column("status")]
    [MaxLength(20)]
    public string? Status { get; set; }

    [Column("chunk_count")]
    public long ChunkCount { get; set; }

    [Column("token_num")]
    public long TokenNum { get; set; }

    [Column("size")]
    public long Size { get; set; }

    [Column("file_type")]
    [MaxLength(20)]
    public string? FileType { get; set; }

    [Column("file_path")]
    public string? FilePath { get; set; }

    [Column("source_content")]
    public string? SourceContent { get; set; }

    [Column("progress")]
    public double? Progress { get; set; }

    [Column("chunk_method")]
    [MaxLength(50)]
    public string? ChunkMethod { get; set; }

    [Column("parser_config")]
    public string? ParserConfig { get; set; }

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
