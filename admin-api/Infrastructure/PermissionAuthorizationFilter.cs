using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using AiAdmin.Services.Rbac;

namespace AiAdmin.Infrastructure;

/// <summary>
/// 权限检查过滤器：检查 Controller/Action 上的 [RequirePermission] 标记，
/// 超管(SuperAdmin = true)自动放行，否则查询数据库验证权限。
/// </summary>
public class PermissionAuthorizationFilter : IAsyncAuthorizationFilter
{
    /// <summary>权限服务，用于验证用户权限</summary>
    private readonly PermissionService _permissionService;

    /// <summary>创建权限授权过滤器实例</summary>
    public PermissionAuthorizationFilter(PermissionService permissionService)
    {
        _permissionService = permissionService;
    }

    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    {
        // 收集 Controller 和 Action 上的所有 RequirePermission 属性
        var endpoint = context.HttpContext.GetEndpoint();
        var attributes = endpoint?.Metadata.GetOrderedMetadata<RequirePermissionAttribute>();

        if (attributes == null || attributes.Count == 0)
            return;

        var user = context.HttpContext.User;
        if (user.Identity?.IsAuthenticated != true)
        {
            context.SetUnauthorizedResult();
            return;
        }

        // 超管直接放行
        if (user.IsSuperAdmin())
            return;

        var userId = user.GetUserId();
        if (userId == 0)
        {
            context.SetUnauthorizedResult();
            return;
        }

        // 检查所有要求的权限
        foreach (var attr in attributes)
        {
            if (!await _permissionService.HasPermissionAsync(userId, attr.PermissionCode))
            {
                context.SetForbiddenResult();
                return;
            }
        }
    }
}
