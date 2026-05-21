# Backend Testing Infrastructure Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax.

**Goal:** Establish a complete testing framework for admin-api using ABP vNext official recommendations — xUnit + Shouldly + NSubstitute + SQLite In-Memory, with risk-prioritized test coverage for Auth, Billing, Device, AgentRole, and RBAC modules.

**Architecture:** Three test projects in `admin-api/test/`: `AiAdmin.TestBase` (shared ABP test module with SQLite), `AiAdmin.Application.Tests` (service integration tests using full DI container), `AiAdmin.Domain.Tests` (pure unit tests for entity logic and stateless services). Follows ABP's layered test project convention with `[DependsOn]` module chaining. Authorization is disabled in test context per ABP convention.

**Tech Stack:** xUnit 2.x, Shouldly, NSubstitute, Volo.Abp.TestBase 10.1.0, Volo.Abp.EntityFrameworkCore.Sqlite 10.1.0, Microsoft.NET.Test.Sdk, coverlet.collector

**Test Priority (risk-tiered):**
1. BillingService — token accounting, usage reporting, subscription lifecycle (money-critical)
2. Auth — JWT token generation/validation, login flow (security-critical)
3. PermissionService — permission cache, RBAC enforcement
4. AgentRoleService — role CRUD, binding, snapshot
5. Device provisioning — credential issuance, bootstrap

---

### Task 1: Create AiAdmin.TestBase project

**Files:**
- Create: `admin-api/test/AiAdmin.TestBase/AiAdmin.TestBase.csproj`
- Create: `admin-api/test/AiAdmin.TestBase/AiAdminTestBaseModule.cs`
- Create: `admin-api/test/AiAdmin.TestBase/AiAdminTestDataBuilder.cs`
- Create: `admin-api/test/AiAdmin.TestBase/AiAdminIntegratedTest.cs`

- [ ] **Step 1: Create csproj with package references**

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net10.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
    <IsTestProject>false</IsTestProject>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Volo.Abp.TestBase" Version="10.1.0" />
    <PackageReference Include="Volo.Abp.EntityFrameworkCore.Sqlite" Version="10.1.0" />
    <PackageReference Include="xunit" Version="2.9.3" />
    <PackageReference Include="Shouldly" Version="4.3.0" />
    <PackageReference Include="NSubstitute" Version="5.3.0" />
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.13.0" />
    <PackageReference Include="xunit.runner.visualstudio" Version="3.0.2">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers</IncludeAssets>
    </PackageReference>
  </ItemGroup>

  <ItemGroup>
    <ProjectReference Include="..\..\AiAdmin.csproj" />
  </ItemGroup>

</Project>
```

- [ ] **Step 2: Run dotnet restore to verify packages resolve**

Run: `dotnet restore admin-api/test/AiAdmin.TestBase/AiAdmin.TestBase.csproj`
Expected: Restore succeeds with no errors.

- [ ] **Step 3: Create AiAdminTestBaseModule.cs**

```csharp
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.Sqlite;
using Volo.Abp.Modularity;

namespace AiAdmin.TestBase;

