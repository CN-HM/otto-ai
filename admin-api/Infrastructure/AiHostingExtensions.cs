using System.Text;
using AiAdmin.Config;
using AiAdmin.Data;
using AiAdmin.Server.Cluster;
using AiAdmin.Server.Endpoints;
using AiAdmin.Services.Settings;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.AspNetCore.Hosting.Server.Features;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Serilog;
using Volo.Abp.Data;

namespace AiAdmin.Infrastructure;

public static class AiHostingExtensions
{
    public static WebApplicationBuilder AddAiHostDefaults(this WebApplicationBuilder builder)
    {
        if (builder.Environment.IsDevelopment())
        {
            builder.WebHost.UseUrls(AiApiConventions.DefaultDevelopmentUrl);
        }

        builder.Host
            .UseAutofac()
            .UseSerilog((context, services, loggerConfiguration) =>
            {
                loggerConfiguration
                    .ReadFrom.Configuration(context.Configuration)
                    .ReadFrom.Services(services);
            });

        return builder;
    }

    public static async Task InitializeAiAppAsync(this WebApplication app)
    {
        await app.InitializeApplicationAsync();

        using var scope = app.Services.CreateScope();
        var db = scope.ServiceProvider.GetRequiredService<AiAdminDbContext>();
        var seeder = scope.ServiceProvider.GetRequiredService<IDataSeeder>();

        // 退避重试机制：最多重试 5 次，指数退避
        const int maxRetries = 5;
        var retryCount = 0;
        var delay = TimeSpan.FromSeconds(1);

        while (true)
        {
            try
            {
                await db.Database.MigrateAsync();
                await seeder.SeedAsync();
                Log.Information("Database migration and seeding completed successfully.");
                return;
            }
            catch (Exception ex)
            {
                retryCount++;
                if (retryCount >= maxRetries)
                {
                    Log.Error(ex, "Database initialization failed after {RetryCount} retries. Application will start in degraded mode (database-dependent features will be unavailable).", retryCount);
                    // 不抛出异常，允许应用继续启动
                    return;
                }

                Log.Warning(ex, "Database initialization failed (attempt {Attempt}/{MaxRetries}). Retrying in {Delay}s...", retryCount, maxRetries, delay.TotalSeconds);
                await Task.Delay(delay);
                delay = TimeSpan.FromSeconds(delay.TotalSeconds * 2); // 指数退避
            }
        }
    }

    public static async Task<int> StartAiAppAsync(this WebApplication app)
    {
        await app.StartAsync();
        await app.LogAiExternalInterfaceSummaryAsync();
        await app.WaitForShutdownAsync();
        return 0;
    }

    public static async Task LogAiExternalInterfaceSummaryAsync(this WebApplication app)
    {
        using var scope = app.Services.CreateScope();
        var runtimeOptions = scope.ServiceProvider.GetRequiredService<IOptions<IoTRuntimeOptions>>().Value;
        var node = scope.ServiceProvider.GetRequiredService<INodeIdentityProvider>().Current;
        var serverAddressProvider = scope.ServiceProvider.GetRequiredService<IServerAddressProvider>();
        var address = await serverAddressProvider.GetSnapshotAsync();
        var deviceWebSocketEndpoint = scope.ServiceProvider.GetRequiredService<DeviceWebSocketEndpoint>();
        var server = app.Services.GetRequiredService<IServer>();
        var listenAddresses = server.Features.Get<IServerAddressesFeature>()?.Addresses.ToArray() ?? Array.Empty<string>();
        var externalHttpBases = BuildExternalHttpBases(listenAddresses, address.PublicHost);
        var runtimeHosts = BuildRuntimeHosts(address.PublicHost, externalHttpBases);

        var summary = new StringBuilder()
            .AppendLine("========== Otto AI External Interface ==========")
            .AppendLine($"Environment: {app.Environment.EnvironmentName}")
            .AppendLine($"NodeId: {node.NodeId}")
            .AppendLine($"PathBase: {AiApiConventions.PathBase}")
            .AppendLine($"RuntimeEnabled: {runtimeOptions.Enabled}")
            .AppendLine("Listening Addresses:");

        AppendLines(summary, listenAddresses, "  - ", "  - (none)");

        summary.AppendLine("HTTP API Base:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.PathBase}"), "  - ", "  - (none)");

