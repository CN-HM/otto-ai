using AiAdmin.Services.Runtime;
using Microsoft.AspNetCore.Mvc.Filters;

namespace AiAdmin.Infrastructure;

[AttributeUsage(AttributeTargets.Method | AttributeTargets.Class)]
public class DeviceCredentialAuthAttribute : Attribute, IAsyncAuthorizationFilter
{
    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    {
        var service = context.HttpContext.RequestServices.GetRequiredService<DeviceCredentialService>();
        var result = await service.AuthenticateHttpRequestAsync(context.HttpContext.Request, context.HttpContext.RequestAborted);
        if (!result.Success || result.Context == null)
        {
            context.SetUnauthorizedResult(result.ErrorMessage ?? "设备认证失败");
            return;
        }

        context.HttpContext.Items[DeviceCredentialService.HttpContextItemKey] = result.Context;
    }
}

public static class DeviceCredentialHttpContextExtensions
{
    public static DeviceCredentialContext? GetAuthenticatedDeviceCredential(this HttpContext httpContext)
    {
        return httpContext.Items.TryGetValue(DeviceCredentialService.HttpContextItemKey, out var value)
            ? value as DeviceCredentialContext
            : null;
    }
}
