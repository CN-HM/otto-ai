using AiAdmin.Infrastructure;
using AiAdmin.Services.AgentRoles;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/agent-roles/runtime-test")]
[Authorize]
public class AgentRoleRuntimeTestController : AiAdminBaseController
{
    private readonly AgentRoleRuntimeTestService _runtimeTestService;

    public AgentRoleRuntimeTestController(AgentRoleRuntimeTestService runtimeTestService)
    {
        _runtimeTestService = runtimeTestService;
    }

    [HttpPost]
    [RequirePermission("agent-role:list")]
    public async Task<Result<AgentRoleRuntimeTestResultDto>> Run([FromBody] AgentRoleRuntimeTestRequestDto request, CancellationToken cancellationToken)
    {
        var result = await _runtimeTestService.RunAsync(request, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<AgentRoleRuntimeTestResultDto>.Ok(result);
    }

    [HttpPost("finalize")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<object>> Finalize([FromBody] AgentRoleRuntimeTestFinalizeRequestDto request, CancellationToken cancellationToken)
    {
        await _runtimeTestService.FinalizeSessionAsync(request.SessionId, cancellationToken);
        return Result<object>.Ok(new { message = "会话结束事件已提交，记忆抽取后台任务将异步执行。" });
    }
}

public sealed class AgentRoleRuntimeTestFinalizeRequestDto
{
    public string? SessionId { get; set; }
}
