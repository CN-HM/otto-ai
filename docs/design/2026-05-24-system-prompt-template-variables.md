# System Prompt 模板变量系统设计

> **日期**：2026-05-24
> **状态**：设计中，待评审
> **动机**：AI 无法回答"明天是周几"——系统提示词缺少运行时上下文注入的标准化机制

---

## 决策记录

| # | 决策 | 理由 |
|---|------|------|
| 1 | 模板语法用 `{{variable_name}}` | 行业标准（Jinja2/Handlebars），无需自定义解析器 |
| 2 | 模板渲染在 `BuildRuntimeSystemPrompt` 内部，作为第一步 | 先解析变量，再叠加知识/记忆注入，避免注入内容包含未渲染的变量 |
| 3 | 变量提供者用接口 `ISystemPromptVariableProvider` + DI 聚合 | 新增变量只需实现接口 + 注册，不改渲染引擎 |
| 4 | **零硬编码注入**，所有运行时上下文走模板变量 | 单一机制，可预测；开发者看 system prompt 模板就知道 LLM 接收什么上下文，不会被隐式 prepend 的硬编码内容干扰 |
| 5 | 默认模板内置 `{{current_datetime}}` | 即使管理员不手动加，新建角色点"应用默认模板"就自带时间上下文 |
| 6 | 可用变量通过 API 暴露给前端 | 前端可做变量提示/自动补全，降低配置门槛 |

---

## 1. 概述

将系统提示词中的**硬编码上下文注入**（当前时间、设备信息等）标准化为**模板变量替换机制**。

管理员在 Agent Role 的 system prompt 中书写 `{{variable_name}}` 占位符，系统在运行时自动替换为真实值。

### 核心变化

| 维度 | 当前 | 目标 |
|------|------|------|
| 时间注入 | 无 | 管理员在 system prompt 中写 `{{current_datetime}}`，运行时自动替换 |
| 设备/用户信息 | 完全不注入 | 可选 `{{device_name}}` `{{user_name}}` 等 |
| 变量扩展 | 新增信息需改 `BuildRuntimeSystemPrompt` | 实现 `ISystemPromptVariableProvider` → DI 自动生效 |
| 管理员体验 | 不知道能写什么变量 | API 返回可用变量列表 + 前端提示 |

---

## 2. 模板变量清单

### 2.1 时间类（TimeVariableProvider）

| 变量 | 示例输出 | 说明 |
|------|---------|------|
| `{{current_datetime}}` | `2026年5月24日 周日 15:30` | 完整日期+星期+时间 |
| `{{current_date}}` | `2026年5月24日` | 日期 |
| `{{current_time}}` | `15:30` | 时间（24小时制） |
| `{{current_weekday}}` | `周日` | 中文星期 |
| `{{current_year}}` | `2026` | 年份 |
| `{{current_month}}` | `5` | 月份 |
| `{{current_day}}` | `24` | 日 |
| `{{current_hour}}` | `15` | 小时 |
| `{{current_minute}}` | `30` | 分钟 |
| `{{current_timestamp}}` | `2026-05-24T15:30:00+08:00` | ISO 8601 时间戳 |

### 2.2 设备类（DeviceVariableProvider）

| 变量 | 示例输出 | 说明 |
|------|---------|------|
| `{{device_id}}` | `DEVICE_A1B2C3` | 设备唯一 ID |
| `{{device_name}}` | `客厅小智` | 设备别名（AiDevice.Alias） |
| `{{device_model}}` | `ESP32-S3` | 硬件板型（AiDevice.Board） |
| `{{device_app_version}}` | `v2.1.0` | 固件版本 |

### 2.3 智能体类（AgentVariableProvider）

| 变量 | 示例输出 | 说明 |
|------|---------|------|
| `{{agent_name}}` | `小智助手` | 角色显示名称 |
| `{{agent_code}}` | `smart_assistant` | 角色编码 |
| `{{agent_description}}` | `温暖陪伴型家庭助手` | 角色描述 |

### 2.4 用户类（UserVariableProvider）

