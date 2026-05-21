using System.Globalization;
using System.Text.Json.Nodes;

namespace AiAdmin.Services.Runtime.Orchestration;

internal static class ModelCapabilityJsonHelper
{
    public static JsonObject? ParseObject(string? json)
    {
        if (string.IsNullOrWhiteSpace(json))
            return null;

        try
        {
            return JsonNode.Parse(json) as JsonObject;
        }
        catch
        {
            return null;
        }
    }

    public static string? GetString(JsonObject? obj, params string[] paths)
    {
        foreach (var path in paths)
        {
            if (GetNode(obj, path) is not JsonValue value)
                continue;

            if (value.TryGetValue<string>(out var text))
                return NormalizeValue(text);
            if (value.TryGetValue<int>(out var intValue))
                return intValue.ToString(CultureInfo.InvariantCulture);
            if (value.TryGetValue<long>(out var longValue))
                return longValue.ToString(CultureInfo.InvariantCulture);
            if (value.TryGetValue<double>(out var doubleValue))
                return doubleValue.ToString(CultureInfo.InvariantCulture);
            if (value.TryGetValue<bool>(out var boolValue))
                return boolValue ? bool.TrueString.ToLowerInvariant() : bool.FalseString.ToLowerInvariant();
        }

        return null;
    }

    public static bool? GetBool(JsonObject? obj, params string[] paths)
    {
        foreach (var path in paths)
        {
            if (GetNode(obj, path) is not JsonValue value)
                continue;

            if (value.TryGetValue<bool>(out var boolValue))
                return boolValue;
            if (value.TryGetValue<int>(out var intValue))
                return intValue != 0;
            if (value.TryGetValue<long>(out var longValue))
                return longValue != 0;
            if (value.TryGetValue<string>(out var text))
            {
                if (bool.TryParse(text, out var parsedBool))
                    return parsedBool;
                if (int.TryParse(text, NumberStyles.Integer, CultureInfo.InvariantCulture, out var parsedInt))
                    return parsedInt != 0;
                if (string.Equals(text, "yes", StringComparison.OrdinalIgnoreCase))
                    return true;
                if (string.Equals(text, "no", StringComparison.OrdinalIgnoreCase))
                    return false;
            }
        }

        return null;
    }

    public static List<string> GetStringList(JsonObject? obj, params string[] paths)
    {
        foreach (var path in paths)
        {
            var node = GetNode(obj, path);
            switch (node)
            {
                case JsonArray array:
                    return array.Select(ReadString)
                        .Where(x => !string.IsNullOrWhiteSpace(x))
                        .Select(x => x!)
                        .Distinct(StringComparer.OrdinalIgnoreCase)
                        .ToList();
                case JsonValue value when value.TryGetValue<string>(out var text) && !string.IsNullOrWhiteSpace(text):
                    return text.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
                        .Select(NormalizeValue)
                        .Where(x => !string.IsNullOrWhiteSpace(x))
                        .Select(x => x!)
                        .Distinct(StringComparer.OrdinalIgnoreCase)
                        .ToList();
            }
        }

        return new List<string>();
    }

    public static string? BuildEndpointFromHostPort(JsonObject? obj, string defaultScheme = "http")
    {
        var host = GetString(obj,
            "host",
            "server_host",
            "provider.host");
        if (string.IsNullOrWhiteSpace(host))
            return null;

        if (host.Contains("://", StringComparison.OrdinalIgnoreCase))
            return host;

        var scheme = GetString(obj,
            "scheme",
            "protocol",
            "provider.scheme") ?? defaultScheme;
        var port = GetString(obj,
            "port",
            "server_port",
            "provider.port");
        return string.IsNullOrWhiteSpace(port)
            ? $"{scheme}://{host}"
            : $"{scheme}://{host}:{port}";
    }

    public static JsonNode? GetNode(JsonObject? obj, string path)
    {
        if (obj == null || string.IsNullOrWhiteSpace(path))
            return null;

        JsonNode? current = obj;
        foreach (var segment in path.Split('.', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
        {
            if (current is not JsonObject currentObject || !currentObject.TryGetPropertyValue(segment, out current))
                return null;
        }

        return current;
    }

    private static string? ReadString(JsonNode? node)
    {
        if (node is not JsonValue value)
            return null;
        if (value.TryGetValue<string>(out var text))
            return NormalizeValue(text);
        if (value.TryGetValue<int>(out var intValue))
            return intValue.ToString(CultureInfo.InvariantCulture);
        if (value.TryGetValue<long>(out var longValue))
            return longValue.ToString(CultureInfo.InvariantCulture);
        return null;
    }

    private static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
