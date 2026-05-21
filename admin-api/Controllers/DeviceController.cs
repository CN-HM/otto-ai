using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Config;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Protocol.Runtime;
using AiAdmin.Services.Device.Dtos;
using AiAdmin.Services.Runtime;
using AiAdmin.Services.Settings;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Volo.Abp.Guids;

namespace AiAdmin.Controllers;

/// <summary>
/// 设备管理控制器
/// 提供设备注册、绑定、解绑、查询等管理功能
/// </summary>
[ApiController]
public class DeviceController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    private readonly DeviceCredentialService _deviceCredentialService;
    private readonly IServerAddressProvider _serverAddressProvider;
    private readonly IoTRuntimeOptions _runtimeOptions;
    private readonly IGuidGenerator _guidGenerator;
    private readonly DeviceConnectionManager _deviceConnectionManager;
    private readonly DeviceMcpRuntimeService _deviceMcpRuntimeService;

    /// <summary>创建设备控制器实例</summary>
    public DeviceController(
        AiAdminDbContext db,
        DeviceCredentialService deviceCredentialService,
        IServerAddressProvider serverAddressProvider,
        IOptions<IoTRuntimeOptions> runtimeOptions,
        IGuidGenerator guidGenerator,
        DeviceConnectionManager deviceConnectionManager,
        DeviceMcpRuntimeService deviceMcpRuntimeService)
    {
        _db = db;
        _deviceCredentialService = deviceCredentialService;
        _serverAddressProvider = serverAddressProvider;
        _runtimeOptions = runtimeOptions.Value;
        _guidGenerator = guidGenerator;
        _deviceConnectionManager = deviceConnectionManager;
        _deviceMcpRuntimeService = deviceMcpRuntimeService;
    }

    /// <summary>解绑设备</summary>
    [HttpPost("device/unbind")]
    [Authorize]
    public async Task<Result<object>> UnbindDevice([FromBody] DeviceUnBindDto dto)
    {
        var (device, error) = await ResolveOwnedEntityAsync<AiDevice, object>(
            _db.AiDevices,
            d => d.Id == dto.DeviceId,
            d => d.UserId,
            "设备");
        if (error != null) return error;

        device.AgentRoleId = null;
        device.AgentRoleReleaseId = null;
        device.Updater = CurrentUserId;
        device.UpdateDate = DateTime.UtcNow;

        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>签发设备配网凭证</summary>
    [HttpPost("device/provisioning/issue")]
    [Authorize]
    public async Task<Result<DeviceProvisioningCredentialDto>> IssueProvisioningCredential([FromBody] DeviceProvisioningIssueDto dto)
    {
        var material = await _deviceCredentialService.IssueProvisioningCredentialAsync(dto, CurrentUserId, IsSuperAdmin);
        var runtime = await BuildProvisioningRuntimeContextAsync();
        var envelopeJson = _deviceCredentialService.BuildProvisioningEnvelopeJson(runtime, material);
        return Result<DeviceProvisioningCredentialDto>.Ok(new DeviceProvisioningCredentialDto
        {
            DeviceEntityId = material.Device.Id,
            DeviceId = material.Device.MacAddress,
            CredentialId = material.CredentialId,
            CredentialSecret = material.CredentialSecret,
            ProvisioningServiceUuid = DeviceCredentialService.ProvisioningServiceUuid,
            ProvisioningCharacteristicUuid = DeviceCredentialService.ProvisioningCredentialCharacteristicUuid,
            EnvelopeJson = envelopeJson,
            Message = "Error:DeviceCredentialIssued"
        });
    }

    /// <summary>手动添加设备</summary>
    [HttpPost("device/manual-add")]
    [Authorize]
    public async Task<Result<object>> ManualAddDevice([FromBody] DeviceManualAddDto dto)
    {
        var normalizedMacAddress = string.IsNullOrWhiteSpace(dto.MacAddress)
            ? null
            : DeviceCredentialService.NormalizeDeviceId(dto.MacAddress);

        // 检查 MAC 是否已被他人绑定
        if (!string.IsNullOrEmpty(normalizedMacAddress))
        {
            var existingDevice = await _db.AiDevices
                .FirstOrDefaultAsync(x => x.MacAddress == normalizedMacAddress);
            if (existingDevice != null && existingDevice.UserId != null
                && !HasOwnerAccess(existingDevice.UserId))
                return Result<object>.Error("设备已被其他用户绑定");
        }

        var (targetAgentRoleId, targetAgentRoleReleaseId, agentRoleError) = await ResolveAgentRoleBindingAsync(
            dto.AgentRoleId,
            dto.AgentRoleReleaseId,
            HttpContext.RequestAborted);
        if (!string.IsNullOrWhiteSpace(agentRoleError))
            return Result<object>.Error(agentRoleError);

        var device = new AiDevice
        {
            Id = _guidGenerator.Create().ToString("N"),
            MacAddress = normalizedMacAddress,
            AgentRoleId = targetAgentRoleId,
            AgentRoleReleaseId = targetAgentRoleReleaseId,
            Board = dto.Board,
            AppVersion = dto.AppVersion,
            UserId = CurrentUserId,
            AutoUpdate = 1,
            Sort = 0,
            Creator = CurrentUserId,
            CreateDate = DateTime.UtcNow,
            Updater = CurrentUserId,
            UpdateDate = DateTime.UtcNow
        };

        _db.AiDevices.Add(device);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>更新设备信息</summary>
    [HttpPut("device/update/{id}")]
    [Authorize]
    public async Task<Result<object>> UpdateDeviceInfo(string id, [FromBody] DeviceUpdateDto dto)
    {
        var (device, error) = await ResolveOwnedEntityAsync<AiDevice, object>(
            _db.AiDevices,
            d => d.Id == id,
            d => d.UserId,
            "设备");
        if (error != null) return error;

        if (dto.AutoUpdate.HasValue)
            device.AutoUpdate = (short)dto.AutoUpdate.Value;
        if (dto.Alias != null)
            device.Alias = dto.Alias;
        if (dto.AgentRoleId != null || dto.AgentRoleReleaseId != null)
        {
            var (targetAgentRoleId, targetAgentRoleReleaseId, agentRoleError) = await ResolveAgentRoleBindingAsync(
                dto.AgentRoleId,
                dto.AgentRoleReleaseId,
                HttpContext.RequestAborted);
            if (!string.IsNullOrWhiteSpace(agentRoleError))
                return Result<object>.Error(agentRoleError);

            device.AgentRoleId = targetAgentRoleId;
            device.AgentRoleReleaseId = targetAgentRoleReleaseId;
        }

        device.Updater = CurrentUserId;
        device.UpdateDate = DateTime.UtcNow;

        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>获取设备工具列表</summary>
    [HttpPost("device/tools/list/{deviceId}")]
    [Authorize]
    public async Task<Result<List<object>>> GetDeviceTools(string deviceId)
    {
        var (device, error) = await ResolveOwnedEntityAsync<AiDevice, List<object>>(
            _db.AiDevices.AsNoTracking(),
            x => x.Id == deviceId,
            x => x.UserId,
            "设备");
        if (error != null) return error;

        if (!string.IsNullOrWhiteSpace(device.MacAddress))
        {
            var connection = _deviceConnectionManager.GetByMac(device.MacAddress);
            if (connection != null && connection.Mcp.CachedTools.Count > 0)
                return Result<List<object>>.Ok(connection.Mcp.CachedTools.ToList());
        }

        var tools = await _deviceMcpRuntimeService.GetDeviceToolsAsync(deviceId);
        return Result<List<object>>.Ok(tools);
    }

    /// <summary>调用设备工具</summary>
    [HttpPost("device/tools/call/{deviceId}")]
    [Authorize]
    public async Task<Result<object>> CallDeviceTool(string deviceId, [FromBody] DeviceToolsCallReqDto dto)
    {
        var (device, error) = await ResolveOwnedEntityAsync<AiDevice, object>(
            _db.AiDevices.AsNoTracking(),
            x => x.Id == deviceId,
            x => x.UserId,
            "设备");
        if (error != null) return error;

        if (string.IsNullOrWhiteSpace(dto.Name))
            return Result<object>.Error("工具名称不能为空");

        var tools = await GetDeviceTools(deviceId);
        if (tools.Data == null || !tools.Data.Any(tool => HasToolName(tool, dto.Name)))
            return Result<object>.Error("工具不存在");

        return Result<object>.Error("当前版本尚未支持通过 admin-api 直接触发本地 MCP 工具调用");
    }

    private static bool HasToolName(object tool, string expectedName)
    {
        var element = JsonSerializer.SerializeToElement(tool);
        return element.TryGetProperty("name", out var nameElement)
               && string.Equals(nameElement.GetString(), expectedName, StringComparison.OrdinalIgnoreCase);
    }

    /// <summary>管理员分页查找设备</summary>
    [HttpGet("admin/device/all")]
    [Authorize]
    [RequirePermission("device:list")]
    public async Task<Result<PageData<UserShowDeviceListVo>>> PageDevice(
        [FromQuery] string? keywords,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10)
    {
        var q = _db.AiDevices.AsQueryable();
        if (!IsSuperAdmin)
            q = q.Where(x => x.UserId == CurrentUserId);
        if (!string.IsNullOrEmpty(keywords))
            q = q.Where(x => (x.MacAddress != null && x.MacAddress.Contains(keywords))
                           || (x.Alias != null && x.Alias.Contains(keywords)));

        var total = await q.CountAsync();
        var devices = await q
            .OrderByDescending(x => x.CreateDate)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync();

        var agentRoleIds = devices.Where(d => d.AgentRoleId != null).Select(d => d.AgentRoleId!).Distinct().ToList();
        var agentRoles = await _db.AiAgentRoles
            .Where(role => agentRoleIds.Contains(role.Id))
            .Select(role => new { role.Id, role.Name, role.DisplayName, role.CurrentVersion })
            .ToListAsync();

        var agentRoleReleaseIds = devices.Where(d => d.AgentRoleReleaseId != null).Select(d => d.AgentRoleReleaseId!).Distinct().ToList();
        var agentRoleReleases = await _db.AiAgentRoleReleases
            .Where(release => agentRoleReleaseIds.Contains(release.Id))
            .Select(release => new { release.Id, release.Version })
            .ToListAsync();

        var userIds = devices.Where(d => d.UserId != null).Select(d => d.UserId!.Value).Distinct().ToList();
        var users = await _db.SysUsers
            .Where(u => userIds.Contains(u.Id))
            .Select(u => new { u.Id, u.Username })
            .ToListAsync();

        var list = devices.Select(d => new UserShowDeviceListVo
        {
            Id = d.Id,
            MacAddress = d.MacAddress,
            Board = d.Board,
            Alias = d.Alias,
            AppVersion = d.AppVersion,
            AgentRoleId = d.AgentRoleId,
            AgentRoleName = agentRoles.FirstOrDefault(agentRoleEntry => agentRoleEntry.Id == d.AgentRoleId) is { } matchedAgentRole ? matchedAgentRole.DisplayName ?? matchedAgentRole.Name : null,
            AgentRoleReleaseId = d.AgentRoleReleaseId,
            AgentRoleVersion = agentRoleReleases.FirstOrDefault(release => release.Id == d.AgentRoleReleaseId)?.Version
                ?? agentRoles.FirstOrDefault(agentRoleEntry => agentRoleEntry.Id == d.AgentRoleId)?.CurrentVersion,
            BindUserName = users.FirstOrDefault(u => u.Id == d.UserId)?.Username,
            LastConnectedAt = d.LastConnectedAt?.ToString("yyyy-MM-dd HH:mm:ss"),
            CreateDate = d.CreateDate?.ToString("yyyy-MM-dd HH:mm:ss")
        }).ToList();

        return Result.Page(list, total);
    }

    /// <summary>设备联网后使用长期凭证完成自证身份</summary>
    [HttpPost("device/bootstrap")]
    [DeviceCredentialAuth]
    public async Task<Result<DeviceBootstrapStatusDto>> BootstrapDevice()
    {
        var authDevice = HttpContext.GetAuthenticatedDeviceCredential();
        if (authDevice == null)
            return Result<DeviceBootstrapStatusDto>.Error("设备认证失败", 401);

        var device = await _db.AiDevices.FirstOrDefaultAsync(x => x.Id == authDevice.DeviceEntityId);
        if (device == null)
            return Result<DeviceBootstrapStatusDto>.Error("设备不存在");

        device.LastConnectedAt = DateTime.UtcNow;
        device.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        return Result<DeviceBootstrapStatusDto>.Ok(new DeviceBootstrapStatusDto
        {
            DeviceEntityId = device.Id,
            DeviceId = device.MacAddress,
            IsBound = device.UserId != null,
            AgentRoleId = device.AgentRoleId,
            Message = "Error:DeviceCredentialVerified"
        });
    }

    /// <summary>OTA版本检查</summary>
    [HttpPost("ota/")]
    [DeviceCredentialAuth]
    public async Task<Result<object>> CheckOTAVersion(
        [FromHeader(Name = "Device-Id")] string? deviceId,
        [FromBody] DeviceReportDto payload)
    {
        var authDevice = HttpContext.GetAuthenticatedDeviceCredential();
        if (authDevice == null)
            return Result<object>.Error("设备认证失败", 401);

        if (!string.IsNullOrWhiteSpace(deviceId)
            && !string.Equals(DeviceCredentialService.NormalizeDeviceId(deviceId), authDevice.DeviceId, StringComparison.Ordinal))
            return Result<object>.Error("设备标识与凭证不匹配", 401);

        var device = await _db.AiDevices.FirstOrDefaultAsync(x => x.Id == authDevice.DeviceEntityId);
        if (device == null)
            return Result<object>.Error("设备不存在");

        await _deviceCredentialService.UpdateDeviceReportAsync(device, payload);

        // 查询最新固件版本
        var currentVersion = payload.Application?.Version;
        var latestOta = await _db.AiOtas
            .OrderByDescending(x => x.Version)
            .FirstOrDefaultAsync();

        if (latestOta == null || string.IsNullOrEmpty(latestOta.Version))
            return Result<object>.Ok(new { firmware = (object?)null });

        // 比较版本：如果设备版本与最新版本不同则返回更新信息
        if (!string.IsNullOrEmpty(currentVersion) && currentVersion == latestOta.Version)
            return Result<object>.Ok(new { firmware = (object?)null });

        return Result<object>.Ok(new
        {
            firmware = new
            {
                version = latestOta.Version,
                url = latestOta.FirmwarePath,
                name = latestOta.FirmwareName,
                size = latestOta.Size
            }
        });
    }

    [HttpGet("device/list")]
    [Authorize]
    public async Task<Result<List<IotDeviceDto>>> GetCurrentUserDeviceList()
    {
        var list = await QueryIotDevices()
            .OrderBy(x => x.Alias)
            .ThenBy(x => x.MacAddress)
            .ToListAsync();

        return Result<List<IotDeviceDto>>.Ok(list);
    }

    [HttpGet("device/{id}")]
    [Authorize]
    public async Task<Result<IotDeviceDto>> GetCurrentUserDevice(string id)
    {
        var device = await QueryIotDevices().FirstOrDefaultAsync(x => x.Id == id);
        if (device == null)
        {
            return Result<IotDeviceDto>.Error("设备不存在");
        }

        return Result<IotDeviceDto>.Ok(device);
    }

    [HttpPut("device/{id}")]
    [Authorize]
    public async Task<Result<object>> UpdateCurrentUserDevice(string id, [FromBody] DeviceUpdateDto dto)
    {
        var (device, error) = await ResolveOwnedEntityAsync<AiDevice, object>(
            _db.AiDevices,
            d => d.Id == id,
            d => d.UserId,
            "设备");
        if (error != null) return error;

        if (dto.AutoUpdate.HasValue)
        {
            device.AutoUpdate = (short)dto.AutoUpdate.Value;
        }

        if (dto.Alias != null)
        {
            device.Alias = dto.Alias;
        }

        if (dto.AgentRoleId != null || dto.AgentRoleReleaseId != null)
        {
            var (targetAgentRoleId, targetAgentRoleReleaseId, agentRoleError) = await ResolveAgentRoleBindingAsync(
                dto.AgentRoleId,
                dto.AgentRoleReleaseId,
                HttpContext.RequestAborted);
            if (!string.IsNullOrWhiteSpace(agentRoleError))
            {
                return Result<object>.Error(agentRoleError);
            }

            device.AgentRoleId = targetAgentRoleId;
            device.AgentRoleReleaseId = targetAgentRoleReleaseId;
        }

        device.Updater = CurrentUserId;
        device.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    [HttpDelete("device/{id}")]
    [Authorize]
    public async Task<Result<object>> DeleteCurrentUserDevice(string id)
    {
        var (device, error) = await ResolveOwnedEntityAsync<AiDevice, object>(
            _db.AiDevices,
            d => d.Id == id,
            d => d.UserId,
            "设备");
        if (error != null) return error;

        device.UserId = null;
        device.AgentRoleId = null;
        device.AgentRoleReleaseId = null;
        device.CredentialId = null;
        device.CredentialSecret = null;
        device.CredentialIssuedAt = null;
        device.Updater = CurrentUserId;
        device.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    private async Task<DeviceProvisioningRuntimeContext> BuildProvisioningRuntimeContextAsync()
    {
        var request = HttpContext.Request;
        var address = await _serverAddressProvider.GetSnapshotAsync(HttpContext.RequestAborted);
        if (_serverAddressProvider.IsLocalOnlyHost(address.PublicHost))
        {
            throw new InvalidOperationException("Error:DeviceCredentialRuntimeHostInvalid");
        }

        var apiBaseUrl = _serverAddressProvider.BuildProvisioningApiBaseUrl(request, address.PublicHost);

        return new DeviceProvisioningRuntimeContext(
            apiBaseUrl,
            address.PublicHost,
            _runtimeOptions.MqttPort,
            "ai");
    }

    private IQueryable<IotDeviceDto> QueryIotDevices()
    {
        var devices = _db.AiDevices
            .Where(x => x.UserId == CurrentUserId);

        return from device in devices
               join agentRole in _db.AiAgentRoles on device.AgentRoleId equals agentRole.Id into agentRoleJoin
               from agentRole in agentRoleJoin.DefaultIfEmpty()
               join agentRoleRelease in _db.AiAgentRoleReleases on device.AgentRoleReleaseId equals agentRoleRelease.Id into agentRoleReleaseJoin
               from agentRoleRelease in agentRoleReleaseJoin.DefaultIfEmpty()
               select new IotDeviceDto
               {
                   Id = device.Id,
                   MacAddress = device.MacAddress,
                   Alias = device.Alias,
                   AgentRoleId = device.AgentRoleId,
                   AgentRoleName = agentRole != null ? agentRole.DisplayName ?? agentRole.Name : null,
                   AgentRoleReleaseId = device.AgentRoleReleaseId,
                   AgentRoleVersion = agentRoleRelease != null ? agentRoleRelease.Version : agentRole != null ? agentRole.CurrentVersion : null,
                   Board = device.Board,
                   AppVersion = device.AppVersion,
                   IsOnline = device.IsOnline,
                   LastConnectedAt = device.LastConnectedAt,
                   AutoUpdate = device.AutoUpdate
               };
    }

    private async Task<(string? AgentRoleId, string? AgentRoleReleaseId, string? ErrorMessage)> ResolveAgentRoleBindingAsync(
        string? agentRoleId,
        string? agentRoleReleaseId,
        CancellationToken cancellationToken)
    {
        var normalizedRoleId = NormalizeOptionalText(agentRoleId);
        var normalizedReleaseId = NormalizeOptionalText(agentRoleReleaseId);

        if (string.IsNullOrWhiteSpace(normalizedRoleId))
        {
            if (!string.IsNullOrWhiteSpace(normalizedReleaseId))
                return (null, null, "指定智能体角色发布版本时必须同时指定智能体角色");

            return (null, null, null);
        }

        var roleExists = await _db.AiAgentRoles.AsNoTracking()
            .AnyAsync(x => x.Id == normalizedRoleId, cancellationToken);
        if (!roleExists)
            return (null, null, "Error:AgentRoleNotFound");

        if (!string.IsNullOrWhiteSpace(normalizedReleaseId))
        {
            var releaseExists = await _db.AiAgentRoleReleases.AsNoTracking()
                .AnyAsync(x => x.Id == normalizedReleaseId && x.RoleId == normalizedRoleId, cancellationToken);
            if (!releaseExists)
                return (null, null, "智能体角色发布版本不存在");
        }

        return (normalizedRoleId, normalizedReleaseId, null);
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