| 变量 | 示例输出 | 说明 |
|------|---------|------|
| `{{user_id}}` | `42` | 绑定用户 ID |
| `{{user_name}}` | `小明` | 用户显示名（待确认数据源） |

### 2.5 会话类（SessionVariableProvider）

| 变量 | 示例输出 | 说明 |
|------|---------|------|
| `{{session_id}}` | `SESS_abc123` | 当前会话 ID |

---

## 3. 架构设计

### 3.1 新增文件

```
admin-api/
├── Services/
│   └── SystemPrompt/
│       ├── ISystemPromptVariableProvider.cs    # 变量提供者接口
│       ├── SystemPromptTemplateRenderer.cs     # 模板渲染引擎
│       └── Variables/
│           ├── TimeVariableProvider.cs         # 时间变量
│           ├── DeviceVariableProvider.cs       # 设备变量
│           ├── AgentVariableProvider.cs        # 智能体变量
│           ├── UserVariableProvider.cs         # 用户变量
│           └── SessionVariableProvider.cs      # 会话变量
├── Controllers/
│   └── SystemPromptController.cs              # 可用变量查询 API
```

### 3.2 修改文件

| 文件 | 变更 |
|------|------|
| `DeviceConversationRuntimeService.cs` | `BuildRuntimeSystemPrompt` 改为实例方法，注入 `SystemPromptTemplateRenderer`；在 `ExecuteReplyPipelineAsync` 中构造 `VariableResolveContext` |
| `AgentRoleRuntimeTestService.cs` | 同上，注入 `SystemPromptTemplateRenderer`，构造测试用 `VariableResolveContext` |
| `admin-web/src/app/features/agent-roles/form/agent-role-form-page.component.ts` | 新增变量面板、插入逻辑 |
| `admin-web/src/app/features/agent-roles/form/agent-role-form-page.component.html` | 变量面板 UI |
| `admin-web/src/app/api/openapi/` | 重新生成 API 客户端（含新的 `SystemPromptController` 接口） |
| `admin-web/src/assets/locales/zh-Hans.json` | 默认模板加 `{{current_datetime}}` |
| `admin-web/src/assets/locales/zh-TW.json` | 同上 |

### 3.3 数据库

**无需任何 schema 变更。** 模板变量直接存储在 `ai_agent_role` 表的现有 `system_prompt` 列（`text` 类型）中。`{{variable_name}}` 只是普通字符串，渲染在运行时完成，存储层无感知。也不涉及索引、迁移或新列。

### 3.4 接口与类型设计

```csharp
// VariableDefinition.cs — 可用变量定义 DTO（也用于 API 返回）
namespace AiAdmin.Services.SystemPrompt.Dtos;

public class VariableDefinition
{
    public string Name { get; set; }         // "current_datetime"
    public string Category { get; set; }     // "时间" | "设备" | "智能体" | "用户" | "会话"
    public string Description { get; set; }  // 变量含义说明
    public string Example { get; set; }      // 示例渲染值
}

// VariableResolveContext.cs — 运行时上下文
namespace AiAdmin.Services.SystemPrompt;

public class VariableResolveContext
{
    public string? AgentRoleId { get; set; }
    public string? DeviceId { get; set; }
    public string? SessionId { get; set; }
    public long? UserId { get; set; }

    // 预加载的完整对象，避免每个 Provider 各自查 DB
    public AiDevice? Device { get; set; }
    public AgentRoleRuntimeDescriptorDto? AgentRole { get; set; }
    public SysUser? User { get; set; }
}

// ISystemPromptVariableProvider.cs
namespace AiAdmin.Services.SystemPrompt;

/// <summary>
/// 系统提示词模板变量提供者。
/// 实现此接口 + ITransientDependency 即可自动注册新变量。
/// </summary>
public interface ISystemPromptVariableProvider
{
    /// <summary>变量名列表，不含花括号（如 "current_time"）</summary>
    IEnumerable<string> SupportedVariables { get; }

    /// <summary>变量定义列表（供前端展示），包含 category/description/example</summary>
    IEnumerable<VariableDefinition> GetDefinitions();

    /// <summary>获取变量值。运行时上下文通过 context 传入。</summary>
    Task<string?> ResolveAsync(string variableName, VariableResolveContext context);
}

// SystemPromptTemplateRenderer.cs
namespace AiAdmin.Services.SystemPrompt;

public class SystemPromptTemplateRenderer : ITransientDependency
{
    private readonly Dictionary<string, ISystemPromptVariableProvider> _index;

    public SystemPromptTemplateRenderer(IEnumerable<ISystemPromptVariableProvider> providers)
    {
        _index = providers
            .SelectMany(p => p.SupportedVariables.Select(v => (name: v, provider: p)))
            .ToDictionary(x => x.name, x => x.provider);
    }

    /// <summary>获取所有可用变量及说明（供前端展示）</summary>
    public List<VariableDefinition> GetAvailableVariables()
    {
        return _index.Values
            .Distinct()
            .SelectMany(p => p.GetDefinitions())
            .ToList();
    }

    /// <summary>渲染模板：将 {{variable}} 替换为实际值</summary>
    public async Task<string> RenderAsync(string? template, VariableResolveContext context)
    {
        if (string.IsNullOrWhiteSpace(template))
            return template ?? string.Empty;

        // 匹配 {{variable_name}}，变量名只允许字母数字下划线
        var regex = new Regex(@"\{\{(\w+)\}\}");
        var result = template;
        var matches = regex.Matches(template);

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
                // 未识别变量 → 保留原文 + 打日志
                _logger.LogWarning("Unknown template variable: {{Variable}}", varName);
            }
        }

        return result;
    }
}
```

