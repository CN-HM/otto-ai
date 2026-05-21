namespace AiAdmin.Services.Rbac.Dtos;

/// <summary>用户信息DTO（包含角色和权限）</summary>
public class UserInfoDto
{
    /// <summary>用户ID</summary>
    public long Id { get; set; }
    /// <summary>用户名</summary>
    public string? Username { get; set; }
    /// <summary>是否超级管理员</summary>
    public short SuperAdmin { get; set; }
    /// <summary>用户状态</summary>
    public short Status { get; set; }
    /// <summary>角色列表</summary>
    public List<string> Roles { get; set; } = [];
    /// <summary>权限列表</summary>
    public List<string> Permissions { get; set; } = [];
}

