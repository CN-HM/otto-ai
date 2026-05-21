namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class AsrRecognitionStreamEventDto
{
    public string EventType { get; set; } = "transcript_updated";
    public string? Transcript { get; set; }
    public string? UtteranceText { get; set; }
    public bool IsFinal { get; set; }
    public bool IsDefinite { get; set; }
    public int? StartTimeMs { get; set; }
    public int? EndTimeMs { get; set; }
    public string? RawEventJson { get; set; }
}
