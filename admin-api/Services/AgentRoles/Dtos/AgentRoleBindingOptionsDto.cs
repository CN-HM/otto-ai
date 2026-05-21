namespace AiAdmin.Services.AgentRoles.Dtos;

public class AgentRoleBindingOptionsDto
{
    public List<OptionItemDto> PipelineTemplates { get; set; } = new();
    public List<OptionItemDto> AsrProfiles { get; set; } = new();
    public List<OptionItemDto> VadProfiles { get; set; } = new();
    public List<OptionItemDto> LlmProfiles { get; set; } = new();
    public List<OptionItemDto> TtsProfiles { get; set; } = new();
}
