using AiAdmin.Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Volo.Abp.Guids;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/common")]
[Authorize]
public class CommonController : AiAdminBaseController
{
    private readonly IGuidGenerator _guidGenerator;

    public CommonController(IGuidGenerator guidGenerator)
    {
        _guidGenerator = guidGenerator;
    }

    [HttpGet("generate-code")]
    public Result<GenerateCodeOutput> GenerateCode([FromQuery] string prefix = "")
    {
        var code = string.IsNullOrWhiteSpace(prefix)
            ? _guidGenerator.Create().ToString("N")[..8]
            : $"{prefix.Trim().ToLowerInvariant()}_{_guidGenerator.Create().ToString("N")[..8]}";

        return Result<GenerateCodeOutput>.Ok(new GenerateCodeOutput { Code = code });
    }
}

public class GenerateCodeOutput
{
    public string Code { get; set; } = string.Empty;
}
