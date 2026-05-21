using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
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
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var sqliteConnection = CreateInMemorySqliteConnection();
        context.Services.AddSingleton(sqliteConnection);

        context.Services.Configure<AbpDbContextOptions>(options =>
        {
            options.Configure(configurationContext =>
            {
                configurationContext.DbContextOptions.UseSqlite(sqliteConnection);
            });
        });
    }

    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        var dbContext = context.ServiceProvider.GetRequiredService<Data.AiAdminDbContext>();
        dbContext.Database.EnsureCreated();
    }

    private static SqliteConnection CreateInMemorySqliteConnection()
    {
        var connection = new SqliteConnection("Data Source=:memory:");
        connection.Open();
        return connection;
    }
}
