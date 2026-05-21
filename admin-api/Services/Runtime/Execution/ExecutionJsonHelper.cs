using System.Globalization;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Services.Runtime.Orchestration;

namespace AiAdmin.Services.Runtime.Execution;

internal static class ExecutionJsonHelper
{
    public static string? GetString(JsonObject? obj, params string[] paths)
    {
        return ModelCapabilityJsonHelper.GetString(obj, paths);
    }

    public static int? GetInt(JsonObject? obj, params string[] paths)
    {
        foreach (var path in paths)
        {
            if (ModelCapabilityJsonHelper.GetNode(obj, path) is not JsonValue value)
                continue;
            if (value.TryGetValue<int>(out var intValue))
                return intValue;
            if (value.TryGetValue<long>(out var longValue) && longValue is >= int.MinValue and <= int.MaxValue)
                return (int)longValue;
            if (value.TryGetValue<string>(out var text) && int.TryParse(text, NumberStyles.Integer, CultureInfo.InvariantCulture, out var parsed))
                return parsed;
        }

        return null;
    }

    public static double? GetDouble(JsonObject? obj, params string[] paths)
    {
        foreach (var path in paths)
        {
            if (ModelCapabilityJsonHelper.GetNode(obj, path) is not JsonValue value)
                continue;
            if (value.TryGetValue<double>(out var doubleValue))
                return doubleValue;
            if (value.TryGetValue<decimal>(out var decimalValue))
                return (double)decimalValue;
            if (value.TryGetValue<int>(out var intValue))
                return intValue;
            if (value.TryGetValue<string>(out var text) && double.TryParse(text, NumberStyles.Float | NumberStyles.AllowThousands, CultureInfo.InvariantCulture, out var parsed))
                return parsed;
        }

        return null;
    }

    public static bool? GetBool(JsonObject? obj, params string[] paths)
    {
        return ModelCapabilityJsonHelper.GetBool(obj, paths);
    }

    public static JsonObject? GetObject(JsonObject? obj, params string[] paths)
    {
        foreach (var path in paths)
        {
            if (ModelCapabilityJsonHelper.GetNode(obj, path) is JsonObject child)
                return child;
        }

        return null;
    }

    public static Dictionary<string, string> ToStringDictionary(JsonObject? obj)
    {
        if (obj == null)
            return new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

        var result = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        foreach (var pair in obj)
        {
            var value = ToInvariantString(pair.Value);
            if (!string.IsNullOrWhiteSpace(value))
                result[pair.Key] = value;
        }

        return result;
    }

    public static object? ToPlainObject(JsonNode? node)
    {
        switch (node)
        {
            case null:
                return null;
            case JsonValue value when value.TryGetValue<string>(out var text):
                return text;
            case JsonValue value when value.TryGetValue<int>(out var intValue):
                return intValue;
            case JsonValue value when value.TryGetValue<long>(out var longValue):
                return longValue;
            case JsonValue value when value.TryGetValue<double>(out var doubleValue):
                return doubleValue;
            case JsonValue value when value.TryGetValue<decimal>(out var decimalValue):
                return decimalValue;
            case JsonValue value when value.TryGetValue<bool>(out var boolValue):
                return boolValue;
            default:
                return node.ToJsonString();
        };
    }

    public static JsonNode? ToJsonNode(object? value)
    {
        return value switch
        {
            null => null,
            JsonNode node => node.DeepClone(),
            JsonElement { ValueKind: JsonValueKind.Undefined } => null,
            JsonElement element => JsonNode.Parse(element.GetRawText()),
            _ => JsonSerializer.SerializeToNode(value)
        };
    }

    private static string? ToInvariantString(JsonNode? node)
    {
        return ToPlainObject(node) switch
        {
            null => null,
            string text => string.IsNullOrWhiteSpace(text) ? null : text,
            bool boolValue => boolValue ? bool.TrueString.ToLowerInvariant() : bool.FalseString.ToLowerInvariant(),
            IFormattable formattable => formattable.ToString(null, CultureInfo.InvariantCulture),
            var value => value.ToString()
        };
    }
}
