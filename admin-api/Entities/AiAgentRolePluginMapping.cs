using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_agent_role_plugin_mapping")]
public class AiAgentRolePluginMapping
{
    [Key]
    [Column("id")]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long Id { get; set; }

    [Column("agent_role_id")]
    [MaxLength(32)]
    public string AgentRoleId { get; set; } = string.Empty;

    [Column("plugin_id")]
    [MaxLength(32)]
    public string PluginId { get; set; } = string.Empty;

    [Column("param_info", TypeName = "jsonb")]
    public string ParamInfo { get; set; } = "{}";

    [Column("provider_code")]
    [MaxLength(50)]
    public string? ProviderCode { get; set; }
}
