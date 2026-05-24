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
        await SeedSystemMcpTools();
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

    private async Task SeedSystemMcpTools()
    {
        var now = DateTime.UtcNow;
        var tools = new[]
        {
            new { Code = McpSystemToolCodes.SendSms,               Name = "发送短信",     Category = McpToolCategory.Notification, Description = "发送短信通知到指定手机号",                ParamSchema = "{\"phone\":\"string\",\"content\":\"string\"}" },
            new { Code = McpSystemToolCodes.SendEmail,             Name = "发送邮件",     Category = McpToolCategory.Notification, Description = "发送邮件通知到指定邮箱",                ParamSchema = "{\"to\":\"string\",\"subject\":\"string\",\"body\":\"string\"}" },
            new { Code = McpSystemToolCodes.TodoList,              Name = "查询任务",     Category = McpToolCategory.Task,         Description = "查询待处理或到期的任务列表",            ParamSchema = "{\"status\":\"string\",\"signal_type\":\"string\",\"limit\":\"integer\"}" },
            new { Code = McpSystemToolCodes.TodoCreate,            Name = "创建待办",     Category = McpToolCategory.Task,         Description = "创建新的待办事项或提醒",                ParamSchema = "{\"title\":\"string\",\"content\":\"string\",\"signal_type\":\"string\",\"severity\":\"string\",\"scheduled_at\":\"string\"}" },
            new { Code = McpSystemToolCodes.TodoExecute,           Name = "执行任务",     Category = McpToolCategory.Task,         Description = "执行任务的提醒通知（短信或邮件）",       ParamSchema = "{\"signal_id\":\"string\",\"notification_channel\":\"string\",\"notification_message\":\"string\"}" },
            new { Code = McpSystemToolCodes.TodoComplete,          Name = "完成任务",     Category = McpToolCategory.Task,         Description = "标记任务为已完成",                      ParamSchema = "{\"signal_id\":\"string\",\"result_note\":\"string\"}" },
            new { Code = McpSystemToolCodes.RiskCreate,            Name = "创建风险线索", Category = McpToolCategory.Monitoring,   Description = "创建风险监控线索",                      ParamSchema = "{\"title\":\"string\",\"content\":\"string\",\"severity\":\"string\",\"evidence\":\"string\"}" },
            new { Code = McpSystemToolCodes.HealthFollowupCreate,  Name = "创建健康线索", Category = McpToolCategory.Monitoring,   Description = "创建健康随访线索",                      ParamSchema = "{\"title\":\"string\",\"content\":\"string\",\"scheduled_at\":\"string\",\"followup_type\":\"string\"}" }
        };

        foreach (var tool in tools)
        {
            var existing = await _db.AiMcpTools.FirstOrDefaultAsync(x => x.Code == tool.Code);
            if (existing != null)
            {
                existing.IsSystem = true;
                existing.Category = tool.Category;
                existing.UpdatedAt = now;
                continue;
            }

            _db.AiMcpTools.Add(new AiMcpTool
            {
                Id = Guid.NewGuid().ToString("N")[..32],
                Code = tool.Code,
                Name = tool.Name,
                Category = tool.Category,
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
