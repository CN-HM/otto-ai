using System.Linq.Expressions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AiAdmin.Infrastructure;

namespace AiAdmin.Controllers;

/// <summary>
/// 控制器基类，所有API控制器应继承此类
/// 提供当前用户ID、用户名、超级管理员判断等通用属性
/// Action 返回值会自动包装为 Result&lt;T&gt;.Ok(data)（若尚未是 Result&lt;T&gt;）
/// </summary>
[ApiController]
[TypeFilter(typeof(AutoResultFilter))]
public abstract class AiAdminBaseController : ControllerBase
{
    /// <summary>当前登录用户ID，从JWT的sub或NameIdentifier声明解析</summary>
    protected long CurrentUserId => User.GetUserId();

    /// <summary>当前登录用户名，从JWT的name声明解析</summary>
    protected string CurrentUsername =>
        User.GetUsername();

    /// <summary>是否为超级管理员，从JWT的superAdmin声明判断</summary>
    protected bool IsSuperAdmin =>
        User.IsSuperAdmin();

    protected bool HasOwnerAccess(long ownerUserId)
    {
        return ownerUserId == CurrentUserId || IsSuperAdmin;
    }

    protected bool HasOwnerAccess(long? ownerUserId)
    {
        return ownerUserId.HasValue ? HasOwnerAccess(ownerUserId.Value) : IsSuperAdmin;
    }

    /// <summary>
    /// 通用"查实体 → 不存在校验 → 权限校验"三连辅助。
    /// 适用于 CRUD 操作中反复出现的先查后验模式。
    /// </summary>
    /// <returns>(entity, null) 表示通过；(_, errorResult) 表示失败，直接返回 errorResult 即可</returns>
    protected async Task<(TEntity Entity, Result<TResult>? Error)> ResolveOwnedEntityAsync<TEntity, TResult>(
        IQueryable<TEntity> source,
        Expression<Func<TEntity, bool>> predicate,
        Func<TEntity, long?> ownerSelector,
        string entityName = "记录")
        where TEntity : class
    {
        var entity = await source.FirstOrDefaultAsync(predicate);
        if (entity == null)
            return (null!, Result<TResult>.Error($"{entityName}不存在"));
        if (!HasOwnerAccess(ownerSelector(entity)))
            return (null!, Result<TResult>.Error("无权操作"));
        return (entity, null);
    }
}