        summary.AppendLine("Swagger UI:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.PathBase}/swagger"), "  - ", "  - (none)");

        summary.AppendLine("Swagger JSON:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.SwaggerJsonPath}"), "  - ", "  - (none)");

        summary.AppendLine("Auth Login:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.PathBase}/auth/login"), "  - ", "  - (none)");

        summary.AppendLine("Runtime Status:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.PathBase}/admin/server/runtime-status"), "  - ", "  - (none)");

        summary.AppendLine("Config Server Base:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.PathBase}/config/server-base"), "  - ", "  - (none)");

        summary.AppendLine("Config Agent Models:");
        AppendLines(summary, externalHttpBases.Select(baseUrl => $"{baseUrl}{AiApiConventions.PathBase}/config/agent-models"), "  - ", "  - (none)");

        summary.AppendLine("MQTT Broker:");
        AppendProtocolLines(summary, runtimeOptions.Enabled && runtimeOptions.EnableMqtt, runtimeHosts.Select(host => $"mqtt://{host}:{node.MqttPort}"));

        summary.AppendLine("UDP Audio:");
        AppendProtocolLines(summary, runtimeOptions.Enabled && runtimeOptions.EnableUdp, runtimeHosts.Select(host => $"udp://{host}:{node.UdpPort}"));

        summary.AppendLine("Device WebSocket:");
        AppendProtocolLines(summary, runtimeOptions.Enabled && runtimeOptions.EnableDeviceWebSocket, externalHttpBases.Select(baseUrl => BuildWebSocketUrl(baseUrl, $"{AiApiConventions.PathBase}{deviceWebSocketEndpoint.Path}")));

        summary.AppendLine($"Local Speech Idle Timeout: {runtimeOptions.LocalSpeechIdleTimeoutMs} ms");

        summary.AppendLine("====================================================");

        Log.Information("{ExternalInterfaceSummary}", summary.ToString());
    }

    private static string[] BuildExternalHttpBases(IEnumerable<string> listenAddresses, string publicHost)
    {
        var bases = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        foreach (var address in listenAddresses)
        {
            if (!Uri.TryCreate(address, UriKind.Absolute, out var uri))
            {
                continue;
            }

            foreach (var host in ExpandExternalHosts(uri.Host, publicHost))
            {
                var builder = new UriBuilder(uri.Scheme, host, uri.IsDefaultPort ? -1 : uri.Port);
                bases.Add(builder.Uri.GetLeftPart(UriPartial.Authority).TrimEnd('/'));
            }
        }

        if (bases.Count == 0)
        {
            bases.Add(AiApiConventions.DefaultDevelopmentBaseUrl);
        }

        return bases.ToArray();
    }

    private static string[] BuildRuntimeHosts(string publicHost, IEnumerable<string> externalHttpBases)
    {
        var hosts = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        if (!string.IsNullOrWhiteSpace(publicHost))
        {
            hosts.Add(publicHost);
        }

        foreach (var baseUrl in externalHttpBases)
        {
            if (Uri.TryCreate(baseUrl, UriKind.Absolute, out var uri) && !string.IsNullOrWhiteSpace(uri.Host))
            {
                hosts.Add(uri.Host);
            }
        }

        if (hosts.Count == 0)
        {
            hosts.Add("localhost");
        }

        return hosts.ToArray();
    }

    private static IEnumerable<string> ExpandExternalHosts(string host, string publicHost)
    {
        if (!IsWildcardHost(host))
        {
            yield return host;
            yield break;
        }

        if (!string.IsNullOrWhiteSpace(publicHost))
        {
            yield return publicHost;
        }

        yield return "localhost";
    }

    private static bool IsWildcardHost(string host)
    {
        return host is "*" or "+" or "0.0.0.0" or "[::]" or "::";
    }

    private static string BuildWebSocketUrl(string httpBaseUrl, string path)
    {
        if (!Uri.TryCreate(httpBaseUrl, UriKind.Absolute, out var uri))
        {
            return path;
        }

        var builder = new UriBuilder(uri)
        {
            Scheme = string.Equals(uri.Scheme, Uri.UriSchemeHttps, StringComparison.OrdinalIgnoreCase) ? "wss" : "ws",
            Path = path
        };

        if ((builder.Scheme == "ws" && builder.Port == 80) || (builder.Scheme == "wss" && builder.Port == 443))
        {
            builder.Port = -1;
        }

        return builder.Uri.ToString().TrimEnd('/');
    }

    private static void AppendProtocolLines(StringBuilder summary, bool enabled, IEnumerable<string> lines)
    {
        if (!enabled)
        {
            summary.AppendLine("  - disabled");
            return;
        }

        AppendLines(summary, lines, "  - ", "  - (none)");
    }

    private static void AppendLines(StringBuilder summary, IEnumerable<string> lines, string prefix, string emptyLine)
    {
        var items = lines
            .Where(line => !string.IsNullOrWhiteSpace(line))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToArray();

        if (items.Length == 0)
        {
            summary.AppendLine(emptyLine);
            return;
        }

        foreach (var item in items)
        {
            summary.AppendLine($"{prefix}{item}");
        }
    }
}
