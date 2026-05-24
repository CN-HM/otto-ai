# MCP 任务系统重设计：后台作业 → MCP 服务体系

> **日期**：2026-05-24
> **状态**：已确认（5 项决策已对齐）
> **原则**：旧方式完全退场，目录结构清晰，遵循现有项目规范

---

## 决策记录

| # | 决策 | 理由 |
|---|------|------|
| 1 | 8 个 MCP 工具按 AgentRole 选择性开启 | 现有 plugin mapping 机制已支持，每个角色在管理后台勾选允许的工具即可 |
| 2 | Handler 不内部调 LLM | 上层 LLM 已在 tool-use loop 中，直接传参给 Handler 执行，简单纯粹 |
| 3 | 唤醒用 Hangfire Schedule | 设备端改动成本高，服务端精确调度 |
| 4 | ActionRule 后置抽取**全部砍掉** | LLM tool-use 接管所有信号创建（todo/reminder/risk/health），`AiActionRule` 全链路移除 |
| 5 | `ConversationToolLoop` 抽成独立服务 | RuntimeService 调用它，职责单一，方便单独测试 |
| 6 | risk / health 也转 MCP 工具 | 新增 `risk-create` + `health-followup-create`，与其他信号统一走 tool-use 模式 |

---

## 1. 概述

将"待办事项 / 定时任务"的后台作业模块从**服务端轮询 + 硬编码调度**模式，改造为**LLM 自主调用 MCP 工具**模式。

三件事同时发生：
- **旧代码退场**：`Services/Notifications/` 整个目录 + `ActionRuleExecutionService` + `AiActionRule` 全链路删除
- **新能力上线**：8 个 MCP 工具（send-sms, send-email, todo-list, todo-create, todo-execute, todo-complete, risk-create, health-followup-create）通过 `IMcpToolHandler` 注册表统一调度
- **对话管道升级**：单轮 LLM 回复 → 多轮 tool-use loop，`ConversationToolLoop` 独立服务

### 核心变化

| 维度 | 旧方式 | 新方式 |
|------|--------|--------|
| 信号创建 | `ActionRuleExecutionService` 后置 LLM 抽取 | LLM 在对话中主动调 `todo-create` / `risk-create` / `health-followup-create` |
| 任务扫描 | Hangfire 每分钟轮询 DB | 按 signal 的 `scheduled_at` 精确调度唤醒 |
| 任务执行 | `TodoExecutionService` 内部调 LLM → 硬编码 switch | LLM 自主调 `todo-execute` → `McpToolDispatcher` 动态路由 |
| 工具调度 | `McpToolExecutionService` 硬编码 switch 2 种 | `McpToolDispatcher` + `IMcpToolHandler` 注册表，按 code 路由 |
| 工具权限 | 无权限模型 | 通过 `ai_agent_role_plugin_mapping` 按角色选择性开启 |
| LLM 参与度 | 被动（只选通知方式） | 主动（全流程自主决策） |
| 扩展新工具 | 改 enum + 改 switch + 改 McpToolExecutionService | 新增 Handler 类 + DB 种子数据 |

---

## 2. 当前架构

```
┌──────────────────────────────────────────────────────────────┐
│                      对话管道                                 │
│  DeviceConversationRuntimeService                            │
│  ASR → LLM 回复 → TTS                                        │
│       │                                                      │
│       └── 后处理: ActionRuleExecutionService (LLM 抽取信号)   │
│            └── AiRuntimeSignal (status=pending)              │
└──────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│                      后台作业 (全部移除)                      │
│  Services/Notifications/                                     │
│                                                              │
│  TodoScanBackgroundJob (每分钟轮询)                          │
│    └── TodoExecutionService                                  │
│          ├── LLM 决定通知方式                                │
│          └── McpToolExecutionService                         │
│                ├── "send-sms" → SmsService                   │
│                └── "send-email" → EmailService               │
└──────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│                  ActionRule 体系 (全部移除)                   │
│                                                              │
│  AiActionRule 实体 + 表                                      │
│  ActionRuleService (CRUD)                                    │
│  ActionRuleController (/admin/action-rules)                  │
│  ActionRuleExecutionService (LLM 后置抽取)                   │
│  admin-web: action-rules/ 前端页面                           │
└──────────────────────────────────────────────────────────────┘
```

