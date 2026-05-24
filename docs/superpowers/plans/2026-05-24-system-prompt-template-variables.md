# System Prompt 模板变量系统实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将系统提示词中的运行时上下文注入标准化为 `{{variable}}` 模板变量替换机制，零硬编码注入。

**Architecture:** `ISystemPromptVariableProvider` 接口 + DI 聚合 → `SystemPromptTemplateRenderer` 正则替换 → 21 个内置变量 (Time/Device/Agent/User/Session) → API 暴露变量列表 → 前端变量面板。

**Tech Stack:** C# ABP vNext 10.1, EF Core, xUnit/Shouldly, Angular + PrimeNG, TypeScript

**Source:** `docs/design/2026-05-24-system-prompt-template-variables.md`

---

### Task 1: 创建接口 + 上下文 + DTO

**Files:**
- Create: `admin-api/Services/SystemPrompt/ISystemPromptVariableProvider.cs`
- Create: `admin-api/Services/SystemPrompt/VariableResolveContext.cs`
- Create: `admin-api/Services/SystemPrompt/Dtos/VariableDefinition.cs`

**Context:** 模板变量系统的核心接口和类型。`ISystemPromptVariableProvider` 定义了变量提供者契约（`SupportedVariables`、`GetDefinitions`、`ResolveAsync`）。`VariableResolveContext` 承载运行时上下文（预加载的 Device/AgentRole/SysUser 避免各 Provider 各自查 DB）。`VariableDefinition` 是 API 返回 DTO（Name/Category/Description/Example）。

- [ ] **Step 1: Create VariableDefinition DTO**

```csharp
// admin-api/Services/SystemPrompt/Dtos/VariableDefinition.cs
namespace AiAdmin.Services.SystemPrompt.Dtos;

public class VariableDefinition
{
    public string Name { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Example { get; set; } = string.Empty;
}
```

- [ ] **Step 2: Create VariableResolveContext**

```csharp
// admin-api/Services/SystemPrompt/VariableResolveContext.cs
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;

namespace AiAdmin.Services.SystemPrompt;

public class VariableResolveContext
{
    public string? AgentRoleId { get; set; }
    public string? DeviceId { get; set; }
    public string? SessionId { get; set; }
    public long? UserId { get; set; }

    public AiDevice? Device { get; set; }
    public AgentRoleRuntimeDescriptorDto? AgentRole { get; set; }
    public SysUser? User { get; set; }
}
```

- [ ] **Step 3: Create ISystemPromptVariableProvider interface**

```csharp
// admin-api/Services/SystemPrompt/ISystemPromptVariableProvider.cs
using AiAdmin.Services.SystemPrompt.Dtos;

namespace AiAdmin.Services.SystemPrompt;

public interface ISystemPromptVariableProvider
{
    IEnumerable<string> SupportedVariables { get; }
    IEnumerable<VariableDefinition> GetDefinitions();
    Task<string?> ResolveAsync(string variableName, VariableResolveContext context);
}
```

- [ ] **Step 4: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 5: Commit**

```bash
git add admin-api/Services/SystemPrompt/ISystemPromptVariableProvider.cs admin-api/Services/SystemPrompt/VariableResolveContext.cs admin-api/Services/SystemPrompt/Dtos/VariableDefinition.cs
git commit -m "feat: add ISystemPromptVariableProvider interface, VariableResolveContext, and VariableDefinition DTO"
```

---

### Task 2: 创建 SystemPromptTemplateRenderer

**Files:**
- Create: `admin-api/Services/SystemPrompt/SystemPromptTemplateRenderer.cs`

**Context:** 核心渲染引擎。构造函数通过 DI 接收所有 `ISystemPromptVariableProvider`，构建 `variableName → provider` 的字典索引。`GetAvailableVariables()` 返回所有变量定义列表（供 API 用）。`RenderAsync()` 用正则 `\{\{(\w+)\}\}` 扫描模板，匹配到变量则调 Provider 替换，未匹配则保留原文 + 打 WARNING 日志。

- [ ] **Step 1: Create SystemPromptTemplateRenderer**

