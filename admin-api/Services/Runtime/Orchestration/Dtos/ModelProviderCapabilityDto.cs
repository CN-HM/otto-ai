namespace AiAdmin.Services.Runtime.Orchestration.Dtos;

using AiAdmin.Entities;

public class ModelProviderCapabilityDto
{
    public string? ProfileId { get; set; }
    public string? ModelType { get; set; }
    public string? ModelCode { get; set; }
    public string? ModelName { get; set; }
    public string? ProviderCode { get; set; }
    public ProviderType? ProviderType { get; set; }
    public string? ProviderName { get; set; }
    public string? ProviderEndpoint { get; set; }
    public string? ProviderFamily { get; set; }
    public bool SupportsStreamingInput { get; set; }
    public bool SupportsStreamingOutput { get; set; }
    public string PreferredInvocationMode { get; set; } = "non_streaming";
    public string CapabilitySource { get; set; } = "inferred";
    public List<string> CapabilityTags { get; set; } = new();
    public List<string> ResolutionTrace { get; set; } = new();
    public string? RawConfigJson { get; set; }
}