**痛点**：
- 两套 MCP 工具体系（DB 管理的通用工具 vs 代码硬编码的系统工具），互不统一
- `McpToolExecutionService` 只能执行 2 种工具，无法扩展
- 后台轮询浪费资源，即使无到期任务也每分钟查 DB
- LLM 只在通知方式选择环节参与，上游决策被代码写死
- ActionRule 后置抽取是额外的 LLM 调用，增加延迟和成本，且与 MCP tool-use 功能重叠

---

## 3. 目标架构

```
┌──────────────────────────────────────────────────────────────┐
│                   对话管道 (改造)                              │
│  DeviceConversationRuntimeService                            │
│                                                              │
│  ASR → ConversationToolLoop (LLM + Tools, 多轮) → TTS       │
│              │                                               │
│              │  每轮: LLM 决定是回复用户还是调用工具          │
│              │  若调工具 → McpToolDispatcher → 结果回注      │
│              │  若回复 → 结束 loop → TTS                     │
│              │                                               │
│              │  可用工具 (取决于该 AgentRole 开启的工具):     │
│              ├── send-sms             (发短信)                │
│              ├── send-email           (发邮件)                │
│              ├── todo-list            (查到期任务)            │
│              ├── todo-create          (创建待办)              │
│              ├── todo-execute         (执行通知)              │
│              ├── todo-complete        (标记完成)              │
│              ├── risk-create          (创建风险线索)          │
│              └── health-followup-create (创建健康线索)        │
│                    │                                         │
│                    ▼                                         │
│              McpToolDispatcher (按 code 路由)                 │
│              └── IMcpToolHandler 注册表 (DI 自动收集)        │
└──────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│                    精确唤醒 (新增)                             │
│  AgentWakeupJob (Hangfire 一次性作业)                        │
│                                                              │
│  Signal 创建时: BackgroundJob.Schedule(..., scheduled_at)    │
│  Signal 更新时: 先取消旧 job，再 Schedule 新的               │
│  Signal 删除/完成时: 取消对应 job                            │
│                                                              │
│  触发后 → 发系统消息 → DeviceConversationRuntimeService      │
│  → ConversationToolLoop → LLM 醒来 → 调 todo-list → 处理    │
└──────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────┐
│                    工具权限控制 (现有机制复用)                 │
│                                                              │
│  ai_agent_role_plugin_mapping 表                             │
│  AgentRole A: [send-sms, todo-list, todo-create, risk-create]│
│  AgentRole B: [todo-list, todo-execute, todo-complete]       │
│  AgentRole C: [全部 8 个]                                    │
│                                                              │
│  管理后台: AgentRole 编辑页 → MCP 工具多选下拉               │
│  运行时: DeviceMcpRuntimeService 只返回已映射的工具          │
└──────────────────────────────────────────────────────────────┘
```

---

## 4. 目录结构变更

### 4.1 新增

```
Services/McpTools/
├── Dtos/
│   ├── McpToolDto.cs              (保留)
│   ├── McpToolUpsertDto.cs        (保留)
│   ├── McpToolCallRequest.cs      (新增) 标准化工具调用请求
│   └── McpToolCallResult.cs       (新增) 标准化工具调用结果
├── Handlers/
│   ├── IMcpToolHandler.cs         (新增) 工具处理器接口
│   ├── McpToolHandlerRegistry.cs  (新增) DI 自动收集所有 Handler
│   ├── SendSmsHandler.cs          (新增) 替代 McpToolExecutionService.SmsService 分支
│   ├── SendEmailHandler.cs        (新增) 替代 McpToolExecutionService.EmailService 分支
│   ├── TodoListHandler.cs         (新增) 查询到期/待处理任务
│   ├── TodoExecuteHandler.cs      (新增) 执行单条任务通知
│   ├── TodoCompleteHandler.cs     (新增) 标记任务完成
│   ├── TodoCreateHandler.cs       (新增) 创建新任务
│   ├── RiskCreateHandler.cs       (新增) 创建风险线索
│   └── HealthFollowupCreateHandler.cs (新增) 创建健康线索 + 调度 Hangfire 唤醒
├── McpToolDispatcher.cs           (新增) 通用调度器，替代 McpToolExecutionService
├── McpSystemTools.cs              (改造) McpSystemToolKind enum → McpSystemToolCodes 常量类
├── McpToolService.cs              (保留，微调 system tool 保护逻辑)
└── McpToolCategory.cs             (新增) 工具分类常量

Services/Runtime/
├── AgentWakeupJob.cs              (新增) Hangfire 一次性唤醒作业
└── ConversationToolLoop.cs        (新增) LLM tool-use 多轮循环，从 RuntimeService 剥离
```

