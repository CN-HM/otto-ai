using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Npgsql.EntityFrameworkCore.PostgreSQL;
using Volo.Abp.AuditLogging;
using Volo.Abp.AuditLogging.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.BackgroundJobs.EntityFrameworkCore;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

/// <summary>
/// 数据库上下文，管理所有实体的数据库访问
/// 继承ABP的AbpDbContext，集成ABP框架功能（设置管理、后台任务等）
/// </summary>
public class AiAdminDbContext : AbpDbContext<AiAdminDbContext>, IAuditLoggingDbContext
{
    // ── System ──
    /// <summary>系统用户表</summary>
    public DbSet<SysUser> SysUsers => Set<SysUser>();
    /// <summary>用户令牌表（用于JWT刷新）</summary>
    public DbSet<SysUserToken> SysUserTokens => Set<SysUserToken>();
    /// <summary>系统设置表</summary>
    public DbSet<SystemSettings> SystemSettings => Set<SystemSettings>();

    // ── RBAC ──
    /// <summary>角色表</summary>
    public DbSet<SysRole> SysRoles => Set<SysRole>();
    /// <summary>菜单表</summary>
    public DbSet<SysMenu> SysMenus => Set<SysMenu>();
    /// <summary>角色菜单关联表</summary>
    public DbSet<SysRoleMenu> SysRoleMenus => Set<SysRoleMenu>();
    /// <summary>用户角色关联表</summary>
    public DbSet<SysUserRole> SysUserRoles => Set<SysUserRole>();

    // ── Agent ──
    /// <summary>智能体表</summary>
    public DbSet<AiAgent> AiAgents => Set<AiAgent>();
    /// <summary>智能体插件映射表</summary>
    public DbSet<AiAgentPluginMapping> AiAgentPluginMappings => Set<AiAgentPluginMapping>();
    /// <summary>智能体上下文提供器表</summary>
    public DbSet<AiAgentContextProvider> AiAgentContextProviders => Set<AiAgentContextProvider>();

    // ── Agent Role ──
    /// <summary>智能体角色表</summary>
    public DbSet<AiAgentRole> AiAgentRoles => Set<AiAgentRole>();
    /// <summary>智能体角色插件映射表</summary>
    public DbSet<AiAgentRolePluginMapping> AiAgentRolePluginMappings => Set<AiAgentRolePluginMapping>();
    /// <summary>智能体角色上下文提供器表</summary>
    public DbSet<AiAgentRoleContextProvider> AiAgentRoleContextProviders => Set<AiAgentRoleContextProvider>();
    /// <summary>智能体角色知识库绑定表</summary>
    public DbSet<AiAgentRoleKnowledgeBinding> AiAgentRoleKnowledgeBindings => Set<AiAgentRoleKnowledgeBinding>();
    /// <summary>智能体角色发布表</summary>
    public DbSet<AiAgentRoleRelease> AiAgentRoleReleases => Set<AiAgentRoleRelease>();

    // ── MCP Tools ──
    /// <summary>MCP 工具主档表</summary>
    public DbSet<AiMcpTool> AiMcpTools => Set<AiMcpTool>();

    // ── Device ──
    /// <summary>设备表</summary>
    public DbSet<AiDevice> AiDevices => Set<AiDevice>();
    /// <summary>OTA升级表</summary>
    public DbSet<AiOta> AiOtas => Set<AiOta>();

    // ── Model ──
    /// <summary>共享云平台集成表</summary>
    public DbSet<AiProviderIntegration> AiProviderIntegrations => Set<AiProviderIntegration>();
    /// <summary>ASR Profile 表</summary>
    public DbSet<AiAsrProfile> AiAsrProfiles => Set<AiAsrProfile>();
    /// <summary>VAD Profile 表</summary>
    public DbSet<AiVadProfile> AiVadProfiles => Set<AiVadProfile>();
    /// <summary>LLM Profile 表</summary>
    public DbSet<AiLlmProfile> AiLlmProfiles => Set<AiLlmProfile>();
    /// <summary>TTS Profile 表</summary>
    public DbSet<AiTtsProfile> AiTtsProfiles => Set<AiTtsProfile>();
    /// <summary>Embedding Profile 表</summary>
    public DbSet<AiEmbeddingProfile> AiEmbeddingProfiles => Set<AiEmbeddingProfile>();
    /// <summary>TTS语音表</summary>
    public DbSet<AiTtsVoice> AiTtsVoices => Set<AiTtsVoice>();

    // ── Knowledge ──
    /// <summary>RAG数据集表</summary>
    public DbSet<AiRagDataset> AiRagDatasets => Set<AiRagDataset>();
    /// <summary>知识文档表</summary>
    public DbSet<AiRagKnowledgeDocument> AiRagKnowledgeDocuments => Set<AiRagKnowledgeDocument>();
    /// <summary>知识切片表</summary>
    public DbSet<AiRagKnowledgeChunk> AiRagKnowledgeChunks => Set<AiRagKnowledgeChunk>();