```csharp
// admin-api/Services/SystemPrompt/SystemPromptTemplateRenderer.cs
using System.Text.RegularExpressions;
using AiAdmin.Services.SystemPrompt.Dtos;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt;

public partial class SystemPromptTemplateRenderer : ITransientDependency
{
    private readonly Dictionary<string, ISystemPromptVariableProvider> _index;
    private readonly ILogger<SystemPromptTemplateRenderer> _logger;

    public SystemPromptTemplateRenderer(
        IEnumerable<ISystemPromptVariableProvider> providers,
        ILogger<SystemPromptTemplateRenderer> logger)
    {
        _index = providers
            .SelectMany(p => p.SupportedVariables.Select(v => (name: v, provider: p)))
            .ToDictionary(x => x.name, x => x.provider);
        _logger = logger;
    }

    public List<VariableDefinition> GetAvailableVariables()
    {
        return _index.Values
            .Distinct()
            .SelectMany(p => p.GetDefinitions())
            .ToList();
    }

    public async Task<string> RenderAsync(string? template, VariableResolveContext context)
    {
        if (string.IsNullOrWhiteSpace(template))
            return template ?? string.Empty;

        var result = template;
        var matches = VariablePattern().Matches(template);

        foreach (Match match in matches)
        {
            var varName = match.Groups[1].Value;
            if (_index.TryGetValue(varName, out var provider))
            {
                var value = await provider.ResolveAsync(varName, context);
                if (value != null)
                    result = result.Replace(match.Value, value);
            }
            else
            {
                _logger.LogWarning("Unknown template variable: {{Variable}}", varName);
            }
        }

        return result;
    }

    [GeneratedRegex(@"\{\{(\w+)\}\}")]
    private static partial Regex VariablePattern();
}
```

- [ ] **Step 2: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 3: Commit**

```bash
git add admin-api/Services/SystemPrompt/SystemPromptTemplateRenderer.cs
git commit -m "feat: add SystemPromptTemplateRenderer with regex-based variable replacement"
```

---

### Task 3: 实现 TimeVariableProvider

**Files:**
- Create: `admin-api/Services/SystemPrompt/Variables/TimeVariableProvider.cs`

**Context:** 10 个时间变量（`current_datetime`, `current_date`, `current_time`, `current_weekday`, `current_year`, `current_month`, `current_day`, `current_hour`, `current_minute`, `current_timestamp`）。`ResolveAsync` 忽略 context 参数，直接用 `DateTime.Now` 取值。

- [ ] **Step 1: Create TimeVariableProvider**

```csharp
// admin-api/Services/SystemPrompt/Variables/TimeVariableProvider.cs
using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

public class TimeVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["current_datetime"] = new() { Name = "current_datetime", Category = "时间", Description = "当前完整日期时间", Example = "2026年5月24日 周日 15:30" },
        ["current_date"] = new() { Name = "current_date", Category = "时间", Description = "当前日期", Example = "2026年5月24日" },
        ["current_time"] = new() { Name = "current_time", Category = "时间", Description = "当前时间（24小时制）", Example = "15:30" },
        ["current_weekday"] = new() { Name = "current_weekday", Category = "时间", Description = "当前星期（中文）", Example = "周日" },
        ["current_year"] = new() { Name = "current_year", Category = "时间", Description = "当前年份", Example = "2026" },
        ["current_month"] = new() { Name = "current_month", Category = "时间", Description = "当前月份", Example = "5" },
        ["current_day"] = new() { Name = "current_day", Category = "时间", Description = "当前日期（日）", Example = "24" },
        ["current_hour"] = new() { Name = "current_hour", Category = "时间", Description = "当前小时", Example = "15" },
        ["current_minute"] = new() { Name = "current_minute", Category = "时间", Description = "当前分钟", Example = "30" },
        ["current_timestamp"] = new() { Name = "current_timestamp", Category = "时间", Description = "ISO 8601 时间戳", Example = "2026-05-24T15:30:00+08:00" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        var now = DateTime.Now;
        var weekday = now.DayOfWeek switch
        {
            DayOfWeek.Sunday => "周日",
            DayOfWeek.Monday => "周一",
            DayOfWeek.Tuesday => "周二",
            DayOfWeek.Wednesday => "周三",
            DayOfWeek.Thursday => "周四",
            DayOfWeek.Friday => "周五",
            DayOfWeek.Saturday => "周六",
            _ => now.DayOfWeek.ToString()
        };

        var value = variableName switch
        {
            "current_datetime" => $"{now:yyyy年M月d日} {weekday} {now:H:mm}",
            "current_date" => now.ToString("yyyy年M月d日"),
            "current_time" => now.ToString("H:mm"),
            "current_weekday" => weekday,
            "current_year" => now.Year.ToString(),
            "current_month" => now.Month.ToString(),
            "current_day" => now.Day.ToString(),
            "current_hour" => now.Hour.ToString(),
            "current_minute" => now.Minute.ToString(),
            "current_timestamp" => now.ToString("yyyy-MM-ddTHH:mm:sszzz"),
            _ => null
        };

        return Task.FromResult(value);
    }
}
```