### 4.2 移除

```
# --- 后台作业 ---
Services/Notifications/           ← 整个目录删除
├── EmailService.cs               → 逻辑合并到 Handlers/SendEmailHandler.cs
├── McpToolExecutionService.cs    → 替换为 McpToolDispatcher.cs
├── TodoExecutionService.cs       → 替换为 Handlers/TodoExecuteHandler.cs
└── TodoScanBackgroundJob.cs      → 替换为 AgentWakeupJob.cs (精确调度)

# --- ActionRule 全链路 ---
Entities/AiActionRule.cs                                   ← 删除
Services/AgentRoles/ActionRuleService.cs                   ← 删除
Services/AgentRoles/ActionRuleExecutionService.cs          ← 删除
Controllers/ActionRuleController.cs                        ← 删除

admin-web/src/app/features/agent-roles/action-rules/       ← 整个目录删除
admin-web/src/app/features/agent-roles/shared/action-rule.models.ts   ← 删除
admin-web/src/app/features/agent-roles/shared/action-rule.service.ts  ← 删除
```

### 4.3 保留不改

```
Services/Memory/
├── RuntimeSignalService.cs       (保留 — 信号 CRUD，增加 Hangfire schedule 逻辑)
├── RuntimeSignalTypes.cs         (保留 — 信号类型/状态/严重度枚举)
└── Dtos/RuntimeSignalDtos.cs     (保留)

Services/Runtime/
└── DeviceConversationRuntimeService.cs  (改造 — 注入 ConversationToolLoop 替代单轮 LLM 调用)

Services/McpTools/
└── McpToolService.cs              (微调 — IsSystemCode 改用 McpSystemToolCodes)

Data/
└── AiAdminDataSeeder.cs          (调整 — 新增 4 个 todo 类工具，移除 ActionRule 种子数据)

Protocol/Runtime/
├── DeviceMcpRuntimeService.cs    (保留 — 返回已映射的工具列表，无需改动)
└── WsBridge.cs                   (保留)

Controllers/
└── RuntimeSignalController.cs    (保留 — 信号管理 API)
```

---

## 5. 核心组件设计

### 5.1 McpToolCallRequest / McpToolCallResult

```csharp
// Services/McpTools/Dtos/McpToolCallRequest.cs
public class McpToolCallRequest
{
    public string ToolCode { get; set; }           // e.g. "send-sms", "todo-create"
    public JsonObject Arguments { get; set; }       // LLM 传入的参数
    public Guid? AgentRoleId { get; set; }          // 上下文：智能体角色
    public Guid? DeviceId { get; set; }             // 上下文：设备
    public Guid? SessionId { get; set; }            // 上下文：会话
    public Guid? UserId { get; set; }               // 上下文：用户
}

// Services/McpTools/Dtos/McpToolCallResult.cs
public class McpToolCallResult
{
    public bool Success { get; set; }
    public string Message { get; set; }             // 人类可读的结果描述，会回注给 LLM
    public JsonObject Data { get; set; }            // 结构化返回数据
}
```

### 5.2 IMcpToolHandler 接口

```csharp
// Services/McpTools/Handlers/IMcpToolHandler.cs
public interface IMcpToolHandler : ITransientDependency
{
    /// <summary>工具唯一标识，e.g. "send-sms", "todo-list"</summary>
    string ToolCode { get; }

    /// <summary>执行工具调用。Handler 不内部调用 LLM，纯粹执行上层传入的指令。</summary>
    Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct);
}
```

