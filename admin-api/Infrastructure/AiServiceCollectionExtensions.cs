using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;
using AiAdmin.Config;
using AiAdmin.Data;
using AiAdmin.Infrastructure.Auditing;
using AiAdmin.Localization;
using AiAdmin.Protocol.Mqtt;
using AiAdmin.Protocol.Runtime;
using AiAdmin.Server.Cluster;
using AiAdmin.Server.Endpoints;
using AiAdmin.Server.HostedServices;
using AiAdmin.Services.Knowledge;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Settings;
using Hangfire;
using Hangfire.PostgreSql;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Caching.StackExchangeRedis;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi;
using Volo.Abp.Auditing;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.PostgreSql;
using Volo.Abp.Hangfire;
using Volo.Abp.Localization;
using Volo.Abp.Swashbuckle;
using Volo.Abp.VirtualFileSystem;

namespace AiAdmin.Infrastructure;

public static class AiServiceCollectionExtensions
{
    private static readonly Regex SwaggerSchemaIdInvalidChars = new("[^a-zA-Z0-9._-]", RegexOptions.Compiled);

    public static IServiceCollection AddAiEfCoreInfrastructure(this IServiceCollection services)
    {
        services.AddAbpDbContext<AiAdminDbContext>(options =>
        {
            options.AddDefaultRepositories(includeAllEntities: true);
        });

        services.Configure<AbpDbContextOptions>(options =>
        {
            options.Configure(configurationContext =>
            {
                configurationContext.UseNpgsql();
            });
        });

        return services;
    }

    public static IServiceCollection AddAiAuditingInfrastructure(this IServiceCollection services)
    {
        services.Configure<AbpAuditingOptions>(options =>
        {
            options.ApplicationName = "AiAdmin";
            options.EntityHistorySelectors.AddAllEntities();
            options.Contributors.Add(new AiAuditLogContributor());
        });

        services.AddHttpContextAccessor();
        return services;
    }

