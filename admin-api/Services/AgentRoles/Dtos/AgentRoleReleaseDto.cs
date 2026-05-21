namespace AiAdmin.Services.AgentRoles.Dtos;

public class AgentRoleReleaseDto
{
    public string? Id { get; set; }
    public string? RoleId { get; set; }
    public string? Version { get; set; }
    public string? Status { get; set; }
    public string? SnapshotJson { get; set; }
    public string? Remark { get; set; }
    public string? PublishedAt { get; set; }
    public long? Creator { get; set; }
    public string? CreatedAt { get; set; }
    public long? Updater { get; set; }
    public string? UpdatedAt { get; set; }
}