ABP 的 `ITransientDependency` 保证所有 Handler 自动注册到 DI。`McpToolHandlerRegistry` 通过 `IEnumerable<IMcpToolHandler>` 收集全部实现，构建 `Dictionary<string, IMcpToolHandler>` 索引。

### 5.3 McpToolHandlerRegistry

```csharp
// Services/McpTools/Handlers/McpToolHandlerRegistry.cs
public class McpToolHandlerRegistry : ITransientDependency
{
    private readonly Dictionary<string, IMcpToolHandler> _handlers;

    public McpToolHandlerRegistry(IEnumerable<IMcpToolHandler> handlers)
    {
        _handlers = handlers.ToDictionary(h => h.ToolCode, h => h);
    }

    public IMcpToolHandler Get(string toolCode)
        => _handlers.TryGetValue(toolCode, out var handler) ? handler : null;

    public bool Exists(string toolCode) => _handlers.ContainsKey(toolCode);
}
```

### 5.4 McpToolDispatcher

```csharp
// Services/McpTools/McpToolDispatcher.cs
public class McpToolDispatcher : ITransientDependency
{
    private readonly McpToolHandlerRegistry _registry;

    public McpToolDispatcher(McpToolHandlerRegistry registry) => _registry = registry;

    public async Task<McpToolCallResult> DispatchAsync(
        string toolCode, McpToolCallRequest request, CancellationToken ct)
    {
        var handler = _registry.Get(toolCode);
        if (handler == null)
            return new McpToolCallResult
            {
                Success = false,
                Message = $"Unknown tool: {toolCode}. Available: {string.Join(", ", _registry.AllCodes())}"
            };

        return await handler.ExecuteAsync(request, ct);
    }
}
```

### 5.5 Handler 实现概要

**SendSmsHandler** (`ToolCode = "send-sms"`)
- 合并旧 `McpToolExecutionService` 中 SMS 分支 + `SmsService` 逻辑
- 参数：`phone`, `content`
- 依赖：阿里云 SMS SDK

**SendEmailHandler** (`ToolCode = "send-email"`)
- 合并旧 `McpToolExecutionService` 中 Email 分支 + `EmailService` 逻辑
- 参数：`to`, `subject`, `body`
- 依赖：SMTP 配置

**TodoListHandler** (`ToolCode = "todo-list"`)
- 参数：`status` (可选), `signal_type` (可选), `limit` (可选，默认 10)
- 查询 `AiRuntimeSignal` 表，按 `scheduled_at` 升序，返回到期/待处理列表
- 仅返回当前 AgentRole / Device 范围内的信号
- 依赖：`AiAdminDbContext`

**TodoCreateHandler** (`ToolCode = "todo-create"`)
- 参数：`title` (必填), `content` (可选), `scheduled_at` (可选), `signal_type` (默认 "todo"), `severity` (可选，默认 "normal")
- 创建 `AiRuntimeSignal` 记录
- 若 `scheduled_at` 有值且在未来 → 调 `BackgroundJob.Schedule<AgentWakeupJob>(...)`
- 依赖：`AiAdminDbContext`, `IGuidGenerator`

**TodoExecuteHandler** (`ToolCode = "todo-execute"`)
- 参数：`signal_id` (必填), `notification_channel` (必填: "sms"|"email"), `notification_message` (可选)
- 加载 signal → 校验状态 → 根据 channel 内部调用 `McpToolDispatcher.DispatchAsync("send-sms"|"send-email", ...)`
- 不调 LLM：上层 LLM 已决定用哪个 channel、发什么内容
- 依赖：`AiAdminDbContext`, `McpToolDispatcher`

**TodoCompleteHandler** (`ToolCode = "todo-complete"`)
- 参数：`signal_id` (必填), `result_note` (可选)
- 更新 signal status → `completed`，记录完成时间
- 取消关联的 Hangfire 唤醒 job
- 依赖：`AiAdminDbContext`

**RiskCreateHandler** (`ToolCode = "risk-create"`)
- 参数：`title` (必填), `content` (可选), `severity` (默认 "high"), `evidence` (可选)
- 创建 `AiRuntimeSignal`，`signal_type = "risk"`
- 与 `TodoCreateHandler` 结构相同，差异仅在于 `signal_type` 和默认 `severity`
- 依赖：`AiAdminDbContext`, `IGuidGenerator`

