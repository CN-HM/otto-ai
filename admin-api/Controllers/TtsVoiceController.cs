using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using Volo.Abp.Guids;
using AiAdmin.Services.Voice.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Controllers;

/// <summary>
/// TTS音色管理控制器
/// 提供系统内置音色查询、详情获取功能
/// </summary>
[ApiController]
[Route("ttsVoice")]
public class TtsVoiceController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    /// <summary>创建TTS音色控制器实例</summary>
    public TtsVoiceController(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    /// <summary>音色详情</summary>
    [HttpGet("{id}")]
    [Authorize]
    [RequirePermission("voice:list")]
    public async Task<Result<TimbreDetailsVo>> Get(string id)
    {
        var entity = await _db.AiTtsVoices.AsNoTracking()
            .Where(x => x.Id == id)
            .Join(_db.AiTtsProfiles.AsNoTracking(),
                voice => voice.TtsProfileId,
                profile => profile.Id,
                (voice, profile) => new { voice, profile })
            .GroupJoin(_db.AiProviderIntegrations.AsNoTracking(),
                current => current.profile.IntegrationId,
                integration => integration.Id,
                (current, integrations) => new { current.voice, current.profile, integrations })
            .SelectMany(
                current => current.integrations.DefaultIfEmpty(),
                (current, integration) => new { current.voice, current.profile, integration })
            .FirstOrDefaultAsync();
        if (entity == null) return Result<TimbreDetailsVo>.Error("音色不存在");

        return Result<TimbreDetailsVo>.Ok(new TimbreDetailsVo
        {
            Id = entity.voice.Id,
            Languages = entity.voice.Languages,
            Name = entity.voice.Name,
            Remark = entity.voice.Remark,
            Sort = entity.voice.Sort,
            ProviderCode = entity.integration?.ProviderCode ?? "doubao",
            ProviderName = entity.integration?.Name ?? entity.profile.Name,
            TtsProfileId = entity.voice.TtsProfileId,
            TtsVoice = entity.voice.TtsVoice,
            VoiceDemo = entity.voice.VoiceDemo
        });
    }

    [HttpGet("tts-profile-options")]
    [Authorize]
    [RequirePermission("voice:list")]
    public async Task<Result<List<TtsProfileOptionDto>>> GetTtsProfileOptions()
    {
        var profiles = await _db.AiTtsProfiles.AsNoTracking()
            .Where(x => x.IsEnabled && x.Status == "active")
            .Join(_db.AiProviderIntegrations.AsNoTracking(),
                profile => profile.IntegrationId,
                integration => integration.Id,
                (profile, integration) => new { profile, integration })
            .Where(x => x.integration.IsEnabled && x.integration.Status == "active")
            .OrderByDescending(x => x.profile.IsDefault)
            .ThenBy(x => x.profile.Sort)
            .ThenBy(x => x.profile.Name)
            .Select(x => new TtsProfileOptionDto
            {
                Label = x.profile.IsDefault
                    ? $"{x.profile.Name}（默认） / {x.integration.Name}"
                    : $"{x.profile.Name} / {x.integration.Name}",
                Value = x.profile.Id,
                Description = x.profile.Description,
                ProfileName = x.profile.Name,
                IntegrationId = x.integration.Id,
                ProviderCode = x.integration.ProviderCode,
                ProviderName = x.integration.Name
            })
            .ToListAsync();

        return Result<List<TtsProfileOptionDto>>.Ok(profiles);
    }

    /// <summary>分页查找</summary>
    [HttpGet]
    [Authorize]
    [RequirePermission("voice:list")]
    public async Task<Result<PageData<TimbreDetailsVo>>> Page(
        [FromQuery] string ttsProfileId,
        [FromQuery] string? name,
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10)
    {
        var q = _db.AiTtsVoices.AsNoTracking()
            .Where(x => x.TtsProfileId == ttsProfileId)
            .Join(_db.AiTtsProfiles.AsNoTracking(),
                voice => voice.TtsProfileId,
                profile => profile.Id,
                (voice, profile) => new { voice, profile })
            .GroupJoin(_db.AiProviderIntegrations.AsNoTracking(),
                current => current.profile.IntegrationId,
                integration => integration.Id,
                (current, integrations) => new { current.voice, current.profile, integrations })
            .SelectMany(
                current => current.integrations.DefaultIfEmpty(),
                (current, integration) => new { current.voice, current.profile, integration });
        if (!string.IsNullOrEmpty(name))
            q = q.Where(x => x.voice.Name != null && x.voice.Name.Contains(name));

        var total = await q.CountAsync();
        var items = await q
            .OrderBy(x => x.voice.Sort)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync();

        var list = items.Select(x => new TimbreDetailsVo
        {
            Id = x.voice.Id,
            Languages = x.voice.Languages,
            Name = x.voice.Name,
            Remark = x.voice.Remark,
            Sort = x.voice.Sort,
            ProviderCode = x.integration != null ? x.integration.ProviderCode : "doubao",
            ProviderName = x.integration != null ? x.integration.Name : x.profile.Name,
            TtsProfileId = x.voice.TtsProfileId,
            TtsVoice = x.voice.TtsVoice,
            VoiceDemo = x.voice.VoiceDemo
        }).ToList();

        return Result<PageData<TimbreDetailsVo>>.Ok(new PageData<TimbreDetailsVo> { Total = total, List = list });
    }

    [HttpPost("sync/{ttsProfileId}")]
    [Authorize]
    [RequirePermission("voice:create")]
    public Task<Result<TtsVoiceSyncResultDto>> Sync(string ttsProfileId, CancellationToken cancellationToken)
    {
        return Task.FromResult(Result<TtsVoiceSyncResultDto>.Error("云音色同步已下线，请改为手动新增与维护音色。"));
    }

    /// <summary>音色保存</summary>
    [HttpPost]
    [Authorize]
    [RequirePermission("voice:create")]
    public async Task<Result<object>> Save([FromBody] TimbreDataDto dto)
    {
        await EnsureTtsProfileIntegrationBoundAsync(dto.TtsProfileId, CancellationToken.None);
        var entity = new AiTtsVoice
        {
            Id = _guidGenerator.Create().ToString("N"),
            TtsProfileId = dto.TtsProfileId,
            Name = dto.Name,
            TtsVoice = dto.TtsVoice,
            Languages = dto.Languages,
            VoiceDemo = dto.VoiceDemo,
            Remark = dto.Remark,
            Sort = dto.Sort ?? 0,
            Creator = CurrentUserId,
            CreateDate = DateTime.UtcNow,
            Updater = CurrentUserId,
            UpdateDate = DateTime.UtcNow
        };

        _db.AiTtsVoices.Add(entity);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>音色修改</summary>
    [HttpPut("{id}")]
    [Authorize]
    [RequirePermission("voice:create")]
    public async Task<Result<object>> Update(string id, [FromBody] TimbreDataDto dto)
    {
        var entity = await _db.AiTtsVoices.FindAsync(id);
        if (entity == null) return Result<object>.Error("音色不存在");

        await EnsureTtsProfileIntegrationBoundAsync(dto.TtsProfileId, CancellationToken.None);

        entity.TtsProfileId = dto.TtsProfileId;
        entity.Name = dto.Name;
        entity.TtsVoice = dto.TtsVoice;
        entity.Languages = dto.Languages;
        entity.VoiceDemo = dto.VoiceDemo;
        entity.Remark = dto.Remark;
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = CurrentUserId;
        entity.UpdateDate = DateTime.UtcNow;

        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>音色删除</summary>
    [HttpPost("delete")]
    [Authorize]
    [RequirePermission("voice:delete")]
    public async Task<Result<object>> Delete([FromBody] string[] ids)
    {
        var normalizedIds = ids
            .Where(id => !string.IsNullOrWhiteSpace(id))
            .Select(id => id.Trim())
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();
        if (normalizedIds.Count == 0)
            return Result<object>.Ok();

        var roleCount = await _db.AiAgentRoles.AsNoTracking().LongCountAsync(x => x.TtsVoiceId != null && normalizedIds.Contains(x.TtsVoiceId), CancellationToken.None);
        if (roleCount > 0)
            return Result<object>.Error($"当前选中的音色已被 {roleCount} 个智能体角色使用，无法删除");

        var entities = await _db.AiTtsVoices.Where(x => ids.Contains(x.Id)).ToListAsync();
        _db.AiTtsVoices.RemoveRange(entities);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    private async Task EnsureTtsProfileIntegrationBoundAsync(string? ttsProfileId, CancellationToken cancellationToken)
    {
        if (string.IsNullOrWhiteSpace(ttsProfileId))
            throw new InvalidOperationException("Error:TtsVoiceProfileRequired");

        var profileWithIntegration = await _db.AiTtsProfiles.AsNoTracking()
            .Where(x => x.Id == ttsProfileId && x.IsEnabled && x.Status == "active")
            .Join(_db.AiProviderIntegrations.AsNoTracking(),
                profile => profile.IntegrationId,
                integration => integration.Id,
                (profile, integration) => new { profile, integration })
            .Where(x => x.integration.IsEnabled && x.integration.Status == "active")
            .Select(x => x.profile.Id)
            .FirstOrDefaultAsync(cancellationToken);

        if (profileWithIntegration == null)
            throw new InvalidOperationException("Error:TtsVoiceProfileIntegrationInvalid");
    }
}
