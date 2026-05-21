using Microsoft.AspNetCore.Mvc.Filters;

namespace AiAdmin.Infrastructure;

/// <summary>
/// 服务间认证过滤器。支持两种认证方式：
/// 1. JWT Bearer Token（前端/用户调用）
/// 2. Service Secret（Python 服务调用）— Authorization: Bearer {ServiceAuth:Secret}
/// 只要任一方式通过即放行。
/// </summary>
[AttributeUsage(AttributeTargets.Method | AttributeTargets.Class)]
public class ServiceAuthAttribute : Attribute, IAsyncAuthorizationFilter
{
    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    {
        // 方式 1: JWT 已认证
        if (context.HttpContext.User.Identity?.IsAuthenticated == true)
            return;

        // 方式 2: Service Secret
        var config = context.HttpContext.RequestServices.GetRequiredService<IConfiguration>();
        var secret = config["ServiceAuth:Secret"];

        if (string.IsNullOrEmpty(secret))
        {
            context.SetUnauthorizedResult("ServiceAuth:Secret 未配置");
            return;
        }

        var token = context.HttpContext.Request.GetBearerToken();
        if (!string.IsNullOrEmpty(token) && string.Equals(token, secret, StringComparison.Ordinal))
        {
            return;
        }

        context.SetUnauthorizedResult();
        await Task.CompletedTask;
    }
}
