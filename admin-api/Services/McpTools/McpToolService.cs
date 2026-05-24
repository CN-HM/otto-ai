using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools;

/// <summary>
/// MCP 工具管理服务
/// </summary>
public class McpToolService : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public McpToolService(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    /// <summary>
    /// 分页查询 MCP 工具列表
    /// </summary>
    public async Task<(List<McpToolDto> List, long Total)> GetPageAsync(McpToolListQuery query, CancellationToken cancellationToken = default)
    {
        var page = Math.Max(1, query.Page ?? 1);
        var limit = Math.Clamp(query.Limit ?? 10, 1, 100);
        var q = _db.AiMcpTools.AsNoTracking().AsQueryable();

        if (!string.IsNullOrWhiteSpace(query.Keyword))
        {
            var keyword = query.Keyword.Trim();
            q = q.Where(x => x.Name.Contains(keyword) || x.Code.Contains(keyword));
        }

        if (!string.IsNullOrWhiteSpace(query.Status))
        {
            q = q.Where(x => x.Status == query.Status.Trim());
        }

        if (!string.IsNullOrWhiteSpace(query.Category))
        {
            q = q.Where(x => x.Category == query.Category.Trim());
        }

        var total = await q.LongCountAsync(cancellationToken);
        var list = await q
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Code)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync(cancellationToken);

        return (list.Select(MapToDto).ToList(), total);
    }

    /// <summary>
    /// 获取所有启用的 MCP 工具（用于下拉选择）
    /// </summary>
    public async Task<List<McpToolOptionDto>> GetActiveOptionsAsync(CancellationToken cancellationToken = default)
    {
        var tools = await _db.AiMcpTools
            .AsNoTracking()
            .Where(x => x.Status == "active")
            .OrderBy(x => x.Sort)
            .ThenBy(x => x.Name)
            .ToListAsync(cancellationToken);

        return tools.Select(MapToOptionDto).ToList();
    }

    /// <summary>
    /// 获取 MCP 工具详情
    /// </summary>
    public async Task<McpToolDto?> GetAsync(string id, CancellationToken cancellationToken = default)
    {
        var entity = await _db.AiMcpTools
            .AsNoTracking()
            .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        return entity == null ? null : MapToDto(entity);
    }

    /// <summary>
    /// 创建 MCP 工具
    /// </summary>
    public async Task<McpToolDto> CreateAsync(McpToolUpsertDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var code = dto.Code.Trim();
        if (McpSystemToolCodes.IsSystemCode(code))
        {
            throw new InvalidOperationException("系统 MCP 工具由系统内置创建，不能手动创建同名工具");
        }

        if (await _db.AiMcpTools.AnyAsync(x => x.Code == code, cancellationToken))
        {
            throw new InvalidOperationException($"工具编码 '{code}' 已存在");
        }

        var now = DateTime.UtcNow;
        var entity = new AiMcpTool
        {
            Id = _guidGenerator.Create().ToString("N"),
            Code = code,
            Name = dto.Name.Trim(),
            Description = NormalizeText(dto.Description),
            Category = NormalizeText(dto.Category),
            ParamSchema = NormalizeJson(dto.ParamSchema),
            Status = dto.Status.ToLowerInvariant() == "inactive" ? "inactive" : "active",
            Sort = dto.Sort,
            CreatedAt = now,
            UpdatedAt = now,
            Creator = operatorUserId,
            Updater = operatorUserId
        };

        _db.AiMcpTools.Add(entity);
        await _db.SaveChangesAsync(cancellationToken);
        return MapToDto(entity);
    }

    /// <summary>
    /// 更新 MCP 工具
    /// </summary>
    public async Task<McpToolDto> UpdateAsync(string id, McpToolUpsertDto dto, long operatorUserId, CancellationToken cancellationToken = default)
    {
        var entity = await _db.AiMcpTools.FindAsync(new object[] { id }, cancellationToken)
            ?? throw new InvalidOperationException("MCP 工具不存在");

        var code = dto.Code.Trim();
        var category = NormalizeText(dto.Category);

        if (entity.IsSystem)
        {
            if (!string.Equals(entity.Code, code, StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException("系统 MCP 工具编码不能修改");
            }

            if (!string.Equals(entity.Category, category, StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException("系统 MCP 工具分类不能修改");
            }
        }
        else if (McpSystemToolCodes.IsSystemCode(code))
        {
            throw new InvalidOperationException("系统 MCP 工具编码不能分配给自定义工具");
        }

        if (await _db.AiMcpTools.AnyAsync(x => x.Code == code && x.Id != id, cancellationToken))
        {
            throw new InvalidOperationException($"工具编码 '{code}' 已被其他工具使用");
        }

        entity.Code = code;
        entity.Name = dto.Name.Trim();
        entity.Description = NormalizeText(dto.Description);
        entity.Category = category;
        entity.ParamSchema = NormalizeJson(dto.ParamSchema);
        entity.Status = dto.Status.ToLowerInvariant() == "inactive" ? "inactive" : "active";
        entity.Sort = dto.Sort;
        entity.UpdatedAt = DateTime.UtcNow;
        entity.Updater = operatorUserId;

        await _db.SaveChangesAsync(cancellationToken);
        return MapToDto(entity);
    }

    /// <summary>
    /// 删除 MCP 工具
    /// </summary>
    public async Task DeleteAsync(string id, CancellationToken cancellationToken = default)
    {
        var entity = await _db.AiMcpTools.FindAsync(new object[] { id }, cancellationToken);
        if (entity != null)
        {
            if (entity.IsSystem)
            {
                throw new InvalidOperationException("系统 MCP 工具不能删除");
            }

            _db.AiMcpTools.Remove(entity);
            await _db.SaveChangesAsync(cancellationToken);
        }
    }

    /// <summary>
    /// 获取所有类别（用于筛选）
    /// </summary>
    public async Task<List<string>> GetCategoriesAsync(CancellationToken cancellationToken = default)
    {
        return await _db.AiMcpTools
            .AsNoTracking()
            .Where(x => x.Category != null && x.Category != "")
            .Select(x => x.Category!)
            .Distinct()
            .OrderBy(x => x)
            .ToListAsync(cancellationToken);
    }

    private static McpToolDto MapToDto(AiMcpTool entity) => new()
    {
        Id = entity.Id,
        Code = entity.Code,
        Name = entity.Name,
        Description = entity.Description,
        Category = entity.Category,
        IsSystem = entity.IsSystem,
        ParamSchema = entity.ParamSchema,
        Status = entity.Status,
        Sort = entity.Sort,
        CreatedAt = entity.CreatedAt,
        UpdatedAt = entity.UpdatedAt
    };

    private static McpToolOptionDto MapToOptionDto(AiMcpTool entity) => new()
    {
        Id = entity.Id,
        Code = entity.Code,
        Name = entity.Name,
        Description = entity.Description,
        Category = entity.Category,
        IsSystem = entity.IsSystem
    };

    private static string? NormalizeText(string? value)
    {
        if (string.IsNullOrWhiteSpace(value)) return null;
        return value.Trim();
    }

    private static string? NormalizeJson(string? json)
    {
        if (string.IsNullOrWhiteSpace(json)) return null;
        try
        {
            var doc = JsonSerializer.Deserialize<JsonElement>(json);
            return JsonSerializer.Serialize(doc);
        }
        catch (JsonException)
        {
            throw new InvalidOperationException("参数模板必须是合法 JSON");
        }
    }
}
