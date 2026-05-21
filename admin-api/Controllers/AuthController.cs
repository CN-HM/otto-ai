using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AiAdmin.Data;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Auth;
using AiAdmin.Services.Auth.Dtos;
using AiAdmin.Services.Billing;
using AiAdmin.Services.Rbac;
using AiAdmin.Services.Rbac.Dtos;
using AiAdmin.Services.Settings;
using System.Text.Json;

namespace AiAdmin.Controllers;

/// <summary>
/// 认证控制器
/// 提供登录、注册、密码重置、验证码发送等认证功能
/// </summary>
[Route("/user")]
public class AuthController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    /// <summary>JWT令牌服务</summary>
    private readonly JwtTokenService _jwt;
    /// <summary>权限服务</summary>
    private readonly PermissionService _permissionService;
    /// <summary>计费服务</summary>
    private readonly BillingService _billingService;
    /// <summary>短信服务</summary>
    private readonly SmsService _sms;
    /// <summary>Turnstile人机验证服务</summary>
    private readonly TurnstileService _turnstile;
    private readonly SystemSettingsService _systemSettingsService;

    /// <summary>创建认证控制器实例</summary>
    public AuthController(AiAdminDbContext db, JwtTokenService jwt, PermissionService permissionService, BillingService billingService, SmsService sms, TurnstileService turnstile, SystemSettingsService systemSettingsService)
    {
        _db = db;
        _jwt = jwt;
        _permissionService = permissionService;
        _billingService = billingService;
        _sms = sms;
        _turnstile = turnstile;
        _systemSettingsService = systemSettingsService;
    }

    /// <summary>登录</summary>
    [HttpPost("login")]
    [AllowAnonymous]
    public async Task<Result<TokenDto>> Login([FromBody] LoginDto dto)
    {
        try
        {
            // Turnstile 验证
            var (turnstileValid, turnstileError) = await _turnstile.VerifyAsync(dto.TurnstileToken);
            if (!turnstileValid)
                return Result<TokenDto>.Error(turnstileError ?? "人机验证失败");

            var loginName = dto.Username?.Trim();
            var password = dto.Password ?? string.Empty;

            if (string.IsNullOrWhiteSpace(loginName) || string.IsNullOrEmpty(password))
                return Result<TokenDto>.Error("用户名或密码错误");

            var user = await _db.SysUsers
                .FirstOrDefaultAsync(u => u.Username == loginName || u.Mobile == loginName);

            if (user == null)
                return Result<TokenDto>.Error("用户名或密码错误");

            if (user.Status != 1)
                return Result<TokenDto>.Error("账号已被停用");

            if (string.IsNullOrWhiteSpace(user.Password) || !BCrypt.Net.BCrypt.Verify(password, user.Password))
                return Result<TokenDto>.Error("用户名或密码错误");

            var (token, expire) = _jwt.GenerateToken(user.Id, user.Username, user.SuperAdmin == 1);

            var existingToken = await _db.SysUserTokens.FirstOrDefaultAsync(t => t.UserId == user.Id);
            if (existingToken != null)
            {
                existingToken.Token = token;
                existingToken.ExpireDate = expire;
                existingToken.UpdateDate = DateTime.UtcNow;
            }
            else
            {
                _db.SysUserTokens.Add(new Entities.SysUserToken
                {
                    Id = IdGenerator.NewLongId(),
                    UserId = user.Id,
                    Token = token,
                    ExpireDate = expire,
                    CreateDate = DateTime.UtcNow,
                    UpdateDate = DateTime.UtcNow
                });
            }
            await _db.SaveChangesAsync();

            return Result<TokenDto>.Ok(new TokenDto
            {
                Token = token,
                Expire = new DateTimeOffset(expire).ToUnixTimeMilliseconds()
            });
        }
        catch (Exception ex)
        {
            return Result<TokenDto>.Error($"登录失败: {ex.Message}");
        }
    }

    /// <summary>注册</summary>
    [HttpPost("register")]
    [AllowAnonymous]
    public async Task<Result<object?>> Register([FromBody] RegisterDto dto)
    {
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false);
        if (!systemSettings.AllowUserRegister)
            return Result<object?>.Error("系统已关闭普通用户注册");

        // Turnstile 验证
        var (turnstileValid, turnstileError) = await _turnstile.VerifyAsync(dto.TurnstileToken);
        if (!turnstileValid)
            return Result<object?>.Error(turnstileError ?? "人机验证失败");

        // 校验短信验证码
        var (verified, verifyMsg) = await _sms.VerifyCodeAsync(dto.Phone, dto.Code);
        if (!verified)
            return Result<object?>.Error(verifyMsg);

        // 自动生成 AI 风格用户名
        var username = dto.Username;
        if (string.IsNullOrWhiteSpace(username))
        {
            username = GenerateAiUsername();
            // 确保用户名唯一
            var attempts = 0;
            while (await _db.SysUsers.AnyAsync(u => u.Username == username) && attempts < 10)
            {
                username = GenerateAiUsername();
                attempts++;
            }
            if (await _db.SysUsers.AnyAsync(u => u.Username == username))
                return Result<object?>.Error("用户名生成失败，请稍后重试");
        }
        else
        {
            var exists = await _db.SysUsers.AnyAsync(u => u.Username == username);
            if (exists)
                return Result<object?>.Error("用户名已存在");
        }

        // 密码：未提供则生成随机密码
        var password = dto.Password;
        if (string.IsNullOrWhiteSpace(password))
            password = GenerateRandomPassword();

        var user = new Entities.SysUser
        {
            Id = IdGenerator.NewLongId(),
            Username = username,
            Password = BCrypt.Net.BCrypt.HashPassword(password),
            Mobile = dto.Phone,
            SuperAdmin = 0,
            Status = 1,
            CreateDate = DateTime.UtcNow,
            UpdateDate = DateTime.UtcNow
        };

        _db.SysUsers.Add(user);

        // 分配默认 user 角色
        var userRole = await _db.SysRoles.FirstOrDefaultAsync(r => r.Code == "user");
        if (userRole != null)
        {
            _db.SysUserRoles.Add(new Entities.SysUserRole
            {
                Id = IdGenerator.NewLongId(),
                UserId = user.Id,
                RoleId = userRole.Id
            });
        }

        await _db.SaveChangesAsync();
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id, user.Id);

        return Result<object?>.Ok();
    }

    /// <summary>短信验证码</summary>
    [HttpPost("smsVerification")]
    [AllowAnonymous]
    public async Task<Result<object?>> SmsVerification([FromBody] SmsVerificationDto dto)
    {
        var (success, message) = await _sms.SendCodeAsync(dto.Phone);
        if (!success)
            return Result<object?>.Error(message);

        return Result<object?>.Ok();
    }

    /// <summary>找回密码</summary>
    [HttpPut("retrieve-password")]
    [AllowAnonymous]
    public async Task<Result<object?>> RetrievePassword([FromBody] RetrievePasswordDto dto)
    {
        // Turnstile 验证
        var (turnstileValid, turnstileError) = await _turnstile.VerifyAsync(dto.TurnstileToken);
        if (!turnstileValid)
            return Result<object?>.Error(turnstileError ?? "人机验证失败");

        var user = await _db.SysUsers.FirstOrDefaultAsync(u => u.Username == dto.Phone);
        if (user == null)
            return Result<object?>.Error("用户不存在");

        user.Password = BCrypt.Net.BCrypt.HashPassword(dto.Password);
        user.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Result<object?>.Ok();
    }

    /// <summary>修改用户密码</summary>
    [HttpPut("change-password")]
    [Authorize]
    public async Task<Result<object?>> ChangePassword([FromBody] PasswordDto dto)
    {
        var user = await _db.SysUsers.FindAsync(CurrentUserId);
        if (user == null)
            return Result<object?>.Error("用户不存在");

        if (!BCrypt.Net.BCrypt.Verify(dto.Password, user.Password))
            return Result<object?>.Error("原密码错误");

        user.Password = BCrypt.Net.BCrypt.HashPassword(dto.NewPassword);
        user.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Result<object?>.Ok();
    }

    /// <summary>公共配置</summary>
    [HttpGet("pub-config")]
    [AllowAnonymous]
    public async Task<Result<PubConfigDto>> PubConfig()
    {
        var systemSettings = await _systemSettingsService.GetOrCreateAsync(false);
        return Result<PubConfigDto>.Ok(new PubConfigDto
        {
            Menus = [],
            AllowUserRegister = systemSettings.AllowUserRegister,
            TurnstileSiteKey = _turnstile.GetSiteKey()
        });
    }

    /// <summary>用户信息获取</summary>
    [HttpGet("info")]
    [Authorize]
    public async Task<Result<UserInfoDto>> Info()
    {
        var user = await _db.SysUsers.FindAsync(CurrentUserId);
        if (user == null)
            return Result<UserInfoDto>.Error("用户不存在");

        List<string> roles;
        List<string> permissions;

        if (user.SuperAdmin == 1)
        {
            // 超管拥有所有权限
            roles = ["admin"];
            permissions = await _db.SysMenus.Select(m => m.Code).ToListAsync();
        }
        else
        {
            roles = await _permissionService.GetUserRoleCodesAsync(user.Id);
            permissions = await _permissionService.GetUserPermissionsAsync(user.Id);
        }

        return Result<UserInfoDto>.Ok(new UserInfoDto
        {
            Id = user.Id,
            Username = user.Username,
            SuperAdmin = user.SuperAdmin,
            Status = user.Status,
            Roles = roles,
            Permissions = permissions
        });
    }

    /// <summary>生成 AI 风格用户名</summary>
    private static string GenerateAiUsername()
    {
        var prefixes = new[] { "智", "慧", "灵", "睿", "思", "芯", "云", "星", "月", "光" };
        var middles = new[] { "言", "语", "心", "脑", "眼", "耳", "手", "翼", "影", "梦" };
        var suffixes = new[] { "AI", "Bot", "X", "Pro", "Max", "Plus", "One", "Go", "IO", "OS" };

        var random = Random.Shared;
        var prefix = prefixes[random.Next(prefixes.Length)];
        var middle = middles[random.Next(middles.Length)];
        var suffix = suffixes[random.Next(suffixes.Length)];
        var number = random.Next(100, 9999);

        return $"{prefix}{middle}{suffix}{number}";
    }

    /// <summary>生成随机密码</summary>
    private static string GenerateRandomPassword()
    {
        const string chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789";
        var random = Random.Shared;
        return new string(Enumerable.Range(0, 12).Select(_ => chars[random.Next(chars.Length)]).ToArray());
    }
}
