using AiAdmin.Server.Endpoints;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Volo.Abp.Hangfire;

namespace AiAdmin.Infrastructure;

public static class AiApplicationBuilderExtensions
{
    public static IApplicationBuilder UseAiApiInfrastructure(this IApplicationBuilder app, IWebHostEnvironment environment)
    {
        app.UsePathBase(AiApiConventions.PathBase);

        if (environment.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }

        app.UseWebSockets();
        app.UseRequestLocalization();
        app.Use(async (context, next) =>
        {
            var endpoint = context.RequestServices.GetRequiredService<DeviceWebSocketEndpoint>();
            if (endpoint.IsEnabled && context.Request.Path.Equals(endpoint.Path, StringComparison.OrdinalIgnoreCase))
            {
                await endpoint.HandleAsync(context);
                return;
            }

            await next();
        });

        app.UseRouting();
        app.UseCors();
        app.UseAuthentication();
        app.UseAuthorization();
        app.UseAuditing();
        app.UseUnitOfWork();

        app.UseSwagger();
        app.UseAbpSwaggerUI(options =>
        {
            options.SwaggerEndpoint(AiApiConventions.SwaggerJsonPath, AiApiConventions.SwaggerDocumentTitle);
        });

        app.UseAbpSerilogEnrichers();
        app.UseAbpHangfireDashboard();
        app.UseConfiguredEndpoints();
        return app;
    }
}
