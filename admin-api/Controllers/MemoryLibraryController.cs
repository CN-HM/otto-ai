using AiAdmin.Infrastructure;
using AiAdmin.Services.Memory;
using AiAdmin.Services.Memory.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("memory-libraries")]
public class MemoryLibraryController : AiAdminBaseController
{
    private readonly MemoryLibraryService _memoryLibraryService;

    public MemoryLibraryController(MemoryLibraryService memoryLibraryService)
    {
        _memoryLibraryService = memoryLibraryService;
    }

    [HttpGet]
    [Authorize]
    public async Task<Result<PageData<MemoryLibraryDto>>> GetPage([FromQuery] MemoryLibraryListQuery query, CancellationToken cancellationToken)
    {
        var (list, total) = await _memoryLibraryService.GetPageAsync(query,
            CurrentUserId,
            IsSuperAdmin,
            cancellationToken);
        return Result<PageData<MemoryLibraryDto>>.Ok(new PageData<MemoryLibraryDto>
        {
            Total = total,
            List = list
        });
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<Result<MemoryLibraryDto>> Get(string id, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.GetAsync(id, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemoryLibraryDto>.Ok(result);
    }

    [HttpGet("{libraryId}/rules")]
    [Authorize]
    public async Task<Result<List<MemoryRuleDto>>> GetRules(string libraryId, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.GetRulesAsync(libraryId, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<List<MemoryRuleDto>>.Ok(result);
    }

    [HttpPost("{libraryId}/rules")]
    [Authorize]
    public async Task<Result<MemoryRuleDto>> CreateRule(string libraryId, [FromBody] MemoryRuleUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.CreateRuleAsync(libraryId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemoryRuleDto>.Ok(result);
    }

    [HttpPut("{libraryId}/rules/{ruleId}")]
    [Authorize]
    public async Task<Result<MemoryRuleDto>> UpdateRule(string libraryId, string ruleId, [FromBody] MemoryRuleUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.UpdateRuleAsync(libraryId, ruleId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemoryRuleDto>.Ok(result);
    }

    [HttpDelete("{libraryId}/rules/{ruleId}")]
    [Authorize]
    public async Task<Result<object>> DeleteRule(string libraryId, string ruleId, CancellationToken cancellationToken)
    {
        await _memoryLibraryService.DeleteRuleAsync(libraryId, ruleId, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }

    [HttpGet("{libraryId}/records")]
    [Authorize]
    public async Task<Result<PageData<MemoryRecordDto>>> GetRecords(string libraryId, [FromQuery] MemoryRecordPageQuery query, CancellationToken cancellationToken)
    {
        var (list, total) = await _memoryLibraryService.GetRecordsPageAsync(libraryId,
            query,
            CurrentUserId,
            IsSuperAdmin,
            cancellationToken);
        return Result<PageData<MemoryRecordDto>>.Ok(new PageData<MemoryRecordDto>
        {
            Total = total,
            List = list
        });
    }

    [HttpPost("{libraryId}/records")]
    [Authorize]
    public async Task<Result<MemoryRecordDto>> CreateRecord(string libraryId, [FromBody] MemoryRecordUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.CreateRecordAsync(libraryId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemoryRecordDto>.Ok(result);
    }

    [HttpPost("{libraryId}/records/ingest")]
    [ServiceAuth]
    public async Task<Result<MemoryRecordDto>> IngestRecord(string libraryId, [FromBody] MemoryRecordUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.CreateRecordByServiceAsync(libraryId, dto, cancellationToken);
        return Result<MemoryRecordDto>.Ok(result);
    }

    [HttpPut("{libraryId}/records/{recordId}")]
    [Authorize]
    public async Task<Result<MemoryRecordDto>> UpdateRecord(string libraryId, string recordId, [FromBody] MemoryRecordUpsertDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.UpdateRecordAsync(libraryId, recordId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemoryRecordDto>.Ok(result);
    }

    [HttpDelete("{libraryId}/records/{recordId}")]
    [Authorize]
    public async Task<Result<object>> DeleteRecord(string libraryId, string recordId, CancellationToken cancellationToken)
    {
        await _memoryLibraryService.DeleteRecordAsync(libraryId, recordId, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<object>.Ok();
    }

    [HttpPost("{libraryId}/records/search")]
    [Authorize]
    public async Task<Result<MemorySearchResultDto>> Search(string libraryId, [FromBody] MemorySearchDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.SearchAsync(libraryId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemorySearchResultDto>.Ok(result);
    }

    [HttpPost("{libraryId}/retrieval-test")]
    [Authorize]
    public async Task<Result<MemorySearchResultDto>> RetrievalTest(string libraryId, [FromBody] MemorySearchDto dto, CancellationToken cancellationToken)
    {
        var result = await _memoryLibraryService.SearchAsync(libraryId, dto, CurrentUserId, IsSuperAdmin, cancellationToken);
        return Result<MemorySearchResultDto>.Ok(result);
    }
}
