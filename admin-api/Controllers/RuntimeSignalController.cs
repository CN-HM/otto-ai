using AiAdmin.Infrastructure;
using AiAdmin.Services.Memory;
using AiAdmin.Services.Memory.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/runtime-signals")]
[Authorize]
public class RuntimeSignalController : AiAdminBaseController
{
    private readonly RuntimeSignalService _runtimeSignalService;

    public RuntimeSignalController(RuntimeSignalService runtimeSignalService)
    {
        _runtimeSignalService = runtimeSignalService;
    }

    [HttpGet]
    [RequirePermission("memory-library:list")]
    public async Task<Result<PageData<RuntimeSignalDto>>> GetPage([FromQuery] RuntimeSignalListQuery query, CancellationToken cancellationToken)
    {
        var (list, total) = await _runtimeSignalService.GetPageAsync(query, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<PageData<RuntimeSignalDto>>.Ok(new PageData<RuntimeSignalDto>
        {
            Total = total,
            List = list
        });
    }

    [HttpPut("{id}/status")]
    [RequirePermission("memory-library:list")]
    public async Task<Result<RuntimeSignalDto>> UpdateStatus(string id, [FromBody] RuntimeSignalStatusUpdateDto dto, CancellationToken cancellationToken)
    {
        var result = await _runtimeSignalService.UpdateStatusAsync(id, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<RuntimeSignalDto>.Ok(result);
    }

    [HttpDelete("{id}")]
    [RequirePermission("memory-library:list")]
    public async Task<Result<object>> DeleteTodo(string id, CancellationToken cancellationToken)
    {
        await _runtimeSignalService.DeleteTodoAsync(id, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }
}
