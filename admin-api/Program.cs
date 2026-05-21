using AiAdmin.Infrastructure;
using Serilog;

namespace AiAdmin;

/// <summary>
/// 应用程序入口类
/// 配置日志、数据库自动迁移、种子数据初始化
/// </summary>
public class Program
{
    public async static Task<int> Main(string[] args)
    {
        Log.Logger = new LoggerConfiguration()
            .WriteTo.Async(c => c.File("Logs/log-.txt", rollingInterval: RollingInterval.Day, retainedFileCountLimit: 30))
            .WriteTo.Async(c => c.Console())
            .CreateBootstrapLogger();

        AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

        try
        {
            var builder = WebApplication.CreateBuilder(args);

            // Listen on port 8002 in dev, otherwise use ASPNETCORE_URLS
            builder.AddAiHostDefaults();

            await builder.AddApplicationAsync<AiAdminModule>();
            var app = builder.Build();
            await app.InitializeAiAppAsync();
            return await app.StartAiAppAsync();
        }
        catch (Exception ex)
        {
            if (ex is HostAbortedException)
            {
                throw;
            }

            Log.Fatal(ex, "AiAdmin terminated unexpectedly!");
            return 1;
        }
        finally
        {
            Log.CloseAndFlush();
        }
    }
}