**HealthFollowupCreateHandler** (`ToolCode = "health-followup-create"`)
- 参数：`title` (必填), `content` (可选), `scheduled_at` (可选，默认 +2h), `followup_type` (可选)
- 创建 `AiRuntimeSignal`，`signal_type = "health_followup"`
- 若 `scheduled_at` 未指定，默认设为当前时间 + 2 小时（保留旧逻辑）
- 依赖：`AiAdminDbContext`, `IGuidGenerator`

### 5.6 McpSystemTools 改造

```csharp
// Services/McpTools/McpSystemTools.cs
// 旧: public enum McpSystemToolKind { SendSms, SendEmail }
// 新:

public static class McpSystemToolCodes
{
    // 通知类
    public const string SendSms   = "send-sms";
    public const string SendEmail = "send-email";

    // 任务类
    public const string TodoList    = "todo-list";
    public const string TodoCreate  = "todo-create";
    public const string TodoExecute = "todo-execute";
    public const string TodoComplete = "todo-complete";

    // 监控类
    public const string RiskCreate           = "risk-create";
    public const string HealthFollowupCreate = "health-followup-create";

    public static readonly HashSet<string> All = new()
    {
        SendSms, SendEmail,
        TodoList, TodoCreate, TodoExecute, TodoComplete,
        RiskCreate, HealthFollowupCreate
    };

    public static bool IsSystemCode(string code) => All.Contains(code);
}
```

`McpSystemToolKind` enum **删除**。`McpToolService` 中系统工具保护逻辑改为调 `McpSystemToolCodes.IsSystemCode()`。

### 5.7 McpToolCategory

```csharp
// Services/McpTools/McpToolCategory.cs
public static class McpToolCategory
{
    public const string Notification = "notification";
    public const string Task = "task";
    public const string Monitoring = "monitoring";
}
```

### 5.8 种子数据

```csharp
// Data/AiAdminDataSeeder.cs — SeedSystemMcpTools()

// 8 个系统工具统一播种：
var systemTools = new[]
{
    new { Code = "send-sms",               Name = "发送短信",     Category = McpToolCategory.Notification, ... },
    new { Code = "send-email",             Name = "发送邮件",     Category = McpToolCategory.Notification, ... },
    new { Code = "todo-list",              Name = "查询任务",     Category = McpToolCategory.Task,         ... },
    new { Code = "todo-create",            Name = "创建待办",     Category = McpToolCategory.Task,         ... },
    new { Code = "todo-execute",           Name = "执行任务",     Category = McpToolCategory.Task,         ... },
    new { Code = "todo-complete",          Name = "完成任务",     Category = McpToolCategory.Task,         ... },
    new { Code = "risk-create",            Name = "创建风险线索", Category = McpToolCategory.Monitoring,   ... },
    new { Code = "health-followup-create", Name = "创建健康线索", Category = McpToolCategory.Monitoring,   ... },
};

foreach (var tool in systemTools)
{
    // Upsert: 按 code 查找，有则更新 name/paramSchema/category，无则插入
}
```

---

## 6. ConversationToolLoop 设计

### 6.1 职责边界

`ConversationToolLoop` 是一个独立服务，只负责一件事：**给定消息历史和可用工具列表，与 LLM 进行多轮交互直到 LLM 产出最终文本回复**。

```
DeviceConversationRuntimeService (协调者)
  │
  ├── 1. ASR → 用户文本
  ├── 2. 加载上下文 (记忆、知识库、AgentRole 配置)
  ├── 3. 加载可用工具列表 (DeviceMcpRuntimeService → 当前 AgentRole 已映射的 MCP 工具)
  │
  ├── 4. ConversationToolLoop.RunAsync(messages, tools, ct)
  │       │
  │       ├── while (未达到 maxRounds):
  │       │    ├── LLM.Chat(messages, tools)
  │       │    │
  │       │    ├── if LLM 返回 final_text:
  │       │    │     return final_text   ← 退出循环
  │       │    │
  │       │    └── if LLM 返回 tool_calls:
  │       │         ├── McpToolDispatcher.DispatchAsync(tool_code, args)
  │       │         ├── 追加 tool_result 到 messages
  │       │         └── continue         ← 下一轮
  │       │
  │       └── 超过 maxRounds → 强制要求 LLM 总结当前状态返回
  │
  ├── 5. TTS → 语音
  └── 6. 记录审计日志 (每轮 tool call)
```