### 3.5 渲染流程

```
ExecuteReplyPipelineAsync (DeviceConversationRuntimeService)
│
├─ 1. 构造 VariableResolveContext
│     └─ 填充 Device (已加载), AgentRole (已加载), User (按需查)
│
├─ 2. Knowledge injection (RAG)           ← 现有，产物 ragResponse
│
├─ 3. BuildRuntimeSystemPrompt()           ← 改为实例方法，注入 _templateRenderer
│   ├─ a. TemplateRenderer.RenderAsync()  ← NEW：变量替换
│   └─ b. Memory context append           ← 现有
│
└─ 4. ConversationToolLoop.RunAsync()
    └─ Tool guidance append                ← 现有
```

**关键原则**：
- 模板渲染作为 `BuildRuntimeSystemPrompt` 内部的第一步
- `BuildRuntimeSystemPrompt` 从 `static` 改为实例方法，注入 `SystemPromptTemplateRenderer`
- **零硬编码注入**——时间、设备、用户等上下文全部通过模板变量表达

### 3.6 `BuildRuntimeSystemPrompt` 签名变更

**改前**（两处各自维护的 static 方法）：
```csharp
private static string? BuildRuntimeSystemPrompt(
    string? baseSystemPrompt,
    MemoryRuntimeContextDto? memoryContext)
```

**改后**（统一为实例方法）：
```csharp
private async Task<string?> BuildRuntimeSystemPrompt(
    string? baseSystemPrompt,
    MemoryRuntimeContextDto? memoryContext,
    VariableResolveContext variableContext)
```

变更点：
1. `static` → 实例方法（需要访问 `_templateRenderer` 字段）
2. 返回值 `string?` → `Task<string?>`（`RenderAsync` 是异步的）
3. 新增 `VariableResolveContext` 参数

### 3.7 `VariableResolveContext` 构造时机

**DeviceConversationRuntimeService 路径**（生产环境）：
```csharp
// 在 ExecuteReplyPipelineAsync 中，device 和 agentRole 已加载
var variableContext = new VariableResolveContext
{
    AgentRoleId = agentRole.Id,
    DeviceId = device.Id,
    SessionId = request.SessionId,
    UserId = device.UserId,
    Device = device,
    AgentRole = agentRole,
    User = device.UserId != null
        ? await _sysUserRepository.FindAsync(device.UserId.Value)
        : null
};
```

