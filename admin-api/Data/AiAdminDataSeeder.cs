using Microsoft.EntityFrameworkCore;
using Volo.Abp.Data;
using Volo.Abp.DependencyInjection;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools;

namespace AiAdmin.Data;

/// <summary>
/// 数据库种子数据初始化器
/// 负责系统启动时的默认数据填充，包括管理员账号、模型配置、RBAC等
/// </summary>
public partial class AiAdminDataSeeder : IDataSeedContributor, ITransientDependency
{
    private readonly AiAdminDbContext _db;

    public AiAdminDataSeeder(AiAdminDbContext db)
    {
        _db = db;
    }

    public async Task SeedAsync(DataSeedContext context)
    {
        await SeedAdminUser();
        await SeedProviderIntegrations();
        // await SeedPipelineTemplates();
        // await SeedVadProfiles();
        // await SeedEmbeddingProfiles();
        // await SeedTtsVoices();
        // await SeedAgentRoles();
        await SeedSystemSettings();
        await SeedBilling();
        await SeedRbac();
        await SeedNotificationMcpTools();
    }

    private async Task SeedAdminUser()
    {
        if (await _db.SysUsers.AnyAsync(u => u.Username == "admin"))
            return;

        _db.SysUsers.Add(new SysUser
        {
            Id = 1,
            Username = "admin",
            Password = BCrypt.Net.BCrypt.HashPassword("admin123"),
            SuperAdmin = 1,
            Status = 1,
            CreateDate = DateTime.UtcNow,
            UpdateDate = DateTime.UtcNow
        });
        await _db.SaveChangesAsync();
    }

    private async Task SeedNotificationMcpTools()
    {
        var now = DateTime.UtcNow;
        var tools = new[]
        {
            new { Code = McpSystemToolCodes.SendSms, Name = "发送短信", Description = "发送短信通知到指定手机号", ParamSchema = "{\"phone\":\"string\",\"content\":\"string\"}" },
            new { Code = McpSystemToolCodes.SendEmail, Name = "发送邮件", Description = "发送邮件通知到指定邮箱", ParamSchema = "{\"to\":\"string\",\"subject\":\"string\",\"body\":\"string\"}" }
        };

        foreach (var tool in tools)
        {
            var code = tool.Code;
            var existing = await _db.AiMcpTools.FirstOrDefaultAsync(x => x.Code == code);
            if (existing != null)
            {
                existing.IsSystem = true;
                existing.Category = McpToolCategory.Notification;
                existing.UpdatedAt = now;
                continue;
            }

            _db.AiMcpTools.Add(new AiMcpTool
            {
                Id = Guid.NewGuid().ToString("N")[..32],
                Code = code,
                Name = tool.Name,
                Category = McpToolCategory.Notification,
                IsSystem = true,
                Description = tool.Description,
                ParamSchema = tool.ParamSchema,
                Status = "active",
                Sort = 0,
                CreatedAt = now,
                UpdatedAt = now,
                Creator = 1
            });
        }

        await _db.SaveChangesAsync();
    }

    private static long AllocateLongId(HashSet<long> usedIds, ref long nextId, long preferredId)
    {
        if (!usedIds.Contains(preferredId))
        {
            usedIds.Add(preferredId);
            return preferredId;
        }

        while (usedIds.Contains(nextId))
            nextId++;

        var allocatedId = nextId;
        usedIds.Add(allocatedId);
        nextId++;
        return allocatedId;
    }
}
