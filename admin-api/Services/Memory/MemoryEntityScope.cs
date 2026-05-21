namespace AiAdmin.Services.Memory;

public enum MemoryEntityScope
{
    User,
    Device,
    Session,
    Global
}

public static class MemoryEntityScopes
{
    public const string User = "user";
    public const string Device = "device";
    public const string Session = "session";
    public const string Global = "global";

    public static MemoryEntityScope Parse(string? value)
    {
        return value?.Trim().ToLowerInvariant() switch
        {
            Device => MemoryEntityScope.Device,
            Session => MemoryEntityScope.Session,
            Global => MemoryEntityScope.Global,
            _ => MemoryEntityScope.User
        };
    }

    public static string ToStorageValue(MemoryEntityScope scope)
    {
        return scope switch
        {
            MemoryEntityScope.Device => Device,
            MemoryEntityScope.Session => Session,
            MemoryEntityScope.Global => Global,
            _ => User
        };
    }
}
