using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 智能体上下文提供者实体
/// 配置智能体的外部上下文数据源，如知识库、API等
/// </summary>
[Table("ai_agent_context_provider")]
public class AiAgentContextProvider
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("agent_id")]
    [MaxLength(32)]
    public string AgentId { get; set; } = string.Empty;

    [Column("url")]
    [MaxLength(500)]
    public string? Url { get; set; }

    [Column("headers", TypeName = "jsonb")]
    public string? Headers { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }
}