- [ ] **Step 2: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 3: Commit**

```bash
git add admin-api/Services/SystemPrompt/Variables/TimeVariableProvider.cs
git commit -m "feat: add TimeVariableProvider with 10 time-related template variables"
```

---

### Task 4: 实现 DeviceVariableProvider + AgentVariableProvider

**Files:**
- Create: `admin-api/Services/SystemPrompt/Variables/DeviceVariableProvider.cs`
- Create: `admin-api/Services/SystemPrompt/Variables/AgentVariableProvider.cs`

**Context:** Device 从 `VariableResolveContext.Device` 取值（Alias→device_name, Board→device_model, Id→device_id, AppVersion→device_app_version），null 时返回空字符串。Agent 从 `VariableResolveContext.AgentRole` 取值（DisplayName→agent_name, Code→agent_code, Description→agent_description）。

- [ ] **Step 1: Create DeviceVariableProvider**

```csharp
// admin-api/Services/SystemPrompt/Variables/DeviceVariableProvider.cs
using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

public class DeviceVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["device_id"] = new() { Name = "device_id", Category = "设备", Description = "设备唯一 ID", Example = "DEVICE_A1B2C3" },
        ["device_name"] = new() { Name = "device_name", Category = "设备", Description = "设备别名", Example = "客厅小智" },
        ["device_model"] = new() { Name = "device_model", Category = "设备", Description = "硬件板型", Example = "ESP32-S3" },
        ["device_app_version"] = new() { Name = "device_app_version", Category = "设备", Description = "固件版本", Example = "v2.1.0" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        if (context.Device == null)
            return Task.FromResult<string?>(null);

        var value = variableName switch
        {
            "device_id" => context.Device.Id,
            "device_name" => context.Device.Alias,
            "device_model" => context.Device.Board,
            "device_app_version" => context.Device.AppVersion,
            _ => null
        };

        return Task.FromResult(value);
    }
}
```

- [ ] **Step 2: Create AgentVariableProvider**

```csharp
// admin-api/Services/SystemPrompt/Variables/AgentVariableProvider.cs
using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

public class AgentVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["agent_name"] = new() { Name = "agent_name", Category = "智能体", Description = "当前智能体角色的显示名称", Example = "小智助手" },
        ["agent_code"] = new() { Name = "agent_code", Category = "智能体", Description = "角色编码", Example = "smart_assistant" },
        ["agent_description"] = new() { Name = "agent_description", Category = "智能体", Description = "角色描述", Example = "温暖陪伴型家庭助手" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        if (context.AgentRole == null)
            return Task.FromResult<string?>(null);

        var value = variableName switch
        {
            "agent_name" => context.AgentRole.DisplayName ?? context.AgentRole.Name,
            "agent_code" => context.AgentRole.Code,
            "agent_description" => context.AgentRole.Description,
            _ => null
        };

        return Task.FromResult(value);
    }
}
```

- [ ] **Step 3: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 4: Commit**

```bash
git add admin-api/Services/SystemPrompt/Variables/DeviceVariableProvider.cs admin-api/Services/SystemPrompt/Variables/AgentVariableProvider.cs
git commit -m "feat: add DeviceVariableProvider and AgentVariableProvider"
```

---

### Task 5: 实现 UserVariableProvider + SessionVariableProvider

**Files:**
- Create: `admin-api/Services/SystemPrompt/Variables/UserVariableProvider.cs`
- Create: `admin-api/Services/SystemPrompt/Variables/SessionVariableProvider.cs`

**Context:** User 从 `VariableResolveContext.User` 取值（Username→user_name, Id→user_id）。Session 从 `VariableResolveContext.SessionId` 取值。均为 null 时返回空字符串。

- [ ] **Step 1: Create UserVariableProvider**

```csharp
// admin-api/Services/SystemPrompt/Variables/UserVariableProvider.cs
using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

public class UserVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["user_id"] = new() { Name = "user_id", Category = "用户", Description = "绑定用户的 ID", Example = "42" },
        ["user_name"] = new() { Name = "user_name", Category = "用户", Description = "用户显示名", Example = "小明" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        if (context.User == null)
            return Task.FromResult<string?>(null);

        var value = variableName switch
        {
            "user_id" => context.User.Id.ToString(),
            "user_name" => context.User.Username,
            _ => null
        };

        return Task.FromResult(value);
    }
}
```

