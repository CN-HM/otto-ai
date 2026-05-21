using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.AgentRoles;

public class ActionRuleService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public ActionRuleService(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public async Task<List<ActionRuleDto>> GetRulesAsync(
        string agentRoleId,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await EnsureAccessibleAgentRoleAsync(agentRoleId, currentUserId, isSuperAdmin, cancellationToken);
        var rules = await _db.AiActionRules.AsNoTracking()
            .Where(x => x.AgentRoleId == agentRoleId)
            .OrderBy(x => x.CreatedAt)
            .ToListAsync(cancellationToken);
        return rules.Select(MapRule).ToList();
    }

    public async Task<ActionRuleDto> CreateRuleAsync(
        string agentRoleId,
        ActionRuleUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await EnsureAccessibleAgentRoleAsync(agentRoleId, currentUserId, isSuperAdmin, cancellationToken);
        var now = DateTime.UtcNow;
        var entity = new AiActionRule
        {
            Id = _guidGenerator.Create().ToString("N"),
            AgentRoleId = agentRoleId,
            ActionType = RequireValue(dto.ActionType, "动作类型不能为空"),
            Name = RequireValue(dto.Name, "规则名称不能为空"),
            Instruction = NormalizeOptionalText(dto.Instruction),
            IsEnabled = dto.IsEnabled != 0,
            Creator = currentUserId,
            CreatedAt = now,
            Updater = currentUserId,
            UpdatedAt = now
        };
        _db.AiActionRules.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapRule(entity);
    }

    public async Task<ActionRuleDto> UpdateRuleAsync(
        string agentRoleId,
        string ruleId,
        ActionRuleUpsertDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await EnsureAccessibleAgentRoleAsync(agentRoleId, currentUserId, isSuperAdmin, cancellationToken);
        var entity = await _db.AiActionRules.FirstOrDefaultAsync(x => x.Id == ruleId && x.AgentRoleId == agentRoleId, cancellationToken)
            ?? throw new InvalidOperationException("Error:ActionRuleNotFound");

        if (!string.IsNullOrWhiteSpace(dto.ActionType))
            entity.ActionType = dto.ActionType.Trim();
        if (!string.IsNullOrWhiteSpace(dto.Name))
            entity.Name = dto.Name.Trim();
        if (dto.Instruction != null)
            entity.Instruction = NormalizeOptionalText(dto.Instruction);
        if (dto.IsEnabled.HasValue)
            entity.IsEnabled = dto.IsEnabled != 0;

        entity.Updater = currentUserId;
        entity.UpdatedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
        return MapRule(entity);
    }

    public async Task DeleteRuleAsync(
        string agentRoleId,
        string ruleId,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        await EnsureAccessibleAgentRoleAsync(agentRoleId, currentUserId, isSuperAdmin, cancellationToken);
        var entity = await _db.AiActionRules.FirstOrDefaultAsync(x => x.Id == ruleId && x.AgentRoleId == agentRoleId, cancellationToken)
            ?? throw new InvalidOperationException("Error:ActionRuleNotFound");
        _db.AiActionRules.Remove(entity);
        await _db.SaveChangesAsync(cancellationToken);
    }

    public async Task<List<AiActionRule>> GetEnabledRulesAsync(string agentRoleId, CancellationToken cancellationToken = default)
    {
        return await _db.AiActionRules.AsNoTracking()
            .Where(x => x.AgentRoleId == agentRoleId && x.IsEnabled)
            .OrderBy(x => x.CreatedAt)
            .ToListAsync(cancellationToken);
    }

    private async Task EnsureAccessibleAgentRoleAsync(string agentRoleId, long currentUserId, bool isSuperAdmin, CancellationToken cancellationToken)
    {
        var role = await _db.AiAgentRoles.AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == agentRoleId, cancellationToken)
            ?? throw new InvalidOperationException("Error:AgentRoleNotFound");
        if (!isSuperAdmin && role.Creator != currentUserId)
            throw new UnauthorizedAccessException("Error:ActionRuleAccessDenied");
    }

    private static ActionRuleDto MapRule(AiActionRule entity)
    {
        return new ActionRuleDto
        {
            Id = entity.Id,
            AgentRoleId = entity.AgentRoleId,
            ActionType = entity.ActionType,
            Name = entity.Name,
            Instruction = entity.Instruction,
            IsEnabled = entity.IsEnabled ? 1 : 0,
            Creator = entity.Creator,
            CreatedAt = entity.CreatedAt.ToString("yyyy-MM-dd HH:mm:ss"),
            Updater = entity.Updater,
            UpdatedAt = entity.UpdatedAt?.ToString("yyyy-MM-dd HH:mm:ss")
        };
    }

    private static string RequireValue(string? value, string errorMessage)
    {
        var normalized = NormalizeOptionalText(value);
        if (normalized == null)
            throw new InvalidOperationException(errorMessage);
        return normalized;
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}
