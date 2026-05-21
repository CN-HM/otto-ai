using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles;
using AiAdmin.Services.AgentRoles.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/agent-roles")]
[Authorize]
public class AgentRoleController : AiAdminBaseController
{
    private readonly AgentRoleService _agentRoleService;

    public AgentRoleController(AgentRoleService agentRoleService)
    {
        _agentRoleService = agentRoleService;
    }

    [HttpGet]
    [RequirePermission("agent-role:list")]
    public async Task<Result<PageData<AgentRoleDto>>> List([FromQuery] AgentRoleListQuery query, CancellationToken cancellationToken)
    {
        var (list, total) = await _agentRoleService.GetPageAsync(query, cancellationToken);
        return Result<PageData<AgentRoleDto>>.Ok(new PageData<AgentRoleDto>
        {
            Total = total,
            List = list
        });
    }

    [HttpGet("all")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<AgentRoleDto>>> All(CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetAllPublishedActiveAsync(cancellationToken);
        return Result<List<AgentRoleDto>>.Ok(result);
    }

    [HttpGet("/agent-roles/catalog")]
    public async Task<Result<List<AgentRoleDto>>> Catalog(CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetAllPublishedActiveAsync(cancellationToken);
        return Result<List<AgentRoleDto>>.Ok(result);
    }

    [HttpGet("{id}")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<AgentRoleDto>> Get(string id, CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetAsync(id, cancellationToken);
        return Result<AgentRoleDto>.Ok(result);
    }

    [HttpGet("{id}/releases")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<AgentRoleReleaseDto>>> GetReleases(string id, CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetReleasesAsync(id, cancellationToken);
        return Result<List<AgentRoleReleaseDto>>.Ok(result);
    }

    [HttpPost]
    [RequirePermission("agent-role:create")]
    public async Task<Result<AgentRoleDto>> Create([FromBody] AgentRoleUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.CreateAsync(dto, CurrentUserId, cancellationToken);
        return Result<AgentRoleDto>.Ok(result);
    }

    [HttpPut("{id}")]
    [RequirePermission("agent-role:update")]
    public async Task<Result<AgentRoleDto>> Update(string id, [FromBody] AgentRoleUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.UpdateAsync(id, dto, CurrentUserId, cancellationToken);
        return Result<AgentRoleDto>.Ok(result);
    }

    [HttpDelete("{id}")]
    [RequirePermission("agent-role:delete")]
    public async Task<Result<object>> Delete(string id, CancellationToken cancellationToken)
    {
        await _agentRoleService.DeleteAsync(id, cancellationToken);
        return Result<object>.Ok();
    }

    [HttpPost("{id}/publish")]
    [RequirePermission("agent-role:publish")]
    public async Task<Result<AgentRoleReleaseDto>> Publish(string id, [FromBody] AgentRolePublishDto dto, CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.PublishAsync(id, dto, CurrentUserId, cancellationToken);
        return Result<AgentRoleReleaseDto>.Ok(result);
    }

    [HttpPut("{id}/releases/{releaseId}/activate")]
    [RequirePermission("agent-role:publish")]
    public async Task<Result<AgentRoleReleaseDto>> ActivateRelease(string id, string releaseId, CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.ActivateReleaseAsync(id, releaseId, CurrentUserId, cancellationToken);
        return Result<AgentRoleReleaseDto>.Ok(result);
    }

    [HttpGet("icon-options")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<OptionItemDto>>> GetIconOptions(CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetIconOptionsAsync(cancellationToken);
        return Result<List<OptionItemDto>>.Ok(result);
    }

    [HttpGet("theme-options")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<OptionItemDto>>> GetThemeOptions(CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetThemeOptionsAsync(cancellationToken);
        return Result<List<OptionItemDto>>.Ok(result);
    }

    [HttpGet("binding-options")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<AgentRoleBindingOptionsDto>> GetBindingOptions(CancellationToken cancellationToken)
    {
        var result = await _agentRoleService.GetBindingOptionsAsync(cancellationToken);
        return Result<AgentRoleBindingOptionsDto>.Ok(result);
    }
}
