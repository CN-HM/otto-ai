using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AiAdmin.Entities;

[Table("ai_memory_library")]
public class AiMemoryLibrary
{
    [Key]
    [Column("id")]
    [MaxLength(32)]
    public string Id { get; set; } = string.Empty;

    [Column("user_id")]
    public long? UserId { get; set; }

    [Column("agent_id")]
    [MaxLength(32)]
    public string? AgentId { get; set; }

    [Column("code")]
    [MaxLength(64)]
    public string Code { get; set; } = string.Empty;

    [Column("name")]
    [MaxLength(100)]
    public string Name { get; set; } = string.Empty;

    [Column("description")]
    public string? Description { get; set; }

    [Column("status")]
    public short Status { get; set; } = 1;

    [Column("is_default")]
    public bool IsDefault { get; set; }

    [Column("entity_scope")]
    [MaxLength(20)]
    public string EntityScope { get; set; } = "user";

    [Column("memory_model_id")]
    [MaxLength(32)]
    public string? MemoryModelId { get; set; }

    [Column("retrieval_config", TypeName = "jsonb")]
    public string? RetrievalConfig { get; set; }

    [Column("write_config", TypeName = "jsonb")]
    public string? WriteConfig { get; set; }

    [Column("sort")]
    public int Sort { get; set; }

    [Column("creator")]
    public long? Creator { get; set; }

    [Column("created_at")]
    public DateTime? CreatedAt { get; set; }

    [Column("updater")]
    public long? Updater { get; set; }

    [Column("updated_at")]
    public DateTime? UpdatedAt { get; set; }
}