    // ── Memory ──
    /// <summary>记忆库表</summary>
    public DbSet<AiMemoryLibrary> AiMemoryLibraries => Set<AiMemoryLibrary>();
    /// <summary>记忆规则表</summary>
    public DbSet<AiMemoryRule> AiMemoryRules => Set<AiMemoryRule>();
    /// <summary>记忆记录表</summary>
    public DbSet<AiMemoryRecord> AiMemoryRecords => Set<AiMemoryRecord>();
    /// <summary>记忆检索日志表</summary>
    public DbSet<AiMemorySearchLog> AiMemorySearchLogs => Set<AiMemorySearchLog>();
    /// <summary>记忆提取任务表</summary>
    public DbSet<AiMemoryExtractionRun> AiMemoryExtractionRuns => Set<AiMemoryExtractionRun>();
    /// <summary>记忆规则执行日志表</summary>
    public DbSet<AiMemoryRuleExecutionLog> AiMemoryRuleExecutionLogs => Set<AiMemoryRuleExecutionLog>();
    /// <summary>记忆记录修订表</summary>
    public DbSet<AiMemoryRecordRevision> AiMemoryRecordRevisions => Set<AiMemoryRecordRevision>();
    /// <summary>动作规则表</summary>
    public DbSet<AiActionRule> AiActionRules => Set<AiActionRule>();
    /// <summary>运行时信号表</summary>
    public DbSet<AiRuntimeSignal> AiRuntimeSignals => Set<AiRuntimeSignal>();

    // ── Billing ──
    /// <summary>计费套餐表</summary>
    public DbSet<AiBillingPlan> AiBillingPlans => Set<AiBillingPlan>();
    /// <summary>计费套餐价格表</summary>
    public DbSet<AiBillingPlanPrice> AiBillingPlanPrices => Set<AiBillingPlanPrice>();
    /// <summary>用户订阅表</summary>
    public DbSet<AiUserSubscription> AiUserSubscriptions => Set<AiUserSubscription>();
    /// <summary>订阅账期表</summary>
    public DbSet<AiSubscriptionPeriod> AiSubscriptionPeriods => Set<AiSubscriptionPeriod>();
    /// <summary>统一用量记录表</summary>
    public DbSet<AiUsageRecord> AiUsageRecords => Set<AiUsageRecord>();
    /// <summary>Token 流水表</summary>
    public DbSet<AiTokenLedger> AiTokenLedgers => Set<AiTokenLedger>();
    /// <summary>用量折算规则表</summary>
    public DbSet<AiUsageConversionRule> AiUsageConversionRules => Set<AiUsageConversionRule>();
    /// <summary>订单表</summary>
    public DbSet<AiOrder> AiOrders => Set<AiOrder>();
    /// <summary>支付交易表</summary>
    public DbSet<AiPaymentTransaction> AiPaymentTransactions => Set<AiPaymentTransaction>();

    public DbSet<AuditLog> AuditLogs => Set<AuditLog>();
    public DbSet<AuditLogExcelFile> AuditLogExcelFiles => Set<AuditLogExcelFile>();

    /// <summary>创建数据库上下文实例</summary>
    public AiAdminDbContext(DbContextOptions<AiAdminDbContext> options)
        : base(options)
    {
    }

    /// <summary>
    /// 配置模型构建
    /// 设置ABP模块和自定义索引
    /// </summary>
    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.HasPostgresExtension("vector");
        builder.ConfigureAuditLogging();
        // 配置ABP设置管理模块
        builder.ConfigureSettingManagement();
        // 配置ABP后台任务模块
        builder.ConfigureBackgroundJobs();

        // ── RBAC indexes ──
        // 角色代码唯一索引
        builder.Entity<SysRole>(b =>
        {
            b.HasIndex(e => e.Code).IsUnique();
        });

        // 菜单代码唯一索引
        builder.Entity<SysMenu>(b =>
        {
            b.HasIndex(e => e.Code).IsUnique();
        });

        // 角色菜单联合唯一索引
        builder.Entity<SysRoleMenu>(b =>
        {
            b.HasIndex(e => new { e.RoleId, e.MenuId }).IsUnique();
        });

        // 用户角色联合唯一索引
        builder.Entity<SysUserRole>(b =>
        {
            b.HasIndex(e => new { e.UserId, e.RoleId }).IsUnique();
        });

        builder.Entity<AiBillingPlan>(b =>
        {
            b.HasIndex(e => e.Code).IsUnique();
        });

        builder.Entity<AiBillingPlanPrice>(b =>
        {
            b.HasIndex(e => new { e.PlanId, e.RegionCode, e.CurrencyCode, e.ProviderCode }).IsUnique();
            b.Property(e => e.Amount).HasPrecision(18, 2);
        });

