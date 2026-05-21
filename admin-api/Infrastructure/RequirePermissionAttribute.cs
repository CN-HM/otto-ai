namespace AiAdmin.Infrastructure;

/// <summary>
/// 权限要求特性，用于标记需要特定权限才能访问的方法或类
/// 支持在方法或类级别标记，允许多个权限组合
/// </summary>
[AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, AllowMultiple = true)]
public class RequirePermissionAttribute : Attribute
{
    /// <summary>权限代码</summary>
    public string PermissionCode { get; }

    /// <summary>创建权限要求特性</summary>
    /// <param name="permissionCode">权限代码，如 "agent:create"、"device:delete"</param>
    public RequirePermissionAttribute(string permissionCode)
    {
        PermissionCode = permissionCode;
    }
}
