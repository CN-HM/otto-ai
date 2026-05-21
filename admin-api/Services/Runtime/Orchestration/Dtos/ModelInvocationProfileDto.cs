namespace AiAdmin.Services.Runtime.Orchestration.Dtos;

using AiAdmin.Entities;

public class ModelInvocationProfileDto
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
    public int? FirstPacketTimeoutMs { get; set; }
    public int? StreamIdleTimeoutMs { get; set; }
    public string? CapabilitySource { get; set; }
    public List<string> CapabilityTags { get; set; } = new();
}