**AgentRoleRuntimeTestService 路径**（测试环境）：
```csharp
// 测试路径无真实设备，用测试输入造一个最小上下文
var variableContext = new VariableResolveContext
{
    AgentRoleId = agentRole.Id,
    DeviceId = request.DeviceId,         // 来自 AgentRoleRuntimeTestRequest
    SessionId = request.SessionId,
    UserId = request.UserId,
    Device = null,                       // 测试路径无设备记录
    AgentRole = agentRole,
    User = null                          // 测试路径无用户记录
};
```
测试路径的 `Device` 和 `User` 为 null，对应 Provider 返回空字符串，提示词中相关变量位置自然留白。

---

## 4. API 设计

### 4.1 可用变量查询

```
GET /api/system-prompt/variables
```

响应：
```json
{
  "variables": [
    {
      "name": "current_datetime",
      "category": "时间",
      "description": "当前完整日期时间，如：2026年5月24日 周日 15:30",
      "example": "2026年5月24日 周日 15:30"
    },
    {
      "name": "agent_name",
      "category": "智能体",
      "description": "当前智能体角色的显示名称",
      "example": "小智助手"
    }
  ]
}
```

### 4.2 模板预览（可选，后续迭代）

```
POST /api/system-prompt/preview
Body: { "template": "...", "agentRoleId": "...", "deviceId": "..." }
Response: { "rendered": "..." }
```

---

## 5. 前端设计

### 5.1 新增/修改文件

| 文件 | 变更 |
|------|------|
| `agent-role-form-page.component.ts` | 新增 `availableVariables` 列表、`insertVariable()` 方法、`ngOnInit` 中调 API 获取变量列表 |
| `agent-role-form-page.component.html` | system prompt textarea 上方新增变量面板 |
| `agent-role-form-page.component.css` | 变量面板样式（chip 按钮、分类标签） |
| `src/assets/locales/zh-Hans.json` | 新增 i18n key + 更新 `defaultSystemPrompt` |
| `src/assets/locales/zh-TW.json` | 同上，繁体中文版本 |
| 生成 `src/app/api/openapi/` | 重新生成，引入 `SystemPromptController` 接口 |

### 5.2 API 调用

组件初始化时调用变量列表 API：

```typescript
// agent-role-form-page.component.ts
availableVariables: VariableDefinition[] = [];

ngOnInit(): void {
  // ... existing init ...
  this.loadVariables();
}

private loadVariables(): void {
  this.systemPromptService.getVariables().subscribe({
    next: (res) => this.availableVariables = res.variables ?? [],
    error: () => this.availableVariables = []  // 降级：面板为空
  });
}

// 按 category 分组供模板渲染
get variablesByCategory(): Map<string, VariableDefinition[]> {
  return this.availableVariables.reduce((map, v) => {
    const list = map.get(v.category) ?? [];
    list.push(v);
    map.set(v.category, list);
    return map;
  }, new Map<string, VariableDefinition[]>());
}
```

### 5.3 Agent Role 编辑表单

在 system prompt 的 `<textarea>` 上方展示"可用变量"面板：

```
┌─────────────────────────────────────────────┐
│  可用变量                          [?]      │
│  ┌─────────────┐ ┌──────────────┐           │
│  │ 时间         │ │ 设备          │           │
│  │ current_date │ │ device_name  │           │
│  │ current_time │ │ device_model │           │
│  │ ...          │ │ ...          │           │
│  └─────────────┘ └──────────────┘           │
│  点击变量自动插入到光标位置                    │
├─────────────────────────────────────────────┤
│  System Prompt                              │
│  ┌─────────────────────────────────────────┐│
│  │ 你是{{agent_name}}。                     ││
│  │ 当前时间：{{current_datetime}}。          ││
│  │ 你运行在{{device_name}}设备上。           ││
│  │ ...                                     ││
│  └─────────────────────────────────────────┘│
└─────────────────────────────────────────────┘
```

具体交互：
- 点击变量名 → 调用 `insertVariable(name)`，在 textarea 光标位置插入 `{{variable_name}}`
- 默认模板（`applyPromptTemplate()`）通过 i18n 获取，已内置 `{{current_datetime}}`
- i18n key：`agentRoles.form.availableVariables` 定义面板标题
- i18n key：`agentRoles.form.defaultSystemPrompt` 为默认模板内容

