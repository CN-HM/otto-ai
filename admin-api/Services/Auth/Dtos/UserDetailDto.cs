namespace AiAdmin.Services.Auth.Dtos;

/// <summary>用户详情DTO</summary>
public class UserDetailDto
{
    /// <summary>用户ID</summary>
    public long Id { get; set; }
    /// <summary>用户名</summary>
    public string? Username { get; set; }
    /// <summary>是否超级管理员</summary>
    public short SuperAdmin { get; set; }
    /// <summary>访问令牌</summary>
    public string? Token { get; set; }
    /// <summary>用户状态</summary>
    public short Status { get; set; }
}

