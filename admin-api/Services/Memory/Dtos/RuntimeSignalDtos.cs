namespace AiAdmin.Services.Memory.Dtos;

public class RuntimeSignalListQuery
{
    public int? Page { get; set; }
    public int? Limit { get; set; }
    public string? SignalType { get; set; }
    public string? Status { get; set; }
    public string? Severity { get; set; }
    public string? Keyword { get; set; }
}

public class RuntimeSignalDto
{
    public string Id { get; set; } = string.Empty;
    public string SignalType { get; set; } = string.Empty;
    public string? SignalCode { get; set; }
    public string Severity { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public long? UserId { get; set; }
    public string? DeviceId { get; set; }
    public string? AgentRoleId { get; set; }
    public string? SessionId { get; set; }
    public string? SourceRunId { get; set; }
    public string? SourceText { get; set; }
    public string? PayloadJson { get; set; }
    public string? ScheduledAt { get; set; }
    public string? ProcessedAt { get; set; }
    public string? DedupeKey { get; set; }
    public int RetryCount { get; set; }
    public string? ErrorMessage { get; set; }
    public string CreatedAt { get; set; } = string.Empty;
    public string? UpdatedAt { get; set; }
}

public class RuntimeSignalStatusUpdateDto
{
    public string Status { get; set; } = string.Empty;
    public string? ErrorMessage { get; set; }
    public DateTime? ScheduledAt { get; set; }
}