### 6.2 接口设计

```csharp
// Services/Runtime/ConversationToolLoop.cs
public class ConversationToolLoop : ITransientDependency
{
    private readonly McpToolDispatcher _dispatcher;
    private readonly McpToolService _toolService;

    // 配置
    private const int MaxRounds = 5;          // 最多 5 轮 tool call
    private const int ToolCallTimeoutMs = 10000;  // 单次工具调用超时

    /// <summary>
    /// 与 LLM 进行多轮 tool-use 交互，返回最终文本回复。
    /// </summary>
    /// <param name="systemPrompt">系统提示词</param>
    /// <param name="userMessage">用户消息（或系统唤醒消息）</param>
    /// <param name="history">历史消息（可选）</param>
    /// <param name="toolDefs">当前 AgentRole 可用的工具定义列表（AiMcpTool → LLM function schema）</param>
    /// <param name="context">会话上下文（AgentRoleId, DeviceId, SessionId）</param>
    /// <returns>最终文本回复 + 工具调用审计记录</returns>
    public async Task<ConversationToolLoopResult> RunAsync(
        string systemPrompt,
        string userMessage,
        List<ChatMessage> history,
        List<McpToolDefinition> toolDefs,
        ConversationContext context,
        CancellationToken ct)
    {
        // ... 实现 while loop
    }
}

public class ConversationToolLoopResult
{
    public string FinalReply { get; set; }                  // LLM 最终文本回复
    public List<ToolCallAudit> ToolCalls { get; set; }       // 本次会话中所有工具调用记录
    public int TotalRounds { get; set; }                     // 总共了多少轮
}

public class ToolCallAudit
{
    public string ToolCode { get; set; }
    public JsonObject Arguments { get; set; }
    public bool Success { get; set; }
    public string ResultSummary { get; set; }
    public long ElapsedMs { get; set; }
}
```

### 6.3 关键设计决策

| 决策 | 值 | 原因 |
|------|-----|------|
| 最大轮数 | 5 | 防止无限循环，5 轮足够完成复杂任务（查列表→逐条执行→标记完成） |
| 单工具超时 | 10s | 短信/邮件发送不会太久，超时后当失败处理，LLM 可重试 |
| 工具失败策略 | 返回错误消息给 LLM | LLM 自行判断是否重试还是放弃，而不是 loop 层做决策 |
| 系统唤醒消息 | "你有待处理的任务，请检查并处理。" | 简单通用，不带业务参数（LLM 自己调 todo-list 获取） |

### 6.4 DeviceConversationRuntimeService 的改动

改动集中在 `ExecuteTurnAsync` 中间部分。原来：

```csharp
// 旧：单轮 LLM 调用
var replyText = await CallLlmAsync(systemPrompt, userText, history);
// 旧：后置 ActionRule 抽取
await AppendActionConfirmationAsync(...);
```

改为：

```csharp
// 新：多轮 tool-use loop
var toolDefs = await BuildToolDefinitionsAsync(agentRole);  // 从 plugin mapping 构建
var loopResult = await _toolLoop.RunAsync(systemPrompt, userText, history, toolDefs, context, ct);
var replyText = loopResult.FinalReply;
// ActionRule 后置抽取：删除
```

---

## 7. 唤醒机制设计

### 7.1 旧方式

`TodoScanBackgroundJob` 每分钟执行 `SELECT ... WHERE status IN ('pending','scheduled') AND scheduled_at <= now()`，即使表为空也持续轮询。

### 7.2 新方式：精确调度

```csharp
// Services/Runtime/AgentWakeupJob.cs
public class AgentWakeupJob : ITransientDependency
{
    private readonly DeviceConversationRuntimeService _runtime;

    /// <summary>Hangfire 入口（必须 public virtual）</summary>
    public virtual async Task WakeAsync(Guid signalId)
    {
        // 1. 加载 signal → 检查状态是否仍需处理
        // 2. 解析 device / agentRole
        // 3. 构造系统唤醒消息
        // 4. 调用 ExecuteTurnAsync，传入 systemWakeMessage
    }
}
```

