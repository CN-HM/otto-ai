using AiAdmin.Data;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Admin.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Controllers;

/// <summary>
/// 管理员用户管理控制器
/// 提供用户分页查询、密码重置等管理功能
/// </summary>
[ApiController]
[Route("admin/users")]
public class AdminUserController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;

    /// <summary>创建管理员用户控制器实例</summary>
    public AdminUserController(AiAdminDbContext db)
    {
        _db = db;
    }

    /// <summary>分页查找用户</summary>
    [HttpGet]
    [Authorize]
    [RequirePermission("user:list")]
    public async Task<Result<PageData<AdminPageUserVo>>> PageUser(
        [FromQuery] string? mobile,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10)
    {
        var q = _db.SysUsers.AsQueryable();
        if (!string.IsNullOrEmpty(mobile))
            q = q.Where(x => x.Username.Contains(mobile));

        var total = await q.CountAsync();
        var users = await q
            .OrderByDescending(x => x.CreateDate)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync();

        var userIds = users.Select(u => u.Id).ToList();
        var deviceCounts = await _db.AiDevices
            .Where(d => d.UserId != null && userIds.Contains(d.UserId.Value))
            .GroupBy(d => d.UserId)
            .Select(g => new { UserId = g.Key, Count = g.Count() })
            .ToListAsync();

        var list = users.Select(u => new AdminPageUserVo
        {
            Userid = u.Id.ToString(),
            Mobile = u.Username,
            Status = (int)u.Status,
            CreateDate = u.CreateDate?.ToString("yyyy-MM-dd HH:mm:ss"),
            DeviceCount = deviceCounts.FirstOrDefault(d => d.UserId == u.Id)?.Count.ToString() ?? "0"
        }).ToList();

        return Result<PageData<AdminPageUserVo>>.Ok(new PageData<AdminPageUserVo>
        {
            Total = total,
            List = list
        });
    }

    /// <summary>重置密码</summary>
    [HttpPut("{id}")]
    [Authorize]
    [RequirePermission("user:reset-password")]
    public async Task<Result<string>> ResetPassword(long id)
    {
        var user = await _db.SysUsers.FindAsync(id);
        if (user == null)
            return Result<string>.Error("用户不存在");

        var newPwd = "Aa123456";
        user.Password = BCrypt.Net.BCrypt.HashPassword(newPwd);
        user.Updater = CurrentUserId;
        user.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Result<string>.Ok(newPwd);
    }

    /// <summary>用户删除</summary>
    [HttpDelete("{id}")]
    [Authorize]
    [RequirePermission("user:delete")]
    public async Task<Result<object>> Delete(long id)
    {
        var user = await _db.SysUsers.FindAsync(id);
        if (user == null)
            return Result<object>.Error("用户不存在");

        _db.SysUsers.Remove(user);
        await _db.SaveChangesAsync();

        return Result<object>.Ok();
    }

    /// <summary>批量修改用户状态</summary>
    [HttpPut("changeStatus/{status}")]
    [Authorize]
    [RequirePermission("user:change-status")]
    public async Task<Result<object>> ChangeStatus(int status, [FromBody] string[] ids)
    {
        var longIds = ids.Select(long.Parse).ToList();
        var users = await _db.SysUsers.Where(x => longIds.Contains(x.Id)).ToListAsync();

        foreach (var u in users)
        {
            u.Status = (short)status;
            u.Updater = CurrentUserId;
            u.UpdateDate = DateTime.UtcNow;
        }

        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>查询用户的智能体列表</summary>
    [HttpGet("agents/{userId}")]
    [Authorize]
    [RequirePermission("user:list")]
    public async Task<Result<PageData<object>>> PageAgent(
        long userId,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10)
    {
        var q = _db.AiAgents.Where(x => x.UserId == userId);
        var total = await q.CountAsync();
        var items = await q
            .OrderByDescending(x => x.CreatedAt)
            .Skip((page - 1) * limit)
            .Take(limit)
            .Select(x => (object)new { x.Id, x.AgentName, x.AgentCode, x.CreatedAt })
            .ToListAsync();

        return Result<PageData<object>>.Ok(new PageData<object> { Total = total, List = items });
    }
}
