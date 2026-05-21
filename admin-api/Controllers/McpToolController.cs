using AiAdmin.Infrastructure;
using AiAdmin.Services.McpTools;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

/// <summary>
/// MCP 工具管理控制器
/// </summary>
[ApiController]
[Route("admin/mcp-tools")]
[Authorize]
public class McpToolController : AiAdminBaseController
{
    private readonly McpToolService _mcpToolService;

    public McpToolController(McpToolService mcpToolService)
    {
        _mcpToolService = mcpToolService;
    }

    /// <summary>分页查询 MCP 工具列表</summary>
    [HttpGet]
    [RequirePermission("mcp-tool:list")]
    public async Task<Result<PageData<McpToolDto>>> List([FromQuery] McpToolListQuery query, CancellationToken cancellationToken)
    {
        var (list, total) = await _mcpToolService.GetPageAsync(query, cancellationToken);
        return Result<PageData<McpToolDto>>.Ok(new PageData<McpToolDto>
        {
            Total = total,
            List = list
        });
    }

    /// <summary>获取所有启用的 MCP 工具选项（用于下拉选择）</summary>
    [HttpGet("options")]
    [RequirePermission("mcp-tool:list")]
    public async Task<Result<List<McpToolOptionDto>>> GetOptions(CancellationToken cancellationToken)
    {
        var list = await _mcpToolService.GetActiveOptionsAsync(cancellationToken);
        return Result<List<McpToolOptionDto>>.Ok(list);
    }

    /// <summary>获取所有 MCP 工具类别</summary>
    [HttpGet("categories")]
    [RequirePermission("mcp-tool:list")]
    public async Task<Result<List<string>>> GetCategories(CancellationToken cancellationToken)
    {
        var categories = await _mcpToolService.GetCategoriesAsync(cancellationToken);
        return Result<List<string>>.Ok(categories);
    }

    /// <summary>获取 MCP 工具详情</summary>
    [HttpGet("{id}")]
    [RequirePermission("mcp-tool:list")]
    public async Task<Result<McpToolDto>> Get(string id, CancellationToken cancellationToken)
    {
        var dto = await _mcpToolService.GetAsync(id, cancellationToken);
        if (dto == null)
            return Result<McpToolDto>.Error("MCP 工具不存在");
        return Result<McpToolDto>.Ok(dto);
    }

    /// <summary>创建 MCP 工具</summary>
    [HttpPost]
    [RequirePermission("mcp-tool:create")]
    public async Task<Result<McpToolDto>> Create([FromBody] McpToolUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _mcpToolService.CreateAsync(dto, CurrentUserId, cancellationToken);
        return Result<McpToolDto>.Ok(result);
    }

    /// <summary>更新 MCP 工具</summary>
    [HttpPut("{id}")]
    [RequirePermission("mcp-tool:update")]
    public async Task<Result<McpToolDto>> Update(string id, [FromBody] McpToolUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _mcpToolService.UpdateAsync(id, dto, CurrentUserId, cancellationToken);
        return Result<McpToolDto>.Ok(result);
    }

    /// <summary>删除 MCP 工具</summary>
    [HttpDelete("{id}")]
    [RequirePermission("mcp-tool:delete")]
    public async Task<Result<object>> Delete(string id, CancellationToken cancellationToken)
    {
        await _mcpToolService.DeleteAsync(id, cancellationToken);
        return Result<object>.Ok();
    }
}
