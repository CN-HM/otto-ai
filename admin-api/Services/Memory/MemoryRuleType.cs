using System.Text.Json;
using System.Text.Json.Serialization;

namespace AiAdmin.Services.Memory;

[JsonConverter(typeof(MemoryRuleTypeJsonConverter))]
public enum MemoryRuleType
{
    Profile,
    Node,
    Risk,
    HealthFollowup,
    Todo,
    Reminder
}

public static class MemoryRuleTypes
{
    public const string Profile = "profile";
    public const string Node = "node";
    public const string Risk = "risk";
    public const string HealthFollowup = "health_followup";
    public const string Todo = "todo";
    public const string Reminder = "reminder";

    public static MemoryRuleType Parse(string? value)
    {
        var normalized = value?.Trim().ToLowerInvariant();
        return normalized switch
        {
            Profile or "profile_extraction" => MemoryRuleType.Profile,
            "preference" or "goal" or "relationship" or "instruction" or "setting" => MemoryRuleType.Profile,
            Risk or "risk_signal" => MemoryRuleType.Risk,
            "health" or HealthFollowup => MemoryRuleType.HealthFollowup,
            Todo or "task" => MemoryRuleType.Todo,
            Reminder => MemoryRuleType.Reminder,
            _ => MemoryRuleType.Node
        };
    }

    public static string ToStorageValue(MemoryRuleType ruleType)
    {
        return ruleType switch
        {
            MemoryRuleType.Profile => Profile,
            MemoryRuleType.Risk => Risk,
            MemoryRuleType.HealthFollowup => HealthFollowup,
            MemoryRuleType.Todo => Todo,
            MemoryRuleType.Reminder => Reminder,
            _ => Node
        };
    }

    public static bool IsProfile(MemoryRuleType ruleType)
    {
        return ruleType == MemoryRuleType.Profile;
    }

    public static bool IsRuntimeSignal(MemoryRuleType ruleType)
    {
        return ruleType is MemoryRuleType.Risk or MemoryRuleType.HealthFollowup or MemoryRuleType.Todo or MemoryRuleType.Reminder;
    }

    public static string ToMemoryRecordType(MemoryRuleType ruleType)
    {
        return MemoryRecordTypes.FromRuleType(ruleType);
    }

    public static string ToSignalType(MemoryRuleType ruleType)
    {
        return IsRuntimeSignal(ruleType) ? ToStorageValue(ruleType) : string.Empty;
    }

    public static string ResolveMemoryMergeStrategy(MemoryRuleType ruleType)
    {
        return IsProfile(ruleType) ? "replace" : "append";
    }
}

public sealed class MemoryRuleTypeJsonConverter : JsonConverter<MemoryRuleType>
{
    public override MemoryRuleType Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        if (reader.TokenType != JsonTokenType.String)
        {
            throw new JsonException("Memory rule type must be a string.");
        }

        var value = reader.GetString()?.Trim().ToLowerInvariant();
        return value switch
        {
            MemoryRuleTypes.Profile => MemoryRuleType.Profile,
            MemoryRuleTypes.Node => MemoryRuleType.Node,
            MemoryRuleTypes.Risk => MemoryRuleType.Risk,
            MemoryRuleTypes.HealthFollowup => MemoryRuleType.HealthFollowup,
            MemoryRuleTypes.Todo => MemoryRuleType.Todo,
            MemoryRuleTypes.Reminder => MemoryRuleType.Reminder,
            _ => throw new JsonException("Memory rule type must be one of: profile, node, risk, health_followup, todo, reminder.")
        };
    }

    public override void Write(Utf8JsonWriter writer, MemoryRuleType value, JsonSerializerOptions options)
    {
        writer.WriteStringValue(MemoryRuleTypes.ToStorageValue(value));
    }
}
