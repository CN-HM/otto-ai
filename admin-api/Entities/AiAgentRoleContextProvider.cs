using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_agent_role_context_provider")]
public class AiAgentRoleContextProvider
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("agent_role_id")]
    [MaxLength(32)]
    public string AgentRoleId { get; set; } = string.Empty;

    [Column("url")]
    [MaxLength(500)]
    public string? Url { get; set; }

    [Column("headers", TypeName = "jsonb")]
    public string? Headers { get; set; }

    [Column("create_date")]
    public DateTime? CreateDate { get; set; }
}