### 5.4 i18n 变更

**zh-Hans.json**（已更新）：
```json
"defaultSystemPrompt": "当前时间：{{current_datetime}}。\n\n你是一个温暖、耐心..."
```

**zh-TW.json**（待同步更新）：
```json
"defaultSystemPrompt": "當前時間：{{current_datetime}}。\n\n你是一個溫暖、耐心..."
```

---

## 6. 扩展示例

新增 `{{weather}}` 变量（未来某天）只需两步，不动渲染引擎：

```csharp
// Step 1: 新建文件
public class WeatherVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    public IEnumerable<string> SupportedVariables => ["weather"];

    public async Task<string?> ResolveAsync(string name, VariableResolveContext ctx)
    {
        if (ctx.Device?.City == null) return "未知";
        return await _weatherService.GetBriefAsync(ctx.Device.City);
    }
}

// Step 2: 更新 VariableDefinition 列表（前端自动展示）
// 无需其他改动 — DI 自动发现 ISystemPromptVariableProvider 实现
```

---

## 7. 实施步骤

| # | 步骤 | 说明 |
|---|------|------|
| 1 | 创建 `ISystemPromptVariableProvider` + `VariableResolveContext` + `VariableDefinition` | 接口 + 上下文 + 变量定义 DTO，放入 `Services/SystemPrompt/` |
| 2 | 创建 `SystemPromptTemplateRenderer` | 正则 `\{\{(\w+)\}\}` 扫描 → `_index` 查表 → Provider.ResolveAsync 替换 |
| 3 | 实现 `TimeVariableProvider` | 10 个时间变量，`DateTime.Now` |
| 4 | 实现 `DeviceVariableProvider` | 4 个设备变量，从 `VariableResolveContext.Device` 取值 |
| 5 | 实现 `AgentVariableProvider` | 3 个智能体变量，从 `VariableResolveContext.AgentRole` 取值 |
| 6 | 实现 `UserVariableProvider` + `SessionVariableProvider` | 用户从 `SysUser` 取值 + 会话从 context 取值 |
| 7 | 改造 `DeviceConversationRuntimeService.BuildRuntimeSystemPrompt` | static → 实例方法，注入 `_templateRenderer`，签名加 `VariableResolveContext` |
| 8 | 改造 `AgentRoleRuntimeTestService.BuildRuntimeSystemPrompt` | 同上，构造测试用 VariableResolveContext（Device/User 为 null） |
| 9 | 创建 `SystemPromptController` | `GET /api/system-prompt/variables` — 返回 `TemplateRenderer.GetAvailableVariables()` |
| 10 | 重新生成前端 API 客户端 | `npm run generate:api`，引入 SystemPrompt 相关接口 |
| 11 | 更新 i18n `zh-Hans.json` + `zh-TW.json` | `defaultSystemPrompt` 首行加 `当前时间：{{current_datetime}}。` |
| 12 | 前端 system prompt 编辑器加变量面板 | 按 category 分组 chip 按钮，点击 `insertVariable()` 插入 `{{var}}` 到光标位置 |
| 13 | 单元测试 | `TemplateRenderer`：空模板/null/正常替换/未知变量保留原文；各 Provider 返回值验证 |

---

## 8. 风险与边界

| 风险 | 缓解 |
|------|------|
| 管理员写了不存在的变量名 `{{typo_var}}` | 渲染时保持原样不替换，打 WARNING 日志；前端变量面板降低拼写错误概率 |
| 变量值很长导致 token 超限 | 每个变量限制最大 200 字符，超出截断 + 打日志 |
| Provider 查 DB 失败 | 返回空字符串而非抛异常，不影响对话主流程 |
| 用户通过变量注入恶意指令 | 所有 Provider 返回纯文本，不解析 prompt 语法；变量值只做纯文本替换 |
| 设备未绑定用户时 `{{user_name}}` 为空 | 返回空字符串，提示词中自然留白 |
