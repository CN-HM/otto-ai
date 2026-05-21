using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles;
using AiAdmin.Services.AgentRoles.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/agent-roles/{agentRoleId}/action-rules")]
[Authorize]
public class ActionRuleController : AiAdminBaseController
{
    private readonly ActionRuleService _actionRuleService;

    public ActionRuleController(ActionRuleService actionRuleService)
    {
        _actionRuleService = actionRuleService;
    }

    [HttpGet]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<ActionRuleDto>>> GetRules(string agentRoleId, CancellationToken cancellationToken)
    {
        var result = await _actionRuleService.GetRulesAsync(agentRoleId, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<List<ActionRuleDto>>.Ok(result);
    }

    [HttpPost]
    [RequirePermission("agent-role:update")]
    public async Task<Result<ActionRuleDto>> CreateRule(string agentRoleId, [FromBody] ActionRuleUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _actionRuleService.CreateRuleAsync(agentRoleId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<ActionRuleDto>.Ok(result);
    }

    [HttpPut("{ruleId}")]
    [RequirePermission("agent-role:update")]
    public async Task<Result<ActionRuleDto>> UpdateRule(string agentRoleId, string ruleId, [FromBody] ActionRuleUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _actionRuleService.UpdateRuleAsync(agentRoleId, ruleId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<ActionRuleDto>.Ok(result);
    }

    [HttpDelete("{ruleId}")]
    [RequirePermission("agent-role:update")]
    public async Task<Result<object>> DeleteRule(string agentRoleId, string ruleId, CancellationToken cancellationToken)
    {
        await _actionRuleService.DeleteRuleAsync(agentRoleId, ruleId, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }
}
