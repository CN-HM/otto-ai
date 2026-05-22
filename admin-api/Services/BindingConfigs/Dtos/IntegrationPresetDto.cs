namespace AiAdmin.Services.BindingConfigs.Dtos;

public class IntegrationPresetDto
{
    public string PresetKey { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string ProviderType { get; set; } = string.Empty;
    public bool SupportsAsr { get; set; }
    public bool SupportsTts { get; set; }
    public bool SupportsLlm { get; set; }
    public bool SupportsMem { get; set; }
    public List<string> AuthFields { get; set; } = [];
}