        builder.Entity<AiUserSubscription>(b =>
        {
            b.HasIndex(e => new { e.UserId, e.Status });
        });

        builder.Entity<AiSubscriptionPeriod>(b =>
        {
            b.HasIndex(e => new { e.SubscriptionId, e.PeriodKey }).IsUnique();
            b.HasIndex(e => new { e.UserId, e.PeriodKey });
        });

        builder.Entity<AiUsageRecord>(b =>
        {
            b.HasIndex(e => e.IdempotencyKey).IsUnique();
            b.HasIndex(e => new { e.UserId, e.HappenedAt });
            b.Property(e => e.RawUnits).HasPrecision(18, 6);
        });

        builder.Entity<AiTokenLedger>(b =>
        {
            b.HasIndex(e => new { e.UserId, e.CreateDate });
        });

        builder.Entity<AiUsageConversionRule>(b =>
        {
            b.HasIndex(e => new { e.ServiceType, e.ProviderCode, e.UnitType }).IsUnique();
            b.Property(e => e.TokensPerUnit).HasPrecision(18, 6);
        });

        builder.Entity<AiAgentRole>(b =>
        {
            b.HasIndex(e => e.Code).IsUnique();
            b.HasIndex(e => new { e.Status, e.Sort });
            b.HasIndex(e => e.AsrProfileId);
            b.HasIndex(e => e.LlmProfileId);
            b.HasIndex(e => e.TtsProfileId);
        });

