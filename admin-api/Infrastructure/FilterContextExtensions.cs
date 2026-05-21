using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;

namespace AiAdmin.Infrastructure;

public static class FilterContextExtensions
{
    public static void SetUnauthorizedResult(this AuthorizationFilterContext context, string message = "未授权")
    {
        context.Result = new UnauthorizedObjectResult(Result.Error(ResolveMessage(context, message), 401));
    }

    public static void SetForbiddenResult(this AuthorizationFilterContext context, string message = "无权限访问")
    {
        context.Result = new ObjectResult(Result.Error(ResolveMessage(context, message), 403))
        {
            StatusCode = 403
        };
    }

    private static string ResolveMessage(AuthorizationFilterContext context, string message)
    {
        return context.HttpContext.RequestServices.GetService<LocalizedMessageResolver>()?.Resolve(message) ?? message;
    }
}
