using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Volo.Abp.Guids;

namespace AiAdmin.Services.Auth;

/// <summary>
/// JWT令牌服务，负责生成和验证访问令牌
/// 使用HS256对称加密算法签名
/// </summary>
public class JwtTokenService
{
    /// <summary>应用配置，用于读取JWT密钥和过期时间</summary>
    private readonly IConfiguration _configuration;
    private readonly IGuidGenerator _guidGenerator;

    /// <summary>创建JWT令牌服务实例</summary>
    public JwtTokenService(IConfiguration configuration, IGuidGenerator guidGenerator)
    {
        _configuration = configuration;
        _guidGenerator = guidGenerator;
    }

    /// <summary>
    /// 生成JWT访问令牌
    /// </summary>
    /// <param name="userId">用户ID</param>
    /// <param name="username">用户名</param>
    /// <param name="isSuperAdmin">是否为超级管理员</param>
    /// <returns>令牌字符串和过期时间</returns>
    public (string token, DateTime expire) GenerateToken(long userId, string username, bool isSuperAdmin)
    {
        var expireMinutes = _configuration.GetValue("Jwt:ExpireMinutes", 10080);
        var expire = DateTime.UtcNow.AddMinutes(expireMinutes);

        var claims = new[]
        {
            new Claim(JwtRegisteredClaimNames.Sub, userId.ToString()),
            new Claim(JwtRegisteredClaimNames.Name, username),
            new Claim("superAdmin", isSuperAdmin ? "1" : "0"),
            new Claim(JwtRegisteredClaimNames.Jti, _guidGenerator.Create().ToString())
        };

        var key = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(_configuration["Jwt:SecretKey"]!));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _configuration["Jwt:Issuer"],
            audience: _configuration["Jwt:Audience"],
            claims: claims,
            expires: expire,
            signingCredentials: credentials);

        return (new JwtSecurityTokenHandler().WriteToken(token), expire);
    }

    /// <summary>
    /// 验证JWT令牌的有效性
    /// </summary>
    /// <param name="token">JWT令牌字符串</param>
    /// <returns>验证成功返回ClaimsPrincipal，失败返回null</returns>
    public ClaimsPrincipal? ValidateToken(string token)
    {
        var key = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(_configuration["Jwt:SecretKey"]!));

        var handler = new JwtSecurityTokenHandler();
        try
        {
            return handler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                ValidIssuer = _configuration["Jwt:Issuer"],
                ValidAudience = _configuration["Jwt:Audience"],
                IssuerSigningKey = key
            }, out _);
        }
        catch
        {
            return null;
        }
    }
}