- [ ] **Step 2: Create SessionVariableProvider**

```csharp
// admin-api/Services/SystemPrompt/Variables/SessionVariableProvider.cs
using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

public class SessionVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["session_id"] = new() { Name = "session_id", Category = "会话", Description = "当前会话 ID", Example = "SESS_abc123" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        var value = variableName switch
        {
            "session_id" => context.SessionId,
            _ => null
        };

        return Task.FromResult(value);
    }
}
```

- [ ] **Step 3: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 4: Commit**

```bash
git add admin-api/Services/SystemPrompt/Variables/UserVariableProvider.cs admin-api/Services/SystemPrompt/Variables/SessionVariableProvider.cs
git commit -m "feat: add UserVariableProvider and SessionVariableProvider"
```

---

### Task 6: 改造 DeviceConversationRuntimeService.BuildRuntimeSystemPrompt

**Files:**
- Modify: `admin-api/Services/Runtime/DeviceConversationRuntimeService.cs`

**Context:** 将 `BuildRuntimeSystemPrompt` 从 `static` 方法改为实例方法，注入 `SystemPromptTemplateRenderer`。构造函数新增 `SystemPromptTemplateRenderer` 参数。方法签名加 `VariableResolveContext`，调用 `_templateRenderer.RenderAsync()` 作为第一步。在 `ExecuteReplyPipelineAsync` 调用处构造 `VariableResolveContext`。

**Key code changes:**

1. Add field and update constructor to accept `SystemPromptTemplateRenderer _templateRenderer`
2. In `ExecuteReplyPipelineAsync`, construct `VariableResolveContext` before calling `BuildRuntimeSystemPrompt`
3. Change `BuildRuntimeSystemPrompt` signature: `private async Task<string?> BuildRuntimeSystemPrompt(string? baseSystemPrompt, MemoryRuntimeContextDto? memoryContext, VariableResolveContext variableContext)`
4. First line of method: `var rendered = await _templateRenderer.RenderAsync(normalizedBase, variableContext);`

- [ ] **Step 1: Add field and update constructor**

Add `private readonly SystemPromptTemplateRenderer _templateRenderer;` field, add to constructor params.

- [ ] **Step 2: Construct VariableResolveContext in ExecuteReplyPipelineAsync**

Add before the `BuildRuntimeSystemPrompt` call (after device and agentRole are loaded, before line 365):

```csharp
var variableContext = new VariableResolveContext
{
    AgentRoleId = agentRole.Id,
    DeviceId = device.Id,
    SessionId = request.SessionId,
    UserId = device.UserId,
    Device = device,
    AgentRole = agentRole,
    User = device.UserId != null
        ? await _db.SysUsers.FindAsync(device.UserId.Value)
        : null
};
```

- [ ] **Step 3: Change BuildRuntimeSystemPrompt signature and add rendering**

```csharp
private async Task<string?> BuildRuntimeSystemPrompt(
    string? baseSystemPrompt,
    MemoryRuntimeContextDto? memoryContext,
    VariableResolveContext variableContext)
{
    var normalizedBase = NormalizeOptionalText(baseSystemPrompt);
    var rendered = await _templateRenderer.RenderAsync(normalizedBase, variableContext);
    // ... rest of memory context appending logic uses 'rendered' instead of 'normalizedBase'
}
```

- [ ] **Step 4: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 5: Commit**

```bash
git add admin-api/Services/Runtime/DeviceConversationRuntimeService.cs
git commit -m "feat: integrate template rendering into DeviceConversationRuntimeService"
```

---

### Task 7: 改造 AgentRoleRuntimeTestService.BuildRuntimeSystemPrompt

**Files:**
- Modify: `admin-api/Services/AgentRoles/AgentRoleRuntimeTestService.cs`

**Context:** 与 Task 6 同步改造测试路径。构造函数注入 `SystemPromptTemplateRenderer`。构造测试用 `VariableResolveContext`（Device/User 为 null）。

- [ ] **Step 1: Add field, update constructor, construct test VariableResolveContext, change signature**

Same pattern as Task 6 but with test context (Device=null, User=null).

- [ ] **Step 2: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 3: Commit**

