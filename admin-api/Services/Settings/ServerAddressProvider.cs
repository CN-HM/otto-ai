namespace AiAdmin.Services.Settings;

public class ServerAddressProvider(IServiceScopeFactory scopeFactory) : IServerAddressProvider
{
    private const string ServerWebSocketPath = "/v1/";

    public async Task<ServerAddressSnapshot> GetSnapshotAsync(CancellationToken cancellationToken = default)
    {
        using var scope = scopeFactory.CreateScope();
        var systemSettingsService = scope.ServiceProvider.GetRequiredService<SystemSettingsService>();
        var settings = await systemSettingsService.GetOrCreateAsync(false, cancellationToken);

        return new ServerAddressSnapshot(
            settings.ServerListenIp.Trim(),
            settings.ServerPublicHost.Trim(),
            settings.ServerPort,
            settings.ServerHttpPort,
            settings.ServerVisionPort,
            settings.FrontendUrl.Trim());
    }

    public string BuildProvisioningApiBaseUrl(HttpRequest request, string publicHost)
    {
        var builder = new UriBuilder(request.Scheme, publicHost)
        {
            Port = request.Host.Port ?? -1,
            Path = request.PathBase.HasValue ? request.PathBase.Value! : string.Empty
        };

        return builder.Uri.ToString().TrimEnd('/');
    }

    public string BuildRequestWebSocketUrl(HttpRequest request, string publicHost, PathString path)
    {
        var builder = new UriBuilder(request.Scheme, publicHost)
        {
            Port = request.Host.Port ?? -1,
            Path = BuildPath(request.PathBase, path)
        };

        builder.Scheme = string.Equals(request.Scheme, Uri.UriSchemeHttps, StringComparison.OrdinalIgnoreCase)
            ? "wss"
            : "ws";

        return builder.Uri.ToString().TrimEnd('/');
    }

    public string BuildServerWebSocketUrl(string publicHost, int port, bool useSecureWebSocket)
    {
        var builder = new UriBuilder(useSecureWebSocket ? "wss" : "ws", publicHost)
        {
            Port = port,
            Path = ServerWebSocketPath
        };

        return builder.Uri.ToString();
    }

    public bool IsLocalOnlyHost(string host)
    {
        if (string.IsNullOrWhiteSpace(host))
        {
            return true;
        }

        return string.Equals(host, "localhost", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "127.0.0.1", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "::1", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "[::1]", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "0.0.0.0", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "::", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "[::]", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "host.docker.internal", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "10.0.2.2", StringComparison.OrdinalIgnoreCase)
               || string.Equals(host, "10.0.3.2", StringComparison.OrdinalIgnoreCase);
    }

    private static string BuildPath(PathString pathBase, PathString path)
    {
        if (!pathBase.HasValue)
        {
            return path.Value ?? string.Empty;
        }

        return $"{pathBase.Value}{path.Value}";
    }
}
