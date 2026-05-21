using AiAdmin.Data;
using AiAdmin.Services.Rbac;
using AiAdmin.TestBase;
using Microsoft.EntityFrameworkCore;
using Shouldly;
using Xunit;

namespace AiAdmin.Application.Tests.Services.Rbac;

public class PermissionServiceTests : AiAdminIntegratedTest
{
    private readonly PermissionService _permissionService;

    public PermissionServiceTests()
    {
        _permissionService = GetRequiredService<PermissionService>();
    }

    [Fact]
    public async Task Should_Return_Empty_Permissions_For_User_Without_Roles()
    {
        var permissions = await _permissionService.GetUserPermissionsAsync(99999);

        permissions.ShouldBeEmpty();
    }

    [Fact]
    public async Task Should_Return_Permissions_For_User_With_Role()
    {
        var user = await DataBuilder.SeedUserAsync("permuser");
        await DataBuilder.SeedMenuAsync(1001, "device:list", "Device List");
        await DataBuilder.SeedRoleAsync(1001, "operator", "Operator");
        await DataBuilder.SeedRoleMenuAsync(1001, 1001, 1001);
        await DataBuilder.SeedUserRoleAsync(1001, user.Id, 1001);

        var permissions = await _permissionService.GetUserPermissionsAsync(user.Id);

        permissions.ShouldContain("device:list");
    }

    [Fact]
    public async Task Should_Cache_Permissions_And_Return_From_Cache()
    {
        var user = await DataBuilder.SeedUserAsync("cacheuser");
        await DataBuilder.SeedMenuAsync(2001, "agent:read", "Agent Read");
        await DataBuilder.SeedRoleAsync(2001, "viewer", "Viewer");
        await DataBuilder.SeedRoleMenuAsync(2001, 2001, 2001);
        await DataBuilder.SeedUserRoleAsync(2001, user.Id, 2001);

        var firstCall = await _permissionService.GetUserPermissionsAsync(user.Id);
        var secondCall = await _permissionService.GetUserPermissionsAsync(user.Id);

        firstCall.ShouldContain("agent:read");
        secondCall.ShouldContain("agent:read");
        firstCall.ShouldBeEquivalentTo(secondCall);
    }

    [Fact]
    public async Task Should_Invalidate_Cache()
    {
        var user = await DataBuilder.SeedUserAsync("invalidcacheuser");
        await DataBuilder.SeedMenuAsync(3001, "billing:read", "Billing Read");
        await DataBuilder.SeedRoleAsync(3001, "finance", "Finance");
        await DataBuilder.SeedRoleMenuAsync(3001, 3001, 3001);
        await DataBuilder.SeedUserRoleAsync(3001, user.Id, 3001);

        var firstCall = await _permissionService.GetUserPermissionsAsync(user.Id);
        firstCall.ShouldContain("billing:read");

        var db = GetRequiredService<AiAdminDbContext>();
        var userRole = await db.SysUserRoles.FirstOrDefaultAsync(x => x.UserId == user.Id);
        db.SysUserRoles.Remove(userRole!);
        await db.SaveChangesAsync();
        await _permissionService.InvalidateUserPermCacheAsync(user.Id);

        var afterInvalidation = await _permissionService.GetUserPermissionsAsync(user.Id);
        afterInvalidation.ShouldBeEmpty();
    }

    [Fact]
    public async Task Should_Check_HasPermission_Correctly()
    {
        var user = await DataBuilder.SeedUserAsync("checkpermuser");
        await DataBuilder.SeedMenuAsync(4001, "admin:manage", "Admin Manage");
        await DataBuilder.SeedRoleAsync(4001, "admin", "Admin");
        await DataBuilder.SeedRoleMenuAsync(4001, 4001, 4001);
        await DataBuilder.SeedUserRoleAsync(4001, user.Id, 4001);

        (await _permissionService.HasPermissionAsync(user.Id, "admin:manage")).ShouldBeTrue();
        (await _permissionService.HasPermissionAsync(user.Id, "nonexistent:perm")).ShouldBeFalse();
    }
}