    public static IServiceCollection AddAiAuthenticationInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = configuration["Jwt:Issuer"],
                    ValidAudience = configuration["Jwt:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:SecretKey"]!))
                };
            });

        return services;
    }

    public static IServiceCollection AddAiMvcInfrastructure(this IServiceCollection services)
    {
        services.AddControllers(options =>
        {
            options.Filters.Add<GlobalExceptionFilter>();
            options.Filters.Add<IotResultFilter>();
            options.Filters.Add<PermissionAuthorizationFilter>();
        }).AddJsonOptions(options =>
        {
            options.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
            options.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
        });

        return services;
    }

    public static IServiceCollection AddAiSwaggerInfrastructure(this IServiceCollection services)
    {
        services.AddAbpSwaggerGen(options =>
        {
            options.SwaggerDoc(AiApiConventions.SwaggerDocumentName, new OpenApiInfo
            {
                Title = AiApiConventions.SwaggerDocumentTitle,
                Version = AiApiConventions.SwaggerDocumentName
            });
            options.DocInclusionPredicate((_, _) => true);
            options.CustomSchemaIds(GetSwaggerSchemaId);
        });

        return services;
    }

    public static IServiceCollection AddAiCorsInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddCors(options =>
        {
            options.AddDefaultPolicy(builder =>
            {
                builder
                    .WithOrigins(
                        configuration["App:CorsOrigins"]?
                            .Split(',', StringSplitOptions.RemoveEmptyEntries)
                            .Select(origin => origin.TrimEnd('/'))
                            .ToArray() ?? Array.Empty<string>())
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowCredentials();
            });
        });

        return services;
    }

    public static IServiceCollection AddAiLocalizationInfrastructure(this IServiceCollection services)
    {
        services.AddScoped<LocalizedMessageResolver>();

        services.Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Add<AiAdminResource>("zh-Hans")
                .AddVirtualJson("/Localization/AiAdmin");

            options.DefaultResourceType = typeof(AiAdminResource);
            options.Languages.Add(new LanguageInfo("zh-Hans", "zh-Hans", "简体中文"));
            options.Languages.Add(new LanguageInfo("zh-TW", "zh-TW", "繁體中文"));
            options.Languages.Add(new LanguageInfo("zh-Hant", "zh-Hant", "繁體中文"));
            options.Languages.Add(new LanguageInfo("en", "en", "English"));
        });

        return services;
    }

    public static IServiceCollection AddAiVirtualFileInfrastructure(this IServiceCollection services, IWebHostEnvironment hostingEnvironment)
    {
        services.Configure<AbpVirtualFileSystemOptions>(options =>
        {
            options.FileSets.AddEmbedded<AiAdminModule>();
            if (hostingEnvironment.IsDevelopment())
            {
                options.FileSets.ReplaceEmbeddedByPhysical<AiAdminModule>(hostingEnvironment.ContentRootPath);
            }
        });

        return services;
    }

    public static IServiceCollection AddAiCachingInfrastructure(this IServiceCollection services, IConfiguration configuration, IWebHostEnvironment hostingEnvironment)
    {
        var useInMemoryCache = configuration.GetValue<bool>("Cache:UseInMemory") || hostingEnvironment.IsDevelopment();

        if (useInMemoryCache)
        {
            services.AddDistributedMemoryCache();
            return services;
        }

        services.AddStackExchangeRedisCache(options =>
        {
            options.Configuration = configuration["Redis:Configuration"];
        });

        return services;
    }

    public static IServiceCollection AddAiHangfireInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("Default");
        if (!string.IsNullOrWhiteSpace(connectionString))
        {
            services.AddHangfire(config =>
            {
                config.UsePostgreSqlStorage(
                    options => options.UseNpgsqlConnection(connectionString),
                    new PostgreSqlStorageOptions
                    {
                        DistributedLockTimeout = TimeSpan.FromSeconds(10)
                    });
            });
        }

        services.Configure<AbpHangfireOptions>(options =>
        {
            options.ServerOptions = new BackgroundJobServerOptions
            {
                Queues = ["default", "memory-extraction"]
            };
        });

        return services;
    }

    public static IServiceCollection AddAiIoTRuntimeInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSingleton<IValidateOptions<IoTRuntimeOptions>, IoTRuntimeOptionsValidator>();
        services.AddOptions<IoTRuntimeOptions>()
            .Bind(configuration.GetSection(IoTRuntimeOptions.SectionName))
            .ValidateOnStart();

        services.AddSingleton<IServerAddressProvider, ServerAddressProvider>();
        services.AddSingleton<INodeIdentityProvider, NodeIdentityProvider>();
        services.AddSingleton<IDistributedSessionDirectory, DistributedSessionDirectory>();
        services.AddSingleton<DeviceConnectionManager>();
        services.AddSingleton<ConversationRuntimeTraceAggregator>();
        services.AddSingleton<MqttAuthHandler>();
        services.AddSingleton<MqttMessageDispatcher>();
        services.AddSingleton<MqttBrokerService>();
        services.AddSingleton<UdpHostedService>();
        services.AddSingleton<NodeHeartbeatHostedService>();
        services.AddSingleton<DeviceWebSocketHostedService>();
        services.AddSingleton<DeviceWebSocketEndpoint>();

        services.AddHostedService(sp => sp.GetRequiredService<NodeHeartbeatHostedService>());
        services.AddHostedService(sp => sp.GetRequiredService<MqttBrokerService>());
        services.AddHostedService(sp => sp.GetRequiredService<UdpHostedService>());
        services.AddHostedService(sp => sp.GetRequiredService<DeviceWebSocketHostedService>());
        return services;
    }

    public static IServiceCollection AddAiSupportInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSingleton<Services.Auth.JwtTokenService>();
        services.AddHttpClient();
        services.AddHttpClient<Services.Auth.SmsService>();
        services.AddHttpClient<Services.Auth.TurnstileService>();
        services.Configure<Services.Auth.TurnstileOptions>(configuration.GetSection("Turnstile"));
        services.AddMemoryCache();
        services.AddHostedService<KnowledgeDocumentIndexingWorker>();
        return services;
    }

    private static string GetSwaggerSchemaId(Type type)
    {
        if (!type.IsGenericType)
        {
            return SanitizeSwaggerSchemaId(type.FullName ?? type.Name);
        }

        var genericTypeName = type.GetGenericTypeDefinition().FullName ?? type.Name;
        var tickIndex = genericTypeName.IndexOf('`');
        if (tickIndex >= 0)
        {
            genericTypeName = genericTypeName[..tickIndex];
        }

        var genericArguments = string.Join("_", type.GetGenericArguments().Select(GetSwaggerSchemaId));
        return SanitizeSwaggerSchemaId($"{genericTypeName}_{genericArguments}");
    }

    private static string SanitizeSwaggerSchemaId(string value)
    {
        return SwaggerSchemaIdInvalidChars.Replace(value.Replace('+', '.'), "_");
    }
}
