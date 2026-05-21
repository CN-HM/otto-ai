using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Infrastructure;
using AiAdmin.Services.Voice.Dtos;
using Volo.Abp.Guids;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Controllers;

/// <summary>
/// OTA固件管理控制器
/// 提供固件版本管理、OTA升级配置功能
/// </summary>
[ApiController]
[Route("otaMag")]
public class OtaController : AiAdminBaseController
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;
    /// <summary>Web主机环境</summary>
    private readonly IWebHostEnvironment _env;
    private readonly IGuidGenerator _guidGenerator;

    /// <summary>创建OTA控制器实例</summary>
    public OtaController(AiAdminDbContext db, IWebHostEnvironment env, IGuidGenerator guidGenerator)
    {
        _db = db;
        _env = env;
        _guidGenerator = guidGenerator;
    }

    /// <summary>分页查询 OTA 固件信息</summary>
    [HttpGet]
    [Authorize]
    [RequirePermission("ota:list")]
    public async Task<Result<PageData<OtaEntityDto>>> Page([FromQuery] int page = 1, [FromQuery] int limit = 10)
    {
        var total = await _db.AiOtas.CountAsync();
        var items = await _db.AiOtas
            .OrderBy(x => x.Sort)
            .ThenByDescending(x => x.CreateDate)
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync();

        var list = items.Select(ToDto).ToList();
        return Result<PageData<OtaEntityDto>>.Ok(new PageData<OtaEntityDto> { Total = total, List = list });
    }

    /// <summary>信息 OTA 固件信息</summary>
    [HttpGet("{id}")]
    [Authorize]
    [RequirePermission("ota:list")]
    public async Task<Result<OtaEntityDto>> Get(string id)
    {
        var x = await _db.AiOtas.FindAsync(id);
        if (x == null) return Result<OtaEntityDto>.Error("固件不存在");
        return Result<OtaEntityDto>.Ok(ToDto(x));
    }

    /// <summary>保存 OTA 固件信息</summary>
    [HttpPost]
    [Authorize]
    [RequirePermission("ota:create")]
    public async Task<Result<object>> Save([FromBody] OtaEntityDto dto)
    {
        var entity = new AiOta
        {
            Id = _guidGenerator.Create().ToString("N"),
            FirmwareName = dto.FirmwareName,
            Type = dto.Type,
            Version = dto.Version,
            Size = dto.Size,
            Remark = dto.Remark,
            FirmwarePath = dto.FirmwarePath,
            Sort = dto.Sort ?? 0,
            Creator = CurrentUserId,
            CreateDate = DateTime.UtcNow,
            Updater = CurrentUserId,
            UpdateDate = DateTime.UtcNow
        };
        _db.AiOtas.Add(entity);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>修改 OTA 固件信息</summary>
    [HttpPut("{id}")]
    [Authorize]
    [RequirePermission("ota:create")]
    public async Task<Result<object>> Update(string id, [FromBody] OtaEntityDto dto)
    {
        var entity = await _db.AiOtas.FindAsync(id);
        if (entity == null) return Result<object>.Error("固件不存在");

        entity.FirmwareName = dto.FirmwareName ?? entity.FirmwareName;
        entity.Type = dto.Type ?? entity.Type;
        entity.Version = dto.Version ?? entity.Version;
        entity.Size = dto.Size ?? entity.Size;
        entity.Remark = dto.Remark;
        entity.FirmwarePath = dto.FirmwarePath ?? entity.FirmwarePath;
        entity.Sort = dto.Sort ?? entity.Sort;
        entity.Updater = CurrentUserId;
        entity.UpdateDate = DateTime.UtcNow;
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>OTA 删除</summary>
    [HttpDelete("batch/{ids}")]
    [Authorize]
    [RequirePermission("ota:delete")]
    public async Task<Result<object>> Delete(string ids)
    {
        var idList = ids.Split(',').ToList();
        var entities = await _db.AiOtas.Where(x => idList.Contains(x.Id)).ToListAsync();
        _db.AiOtas.RemoveRange(entities);
        await _db.SaveChangesAsync();
        return Result<object>.Ok();
    }

    /// <summary>上传固件文件</summary>
    [HttpPost("upload")]
    [Authorize]
    [RequirePermission("ota:create")]
    public async Task<Result<string>> UploadFirmware(IFormFile file)
    {
        if (file == null || file.Length == 0)
            return Result<string>.Error("文件不能为空");

        var uploadPath = Path.Combine(_env.ContentRootPath, "uploads", "firmware");
        Directory.CreateDirectory(uploadPath);
        var fileName = $"{_guidGenerator.Create():N}{Path.GetExtension(file.FileName)}";
        var filePath = Path.Combine(uploadPath, fileName);
        await using var stream = System.IO.File.Create(filePath);
        await file.CopyToAsync(stream);
        return Result<string>.Ok($"/uploads/firmware/{fileName}");
    }

    /// <summary>上传资源固件文件</summary>
    [HttpPost("uploadAssetsBin")]
    [Authorize]
    [RequirePermission("ota:create")]
    public async Task<Result<string>> UploadAssetsBin(IFormFile file)
    {
        if (file == null || file.Length == 0)
            return Result<string>.Error("文件不能为空");

        var uploadPath = Path.Combine(_env.ContentRootPath, "uploads", "assets");
        Directory.CreateDirectory(uploadPath);
        var fileName = $"{_guidGenerator.Create():N}{Path.GetExtension(file.FileName)}";
        var filePath = Path.Combine(uploadPath, fileName);
        await using var stream = System.IO.File.Create(filePath);
        await file.CopyToAsync(stream);
        return Result<string>.Ok($"/uploads/assets/{fileName}");
    }

    /// <summary>获取 OTA 固件下载链接</summary>
    [HttpGet("getDownloadUrl/{id}")]
    [Authorize]
    public async Task<Result<string>> GetDownloadUrl(string id)
    {
        var entity = await _db.AiOtas.FindAsync(id);
        if (entity == null) return Result<string>.Error("固件不存在");
        return Result<string>.Ok(entity.FirmwarePath ?? string.Empty);
    }

    /// <summary>下载固件文件</summary>
    [HttpGet("download/{uuid}")]
    public async Task<IActionResult> DownloadFirmware(string uuid)
    {
        var entity = await _db.AiOtas.FindAsync(uuid);
        if (entity?.FirmwarePath == null) return NotFound();

        var filePath = Path.Combine(_env.ContentRootPath, entity.FirmwarePath.TrimStart('/'));
        if (!System.IO.File.Exists(filePath)) return NotFound();

        var bytes = await System.IO.File.ReadAllBytesAsync(filePath);
        return File(bytes, "application/octet-stream", entity.FirmwareName ?? "firmware.bin");
    }

    private static OtaEntityDto ToDto(AiOta x) => new()
    {
        Id = x.Id,
        FirmwareName = x.FirmwareName,
        Type = x.Type,
        Version = x.Version,
        Size = x.Size,
        Remark = x.Remark,
        FirmwarePath = x.FirmwarePath,
        Sort = x.Sort,
        Creator = x.Creator,
        CreateDate = x.CreateDate?.ToString("yyyy-MM-dd HH:mm:ss"),
        Updater = x.Updater,
        UpdateDate = x.UpdateDate?.ToString("yyyy-MM-dd HH:mm:ss")
    };
}
