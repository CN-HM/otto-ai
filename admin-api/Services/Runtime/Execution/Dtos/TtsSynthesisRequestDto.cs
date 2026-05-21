namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class TtsSynthesisRequestDto
{
    public string Text { get; set; } = string.Empty;
    public string? Voice { get; set; }
    public string? ResponseFormat { get; set; }
    public double? Speed { get; set; }
    public Dictionary<string, object?> ExtraOptions { get; set; } = new();
}