### 7.3 调度时机

在 `RuntimeSignalService` 的信号创建/更新/删除路径中：

```csharp
// 创建或更新 scheduled_at 时
if (signal.ScheduledAt.HasValue && signal.ScheduledAt > DateTime.UtcNow)
{
    // 先取消旧 job（如果有）
    if (!string.IsNullOrEmpty(signal.WakeupJobId))
        BackgroundJob.Delete(signal.WakeupJobId);

    // 调度新 job
    signal.WakeupJobId = BackgroundJob.Schedule<AgentWakeupJob>(
        job => job.WakeAsync(signal.Id),
        signal.ScheduledAt.Value
    );
}

// 删除或标记完成时
if (!string.IsNullOrEmpty(signal.WakeupJobId))
    BackgroundJob.Delete(signal.WakeupJobId);
```

### 7.4 数据库变更

| 变更类型 | 表 | 说明 |
|----------|-----|------|
| ALTER | `ai_runtime_signal` | 新增 `wakeup_job_id VARCHAR(100)` |
| ALTER | `ai_runtime_signal` | 旧数据 `wakeup_job_id` 为 NULL，不会触发唤醒 |

```sql
ALTER TABLE ai_runtime_signal ADD COLUMN wakeup_job_id VARCHAR(100);
```

Entity 新增：
```csharp
// Entities/AiRuntimeSignal.cs
public string WakeupJobId { get; set; }
```

---

## 8. 工具权限控制

不新建权限模型，复用现有的 `ai_agent_role_plugin_mapping` 机制。

```
┌───────────────────────────────────────────────────────────┐
│  管理后台                                                  │
│                                                           │
│  AgentRole 编辑页                                          │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ MCP 工具:                                            │  │
│  │ ☑ send-sms       (通知类)                           │  │
│  │ ☑ send-email     (通知类)                           │  │
│  │ ☑ todo-list      (任务类)                           │  │
│  │ ☑ todo-create    (任务类)                           │  │
│  │ ☐ todo-execute   (任务类)   ← 该角色未开            │  │
│  │ ☐ todo-complete  (任务类)   ← 该角色未开            │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                           │
│  保存 → AiAgentRolePluginMapping 写入:                    │
│    { PluginId: "send-sms", ProviderCode: "mcp" }          │
│    { PluginId: "send-email", ProviderCode: "mcp" }        │
│    { PluginId: "todo-list", ProviderCode: "mcp" }         │
│    { PluginId: "todo-create", ProviderCode: "mcp" }       │
└───────────────────────────────────────────────────────────┘

运行时:
  DeviceMcpRuntimeService.BuildForAgentRoleAsync(agentRoleId)
    → 只返回该角色已映射的 4 个工具
    → ConversationToolLoop 只会向 LLM 暴露这 4 个
```

已有基础设施完全满足，无需额外开发。

---

## 9. 移除清单

### 9.1 后台作业（4 个文件）

```
Services/Notifications/EmailService.cs           → 合并到 Handlers/SendEmailHandler.cs
Services/Notifications/McpToolExecutionService.cs → 替换为 McpToolDispatcher.cs
Services/Notifications/TodoExecutionService.cs    → 替换为 Handlers/TodoExecuteHandler.cs
Services/Notifications/TodoScanBackgroundJob.cs   → 替换为 AgentWakeupJob.cs
```

删除后 `Services/Notifications/` 空目录移除。

### 9.2 ActionRule 全链路（8 个文件）

```
# 后端
Entities/AiActionRule.cs
Services/AgentRoles/ActionRuleService.cs
Services/AgentRoles/ActionRuleExecutionService.cs
Controllers/ActionRuleController.cs

# 前端
admin-web/src/app/features/agent-roles/action-rules/action-rules.component.ts
admin-web/src/app/features/agent-roles/action-rules/action-rules.component.html
admin-web/src/app/features/agent-roles/action-rules/action-rules.component.css
admin-web/src/app/features/agent-roles/shared/action-rule.models.ts
admin-web/src/app/features/agent-roles/shared/action-rule.service.ts
```

