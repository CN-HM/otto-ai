namespace AiAdmin.Services.AgentRoles.Dtos;

public class ActionRuleUpsertDto
{
    public string ActionType { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string? Instruction { get; set; }
    public int? IsEnabled { get; set; }
}

public class ActionRuleDto
{
    public string Id { get; set; } = string.Empty;
    public string? AgentRoleId { get; set; }
    public string ActionType { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string? Instruction { get; set; }
    public int IsEnabled { get; set; }
    public long? Creator { get; set; }
    public string? CreatedAt { get; set; }
    public long? Updater { get; set; }
    public string? UpdatedAt { get; set; }
}
