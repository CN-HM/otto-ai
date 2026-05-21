using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Rbac;
using AiAdmin.Services.Rbac.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Controllers;

/// <summary>
/// 角色管理控制器
/// 提供角色CRUD、权限分配、角色成员管理功能
/// </summary>
[ApiController]
[Route("system/roles")]
[Authorize]
public class RoleController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    /// <summary>权限服务</summary>
    private readonly PermissionService _permissionService;

    /// <summary>创建角色控制器实例</summary>
    public RoleController(AiAdminDbContext db, PermissionService permissionService)
    {
        _db = db;
        _permissionService = permissionService;
    }

    /// <summary>角色列表</summary>
    [HttpGet]
    [RequirePermission("role:list")]
    public async Task<Result<PageData<RoleDto>>> List(
        [FromQuery] string? name,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10)
    {
        var q = _db.SysRoles.AsQueryable();
        if (!string.IsNullOrEmpty(name))
            q = q.Where(r => r.Name.Contains(name));

        var total = await q.CountAsync();
        var items = await q
            .OrderBy(r => r.Sort)
            .Skip((page - 1) * limit)
            .Take(limit)
            .Select(r => new RoleDto
            {
                Id = r.Id,
                Name = r.Name,
                Code = r.Code,
                Remark = r.Remark,
                Status = r.Status,
                Sort = r.Sort,
                CreateDate = r.CreateDate
            })
            .ToListAsync();

        return Result<PageData<RoleDto>>.Ok(new PageData<RoleDto> { Total = total, List = items });
    }

    /// <summary>全部角色（用于分配）</summary>
    [HttpGet("all")]
    [RequirePermission("role:list")]
    public async Task<Result<List<RoleDto>>> All()
    {
        var list = await _db.SysRoles
            .Where(r => r.Status == 1)
            .OrderBy(r => r.Sort)
            .Select(r => new RoleDto
            {
                Id = r.Id,
                Name = r.Name,
                Code = r.Code,
                Remark = r.Remark,
                Status = r.Status,
                Sort = r.Sort,
                CreateDate = r.CreateDate
            })
            .ToListAsync();

        return Result<List<RoleDto>>.Ok(list);
    }

    /// <summary>创建角色</summary>
    [HttpPost]
    [RequirePermission("role:create")]
    public async Task<Result<object>> Create([FromBody] RoleCreateDto dto)
    {
        if (await _db.SysRoles.AnyAsync(r => r.Code == dto.Code))
            return Result<object>.Error("Error:RoleCodeExists");

        _db.SysRoles.Add(new SysRole
        {
            Id = IdGenerator.NewLongId(),
            Name = dto.Name,
            Code = dto.Code,
            Remark = dto.Remark,
            Status = dto.Status,
            Sort = dto.Sort,
            Creator = CurrentUserId,
            CreateDate = DateTime.UtcNow,
            Updater = CurrentUserId,
            UpdateDate = DateTime.UtcNow
        });
        await _db.SaveChangesAsync();

        return Result<object>.Ok();
    }

    /// <summary>更新角色</summary>
    [HttpPut("{id}")]
    [RequirePermission("role:update")]
    public async Task<Result<object>> Update(long id, [FromBody] RoleUpdateDto dto)
    {
        var role = await _db.SysRoles.FindAsync(id);
        if (role == null)
            return Result<object>.Error("角色不存在");

        if (await _db.SysRoles.AnyAsync(r => r.Code == dto.Code && r.Id != id))
            return Result<object>.Error("Error:RoleCodeExists");

        role.Name = dto.Name;
        role.Code = dto.Code;
        role.Remark = dto.Remark;
        role.Status = dto.Status;
        role.Sort = dto.Sort;
        role.Updater = CurrentUserId;
        role.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Result<object>.Ok();
    }

    /// <summary>删除角色</summary>
    [HttpDelete("{id}")]
    [RequirePermission("role:delete")]
    public async Task<Result<object>> Delete(long id)
    {
        var role = await _db.SysRoles.FindAsync(id);
        if (role == null)
            return Result<object>.Error("角色不存在");

        if (role.Code == "admin")
            return Result<object>.Error("内置超级管理员角色不允许删除");

        // 检查是否有用户关联
        if (await _db.SysUserRoles.AnyAsync(ur => ur.RoleId == id))
            return Result<object>.Error("该角色已分配给用户，请先取消分配");

        // 删除角色菜单关联
        var roleMenus = await _db.SysRoleMenus.Where(rm => rm.RoleId == id).ToListAsync();
        _db.SysRoleMenus.RemoveRange(roleMenus);

        _db.SysRoles.Remove(role);
        await _db.SaveChangesAsync();

        return Result<object>.Ok();
    }

    /// <summary>获取角色的菜单ID列表</summary>
    [HttpGet("{id}/menus")]
    [RequirePermission("role:assign-permission")]
    public async Task<Result<List<long>>> GetRoleMenus(long id)
    {
        var menuIds = await _db.SysRoleMenus
            .Where(rm => rm.RoleId == id)
            .Select(rm => rm.MenuId)
            .ToListAsync();

        return Result<List<long>>.Ok(menuIds);
    }

    /// <summary>分配角色菜单权限</summary>
    [HttpPut("{id}/menus")]
    [RequirePermission("role:assign-permission")]
    public async Task<Result<object>> AssignMenus(long id, [FromBody] RoleMenuAssignDto dto)
    {
        if (!await _db.SysRoles.AnyAsync(r => r.Id == id))
            return Result<object>.Error("角色不存在");

        // 删除旧关联
        var oldMenus = await _db.SysRoleMenus.Where(rm => rm.RoleId == id).ToListAsync();
        _db.SysRoleMenus.RemoveRange(oldMenus);

        // 添加新关联
        var newMenus = dto.MenuIds.Select(menuId => new SysRoleMenu
        {
            Id = IdGenerator.NewLongId(),
            RoleId = id,
            MenuId = menuId
        }).ToList();
        _db.SysRoleMenus.AddRange(newMenus);

        await _db.SaveChangesAsync();

        // 清除该角色下所有用户的权限缓存
        await _permissionService.InvalidateRolePermCacheAsync(id);

        return Result<object>.Ok();
    }

    /// <summary>完整菜单树（用于角色权限配置）</summary>
    [HttpGet("menu-tree")]
    [RequirePermission("role:assign-permission")]
    public async Task<Result<List<MenuTreeDto>>> MenuTree()
    {
        var tree = await _permissionService.GetAllMenuTreeAsync();
        return Result<List<MenuTreeDto>>.Ok(tree);
    }

    /// <summary>获取用户的角色ID列表</summary>
    [HttpGet("user/{userId}")]
    [RequirePermission("user:assign-role")]
    public async Task<Result<List<long>>> GetUserRoles(long userId)
    {
        var roleIds = await _db.SysUserRoles
            .Where(ur => ur.UserId == userId)
            .Select(ur => ur.RoleId)
            .ToListAsync();

        return Result<List<long>>.Ok(roleIds);
    }

    /// <summary>分配用户角色</summary>
    [HttpPut("user/{userId}")]
    [RequirePermission("user:assign-role")]
    public async Task<Result<object>> AssignUserRoles(long userId, [FromBody] UserRoleAssignDto dto)
    {
        if (!await _db.SysUsers.AnyAsync(u => u.Id == userId))
            return Result<object>.Error("用户不存在");

        // 删除旧关联
        var oldRoles = await _db.SysUserRoles.Where(ur => ur.UserId == userId).ToListAsync();
        _db.SysUserRoles.RemoveRange(oldRoles);

        // 添加新关联
        var newRoles = dto.RoleIds.Select(roleId => new SysUserRole
        {
            Id = IdGenerator.NewLongId(),
            UserId = userId,
            RoleId = roleId
        }).ToList();
        _db.SysUserRoles.AddRange(newRoles);

        await _db.SaveChangesAsync();

        // 清除该用户的权限缓存
        await _permissionService.InvalidateUserPermCacheAsync(userId);

        return Result<object>.Ok();
    }
}
