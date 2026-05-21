namespace AiAdmin.Services.Memory;

public enum MemoryRecordType
{
    Node,
    Profile,
    Preference,
    Fact,
    Event,
    Episodic,
    Goal,
    Relationship,
    Summary,
    Instruction,
    Setting
}

public static class MemoryRecordTypes
{
    public const string Node = "node";
    public const string Profile = "profile";
    public const string Preference = "preference";
    public const string Fact = "fact";
    public const string Event = "event";
    public const string Episodic = "episodic";
    public const string Goal = "goal";
    public const string Relationship = "relationship";
    public const string Summary = "summary";
    public const string Instruction = "instruction";
    public const string Setting = "setting";

    public static MemoryRecordType Parse(string? value)
    {
        return value?.Trim().ToLowerInvariant() switch
        {
            Profile => MemoryRecordType.Profile,
            Preference => MemoryRecordType.Preference,
            Fact => MemoryRecordType.Fact,
            Event => MemoryRecordType.Event,
            Episodic => MemoryRecordType.Episodic,
            Goal => MemoryRecordType.Goal,
            Relationship => MemoryRecordType.Relationship,
            Summary => MemoryRecordType.Summary,
            Instruction => MemoryRecordType.Instruction,
            Setting => MemoryRecordType.Setting,
            _ => MemoryRecordType.Node
        };
    }

    public static string ToStorageValue(MemoryRecordType recordType)
    {
        return recordType switch
        {
            MemoryRecordType.Profile => Profile,
            MemoryRecordType.Preference => Preference,
            MemoryRecordType.Fact => Fact,
            MemoryRecordType.Event => Event,
            MemoryRecordType.Episodic => Episodic,
            MemoryRecordType.Goal => Goal,
            MemoryRecordType.Relationship => Relationship,
            MemoryRecordType.Summary => Summary,
            MemoryRecordType.Instruction => Instruction,
            MemoryRecordType.Setting => Setting,
            _ => Node
        };
    }

    public static string FromRuleType(MemoryRuleType ruleType)
    {
        return ToStorageValue(MemoryRuleTypes.IsProfile(ruleType) ? MemoryRecordType.Profile : MemoryRecordType.Node);
    }
}
