namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class TtsSynthesisResponseDto
{
    public string InvocationMode { get; set; } = "non_streaming";
    public string? ContentType { get; set; }
    public string? Format { get; set; }
    public string? AudioBase64 { get; set; }
    public long AudioSize { get; set; }
    public string? RawResponseJson { get; set; }
    public StageExecutionTraceDto? StageTrace { get; set; }
}