[DependsOn(
    typeof(AiAdminModule),
    typeof(AbpEntityFrameworkCoreSqliteModule)
)]
public class AiAdminTestBaseModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var sqliteConnection = CreateInMemorySqliteConnection();
        context.Services.AddSingleton(sqliteConnection);

        context.Services.Configure<AbpDbContextOptions>(options =>
        {
            options.Configure(configurationContext =>
            {
                configurationContext.DbContextOptions.UseSqlite(sqliteConnection);
            });
        });
    }

    public override void OnApplicationInitialization(ApplicationInitializationContext context)
    {
        var dbContext = context.ServiceProvider.GetRequiredService<Data.AiAdminDbContext>();
        dbContext.Database.EnsureCreated();
    }

    private static SqliteConnection CreateInMemorySqliteConnection()
    {
        var connection = new SqliteConnection("Data Source=:memory:");
        connection.Open();
        return connection;
    }
}
```

- [ ] **Step 4: Create AiAdminTestDataBuilder.cs**

```csharp
using AiAdmin.Entities;
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
        string deviceName = "Test Device")
    {
        var device = new AiDevice
        {
            Id = _guidGenerator.Create().ToString("N"),
            UserId = userId,
            MacAddress = macAddress,
            DeviceName = deviceName,
            Status = "active",
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
```

- [ ] **Step 5: Create AiAdminIntegratedTest.cs**

```csharp
using Volo.Abp;

namespace AiAdmin.TestBase;

public abstract class AiAdminIntegratedTest : AbpIntegratedTest<AiAdminTestBaseModule>
{
    protected AiAdminTestDataBuilder DataBuilder => GetRequiredService<AiAdminTestDataBuilder>();

    protected override void SetAbpApplicationCreationOptions(AbpApplicationCreationOptions options)
    {
        options.UseAutofac();
    }
}
```

- [ ] **Step 6: Run dotnet build to verify compilation**

Run: `dotnet build admin-api/test/AiAdmin.TestBase/AiAdmin.TestBase.csproj`
Expected: Build succeeds with no errors.

- [ ] **Step 7: Commit**

---
### Task 2: Create AiAdmin.Application.Tests project

**Files:**
- Create: `admin-api/test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj`
- Create: `admin-api/test/AiAdmin.Application.Tests/AiAdminApplicationTestModule.cs`
- Create: `admin-api/test/AiAdmin.Application.Tests/appsettings.json`

- [ ] **Step 1: Create csproj**

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net10.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
    <IsTestProject>true</IsTestProject>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.13.0" />
    <PackageReference Include="xunit.runner.visualstudio" Version="3.0.2">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers</IncludeAssets>
    </PackageReference>
    <PackageReference Include="coverlet.collector" Version="6.0.4">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers</IncludeAssets>
    </PackageReference>
  </ItemGroup>

  <ItemGroup>
    <ProjectReference Include="..\AiAdmin.TestBase\AiAdmin.TestBase.csproj" />
  </ItemGroup>

  <ItemGroup>
    <None Update="appsettings.json">
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </None>
  </ItemGroup>

</Project>
```

- [ ] **Step 2: Create AiAdminApplicationTestModule.cs**

```csharp
using Volo.Abp.Modularity;

namespace AiAdmin.Application.Tests;

[DependsOn(typeof(TestBase.AiAdminTestBaseModule))]
public class AiAdminApplicationTestModule : AbpModule
{
}
```

- [ ] **Step 3: Create appsettings.json**

```json
{
  "Jwt": {
    "Issuer": "TestIssuer",
    "Audience": "TestAudience",
    "SecretKey": "test-secret-key-that-is-long-enough-for-hmac-sha256-algorithm",
    "ExpireMinutes": 10080
  },
  "ServiceAuth": {
    "Secret": "test-service-secret-32-chars--"
  },
  "ConnectionStrings": {
    "Default": "Data Source=:memory:"
  },
  "Cache": {
    "UseInMemory": true
  },
  "IoTRuntime": {
    "Enabled": false
  },
  "StringEncryption": {
    "DefaultPassPhrase": "test-passphrase-"
  },
  "Sms": {
    "Provider": "NetEase",
    "NetEase": {
      "AppKey": "test",
      "AppSecret": "test",
      "SendUrl": "https://localhost/sms",
      "VerifyUrl": "https://localhost/verify",
      "CodeLength": 6
    }
  },
  "Turnstile": {
    "Enabled": false,
    "SiteKey": "test",
    "SecretKey": "test"
  }
}
```

- [ ] **Step 4: Run dotnet build**

Run: `dotnet build admin-api/test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj`
Expected: Build succeeds.

- [ ] **Step 5: Commit**

---
### Task 3: Create AiAdmin.Domain.Tests project

**Files:**
- Create: `admin-api/test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj`

- [ ] **Step 1: Create csproj (no ABP dependency — pure xUnit)**

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net10.0</TargetFramework>
    <Nullable>enable</Nullable>
    <ImplicitUsings>enable</ImplicitUsings>
    <IsTestProject>true</IsTestProject>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.13.0" />
    <PackageReference Include="xunit" Version="2.9.3" />
    <PackageReference Include="xunit.runner.visualstudio" Version="3.0.2">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Shouldly" Version="4.3.0" />
    <PackageReference Include="NSubstitute" Version="5.3.0" />
    <PackageReference Include="coverlet.collector" Version="6.0.4">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers</IncludeAssets>
    </PackageReference>
  </ItemGroup>

  <ItemGroup>
    <ProjectReference Include="..\..\AiAdmin.csproj" />
  </ItemGroup>

</Project>
```

- [ ] **Step 2: Run dotnet build**

Run: `dotnet build admin-api/test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj`
Expected: Build succeeds.

- [ ] **Step 3: Commit**

---
### Task 4: Write JwtTokenService unit tests (Domain.Tests)

**Files:**
- Create: `admin-api/test/AiAdmin.Domain.Tests/Services/Auth/JwtTokenServiceTests.cs`

- [ ] **Step 1: Write the tests**

```csharp
using AiAdmin.Services.Auth;
using NSubstitute;
using Shouldly;
using Volo.Abp.Guids;
using Xunit;

namespace AiAdmin.Domain.Tests.Services.Auth;

public class JwtTokenServiceTests
{
    private readonly JwtTokenService _jwtService;
    private readonly IConfiguration _config;
    private readonly IGuidGenerator _guidGenerator;

    public JwtTokenServiceTests()
    {
        _config = CreateTestConfiguration();
        _guidGenerator = Substitute.For<IGuidGenerator>();
        _guidGenerator.Create().Returns(Guid.NewGuid());

        _jwtService = new JwtTokenService(_config, _guidGenerator);
    }

    [Fact]
    public void Should_Generate_Valid_Token()
    {
        var (token, expire) = _jwtService.GenerateToken(1, "admin", true);

        token.ShouldNotBeNullOrEmpty();
        expire.ShouldBeGreaterThan(DateTime.UtcNow);
    }

    [Fact]
    public void Should_Validate_Valid_Token()
    {
        var (token, _) = _jwtService.GenerateToken(1, "admin", true);

        var principal = _jwtService.ValidateToken(token);

        principal.ShouldNotBeNull();
        principal!.FindFirst("sub")!.Value.ShouldBe("1");
        principal.FindFirst("name")!.Value.ShouldBe("admin");
        principal.FindFirst("superAdmin")!.Value.ShouldBe("1");
    }

    [Fact]
    public void Should_Return_Null_For_Invalid_Token()
    {
        var principal = _jwtService.ValidateToken("invalid-token");

        principal.ShouldBeNull();
    }

    [Fact]
    public void Should_Return_Null_For_Expired_Token()
    {
        // Use config with 0-minute expiry to force immediate expiration
        var expiredConfig = CreateTestConfiguration(expireMinutes: 0);
        var expiredService = new JwtTokenService(expiredConfig, _guidGenerator);
        var (token, _) = expiredService.GenerateToken(1, "user", false);

        // Small delay to ensure expiration passes
        Thread.Sleep(100);

        var principal = expiredService.ValidateToken(token);
        principal.ShouldBeNull();
    }

    [Fact]
    public void Should_Set_SuperAdmin_Claim_Correctly()
    {
        var (token1, _) = _jwtService.GenerateToken(1, "admin", true);
        var principal1 = _jwtService.ValidateToken(token1);
        principal1!.FindFirst("superAdmin")!.Value.ShouldBe("1");

        var (token0, _) = _jwtService.GenerateToken(2, "user", false);
        var principal0 = _jwtService.ValidateToken(token0);
        principal0!.FindFirst("superAdmin")!.Value.ShouldBe("0");
    }

    [Fact]
    public void Should_Include_User_Id_As_Sub_Claim()
    {
        var (token, _) = _jwtService.GenerateToken(42, "test", false);

        var principal = _jwtService.ValidateToken(token);

        principal!.FindFirst("sub")!.Value.ShouldBe("42");
    }

    private static IConfiguration CreateTestConfiguration(int expireMinutes = 10080)
    {
        var configData = new Dictionary<string, string?>
        {
            ["Jwt:Issuer"] = "TestIssuer",
            ["Jwt:Audience"] = "TestAudience",
            ["Jwt:SecretKey"] = "test-secret-key-that-is-long-enough-for-hmac-sha256-algorithm-min-32-chars",
            ["Jwt:ExpireMinutes"] = expireMinutes.ToString()
        };
        return new ConfigurationBuilder().AddInMemoryCollection(configData).Build();
    }
}
```

- [ ] **Step 2: Run tests**

Run: `dotnet test admin-api/test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj --filter "FullyQualifiedName~JwtTokenServiceTests"`
Expected: All 6 tests pass.

- [ ] **Step 3: Commit**

---
### Task 5: Write BillingService integration tests (Application.Tests)

**Files:**
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/Billing/BillingServiceTests.cs`

- [ ] **Step 1: Write the tests**

```csharp
using AiAdmin.Entities;
using AiAdmin.Services.Billing;
using AiAdmin.Services.Billing.Dtos;
using AiAdmin.TestBase;
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
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync("trial_monthly", "Trial Monthly", 10000, 1000, isDefault: true);
        var user = await DataBuilder.SeedUserAsync("newuser");

        // Act
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        // Assert
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var subscription = await db.AiUserSubscriptions
            .FirstOrDefaultAsync(x => x.UserId == user.Id);
        subscription.ShouldNotBeNull();
        subscription!.Status.ShouldBe("active");
        subscription.AutoRenew.ShouldBeTrue();
    }

    [Fact]
    public async Task Should_Not_Duplicate_Subscription_When_Already_Active()
    {
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("existinguser");

        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        // Act
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        // Assert
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var subscriptions = await db.AiUserSubscriptions
            .Where(x => x.UserId == user.Id && x.Status == "active")
            .ToListAsync();
        subscriptions.Count.ShouldBe(1);
    }

    [Fact]
    public async Task Should_Create_Subscription_Period_And_Ledger()
    {
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("perioduser");

        // Act
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        // Assert
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var periods = await db.AiSubscriptionPeriods
            .Where(x => x.UserId == user.Id)
            .ToListAsync();
        periods.Count.ShouldBe(1);
        periods[0].RemainingTokens.ShouldBe(11000); // 10000 + 1000 bonus

        var ledgers = await db.AiTokenLedgers
            .Where(x => x.UserId == user.Id)
            .ToListAsync();
        ledgers.Count.ShouldBeGreaterThan(0);
        ledgers.Any(x => x.ChangeType == "grant").ShouldBeTrue();
    }

    [Fact]
    public async Task Should_Get_User_Summary()
    {
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("summaryuser");

        // Act
        var summary = await _billingService.GetUserSummaryAsync(user.Id);

        // Assert
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
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("usageuser");
        var device = await DataBuilder.SeedDeviceAsync(user.Id, "FF:EE:DD:CC:BB:AA");
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var dto = new BillingUsageReportDto
        {
            IdempotencyKey = Guid.NewGuid().ToString("N"),
            MacAddress = device.MacAddress,
            ServiceType = "LLM",
            UnitType = "tokens",
            NormalizedTokens = 100,
            RawUnits = 100
        };

        // Act
        var result = await _billingService.ReportUsageAsync(dto);

        // Assert
        result.Recorded.ShouldBeTrue();
        result.NormalizedTokens.ShouldBe(100);
        result.IsExhausted.ShouldBeFalse();

        var db = GetRequiredService<Data.AiAdminDbContext>();
        var period = await db.AiSubscriptionPeriods
            .FirstOrDefaultAsync(x => x.UserId == user.Id);
        period!.ConsumedTokens.ShouldBe(100);
    }

    [Fact]
    public async Task Should_Be_Idempotent_On_Usage_Reporting()
    {
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("idempotentuser");
        var device = await DataBuilder.SeedDeviceAsync(user.Id, "11:22:33:44:55:66");
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        var idempotencyKey = Guid.NewGuid().ToString("N");
        var dto = new BillingUsageReportDto
        {
            IdempotencyKey = idempotencyKey,
            MacAddress = device.MacAddress,
            NormalizedTokens = 50,
            RawUnits = 50
        };

        // Act
        var result1 = await _billingService.ReportUsageAsync(dto);
        var result2 = await _billingService.ReportUsageAsync(dto);

        // Assert
        result1.Recorded.ShouldBeTrue();
        result2.Recorded.ShouldBeFalse();

        var db = GetRequiredService<Data.AiAdminDbContext>();
        var records = await db.AiUsageRecords
            .Where(x => x.IdempotencyKey == idempotencyKey)
            .ToListAsync();
        records.Count.ShouldBe(1); // Only one record even though called twice
    }

    [Fact]
    public async Task Should_Throw_When_Reporting_Usage_For_Unregistered_Device()
    {
        // Arrange
        var dto = new BillingUsageReportDto
        {
            IdempotencyKey = Guid.NewGuid().ToString("N"),
            MacAddress = "00:00:00:00:00:00",
            NormalizedTokens = 10,
            RawUnits = 10
        };

        // Act & Assert
        var ex = await Should.ThrowAsync<InvalidOperationException>(
            async () => await _billingService.ReportUsageAsync(dto));
        ex.Message.ShouldContain("Error:DeviceNotRegistered");
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
        ex.Message.ShouldContain("Error:IdempotencyKeyRequired");
    }

    [Fact]
    public async Task Should_Grant_Tokens_And_Update_Balance()
    {
        // Arrange
        await DataBuilder.SeedSystemSettingsAsync();
        await DataBuilder.SeedBillingPlanAsync();
        var user = await DataBuilder.SeedUserAsync("grantuser");
        await _billingService.EnsureDefaultSubscriptionForUserAsync(user.Id);

        // Act
        await _billingService.GrantTokensAsync(user.Id, 500, "客服赠量", user.Id);

        // Assert
        var summary = await _billingService.GetUserSummaryAsync(user.Id);
        summary!.TotalTokens.ShouldBe(11500); // 11000 + 500
    }

    [Fact]
    public async Task Should_Throw_When_Grant_Negative_Tokens()
    {
        var ex = await Should.ThrowAsync<InvalidOperationException>(
            async () => await _billingService.GrantTokensAsync(1, -10, null, 1));
        ex.Message.ShouldContain("Error:TokensMustBePositive");
    }

    [Fact]
    public async Task Should_Get_Plan_List()
    {
        // Arrange
        await DataBuilder.SeedBillingPlanAsync("basic_monthly", "Basic", 5000, 0, isDefault: false);
        await DataBuilder.SeedBillingPlanAsync("pro_monthly", "Pro", 50000, 5000, isDefault: false);

        // Act
        var plans = await _billingService.GetPlanListAsync();

        // Assert
        plans.Count.ShouldBeGreaterThanOrEqualTo(2);
        plans.ShouldAllBe(x => x.Code != null);
    }
}
```

- [ ] **Step 2: Run tests**

Run: `dotnet test admin-api/test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj --filter "FullyQualifiedName~BillingServiceTests"`
Expected: All 12 tests pass.

- [ ] **Step 3: Commit**

---
### Task 6: Write PermissionService integration tests (Application.Tests)

**Files:**
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/Rbac/PermissionServiceTests.cs`

- [ ] **Step 1: Write the tests**

```csharp
using AiAdmin.Entities;
using AiAdmin.Services.Rbac;
using AiAdmin.TestBase;
using Shouldly;
using Xunit;

namespace AiAdmin.Application.Tests.Services.Rbac;

public class PermissionServiceTests : AiAdminIntegratedTest
{
    private readonly PermissionService _permissionService;

    public PermissionServiceTests()
    {
        _permissionService = GetRequiredService<PermissionService>();
    }

    [Fact]
    public async Task Should_Return_Empty_Permissions_For_User_Without_Roles()
    {
        var permissions = await _permissionService.GetUserPermissionsAsync(99999);

        permissions.ShouldBeEmpty();
    }

    [Fact]
    public async Task Should_Return_Permissions_For_User_With_Role()
    {
        // Arrange
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var user = await DataBuilder.SeedUserAsync("permuser");

        var menu = new SysMenu
        {
            Id = 1,
            Code = "device:list",
            Name = "Device List",
            Type = "page",
            Status = "0",
            CreateDate = DateTime.UtcNow
        };
        var role = new SysRole
        {
            Id = 1,
            Name = "Operator",
            Code = "operator",
            Status = 1,
            CreateDate = DateTime.UtcNow
        };
        db.SysMenus.Add(menu);
        db.SysRoles.Add(role);
        await db.SaveChangesAsync();

        db.SysRoleMenus.Add(new SysRoleMenu { Id = 1, RoleId = 1, MenuId = 1 });
        db.SysUserRoles.Add(new SysUserRole { Id = 1, UserId = user.Id, RoleId = 1 });
        await db.SaveChangesAsync();

        // Act
        var permissions = await _permissionService.GetUserPermissionsAsync(user.Id);

        // Assert
        permissions.ShouldContain("device:list");
    }

    [Fact]
    public async Task Should_Cache_Permissions_And_Return_From_Cache()
    {
        // Arrange
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var user = await DataBuilder.SeedUserAsync("cacheuser");
        var menu = new SysMenu
        {
            Id = 2,
            Code = "agent:read",
            Name = "Agent Read",
            Type = "page",
            Status = "0",
            CreateDate = DateTime.UtcNow
        };
        var role = new SysRole
        {
            Id = 2,
            Name = "Viewer",
            Code = "viewer",
            Status = 1,
            CreateDate = DateTime.UtcNow
        };
        db.SysMenus.Add(menu);
        db.SysRoles.Add(role);
        await db.SaveChangesAsync();
        db.SysRoleMenus.Add(new SysRoleMenu { Id = 2, RoleId = 2, MenuId = 2 });
        db.SysUserRoles.Add(new SysUserRole { Id = 2, UserId = user.Id, RoleId = 2 });
        await db.SaveChangesAsync();

        // Act
        var firstCall = await _permissionService.GetUserPermissionsAsync(user.Id);
        var secondCall = await _permissionService.GetUserPermissionsAsync(user.Id);

        // Assert: both calls return same data (second from cache)
        firstCall.ShouldContain("agent:read");
        secondCall.ShouldContain("agent:read");
        firstCall.ShouldBeEquivalentTo(secondCall);
    }

    [Fact]
    public async Task Should_Invalidate_Cache()
    {
        // Arrange
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var user = await DataBuilder.SeedUserAsync("invalidcacheuser");
        var menu = new SysMenu
        {
            Id = 3,
            Code = "billing:read",
            Name = "Billing Read",
            Type = "page",
            Status = "0",
            CreateDate = DateTime.UtcNow
        };
        var role = new SysRole
        {
            Id = 3,
            Name = "Finance",
            Code = "finance",
            Status = 1,
            CreateDate = DateTime.UtcNow
        };
        db.SysMenus.Add(menu);
        db.SysRoles.Add(role);
        await db.SaveChangesAsync();
        db.SysRoleMenus.Add(new SysRoleMenu { Id = 3, RoleId = 3, MenuId = 3 });
        db.SysUserRoles.Add(new SysUserRole { Id = 3, UserId = user.Id, RoleId = 3 });
        await db.SaveChangesAsync();

        var firstCall = await _permissionService.GetUserPermissionsAsync(user.Id);
        firstCall.ShouldContain("billing:read");

        // Act: remove role and invalidate cache
        var userRole = await db.SysUserRoles.FirstOrDefaultAsync(x => x.UserId == user.Id);
        db.SysUserRoles.Remove(userRole!);
        await db.SaveChangesAsync();
        await _permissionService.InvalidateUserPermCacheAsync(user.Id);

        // Assert: permissions should be empty after invalidation
        var afterInvalidation = await _permissionService.GetUserPermissionsAsync(user.Id);
        afterInvalidation.ShouldBeEmpty();
    }

    [Fact]
    public async Task Should_Check_HasPermission_Correctly()
    {
        // Arrange
        var db = GetRequiredService<Data.AiAdminDbContext>();
        var user = await DataBuilder.SeedUserAsync("checkpermuser");
        var menu = new SysMenu
        {
            Id = 4,
            Code = "admin:manage",
            Name = "Admin Manage",
            Type = "page",
            Status = "0",
            CreateDate = DateTime.UtcNow
        };
        var role = new SysRole
        {
            Id = 4,
            Name = "Admin",
            Code = "admin",
            Status = 1,
            CreateDate = DateTime.UtcNow
        };
        db.SysMenus.Add(menu);
        db.SysRoles.Add(role);
        await db.SaveChangesAsync();
        db.SysRoleMenus.Add(new SysRoleMenu { Id = 4, RoleId = 4, MenuId = 4 });
        db.SysUserRoles.Add(new SysUserRole { Id = 4, UserId = user.Id, RoleId = 4 });
        await db.SaveChangesAsync();

        // Act & Assert
        (await _permissionService.HasPermissionAsync(user.Id, "admin:manage")).ShouldBeTrue();
        (await _permissionService.HasPermissionAsync(user.Id, "nonexistent:perm")).ShouldBeFalse();
    }
}
```

- [ ] **Step 2: Run tests**

Run: `dotnet test admin-api/test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj --filter "FullyQualifiedName~PermissionServiceTests"`
Expected: All 5 tests pass.

- [ ] **Step 3: Commit**

---
### Task 7: Write Entity domain logic unit tests (Domain.Tests)

**Files:**
- Create: `admin-api/test/AiAdmin.Domain.Tests/Entities/ClaimsPrincipalExtensionsTests.cs`
- Create: `admin-api/test/AiAdmin.Domain.Tests/Infrastructure/ResultTests.cs`

- [ ] **Step 1: Write ClaimsPrincipalExtensions tests**

```csharp
using System.Security.Claims;
using AiAdmin.Infrastructure;
using Shouldly;
using Xunit;

namespace AiAdmin.Domain.Tests.Entities;

public class ClaimsPrincipalExtensionsTests
{
    [Fact]
    public void Should_Get_UserId_From_Sub_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("sub", "42"),
            new Claim("name", "testuser")
        ], "test"));

        var userId = principal.GetUserId();

        userId.ShouldBe(42);
    }

    [Fact]
    public void Should_Get_UserId_From_NameIdentifier_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim(ClaimTypes.NameIdentifier, "99"),
            new Claim("name", "testuser")
        ], "test"));

        var userId = principal.GetUserId();

        userId.ShouldBe(99);
    }

    [Fact]
    public void Should_Return_Zero_When_No_UserId_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity());

        var userId = principal.GetUserId();

        userId.ShouldBe(0);
    }

    [Fact]
    public void Should_Detect_SuperAdmin()
    {
        var superAdmin = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("superAdmin", "1")
        ], "test"));

        var normalUser = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("superAdmin", "0")
        ], "test"));

        superAdmin.IsSuperAdmin().ShouldBeTrue();
        normalUser.IsSuperAdmin().ShouldBeFalse();
    }

    [Fact]
    public void Should_Get_Username_From_Name_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("name", "john_doe")
        ], "test"));

        var username = principal.GetUsername();

        username.ShouldBe("john_doe");
    }
}
```

- [ ] **Step 2: Write Result tests**

```csharp
using AiAdmin.Infrastructure;
using Shouldly;
using Xunit;

