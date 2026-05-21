using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace AiAdmin.Infrastructure;

public static class ClaimsPrincipalExtensions
{
    public static long GetUserId(this ClaimsPrincipal claimsPrincipal)
    {
        var sub = claimsPrincipal.FindFirstValue(JwtRegisteredClaimNames.Sub)
                  ?? claimsPrincipal.FindFirstValue(ClaimTypes.NameIdentifier);

        return long.TryParse(sub, out var id) ? id : 0;
    }

    public static string? GetUserIdValue(this ClaimsPrincipal claimsPrincipal)
    {
        var sub = claimsPrincipal.FindFirstValue(JwtRegisteredClaimNames.Sub)
                  ?? claimsPrincipal.FindFirstValue(ClaimTypes.NameIdentifier);

        return string.IsNullOrWhiteSpace(sub) ? null : sub;
    }

    public static string GetUsername(this ClaimsPrincipal claimsPrincipal)
    {
        return claimsPrincipal.FindFirstValue(JwtRegisteredClaimNames.Name)
            ?? claimsPrincipal.FindFirstValue(ClaimTypes.Name)
            ?? string.Empty;
    }

    public static bool IsSuperAdmin(this ClaimsPrincipal claimsPrincipal)
    {
        return claimsPrincipal.FindFirstValue("superAdmin") == "1";
    }
}
