using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Billing;
using AiAdmin.Services.Billing.Dtos;
using AiAdmin.TestBase;
using Microsoft.EntityFrameworkCore;
using Shouldly;
using Xunit;

namespace AiAdmin.Application.Tests.Services.Billing;

public class BillingServiceTests : AiAdminIntegratedTest
{
    private readonly BillingService _billingService;

    public BillingServiceTests()
    {
        _billingService = GetRequiredService<BillingService>();
    }

    [Fact]
    public async Task Should_Create_Default_Subscription_For_New_User()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync("trial_monthly", "Trial Monthly", 10000, 1000, isDefault: true);
        var user = await DataBuilder.SeedUserAsync("newuser");

        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var db = GetRequiredService<AiAdminDbContext>();
        var subscription = await db.AiUserSubscriptions
            .FirstOrDefaultAsync(x => x.UserId == user.Id);
        subscription.ShouldNotBeNull();
        subscription!.Status.ShouldBe("active");
        subscription.AutoRenew.ShouldBeTrue();
    }

    [Fact]
    public async Task Should_Not_Duplicate_Subscription_When_Already_Active()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("existinguser");

        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var db = GetRequiredService<AiAdminDbContext>();
        var subscriptions = await db.AiUserSubscriptions
            .Where(x => x.UserId == user.Id && x.Status == "active")
            .ToListAsync();
        subscriptions.Count.ShouldBe(1);
    }

    [Fact]
    public async Task Should_Create_Subscription_Period_And_Ledger()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("perioduser");

        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var db = GetRequiredService<AiAdminDbContext>();
        var periods = await db.AiSubscriptionPeriods
            .Where(x => x.UserId == user.Id)
            .ToListAsync();
        periods.Count.ShouldBe(1);
        periods[0].RemainingTokens.ShouldBe(11000);

        var ledgers = await db.AiTokenLedgers
            .Where(x => x.UserId == user.Id)
            .ToListAsync();
        ledgers.Count.ShouldBeGreaterThan(0);
        ledgers.Any(x => x.ChangeType == "grant").ShouldBeTrue();
    }

    [Fact]
    public async Task Should_Get_User_Summary()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("summaryuser");

        var summary = await _billingService.GetUserSummaryAsync(user.Id);

        summary.ShouldNotBeNull();
        summary!.UserId.ShouldBe(user.Id);
        summary.Username.ShouldBe("summaryuser");
        summary.PlanCode.ShouldBe("trial_monthly");
        summary.TotalTokens.ShouldBeGreaterThan(0);
        summary.RemainingTokens.ShouldBeGreaterThan(0);
    }

    [Fact]
    public async Task Should_Return_Null_Summary_For_Nonexistent_User()
    {
        var summary = await _billingService.GetUserSummaryAsync(99999);

        summary.ShouldBeNull();
    }

    [Fact]
    public async Task Should_Report_Usage_And_Deduct_Tokens()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("usageuser");
        var device = await DataBuilder.SeedDeviceAsync(user.Id, "FF:EE:DD:CC:BB:AA");
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var dto = new BillingUsageReportDto
        {
            IdempotencyKey = Guid.NewGuid().ToString("N"),
            MacAddress = device.MacAddress!,
            ServiceType = "LLM",
            UnitType = "tokens",
            NormalizedTokens = 100,
            RawUnits = 100
        };

        var result = await _billingService.ReportUsageAsync(dto);

        result.Recorded.ShouldBeTrue();
        result.NormalizedTokens.ShouldBe(100);
        result.IsExhausted.ShouldBeFalse();

        var db = GetRequiredService<AiAdminDbContext>();
        var period = await db.AiSubscriptionPeriods
            .FirstOrDefaultAsync(x => x.UserId == user.Id);
        period!.ConsumedTokens.ShouldBe(100);
    }

    [Fact]
    public async Task Should_Be_Idempotent_On_Usage_Reporting()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("idempotentuser");
        var device = await DataBuilder.SeedDeviceAsync(user.Id, "11:22:33:44:55:66");
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var idempotencyKey = Guid.NewGuid().ToString("N");
        var dto = new BillingUsageReportDto
        {
            IdempotencyKey = idempotencyKey,
            MacAddress = device.MacAddress!,
            NormalizedTokens = 50,
            RawUnits = 50
        };

        var result1 = await _billingService.ReportUsageAsync(dto);
        var result2 = await _billingService.ReportUsageAsync(dto);

        result1.Recorded.ShouldBeTrue();
        result2.Recorded.ShouldBeFalse();

        var db = GetRequiredService<AiAdminDbContext>();
        var records = await db.AiUsageRecords
            .Where(x => x.IdempotencyKey == idempotencyKey)
            .ToListAsync();
        records.Count.ShouldBe(1);
    }

    [Fact]
    public async Task Should_Throw_When_Reporting_Usage_For_Unregistered_Device()
    {
        var dto = new BillingUsageReportDto
        {
            IdempotencyKey = Guid.NewGuid().ToString("N"),
            MacAddress = "00:00:00:00:00:00",
            NormalizedTokens = 10,
            RawUnits = 10
        };

        var ex = await Should.ThrowAsync<InvalidOperationException>(
            async () => await _billingService.ReportUsageAsync(dto));
        ex.Message.ShouldContain("DeviceNotRegistered");
    }

    [Fact]
    public async Task Should_Throw_When_Idempotency_Key_Missing()
    {
        var dto = new BillingUsageReportDto
        {
            MacAddress = "AA:BB:CC:DD:EE:FF",
            NormalizedTokens = 10
        };

        var ex = await Should.ThrowAsync<InvalidOperationException>(
            async () => await _billingService.ReportUsageAsync(dto));
        ex.Message.ShouldContain("IdempotencyKeyRequired");
    }

    [Fact]
    public async Task Should_Grant_Tokens_And_Update_Balance()
    {
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("grantuser");
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        await _billingService.GrantTokensAsync(user.Id, 500, "客服赠量", user.Id);

        var summary = await _billingService.GetUserSummaryAsync(user.Id);
        summary!.TotalTokens.ShouldBe(11500);
    }

    [Fact]
    public async Task Should_Throw_When_Grant_Negative_Tokens()
    {
        var ex = await Should.ThrowAsync<InvalidOperationException>(
            async () => await _billingService.GrantTokensAsync(1, -10, null, 1));
        ex.Message.ShouldContain("TokensMustBePositive");
    }

    [Fact]
    public async Task Should_Get_Plan_List()
    {
        await DataBuilder.SeedBillingPlanAsync("basic_monthly", "Basic", 5000, 0, isDefault: false);
        await DataBuilder.SeedBillingPlanAsync("pro_monthly", "Pro", 50000, 5000, isDefault: false);

        var plans = await _billingService.GetPlanListAsync();

        plans.Count.ShouldBeGreaterThanOrEqualTo(2);
        plans.ShouldAllBe(x => x.Code != null);
    }
}
