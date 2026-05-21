namespace AiAdmin.Services.Voice.Dtos;

public class TtsProfileOptionDto
{
    public string Label { get; set; } = string.Empty;

    public string Value { get; set; } = string.Empty;

    public string? Description { get; set; }

    public string? ProfileName { get; set; }

    public string? IntegrationId { get; set; }

    public string? ProviderCode { get; set; }

    public string? ProviderName { get; set; }
}
