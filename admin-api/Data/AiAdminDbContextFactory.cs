using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace AiAdmin.Data;

/// <summary>
/// 数据库上下文工厂
/// 用于设计时（Design-Time）创建DbContext实例，支持EF Core迁移命令
/// </summary>
public class AiAdminDbContextFactory : IDesignTimeDbContextFactory<AiAdminDbContext>
{
    public AiAdminDbContext CreateDbContext(string[] args)
    {
        AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
        var environmentName = Environment.GetEnvironmentVariable("DOTNET_ENVIRONMENT")
                              ?? Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT")
                              ?? "Development";

        var configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", optional: false)
            .AddJsonFile($"appsettings.{environmentName}.json", optional: true)
            .AddEnvironmentVariables()
            .Build();

        var builder = new DbContextOptionsBuilder<AiAdminDbContext>()
            .UseNpgsql(configuration.GetConnectionString("Default"));

        return new AiAdminDbContext(builder.Options);
    }
}