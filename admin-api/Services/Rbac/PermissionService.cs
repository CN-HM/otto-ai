using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using AiAdmin.Data;
using AiAdmin.Services.Rbac.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Rbac;

/// <summary>
/// 权限服务，管理用户权限和角色菜单关系
/// 使用Redis缓存权限数据，TTL 30分钟
/// </summary>
public class PermissionService : ITransientDependency
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    /// <summary>分布式缓存（Redis）</summary>
    private readonly IDistributedCache _cache;
    /// <summary>权限缓存TTL（30分钟）</summary>
    private static readonly TimeSpan PermCacheTtl = TimeSpan.FromMinutes(30);

    /// <summary>创建权限服务实例</summary>
    public PermissionService(AiAdminDbContext db, IDistributedCache cache)
    {
        _db = db;
        _cache = cache;
    }

    /// <summary>获取用户的所有权限码（带缓存）</summary>
    public async Task<List<string>> GetUserPermissionsAsync(long userId)
    {
        var cacheKey = $"perm:user:{userId}";
        var cached = await _cache.GetStringAsync(cacheKey);
        if (cached != null)
            return JsonSerializer.Deserialize<List<string>>(cached) ?? [];

        var permissions = await _db.SysUserRoles
            .Where(ur => ur.UserId == userId)
            .Join(_db.SysRoleMenus, ur => ur.RoleId, rm => rm.RoleId, (ur, rm) => rm.MenuId)
            .Join(_db.SysMenus, menuId => menuId, m => m.Id, (_, m) => m.Code)
            .Distinct()
            .ToListAsync();

        await _cache.SetStringAsync(cacheKey, JsonSerializer.Serialize(permissions),
            new DistributedCacheEntryOptions { AbsoluteExpirationRelativeToNow = PermCacheTtl });

        return permissions;
    }

    /// <summary>判断用户是否拥有指定权限（复用缓存）</summary>
    public async Task<bool> HasPermissionAsync(long userId, string permCode)
    {
        var permissions = await GetUserPermissionsAsync(userId);
        return permissions.Contains(permCode);
    }

    /// <summary>清除指定用户的权限缓存</summary>
    public async Task InvalidateUserPermCacheAsync(long userId)
    {
        await _cache.RemoveAsync($"perm:user:{userId}");
    }

    /// <summary>清除角色下所有用户的权限缓存</summary>
    public async Task InvalidateRolePermCacheAsync(long roleId)
    {
        var userIds = await _db.SysUserRoles
            .Where(ur => ur.RoleId == roleId)
            .Select(ur => ur.UserId)
            .ToListAsync();
        foreach (var uid in userIds)
            await _cache.RemoveAsync($"perm:user:{uid}");
    }

    /// <summary>获取全量菜单树（管理用）</summary>
    public async Task<List<MenuTreeDto>> GetAllMenuTreeAsync()
    {
        var menus = await _db.SysMenus
            .Where(m => m.Status == 1)
            .OrderBy(m => m.Sort)
            .ToListAsync();

        return BuildTree(menus, null);
    }

    /// <summary>获取用户的角色代码列表</summary>
    public async Task<List<string>> GetUserRoleCodesAsync(long userId)
    {
        return await _db.SysUserRoles
            .Where(ur => ur.UserId == userId)
            .Join(_db.SysRoles, ur => ur.RoleId, r => r.Id, (_, r) => r.Code)
            .ToListAsync();
    }

    /// <summary>
    /// 递归构建菜单树结构
    /// </summary>
    /// <param name="menus">菜单列表</param>
    /// <param name="parentId">父菜单ID，null表示根节点</param>
    /// <returns>树形结构的菜单DTO列表</returns>
    private static List<MenuTreeDto> BuildTree(List<Entities.SysMenu> menus, long? parentId)
    {
        return menus
            .Where(m => m.ParentId == parentId)
            .Select(m => new MenuTreeDto
            {
                Id = m.Id,
                ParentId = m.ParentId,
                Name = m.Name,
                Code = m.Code,
                Type = m.Type,
                Sort = m.Sort,
                Children = BuildTree(menus, m.Id)
            })
            .ToList();
    }
}
