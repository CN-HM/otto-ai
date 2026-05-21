namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class TtsSynthesisStreamEventDto
{
    public string EventType { get; set; } = "audio_chunk";
    public string? Text { get; set; }
    public byte[] AudioBytes { get; set; } = [];
    public string? Format { get; set; }
    public string? ContentType { get; set; }
    public string? RawEventJson { get; set; }
    public bool IsFinal { get; set; }
}
