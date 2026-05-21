using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NSubstitute;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.Sqlite;
using Volo.Abp.Modularity;

namespace AiAdmin.TestBase;

[DependsOn(
    typeof(AiAdminModule),
    typeof(AbpEntityFrameworkCoreSqliteModule)
)]
public class AiAdminTestBaseModule : AbpModule
{
    public override void PreConfigureServices(ServiceConfigurationContext context)
    {
        // Register IWebHostEnvironment early so it's available when
        // AiAdminModule.ConfigureServices resolves it (runs later).
        var env = Substitute.For<IWebHostEnvironment>();
        env.EnvironmentName.Returns(Environments.Development);
        env.ContentRootPath.Returns(Directory.GetCurrentDirectory());
        context.Services.AddSingleton(env);
    }

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var sqliteConnection = new SqliteConnection("Data Source=:memory:");
        sqliteConnection.Open();
        context.Services.AddSingleton(sqliteConnection);

        context.Services.Configure<AbpDbContextOptions>(options =>
        {
            options.Configure(configurationContext =>
            {
                configurationContext.DbContextOptions.UseSqlite(sqliteConnection);
            });
        });

        // Provide a mock Hangfire JobStorage to prevent resolution failures
        // during ABP module initialization when no real Hangfire storage is configured
        context.Services.AddSingleton(Substitute.For<global::Hangfire.JobStorage>());

        // Provide IApplicationBuilder for AiAdminModule.OnApplicationInitialization
        // which calls UseAiApiInfrastructure in non-web integration test context
        context.Services.AddSingleton<IApplicationBuilder>(new TestApplicationBuilder());
    }

    public override void OnPreApplicationInitialization(ApplicationInitializationContext context)
    {
        // Create database schema before any other module's OnApplicationInitialization
        // opens transactions on the SQLite connection.
        var dbContext = context.ServiceProvider.GetRequiredService<Data.AiAdminDbContext>();
        dbContext.Database.EnsureCreated();
    }
}