        builder.Entity<AiAsrProfile>(b =>
        {
            b.HasIndex(e => new { e.Status, e.Sort });
            b.HasIndex(e => e.IntegrationId);
            b.Property(e => e.IntegrationId).IsRequired();
            b.HasOne<AiProviderIntegration>()
                .WithMany()
                .HasForeignKey(e => e.IntegrationId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        builder.Entity<AiVadProfile>(b =>
        {
            b.HasIndex(e => new { e.Status, e.Sort });
        });

        builder.Entity<AiLlmProfile>(b =>
        {
            b.HasIndex(e => new { e.Status, e.Sort });
            b.HasIndex(e => e.IntegrationId);
            b.Property(e => e.IntegrationId).IsRequired();
            b.HasOne<AiProviderIntegration>()
                .WithMany()
                .HasForeignKey(e => e.IntegrationId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        builder.Entity<AiTtsProfile>(b =>
        {
            b.HasIndex(e => new { e.Status, e.Sort });
            b.HasIndex(e => e.IntegrationId);
            b.Property(e => e.IntegrationId).IsRequired();
            b.HasOne<AiProviderIntegration>()
                .WithMany()
                .HasForeignKey(e => e.IntegrationId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        builder.Entity<AiEmbeddingProfile>(b =>
        {
            b.HasIndex(e => new { e.Status, e.Sort });
            b.HasIndex(e => e.IntegrationId);
            b.Property(e => e.IntegrationId).IsRequired();
            b.HasOne<AiProviderIntegration>()
                .WithMany()
                .HasForeignKey(e => e.IntegrationId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        builder.Entity<AiProviderIntegration>(b =>
        {
            b.HasIndex(e => e.Code).IsUnique();
            b.HasIndex(e => new { e.ProviderCode, e.Status, e.Sort });
            b.HasIndex(e => new { e.ProviderType, e.Status, e.Sort });
            b.HasIndex(e => new { e.SupportsAsr, e.Status, e.Sort });
            b.HasIndex(e => new { e.SupportsTts, e.Status, e.Sort });
            b.HasIndex(e => new { e.SupportsLlm, e.Status, e.Sort });
            b.HasIndex(e => new { e.SupportsMem, e.Status, e.Sort });
            b.Property(e => e.ProviderType)
                .HasConversion(
                    providerType => ProviderTypeConverter.ToStorageValue(providerType),
                    value => ProviderTypeConverter.Parse(value))
                .HasMaxLength(32);
        });

        builder.Entity<AiAgentRoleRelease>(b =>
        {
            b.HasIndex(e => new { e.RoleId, e.Version }).IsUnique();
            b.HasIndex(e => new { e.RoleId, e.Status, e.PublishedAt });
        });

        builder.Entity<AiAgentRolePluginMapping>(b =>
        {
            b.HasIndex(e => new { e.AgentRoleId, e.PluginId, e.ProviderCode });
        });

        builder.Entity<AiAgentRoleContextProvider>(b =>
        {
            b.HasIndex(e => new { e.AgentRoleId, e.CreateDate });
        });

        builder.Entity<AiAgentRoleKnowledgeBinding>(b =>
        {
            b.HasIndex(e => new { e.AgentRoleId, e.DatasetId }).IsUnique();
            b.HasIndex(e => new { e.AgentRoleId, e.Sort });
        });

        builder.Entity<AiMcpTool>(b =>
        {
            b.HasIndex(e => e.Code).IsUnique();
            b.HasIndex(e => new { e.Status, e.Sort });
            b.HasIndex(e => e.Category);
            b.HasIndex(e => e.IsSystem);
        });

        builder.Entity<AiRagKnowledgeChunk>(b =>
        {
            var embedding = b.Property<string?>("Embedding").HasColumnName("embedding").HasColumnType("vector");
            embedding.Metadata.SetBeforeSaveBehavior(PropertySaveBehavior.Ignore);
            embedding.Metadata.SetAfterSaveBehavior(PropertySaveBehavior.Ignore);
            b.HasIndex(e => new { e.DatasetId, e.DocumentId, e.ChunkIndex }).IsUnique();
            b.HasIndex(e => new { e.DatasetId, e.ContentHash });
        });

        builder.Entity<SystemSettings>(b =>
        {
            b.Property(e => e.BillingLowBalanceRatio).HasPrecision(18, 6);
        });

        builder.Entity<AiDevice>(b =>
        {
            b.HasIndex(e => e.CredentialId).IsUnique();
        });

        builder.Entity<AiMemoryLibrary>(b =>
        {
            b.HasIndex(e => new { e.UserId, e.Code }).IsUnique();
            b.HasIndex(e => new { e.UserId, e.AgentId });
            b.HasIndex(e => new { e.AgentId, e.Status });
        });

        builder.Entity<AiActionRule>(b =>
        {
            b.HasIndex(e => new { e.AgentRoleId, e.Name }).IsUnique();
            b.HasIndex(e => new { e.AgentRoleId, e.ActionType, e.IsEnabled });
        });

        builder.Entity<AiMemoryRule>(b =>
        {
            b.HasIndex(e => new { e.LibraryId, e.RuleName }).IsUnique();
            b.HasIndex(e => new { e.LibraryId, e.RuleType, e.IsEnabled });
            b.HasIndex(e => new { e.LibraryId, e.RuleCode }).IsUnique();
        });

        builder.Entity<AiMemoryRecord>(b =>
        {
            b.HasIndex(e => new { e.LibraryId, e.EntityId, e.UpdatedAt });
            b.HasIndex(e => new { e.LibraryId, e.SessionId });
            b.HasIndex(e => new { e.LibraryId, e.RecordType, e.ExpiresAt });
            b.HasIndex(e => new { e.AgentId, e.UserId, e.CreatedAt });
            b.HasIndex(e => new { e.LibraryId, e.EntityId, e.RuleId, e.CanonicalKey });
            b.HasIndex(e => new { e.LibraryId, e.EntityId, e.RuleId, e.ContentHash });
            b.HasIndex(e => new { e.SourceRunId });
        });

        builder.Entity<AiMemorySearchLog>(b =>
        {
            b.HasIndex(e => new { e.LibraryId, e.CreatedAt });
            b.HasIndex(e => new { e.EntityId, e.CreatedAt });
        });

        builder.Entity<AiMemoryExtractionRun>(b =>
        {
            b.HasIndex(e => new { e.LibraryId, e.CreatedAt });
            b.HasIndex(e => new { e.EntityId, e.CreatedAt });
            b.HasIndex(e => new { e.Status, e.CreatedAt });
        });

        builder.Entity<AiMemoryRuleExecutionLog>(b =>
        {
            b.HasIndex(e => new { e.RunId, e.RuleId });
            b.HasIndex(e => new { e.LibraryId, e.CreatedAt });
        });

        builder.Entity<AiMemoryRecordRevision>(b =>
        {
            b.HasIndex(e => new { e.RecordId, e.CreatedAt });
            b.HasIndex(e => new { e.SourceRunId });
        });

        builder.Entity<AiRuntimeSignal>(b =>
        {
            b.HasIndex(e => new { e.Status, e.ScheduledAt });
            b.HasIndex(e => new { e.SignalType, e.Status, e.CreatedAt });
            b.HasIndex(e => e.DedupeKey);
            b.HasIndex(e => e.SourceRunId);
            b.HasIndex(e => new { e.UserId, e.CreatedAt });
            b.HasIndex(e => new { e.DeviceId, e.CreatedAt });
        });

        builder.Entity<AiOrder>(b =>
        {
            b.HasIndex(e => e.OrderNo).IsUnique();
            b.HasIndex(e => new { e.UserId, e.Status });
            b.Property(e => e.Amount).HasPrecision(18, 2);
        });

        builder.Entity<AiPaymentTransaction>(b =>
        {
            b.HasIndex(e => new { e.OrderId, e.TransactionNo });
            b.HasIndex(e => new { e.ProviderCode, e.TransactionNo });
        });
    }
}
