using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

/// <summary>
/// 智能体插件映射实体
/// 存储智能体与插件的关联配置，支持插件参数自定义
/// </summary>
[Table("ai_agent_plugin_mapping")]
public class AiAgentPluginMapping
{
    [Key]
    [Column("id")]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public long Id { get; set; }

    [Column("agent_id")]
    [MaxLength(32)]
    public string AgentId { get; set; } = string.Empty;

    [Column("plugin_id")]
    [MaxLength(32)]
    public string PluginId { get; set; } = string.Empty;

    [Column("param_info", TypeName = "jsonb")]
    public string ParamInfo { get; set; } = "{}";

    [Column("provider_code")]
    [MaxLength(50)]
    public string? ProviderCode { get; set; }
}
