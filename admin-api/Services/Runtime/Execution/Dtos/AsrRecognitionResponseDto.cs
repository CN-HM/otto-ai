namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class AsrRecognitionResponseDto
{
    public string InvocationMode { get; set; } = "non_streaming";
    public string? Transcript { get; set; }
    public string? RawResponseJson { get; set; }
    public StageExecutionTraceDto? StageTrace { get; set; }
}