### 9.3 注册代码

```
AiAdminModule.cs:
  - RecurringJob.AddOrUpdate<TodoScanBackgroundJob>(...)     ← 删除
  - context.Services.AddTransient<ActionRuleExecutionService> ← 删除 (如有显式注册)

AiAdminDbContext.cs:
  - public DbSet<AiActionRule> ActionRules { get; set; }     ← 删除

Infrastructure/AiServiceCollectionExtensions.cs:
  - EmailService / TodoExecutionService 显式注册             ← 删除 (如有)
```

### 9.4 前端路由/导航

```
admin-web/src/app/baseline/features/:
  - action-rules 相关的 feature 注册                          ← 删除

admin-web/src/app/features/agent-roles/form/:
  - actionRules 相关字段/逻辑                                 ← 删除
```

---

## 10. 迁移步骤

| 步骤 | 内容 | 风险 | 依赖 |
|------|------|------|------|
| **1** | 新建 `McpToolCallRequest` / `McpToolCallResult` DTO | 无 | — |
| **2** | 新建 `IMcpToolHandler` + `McpToolHandlerRegistry` | 无 | 1 |
| **3** | 新建 `McpToolDispatcher` | 无 | 2 |
| **4** | 实现 `SendSmsHandler` + `SendEmailHandler`（从旧代码搬逻辑） | 低 | 3 |
| **5** | 改造 `McpSystemTools.cs`（enum → `McpSystemToolCodes` 常量类） | 中 | — |
| **6** | 实现 6 个信号类 Handler（Todo* x4 + RiskCreate + HealthFollowupCreate） | 低 | 3 |
| **7** | 扩展种子数据（8 个系统工具统一播种） | 无 | 5 |
| **8** | `AiRuntimeSignal` 新增 `WakeupJobId` + EF migration | 低 | — |
| **9** | `RuntimeSignalService` 增加 Hangfire schedule 逻辑 | 中 | 6, 8 |
| **10** | 新建 `AgentWakeupJob` | 低 | 9 |
| **11** | 新建 `ConversationToolLoop` 独立服务 | 中 | 3 |
| **12** | 改造 `DeviceConversationRuntimeService`（注入 `ConversationToolLoop`） | **高** | 11 |
| **13** | 联调：对话中 LLM tool-use 完成全部信号操作（todo/risk/health 创建+执行） | **高** | 10, 12 |
| **14** | 联调：Hangfire 精确唤醒 → LLM 处理到期任务 | 中 | 10, 12 |
| **15** | 删除 `Services/Notifications/` 目录 | 低 | 13, 14 通过 |
| **16** | 删除 `ActionRule` 全链路（entity + service + controller + 前端） | 中 | 13 通过 |
| **17** | 删除 `AiAdminModule` 中旧注册 + `ai_action_rule` 表 migration | 中 | 16 |
| **18** | 端到端回归测试 | — | 全部 |

---

## 11. 风险与注意事项

- **步骤 12 风险最高**：`ConversationToolLoop` 改造涉及对话管道的核心路径。需要关注：多轮 tool calling 的 token 消耗增量、用户感知延迟（每轮 tool call 都是额外的 LLM 往返）、以及 LLM 在 tool-use 模式下回复质量是否下降
- **步骤 16 影响面大**：ActionRule 是完整的前后端功能，其删除迁移脚本需确保 `ai_action_rule` 表和相关外键干净移除
- **Hangfire 保留**：作为 job 调度基础设施继续使用，只是从 RecurringJob（轮询）改为 BackgroundJob.Schedule（精确一次性调度），不增加新依赖
- **工具权限是现有机制**：`ai_agent_role_plugin_mapping` 表已支持，前端 AgentRole 编辑页已有 MCP 工具多选组件，仅需确认新工具在选项中可见
- **旧数据兼容**：已有 `AiRuntimeSignal` 记录的 `wakeup_job_id` 为 NULL，不会触发唤醒。如需激活历史任务，可写一次性脚本补调度
- **记忆保留**：`AiRuntimeSignal` 表、`RuntimeSignalService`、前端信号管理页面全部保留。砍掉的只是"从对话中自动抽取信号"的 ActionRule 机制，信号本身的生命周期管理不变
