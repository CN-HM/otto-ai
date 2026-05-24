using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;

namespace AiAdmin.Services.SystemPrompt;

public class VariableResolveContext
{
    public string? AgentRoleId { get; set; }
    public string? DeviceId { get; set; }
    public string? SessionId { get; set; }
    public long? UserId { get; set; }

    public AiDevice? Device { get; set; }
    public AgentRoleRuntimeDescriptorDto? AgentRole { get; set; }
    public SysUser? User { get; set; }
}
