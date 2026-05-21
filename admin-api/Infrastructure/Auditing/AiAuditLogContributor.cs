using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using AiAdmin.Infrastructure;
using Volo.Abp.Auditing;
using Volo.Abp.Data;

namespace AiAdmin.Infrastructure.Auditing;

public class AiAuditLogContributor : AuditLogContributor
{
    public override void PreContribute(AuditLogContributionContext context)
    {
        var httpContextAccessor = context.ServiceProvider.GetService<IHttpContextAccessor>();
        var claimsPrincipal = httpContextAccessor?.HttpContext?.User;
        if (claimsPrincipal == null)
        {
            return;
        }

        var userId = claimsPrincipal.GetUserIdValue();
        var username = claimsPrincipal.GetUsername();

        if (!string.IsNullOrWhiteSpace(userId))
        {
            context.AuditInfo.SetProperty("aiUserId", userId);
        }

        if (!string.IsNullOrWhiteSpace(username))
        {
            context.AuditInfo.UserName = username;
            context.AuditInfo.SetProperty("aiUserName", username);
        }

        if (claimsPrincipal.Identity?.IsAuthenticated == true)
        {
            context.AuditInfo.SetProperty("superAdmin", claimsPrincipal.IsSuperAdmin());
        }
    }
}
