namespace AiAdmin.Services.AgentRoles.Dtos;

public class AgentRoleListQuery
{
    public string? Keyword { get; set; }
    public string? Status { get; set; }
    public int? Page { get; set; }
    public int? Limit { get; set; }
}
