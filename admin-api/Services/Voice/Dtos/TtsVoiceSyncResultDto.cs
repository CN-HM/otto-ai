namespace AiAdmin.Services.Voice.Dtos;

public class TtsVoiceSyncResultDto
{
    public string ProviderCode { get; set; } = string.Empty;
    public string TtsProfileId { get; set; } = string.Empty;
    public int RemoteCount { get; set; }
    public int CreatedCount { get; set; }
    public int UpdatedCount { get; set; }
    public int SkippedCount { get; set; }
    public string Message { get; set; } = string.Empty;
}
