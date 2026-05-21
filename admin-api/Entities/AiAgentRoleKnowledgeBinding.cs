using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_agent_role_knowledge_binding")]
public class AiAgentRoleKnowledgeBinding
{
    [Key]
    [Column("id")]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long Id { get; set; }

    [Column("agent_role_id")]
    [MaxLength(32)]
    public string AgentRoleId { get; set; } = string.Empty;

    [Column("dataset_id")]
    [MaxLength(64)]
    public string DatasetId { get; set; } = string.Empty;

    [Column("sort")]
    public int Sort { get; set; }

    [Column("enabled")]
    public bool Enabled { get; set; } = true;

    [Column("top_k")]
    public int? TopK { get; set; }

    [Column("min_score")]
    public double? MinScore { get; set; }

    [Column("rerank_enabled")]
    public bool? RerankEnabled { get; set; }

    [Column("max_chunks")]
    public int? MaxChunks { get; set; }
}
