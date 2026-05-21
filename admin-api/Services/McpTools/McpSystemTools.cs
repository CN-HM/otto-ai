namespace AiAdmin.Services.McpTools;

public enum McpSystemToolKind
{
    SendSms,
    SendEmail
}

public static class McpSystemTools
{
    public const string NotificationCategory = "notification";

    private static readonly IReadOnlyDictionary<McpSystemToolKind, string> Codes = new Dictionary<McpSystemToolKind, string>
    {
        [McpSystemToolKind.SendSms] = "send-sms",
        [McpSystemToolKind.SendEmail] = "send-email"
    };

    public static string GetCode(McpSystemToolKind kind) => Codes[kind];

    public static bool TryParse(string? code, out McpSystemToolKind kind)
    {
        if (!string.IsNullOrWhiteSpace(code))
        {
            var normalized = code.Trim();
            foreach (var item in Codes)
            {
                if (string.Equals(item.Value, normalized, StringComparison.OrdinalIgnoreCase))
                {
                    kind = item.Key;
                    return true;
                }
            }
        }

        kind = default;
        return false;
    }

    public static bool IsSystemCode(string? code) => TryParse(code, out _);

    public static bool IsNotificationTool(McpSystemToolKind kind) => kind is McpSystemToolKind.SendSms or McpSystemToolKind.SendEmail;
}
