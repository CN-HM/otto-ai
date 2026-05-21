using Microsoft.AspNetCore.Http;

namespace AiAdmin.Infrastructure;

public static class HttpRequestAuthExtensions
{
    private const string BearerPrefix = "Bearer ";

    public static string? GetBearerToken(this HttpRequest request)
    {
        var authHeader = request.Headers.Authorization.ToString();
        if (!authHeader.StartsWith(BearerPrefix, StringComparison.OrdinalIgnoreCase))
        {
            return null;
        }

        var token = authHeader[BearerPrefix.Length..].Trim();
        return string.IsNullOrWhiteSpace(token) ? null : token;
    }
}
