using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// RAG知识库实体
/// 存储知识库基本信息，关联RAG模型和文档数据
/// </summary>
[Table("ai_rag_dataset")]
public class AiRagDataset
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("dataset_id")]
    [MaxLength(64)]
    public string DatasetId { get; set; } = string.Empty;

    [Column("name")]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [Column("description")]
    public string? Description { get; set; }

    [Column("status")]
    public short Status { get; set; } = 1;

    [Column("avatar")]
    public string? Avatar { get; set; }

    [Column("permission")]
    [MaxLength(20)]
    public string Permission { get; set; } = "public";

    [Column("chunk_method")]
    [MaxLength(50)]
    public string? ChunkMethod { get; set; }

    [Column("parser_config")]
    public string? ParserConfig { get; set; }

    [Column("chunk_count")]
    public long ChunkCount { get; set; }

    [Column("document_count")]
    public long DocumentCount { get; set; }

    [Column("token_num")]
    public long TokenNum { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
