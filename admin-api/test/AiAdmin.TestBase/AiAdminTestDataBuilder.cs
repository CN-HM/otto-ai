using AiAdmin.Entities;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.TestBase;

public class AiAdminTestDataBuilder : ITransientDependency
{
    private readonly Data.AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public AiAdminTestDataBuilder(Data.AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public async Task<SysUser> SeedUserAsync(
        string username = "testuser",
        string password = "hashedpassword",
        bool superAdmin = false,
        string? mobile = null)
    {
        var user = new SysUser
        {
            Id = DateTime.UtcNow.Ticks,
            Username = username,
            Password = password,
            SuperAdmin = superAdmin ? (short)1 : (short)0,
            Status = 1,
            Mobile = mobile,
            CreateDate = DateTime.UtcNow
        };
        _db.SysUsers.Add(user);
        await _db.SaveChangesAsync();
        return user;
    }

    public async Task<AiBillingPlan> SeedBillingPlanAsync(
        string code = "trial_monthly",
        string name = "Trial Plan",
        long includedTokens = 10000,
        long bonusTokens = 1000,
        bool isDefault = true,
        bool isEnabled = true)
    {
        var plan = new AiBillingPlan
        {
            Id = _guidGenerator.Create().ToString("N"),
            Code = code,
            Name = name,
            IncludedTokens = includedTokens,
            BonusTokens = bonusTokens,
            IsDefault = isDefault,
            IsEnabled = isEnabled,
            PlanType = "subscription",
            CycleMonths = 1,
            Sort = 1,
            CreateDate = DateTime.UtcNow
        };
        _db.AiBillingPlans.Add(plan);
        await _db.SaveChangesAsync();
        return plan;
    }

    public async Task<AiDevice> SeedDeviceAsync(
        long userId,
        string macAddress = "AA:BB:CC:DD:EE:FF",
        string alias = "Test Device")
    {
        var device = new AiDevice
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId,
            MacAddress = macAddress,
            Alias = alias,
            CreateDate = DateTime.UtcNow
        };
        _db.AiDevices.Add(device);
        await _db.SaveChangesAsync();
        return device;
    }

    public async Task SeedSystemSettingsAsync()
    {
        if (!await _db.SystemSettings.AnyAsync())
        {
            _db.SystemSettings.Add(new SystemSettings
            {
                Id = 1,
                BillingDefaultPlanCode = "trial_monthly",
                BillingResetTimezone = "Asia/Taipei",
                BillingLowBalanceRatio = 0.1m,
                BillingExhaustionRemindCooldownHours = 12
            });
            await _db.SaveChangesAsync();
        }
    }
}
