namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class AsrRecognitionRequestDto
{
    public string AudioBase64 { get; set; } = string.Empty;
    public string? AudioFormat { get; set; }
    public string? Language { get; set; }
    public Dictionary<string, object?> ExtraOptions { get; set; } = new();
}
