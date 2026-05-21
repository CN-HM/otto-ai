namespace AiAdmin.Services.Runtime.Execution.Dtos;

using AiAdmin.Entities;

public class StageExecutionBindingDto
{
    public string Stage { get; set; } = string.Empty;
    public string? ProfileId { get; set; }
    public string? ModelType { get; set; }
    public string? ModelCode { get; set; }
    public string? ModelName { get; set; }
    public string? ProviderCode { get; set; }
    public ProviderType? ProviderType { get; set; }
    public string? ProviderName { get; set; }
    public string? ProviderFamily { get; set; }
    public string InvocationMode { get; set; } = "non_streaming";
    public bool SupportsStreamingInput { get; set; }
    public bool SupportsStreamingOutput { get; set; }
    public string? CapabilitySource { get; set; }
    public List<string> CapabilityTags { get; set; } = new();
    public string? AdapterCode { get; set; }
    public string? AdapterName { get; set; }
    public bool IsResolved { get; set; }
    public string ResolutionMode { get; set; } = "unresolved";
    public string? ResolutionDetail { get; set; }
    public List<string> Warnings { get; set; } = new();
}
