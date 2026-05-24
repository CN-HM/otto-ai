using AiAdmin.Services.SystemPrompt;
using Microsoft.AspNetCore.Mvc;
using Volo.Abp.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[Route("api/system-prompt")]
public class SystemPromptController : AbpControllerBase
{
    private readonly SystemPromptTemplateRenderer _renderer;

    public SystemPromptController(SystemPromptTemplateRenderer renderer)
    {
        _renderer = renderer;
    }

    [HttpGet("variables")]
    public IActionResult GetVariables()
    {
        var variables = _renderer.GetAvailableVariables();
        return Ok(new { variables });
    }
}
