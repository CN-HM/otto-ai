using AiAdmin.Infrastructure;
using AiAdmin.Services.Admin.Dtos;
using AiAdmin.Services.Settings;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/params/settings")]
public class SystemSettingsController : AiAdminBaseController
{
    private readonly SystemSettingsService _systemSettingsService;

    public SystemSettingsController(SystemSettingsService systemSettingsService)
    {
        _systemSettingsService = systemSettingsService;
    }

    [HttpGet]
    [Authorize]
    [RequirePermission("sys-param:list")]
    public async Task<Result<AdminSystemSettingsDto>> GetSettings(CancellationToken cancellationToken)
    {
        var settings = await _systemSettingsService.GetAdminSettingsAsync(cancellationToken);
        return Result<AdminSystemSettingsDto>.Ok(settings);
    }

    [HttpPut]
    [Authorize]
    [RequirePermission("sys-param:create")]
    public async Task<Result<object>> UpdateSettings([FromBody] AdminSystemSettingsDto dto, CancellationToken cancellationToken)
    {
        await _systemSettingsService.UpdateAdminSettingsAsync(dto, CurrentUserId, cancellationToken);
        return Result<object>.Ok();
    }
}
