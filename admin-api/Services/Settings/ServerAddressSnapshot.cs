namespace AiAdmin.Services.Settings;

public sealed record ServerAddressSnapshot(
    string ListenIp,
    string PublicHost,
    int ServerPort,
    int ServerHttpPort,
    int ServerVisionPort,
    string FrontendUrl);
