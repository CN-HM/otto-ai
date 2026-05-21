namespace AiAdmin.Services.Memory;

public static class RuntimeSignalTypes
{
    public const string Risk = "risk";
    public const string HealthFollowup = "health_followup";
    public const string Todo = "todo";
    public const string Reminder = "reminder";
}

public enum RuntimeSignalStatus
{
    Pending,
    Scheduled,
    Processing,
    Completed,
    Ignored,
    Failed
}

public static class RuntimeSignalStatuses
{
    public const string Pending = "pending";
    public const string Scheduled = "scheduled";
    public const string Processing = "processing";
    public const string Completed = "completed";
    public const string Ignored = "ignored";
    public const string Failed = "failed";

    public static RuntimeSignalStatus Parse(string? value)
    {
        return value?.Trim().ToLowerInvariant() switch
        {
            Scheduled => RuntimeSignalStatus.Scheduled,
            Processing => RuntimeSignalStatus.Processing,
            Completed => RuntimeSignalStatus.Completed,
            Ignored => RuntimeSignalStatus.Ignored,
            Failed => RuntimeSignalStatus.Failed,
            _ => RuntimeSignalStatus.Pending
        };
    }

    public static string ToStorageValue(RuntimeSignalStatus status)
    {
        return status switch
        {
            RuntimeSignalStatus.Scheduled => Scheduled,
            RuntimeSignalStatus.Processing => Processing,
            RuntimeSignalStatus.Completed => Completed,
            RuntimeSignalStatus.Ignored => Ignored,
            RuntimeSignalStatus.Failed => Failed,
            _ => Pending
        };
    }

    public static bool IsTerminal(RuntimeSignalStatus status)
    {
        return status is RuntimeSignalStatus.Completed or RuntimeSignalStatus.Ignored;
    }
}

public enum RuntimeSignalSeverity
{
    Low,
    Medium,
    High,
    Critical
}

public static class RuntimeSignalSeverities
{
    public const string Low = "low";
    public const string Medium = "medium";
    public const string High = "high";
    public const string Critical = "critical";

    public static string ToStorageValue(RuntimeSignalSeverity severity)
    {
        return severity switch
        {
            RuntimeSignalSeverity.Critical => Critical,
            RuntimeSignalSeverity.High => High,
            RuntimeSignalSeverity.Medium => Medium,
            _ => Low
        };
    }
}
