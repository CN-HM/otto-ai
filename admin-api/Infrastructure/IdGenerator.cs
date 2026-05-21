namespace AiAdmin.Infrastructure;

public static class IdGenerator
{
    public static long NewLongId()
    {
        return DateTimeOffset.UtcNow.ToUnixTimeMilliseconds() * 1000 + Random.Shared.Next(1000);
    }
}