```bash
git add admin-api/Services/AgentRoles/AgentRoleRuntimeTestService.cs
git commit -m "feat: integrate template rendering into AgentRoleRuntimeTestService"
```

---

### Task 8: 创建 SystemPromptController

**Files:**
- Create: `admin-api/Controllers/SystemPromptController.cs`

**Context:** GET `/api/system-prompt/variables` 返回 `TemplateRenderer.GetAvailableVariables()`。匿名访问，无需鉴权。

- [ ] **Step 1: Create SystemPromptController**

```csharp
// admin-api/Controllers/SystemPromptController.cs
using AiAdmin.Services.SystemPrompt;
using Microsoft.AspNetCore.Mvc;
using Volo.Abp.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[Route("api/system-prompt")]
public class SystemPromptController : AbpControllerBase
{
    private readonly SystemPromptTemplateRenderer _renderer;

    public SystemPromptController(SystemPromptTemplateRenderer renderer)
    {
        _renderer = renderer;
    }

    [HttpGet("variables")]
    public IActionResult GetVariables()
    {
        var variables = _renderer.GetAvailableVariables();
        return Ok(new { variables });
    }
}
```

- [ ] **Step 2: Build and verify**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

- [ ] **Step 3: Commit**

```bash
git add admin-api/Controllers/SystemPromptController.cs
git commit -m "feat: add SystemPromptController GET /api/system-prompt/variables"
```

---

### Task 9: 单元测试 - TemplateRenderer + Providers

**Files:**
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/SystemPrompt/SystemPromptTemplateRendererTests.cs`

**Context:** 测试覆盖：空模板/null、正常替换、未知变量保留原文、多变量混合、各 Provider 返回值验证。

- [ ] **Step 1: Write test class**

Tests: `Should_Return_Empty_For_Null_Template`, `Should_Return_Same_Text_When_No_Variables`, `Should_Replace_Known_Variable`, `Should_Preserve_Unknown_Variable`, `Should_Replace_Multiple_Variables`, `Should_Handle_Empty_Context`

- [ ] **Step 2: Run tests to verify they pass**

Run: `dotnet test e:\GitHub\otto-ai\admin-api\test\AiAdmin.Application.Tests\AiAdmin.Application.Tests.csproj`
Expected: All tests pass

- [ ] **Step 3: Commit**

```bash
git add admin-api/test/AiAdmin.Application.Tests/Services/SystemPrompt/
git commit -m "test: add SystemPromptTemplateRenderer unit tests"
```

---

### Task 10: 重新生成前端 API 客户端 + 更新 i18n

**Files:**
- Regenerate: `admin-web/src/app/api/openapi/` (via npm run generate:api)
- Modify: `admin-web/src/assets/locales/zh-Hans.json`
- Modify: `admin-web/src/assets/locales/zh-TW.json`

**Context:** 后端现在有 `SystemPromptController`，需要重新生成前端 API 客户端。同时更新 zh-Hans 和 zh-TW 的默认模板。

- [ ] **Step 1: Run API generation**

Run: `npm run generate:api` in `admin-web/`

- [ ] **Step 2: Update zh-Hans.json defaultSystemPrompt** (already done — verify)

- [ ] **Step 3: Update zh-TW.json defaultSystemPrompt**

```json
"defaultSystemPrompt": "當前時間：{{current_datetime}}。\n\n你是一個溫暖、耐心、適合陪伴兒童與家庭使用的智能體角色。\n\n你的目標：\n1. 用簡潔、自然、有安全感的語氣與用戶交流。\n2. 優先給出可執行、容易理解的回答。\n3. 當用戶表達情緒時，先共情，再給建議。\n4. 不編造設備能力、醫療/法律/金融結論或無法確認的事實。\n5. 遇到危險、隱私或不適合兒童的內容時，溫和拒絕並引導到安全話題。\n\n說話風格：\n- 中文為主，句子不要太長。\n- 像可靠的朋友，不要像說明書。\n- 可以適當使用鼓勵性表達，但不要過度賣萌。"
```

- [ ] **Step 4: Commit**

```bash
git add admin-web/src/app/api/openapi/ admin-web/src/assets/locales/
git commit -m "feat: regenerate API client, update i18n default templates with {{current_datetime}}"
```

---

### Task 11: 前端 - agent role 表单新增变量面板

**Files:**
- Modify: `admin-web/src/app/features/agent-roles/form/agent-role-form-page.component.ts`
- Modify: `admin-web/src/app/features/agent-roles/form/agent-role-form-page.component.html`
- Modify: `admin-web/src/app/features/agent-roles/form/agent-role-form-page.component.css`

**Context:** 在 system prompt textarea 上方展示按 category 分组的变量 chip 列表。点击 chip 在光标位置插入 `{{variable_name}}`。新增 `availableVariables` 属性、`loadVariables()` 方法、`insertVariable(name)` 方法、`variablesByCategory` getter。

- [ ] **Step 1: Add component logic to .ts file**

```typescript
// New imports
import { SystemPromptService, VariableDefinition } from '../../../api/openapi';