namespace AiAdmin.Domain.Tests.Infrastructure;

public class ResultTests
{
    [Fact]
    public void Should_Create_Ok_Result()
    {
        var result = Result<string>.Ok("hello");

        result.Code.ShouldBe(0);
        result.Msg.ShouldBe("success");
        result.Data.ShouldBe("hello");
    }

    [Fact]
    public void Should_Create_Ok_Result_With_Null_Data()
    {
        var result = Result<object>.Ok();

        result.Code.ShouldBe(0);
        result.Data.ShouldBeNull();
    }

    [Fact]
    public void Should_Create_Error_Result()
    {
        var result = Result<string>.Error("something went wrong", 400);

        result.Code.ShouldBe(400);
        result.Msg.ShouldBe("something went wrong");
        result.Data.ShouldBeNull();
    }
}
```

- [ ] **Step 3: Run all Domain.Tests**

Run: `dotnet test admin-api/test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj`
Expected: All tests pass (JwtTokenService + ClaimsPrincipalExtensions + Result tests).

- [ ] **Step 4: Commit**

---
### Task 8: Run all tests and verify full coverage

- [ ] **Step 1: Run all test projects**

Run: `dotnet test admin-api/test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj && dotnet test admin-api/test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj`
Expected: All tests pass across both projects.

- [ ] **Step 2: Check test count**

Run: `dotnet test admin-api/test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj --verbosity minimal 2>&1 | Select-String "Total tests"` and `dotnet test admin-api/test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj --verbosity minimal 2>&1 | Select-String "Total tests"`
Expected: Domain.Tests ≥ 14 tests, Application.Tests ≥ 17 tests, total ≥ 31 tests.

- [ ] **Step 3: Commit**

---
### Task 9: Set up GitHub Actions CI pipeline

**Files:**
- Create: `.github/workflows/test.yml`

- [ ] **Step 1: Create workflow file**

```yaml
name: Backend Tests

on:
  push:
    branches: [main]
    paths:
      - 'admin-api/**'
  pull_request:
    branches: [main]
    paths:
      - 'admin-api/**'

jobs:
  test:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: admin-api

    steps:
      - uses: actions/checkout@v4

      - name: Setup .NET
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: '10.0.x'

      - name: Restore dependencies
        run: dotnet restore

      - name: Build
        run: dotnet build --no-restore --configuration Release

      - name: Run Domain Tests
        run: dotnet test test/AiAdmin.Domain.Tests/AiAdmin.Domain.Tests.csproj --no-build --configuration Release --verbosity normal --logger "trx;LogFileName=domain-results.trx"

      - name: Run Application Tests
        run: dotnet test test/AiAdmin.Application.Tests/AiAdmin.Application.Tests.csproj --no-build --configuration Release --verbosity normal --logger "trx;LogFileName=application-results.trx"

      - name: Upload test results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: test-results
          path: admin-api/test/**/TestResults/*.trx
```

- [ ] **Step 2: Commit**

---
