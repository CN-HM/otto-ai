namespace AiAdmin.Services.Settings;

public interface IServerAddressProvider
{
    Task<ServerAddressSnapshot> GetSnapshotAsync(CancellationToken cancellationToken = default);
    string BuildProvisioningApiBaseUrl(HttpRequest request, string publicHost);
    string BuildRequestWebSocketUrl(HttpRequest request, string publicHost, PathString path);
    string BuildServerWebSocketUrl(string publicHost, int port, bool useSecureWebSocket);
    bool IsLocalOnlyHost(string host);
}
