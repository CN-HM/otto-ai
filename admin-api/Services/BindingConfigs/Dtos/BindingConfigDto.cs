namespace AiAdmin.Services.BindingConfigs.Dtos;

public class BindingConfigDto
{
    public string Id { get; set; } = string.Empty;
    public string? Code { get; set; }
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public string Status { get; set; } = "active";
    public string? ProviderCode { get; set; }
    public string? ProviderType { get; set; }
    public string? IntegrationId { get; set; }
    public bool? IsEnabled { get; set; }
    public bool IsDefault { get; set; }
    public bool SupportsAsr { get; set; }
    public bool SupportsTts { get; set; }
    public bool SupportsLlm { get; set; }
    public bool SupportsMem { get; set; }
    public bool? IsSystem { get; set; }
    public string? InvocationMode { get; set; }
    public int Sort { get; set; }
    public string? PrimaryEndpoint { get; set; }
    public string? PrimaryModel { get; set; }
    public int? Dimension { get; set; }
    public string? ApiKey { get; set; }
    public string? SecretKey { get; set; }
    public string? AppId { get; set; }
    public string? AccessToken { get; set; }
    public string? Organization { get; set; }
    public string? CatalogAccessKey { get; set; }
    public string? CatalogSecretKey { get; set; }
    public string? CatalogAppId { get; set; }
    public string? GraphJson { get; set; }
    public string? ConfigJson { get; set; }
    public double? Temperature { get; set; }
    public int? MaxTokens { get; set; }
    public double? TopP { get; set; }
    public string? Encoding { get; set; }
    public int? SampleRate { get; set; }
    public int? SpeechRate { get; set; }
    public int? LoudnessRate { get; set; }
    public string? ResourceId { get; set; }
    public string? AudioFormat { get; set; }
    public string? Codec { get; set; }
    public int? Bits { get; set; }
    public int? Channels { get; set; }
    public int? ChunkDurationMs { get; set; }
    public int? ChunkSizeBytes { get; set; }
    public string? Language { get; set; }
    public string? Context { get; set; }
    public bool? EnableNonstream { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
