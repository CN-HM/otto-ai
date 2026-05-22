using AiAdmin.Infrastructure;
using AiAdmin.Services.Notifications;
using Hangfire;
using Volo.Abp;
using Volo.Abp.AspNetCore.Mvc;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.AuditLogging.EntityFrameworkCore;
using Volo.Abp.Autofac;
using Volo.Abp.EntityFrameworkCore.PostgreSql;
using Volo.Abp.BackgroundJobs.EntityFrameworkCore;
using Volo.Abp.BackgroundJobs.Hangfire;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
using Volo.Abp.Modularity;
using Volo.Abp.Swashbuckle;
using Microsoft.AspNetCore.Builder;

namespace AiAdmin;

/// <summary>
/// ABP模块配置类
/// 配置依赖注入、认证、MVC、Swagger、IoT运行时等核心服务
/// </summary>
[DependsOn(
    typeof(AbpAspNetCoreMvcModule),
    typeof(AbpAutofacModule),
    typeof(AbpSwashbuckleModule),
    typeof(AbpAspNetCoreSerilogModule),
    typeof(AbpEntityFrameworkCorePostgreSqlModule),
    typeof(AbpAuditLoggingEntityFrameworkCoreModule),
    typeof(AbpBackgroundJobsEntityFrameworkCoreModule),
    typeof(AbpBackgroundJobsHangfireModule),
    typeof(AbpSettingManagementEntityFrameworkCoreModule)
)]
public class AiAdminModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var configuration = context.Services.GetConfiguration();
        var hostingEnvironment = context.Services.GetHostingEnvironment();

        context.Services
            .AddAiEfCoreInfrastructure()
            .AddAiAuditingInfrastructure()
            .AddAiAuthenticationInfrastructure(configuration)
            .AddAiMvcInfrastructure()
            .AddAiSwaggerInfrastructure()
            .AddAiCorsInfrastructure(configuration)
            .AddAiLocalizationInfrastructure()
            .AddAiVirtualFileInfrastructure(hostingEnvironment)
            .AddAiCachingInfrastructure(configuration, hostingEnvironment)
            .AddAiHangfireInfrastructure(configuration)
            .AddAiIoTRuntimeInfrastructure(configuration)
            .AddAiSupportInfrastructure(configuration);
    }

    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        try
        {
            var app = context.GetApplicationBuilder();
            var env = context.GetEnvironment();
            app.UseAiApiInfrastructure(env);
        }
        catch (Exception ex)
        {
            // Skip middleware pipeline setup in integration test or non-web contexts
            // where required ASP.NET Core services may not be registered
            var logger = context.ServiceProvider.GetRequiredService<ILogger<AiAdminModule>>();
            logger.LogWarning(ex, "无法配置 ASP.NET Core 中间件管道，可能在集成测试环境中运行");
        }

        try
        {
            RecurringJob.AddOrUpdate<TodoScanBackgroundJob>(
                "todo-execution-scan",
                job => job.ScanAndExecuteAsync(CancellationToken.None),
                "*/1 * * * *");
        }
        catch (Exception ex)
        {
            // 旧实例崩溃后残留的分布式锁可能需要 10-30 秒才能释放，启动时不阻塞
            var logger = context.ServiceProvider.GetRequiredService<ILogger<AiAdminModule>>();
            logger.LogWarning(ex, "无法获取 Hangfire 分布式锁以注册定时任务，可能是旧实例锁残留");
        }
    }
}
