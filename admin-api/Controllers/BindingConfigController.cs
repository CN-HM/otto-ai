using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.BindingConfigs;
using AiAdmin.Services.BindingConfigs.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/binding-configs")]
[Authorize]
public class BindingConfigController : AiAdminBaseController
{
    private readonly BindingConfigService _bindingConfigService;

    public BindingConfigController(BindingConfigService bindingConfigService)
    {
        _bindingConfigService = bindingConfigService;
    }

    [HttpGet("kinds")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<BindingConfigKindMetaDto>>> GetKinds(CancellationToken cancellationToken)
    {
        var result = await _bindingConfigService.GetKindsAsync(cancellationToken);
        return Result<List<BindingConfigKindMetaDto>>.Ok(result);
    }

    [HttpGet("integration-options")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<List<OptionItemDto>>> GetIntegrationOptions([FromQuery] string? providerCode, [FromQuery] string? scope, CancellationToken cancellationToken)
    {
        var result = await _bindingConfigService.GetIntegrationOptionsAsync(providerCode, scope, cancellationToken);
        return Result<List<OptionItemDto>>.Ok(result);
    }

    [HttpGet("{kind}")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<PageData<BindingConfigDto>>> List(string kind, [FromQuery] BindingConfigListQuery query, CancellationToken cancellationToken)
    {
        var (list, total) = await _bindingConfigService.GetPageAsync(kind, query, cancellationToken);
        return Result<PageData<BindingConfigDto>>.Ok(new PageData<BindingConfigDto>
        {
            Total = total,
            List = list
        });
    }

    [HttpGet("{kind}/{id}")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<BindingConfigDto>> Get(string kind, string id, CancellationToken cancellationToken)
    {
        var result = await _bindingConfigService.GetAsync(kind, id, cancellationToken);
        return Result<BindingConfigDto>.Ok(result);
    }

    [HttpPost("{kind}")]
    [RequirePermission("agent-role:create")]
    public async Task<Result<BindingConfigDto>> Create(string kind, [FromBody] BindingConfigUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _bindingConfigService.CreateAsync(kind, dto, CurrentUserId, cancellationToken);
        return Result<BindingConfigDto>.Ok(result);
    }

    [HttpPut("{kind}/{id}")]
    [RequirePermission("agent-role:update")]
    public async Task<Result<BindingConfigDto>> Update(string kind, string id, [FromBody] BindingConfigUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _bindingConfigService.UpdateAsync(kind, id, dto, CurrentUserId, cancellationToken);
        return Result<BindingConfigDto>.Ok(result);
    }

    [HttpDelete("{kind}/{id}")]
    [RequirePermission("agent-role:delete")]
    public async Task<Result<object>> Delete(string kind, string id, CancellationToken cancellationToken)
    {
        await _bindingConfigService.DeleteAsync(kind, id, cancellationToken);
        return Result<object>.Ok();
    }
}