// New properties
availableVariables: VariableDefinition[] = [];
private systemPromptService: SystemPromptService;

// In constructor: this.systemPromptService = inject(SystemPromptService);

// In ngOnInit: this.loadVariables();

private loadVariables(): void {
  this.systemPromptService.getVariables().subscribe({
    next: (res) => this.availableVariables = res.variables ?? [],
    error: () => this.availableVariables = []
  });
}

get variablesByCategory(): Map<string, VariableDefinition[]> {
  const map = new Map<string, VariableDefinition[]>();
  for (const v of this.availableVariables) {
    const list = map.get(v.category!) ?? [];
    list.push(v);
    map.set(v.category!, list);
  }
  return map;
}

insertVariable(name: string): void {
  const textarea = document.getElementById('systemPrompt') as HTMLTextAreaElement;
  if (!textarea) return;
  const start = textarea.selectionStart;
  const end = textarea.selectionEnd;
  const text = this.form.controls.systemPrompt.value ?? '';
  const varText = `{{${name}}}`;
  this.form.controls.systemPrompt.setValue(
    text.substring(0, start) + varText + text.substring(end)
  );
  setTimeout(() => {
    textarea.focus();
    textarea.setSelectionRange(start + varText.length, start + varText.length);
  });
}
```

- [ ] **Step 2: Add variable panel to .html file**

Add above the `<textarea id="systemPrompt">`:
```html
<div class="variable-panel" *ngIf="availableVariables.length > 0">
  <label>{{ 'agentRoles.form.availableVariables' | i18n }}</label>
  <div class="variable-chips">
    <ng-container *ngFor="let cat of variablesByCategory | keyvalue">
      <span class="category-label">{{ cat.key }}</span>
      <button type="button" class="variable-chip" *ngFor="let v of cat.value"
              (click)="insertVariable(v.name!)" [title]="v.description">
        {{ v.name }}
      </button>
    </ng-container>
  </div>
</div>
```

- [ ] **Step 3: Add CSS styles**

```css
.variable-panel { margin-bottom: 0.5rem; }
.variable-panel label { display: block; margin-bottom: 0.25rem; font-weight: 600; }
.variable-chips { display: flex; flex-wrap: wrap; gap: 0.375rem; align-items: center; }
.category-label { font-size: 0.75rem; color: var(--text-muted); margin-right: 0.25rem; }
.variable-chip { font-size: 0.75rem; padding: 0.125rem 0.5rem; border-radius: 999px; cursor: pointer; border: 1px solid var(--border); background: var(--surface-hover); }
.variable-chip:hover { background: var(--primary-light); border-color: var(--primary); }
```

- [ ] **Step 4: Add i18n keys**

zh-Hans: `"availableVariables": "可用变量"`
zh-TW: `"availableVariables": "可用變數"`

- [ ] **Step 5: Verify frontend builds**

Run: `npm run build` in `admin-web/`

- [ ] **Step 6: Commit**

```bash
git add admin-web/src/app/features/agent-roles/form/ admin-web/src/assets/locales/
git commit -m "feat: add template variable panel to agent role system prompt editor"
```

---

### Task 12: 运行全部测试验证

**Files:** None (validation only)

- [ ] **Step 1: Run backend tests**

Run: `dotnet test e:\GitHub\otto-ai\admin-api\test\AiAdmin.Application.Tests\AiAdmin.Application.Tests.csproj`
Expected: All tests pass

- [ ] **Step 2: Run backend build**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`
Expected: 0 errors, 0 warnings

---

### Task 13: 最终审查与收尾

**Files:** None (review only)

- [ ] **Step 1: Verify git status shows all expected changes**

- [ ] **Step 2: Review diff for unintended changes**

- [ ] **Step 3: Use superpowers:finishing-a-development-branch**
