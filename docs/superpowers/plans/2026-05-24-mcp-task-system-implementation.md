# MCP Task System Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the hardcoded background job system (Services/Notifications/) and ActionRule extraction pipeline with 8 LLM-callable MCP tools dispatched through a generic handler registry, plus precise Hangfire-based wake-up scheduling.

**Architecture:** 8 MCP tools (send-sms, send-email, todo-list, todo-create, todo-execute, todo-complete, risk-create, health-followup-create) each implement `IMcpToolHandler`. `McpToolDispatcher` routes by tool code via `McpToolHandlerRegistry`. `ConversationToolLoop` wraps LLM tool-use multi-turn loop. `AgentWakeupJob` replaces polling with per-signal Hangfire scheduling. Entire `Services/Notifications/` directory and `ActionRule` chain removed.

**Tech Stack:** C# / .NET 10 / ABP vNext 10.1 / EF Core PostgreSQL / Hangfire / xUnit + Shouldly + NSubstitute + SQLite

---

### Task 1: DTOs — McpToolCallRequest and McpToolCallResult

**Files:**
- Create: `admin-api/Services/McpTools/Dtos/McpToolCallRequest.cs`
- Create: `admin-api/Services/McpTools/Dtos/McpToolCallResult.cs`

- [ ] **Step 1: Create McpToolCallRequest DTO**

```csharp
// admin-api/Services/McpTools/Dtos/McpToolCallRequest.cs
using System.Text.Json.Nodes;

namespace AiAdmin.Services.McpTools.Dtos;

public class McpToolCallRequest
{
    public string ToolCode { get; set; }
    public JsonObject Arguments { get; set; }
    public string AgentRoleId { get; set; }
    public string DeviceId { get; set; }
    public string SessionId { get; set; }
    public long? UserId { get; set; }
}
```

- [ ] **Step 2: Create McpToolCallResult DTO**

```csharp
// admin-api/Services/McpTools/Dtos/McpToolCallResult.cs
using System.Text.Json.Nodes;

namespace AiAdmin.Services.McpTools.Dtos;

public class McpToolCallResult
{
    public bool Success { get; set; }
    public string Message { get; set; }
    public JsonObject Data { get; set; }
}
```

- [ ] **Step 3: Commit**

```bash
git add admin-api/Services/McpTools/Dtos/McpToolCallRequest.cs admin-api/Services/McpTools/Dtos/McpToolCallResult.cs
git commit -m "feat: add McpToolCallRequest and McpToolCallResult DTOs for generic tool dispatch"
```

---

### Task 2: IMcpToolHandler Interface

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/IMcpToolHandler.cs`

- [ ] **Step 1: Create IMcpToolHandler interface**

```csharp
// admin-api/Services/McpTools/Handlers/IMcpToolHandler.cs
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.McpTools.Handlers;

public interface IMcpToolHandler : ITransientDependency
{
    string ToolCode { get; }
    Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct);
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/IMcpToolHandler.cs
git commit -m "feat: add IMcpToolHandler interface for generic MCP tool dispatch"
```

---

### Task 3: McpToolHandlerRegistry

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/McpToolHandlerRegistry.cs`

- [ ] **Step 1: Create McpToolHandlerRegistry**

```csharp
// admin-api/Services/McpTools/Handlers/McpToolHandlerRegistry.cs
using System.Collections.Generic;
using System.Linq;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.McpTools.Handlers;

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

    public IEnumerable<string> AllCodes() => _handlers.Keys;
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/McpToolHandlerRegistry.cs
git commit -m "feat: add McpToolHandlerRegistry for DI-driven handler collection"
```

---

### Task 4: McpToolDispatcher

**Files:**
- Create: `admin-api/Services/McpTools/McpToolDispatcher.cs`

- [ ] **Step 1: Create McpToolDispatcher**

```csharp
// admin-api/Services/McpTools/McpToolDispatcher.cs
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.Services.McpTools.Handlers;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.McpTools;

public class McpToolDispatcher : ITransientDependency
{
    private readonly McpToolHandlerRegistry _registry;

    public McpToolDispatcher(McpToolHandlerRegistry registry) => _registry = registry;

    public async Task<McpToolCallResult> DispatchAsync(
        string toolCode,
        McpToolCallRequest request,
        CancellationToken ct)
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

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/McpToolDispatcher.cs
git commit -m "feat: add McpToolDispatcher for generic tool routing"
```

---

### Task 5: McpToolCategory Constants

**Files:**
- Create: `admin-api/Services/McpTools/McpToolCategory.cs`

- [ ] **Step 1: Create McpToolCategory**

```csharp
// admin-api/Services/McpTools/McpToolCategory.cs
namespace AiAdmin.Services.McpTools;

public static class McpToolCategory
{
    public const string Notification = "notification";
    public const string Task = "task";
    public const string Monitoring = "monitoring";
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/McpToolCategory.cs
git commit -m "feat: add McpToolCategory constants (notification/task/monitoring)"
```

---

### Task 6: Refactor McpSystemTools — enum to constants

**Files:**
- Modify: `admin-api/Services/McpTools/McpSystemTools.cs`

- [ ] **Step 1: Check all references to McpSystemToolKind and McpSystemTools**

Run: `rg "McpSystemToolKind|McpSystemTools\." e:\GitHub\otto-ai\admin-api --type cs -n`

Expected: hits in `McpSystemTools.cs`, `McpToolService.cs`, `AiAdminDataSeeder.cs`, `McpToolExecutionService.cs`.

- [ ] **Step 2: Rewrite McpSystemTools.cs**

Replace the existing file content:

```csharp
// admin-api/Services/McpTools/McpSystemTools.cs
using System.Collections.Generic;

namespace AiAdmin.Services.McpTools;

public static class McpSystemToolCodes
{
    public const string SendSms   = "send-sms";
    public const string SendEmail = "send-email";

    public const string TodoList    = "todo-list";
    public const string TodoCreate  = "todo-create";
    public const string TodoExecute = "todo-execute";
    public const string TodoComplete = "todo-complete";

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

- [ ] **Step 3: Update McpToolService.cs — replace IsSystemCode calls**

Search for `McpSystemTools.IsSystemCode` and replace with `McpSystemToolCodes.IsSystemCode`.

Search for `McpSystemTools.NotificationCategory` — replace with `McpToolCategory.Notification`.

- [ ] **Step 4: Update AiAdminDataSeeder.cs — replace enum references**

Replace `McpSystemToolKind.SendSms` → `McpSystemToolCodes.SendSms`
Replace `McpSystemToolKind.SendEmail` → `McpSystemToolCodes.SendEmail`
Replace `McpSystemTools.GetCode(...)` → direct constant
Replace `McpSystemTools.NotificationCategory` → `McpToolCategory.Notification`

- [ ] **Step 5: Verify build**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`

Expected: build succeeds with no errors.

- [ ] **Step 6: Commit**

```bash
git add admin-api/Services/McpTools/McpSystemTools.cs admin-api/Services/McpTools/McpToolService.cs admin-api/Data/AiAdminDataSeeder.cs
git commit -m "refactor: replace McpSystemToolKind enum with McpSystemToolCodes constants"
```

---

### Task 7: SendSmsHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/SendSmsHandler.cs`

- [ ] **Step 1: Create SendSmsHandler**

```csharp
// admin-api/Services/McpTools/Handlers/SendSmsHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.Auth;
using AiAdmin.Services.McpTools.Dtos;

namespace AiAdmin.Services.McpTools.Handlers;

public class SendSmsHandler : IMcpToolHandler
{
    private readonly SmsService _smsService;

    public SendSmsHandler(SmsService smsService) => _smsService = smsService;

    public string ToolCode => McpSystemToolCodes.SendSms;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var phone = request.Arguments["phone"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(phone))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: phone" };
        if (string.IsNullOrWhiteSpace(content))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: content" };

        try
        {
            var result = await _smsService.SendNotificationAsync(phone, content, ct);
            return new McpToolCallResult { Success = true, Message = result };
        }
        catch (Exception ex)
        {
            return new McpToolCallResult { Success = false, Message = $"SMS send failed: {ex.Message}" };
        }
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/SendSmsHandler.cs
git commit -m "feat: add SendSmsHandler — MCP tool for SMS notification"
```

---

### Task 8: SendEmailHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/SendEmailHandler.cs`

- [ ] **Step 1: Create SendEmailHandler**

```csharp
// admin-api/Services/McpTools/Handlers/SendEmailHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools.Dtos;

namespace AiAdmin.Services.McpTools.Handlers;

public class SendEmailHandler : IMcpToolHandler
{
    // Direct SMTP send, no dependency on old EmailService.
    // Copy the SMTP logic from the old EmailService into this handler.
    private readonly IConfiguration _config;
    private readonly ILogger<SendEmailHandler> _logger;

    public SendEmailHandler(IConfiguration config, ILogger<SendEmailHandler> logger)
    {
        _config = config;
        _logger = logger;
    }

    public string ToolCode => McpSystemToolCodes.SendEmail;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var to = request.Arguments["to"]?.GetValue<string>();
        var subject = request.Arguments["subject"]?.GetValue<string>();
        var body = request.Arguments["body"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(to))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: to" };
        if (string.IsNullOrWhiteSpace(subject))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: subject" };
        if (string.IsNullOrWhiteSpace(body))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: body" };

        try
        {
            using var smtp = new MailKit.Net.Smtp.SmtpClient();
            var smtpHost = _config["Email:Host"] ?? "smtp.example.com";
            var smtpPort = int.Parse(_config["Email:Port"] ?? "587");
            var smtpUser = _config["Email:Username"] ?? "";
            var smtpPass = _config["Email:Password"] ?? "";

            await smtp.ConnectAsync(smtpHost, smtpPort, MailKit.Security.SecureSocketOptions.StartTls, ct);
            await smtp.AuthenticateAsync(smtpUser, smtpPass, ct);

            var message = new MimeKit.MimeMessage();
            message.From.Add(MailboxAddress.Parse(_config["Email:From"] ?? "noreply@otto-ai.local"));
            message.To.Add(MailboxAddress.Parse(to));
            message.Subject = subject;
            message.Body = new TextPart("plain") { Text = body };

            await smtp.SendAsync(message, ct);
            await smtp.DisconnectAsync(true, ct);

            return new McpToolCallResult { Success = true, Message = "Email sent successfully" };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to send email to {To}", to);
            return new McpToolCallResult { Success = false, Message = $"Email send failed: {ex.Message}" };
        }
    }
}
```

- [ ] **Step 2: Add required usings and verify package references**

Add to the top of SendEmailHandler.cs:
```csharp
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using MimeKit;
```

`MailKit` and `MimeKit` are already in the project (used by the old `EmailService.cs`).  

- [ ] **Step 3: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/SendEmailHandler.cs
git commit -m "feat: add SendEmailHandler — MCP tool for email notification"
```

---

### Task 9: TodoListHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/TodoListHandler.cs`

- [ ] **Step 1: Create TodoListHandler**

```csharp
// admin-api/Services/McpTools/Handlers/TodoListHandler.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoListHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;

    public TodoListHandler(AiAdminDbContext db) => _db = db;

    public string ToolCode => McpSystemToolCodes.TodoList;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var status = request.Arguments["status"]?.GetValue<string>();
        var signalType = request.Arguments["signal_type"]?.GetValue<string>();
        var limit = request.Arguments["limit"]?.GetValue<int>() ?? 10;

        var query = _db.AiRuntimeSignals.AsQueryable();

        if (request.AgentRoleId != null)
            query = query.Where(s => s.AgentRoleId == request.AgentRoleId);

        if (!string.IsNullOrWhiteSpace(status))
            query = query.Where(s => s.Status == status);

        if (!string.IsNullOrWhiteSpace(signalType))
            query = query.Where(s => s.SignalType == signalType);
        else
            query = query.Where(s => s.SignalType == "todo" || s.SignalType == "reminder");

        query = query.Where(s => s.ScheduledAt == null || s.ScheduledAt <= DateTime.UtcNow);
        query = query.OrderBy(s => s.ScheduledAt ?? s.CreatedAt);
        query = query.Take(Math.Min(limit, 20));

        var signals = await query.Select(s => new
        {
            s.Id,
            s.SignalType,
            s.SignalCode,
            s.Severity,
            s.Status,
            s.SourceText,
            s.ScheduledAt,
            s.CreatedAt
        }).ToListAsync(ct);

        var json = JsonNode.Parse(System.Text.Json.JsonSerializer.Serialize(signals));
        return new McpToolCallResult
        {
            Success = true,
            Message = $"Found {signals.Count} pending signal(s)",
            Data = json as JsonObject
        };
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/TodoListHandler.cs
git commit -m "feat: add TodoListHandler — MCP tool for querying pending tasks"
```

---

### Task 10: TodoCreateHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/TodoCreateHandler.cs`

- [ ] **Step 1: Create TodoCreateHandler**

```csharp
// admin-api/Services/McpTools/Handlers/TodoCreateHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoCreateHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public TodoCreateHandler(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public string ToolCode => McpSystemToolCodes.TodoCreate;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var title = request.Arguments["title"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();
        var signalType = request.Arguments["signal_type"]?.GetValue<string>() ?? "todo";
        var severity = request.Arguments["severity"]?.GetValue<string>() ?? "normal";
        var scheduledAtStr = request.Arguments["scheduled_at"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(title))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: title" };

        DateTime? scheduledAt = null;
        if (!string.IsNullOrWhiteSpace(scheduledAtStr) && DateTime.TryParse(scheduledAtStr, out var parsed))
            scheduledAt = parsed;

        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N")[..32],
            SignalType = signalType,
            SignalCode = title,
            Severity = severity,
            Status = scheduledAt.HasValue && scheduledAt > now ? "scheduled" : "pending",
            SourceText = content,
            ScheduledAt = scheduledAt,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId,
            SessionId = request.SessionId,
            UserId = request.UserId,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(ct);

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Created {signalType}: {title}",
            Data = new JsonObject { ["signal_id"] = signal.Id, ["status"] = signal.Status }
        };
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/TodoCreateHandler.cs
git commit -m "feat: add TodoCreateHandler — MCP tool for creating todo/reminder signals"
```

---

### Task 11: TodoExecuteHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/TodoExecuteHandler.cs`

- [ ] **Step 1: Create TodoExecuteHandler**

```csharp
// admin-api/Services/McpTools/Handlers/TodoExecuteHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoExecuteHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly McpToolDispatcher _dispatcher;

    public TodoExecuteHandler(AiAdminDbContext db, McpToolDispatcher dispatcher)
    {
        _db = db;
        _dispatcher = dispatcher;
    }

    public string ToolCode => McpSystemToolCodes.TodoExecute;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var signalId = request.Arguments["signal_id"]?.GetValue<string>();
        var channel = request.Arguments["notification_channel"]?.GetValue<string>();
        var message = request.Arguments["notification_message"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(signalId))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: signal_id" };
        if (string.IsNullOrWhiteSpace(channel))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: notification_channel (sms|email)" };

        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(s => s.Id == signalId, ct);
        if (signal == null)
            return new McpToolCallResult { Success = false, Message = $"Signal not found: {signalId}" };

        var finishStatuses = new[] { "completed", "ignored" };
        if (finishStatuses.Contains(signal.Status))
            return new McpToolCallResult { Success = false, Message = $"Signal already finished: {signal.Status}" };

        signal.Status = "processing";
        signal.ProcessedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(ct);

        var notifyArgs = new JsonObject();
        var toolCode = channel switch
        {
            "sms" => McpSystemToolCodes.SendSms,
            "email" => McpSystemToolCodes.SendEmail,
            _ => null
        };

        if (toolCode == null)
        {
            signal.Status = "failed";
            signal.ErrorMessage = $"Unknown notification channel: {channel}";
            await _db.SaveChangesAsync(ct);
            return new McpToolCallResult { Success = false, Message = $"Unknown channel: {channel}. Use sms or email." };
        }

        if (toolCode == McpSystemToolCodes.SendSms)
        {
            notifyArgs["phone"] = signal.PayloadJson != null
                ? JsonNode.Parse(signal.PayloadJson)?["phone"]?.GetValue<string>() ?? ""
                : "";
            notifyArgs["content"] = message ?? signal.SourceText ?? "Reminder";
        }
        else
        {
            notifyArgs["to"] = signal.PayloadJson != null
                ? JsonNode.Parse(signal.PayloadJson)?["email"]?.GetValue<string>() ?? ""
                : "";
            notifyArgs["subject"] = signal.SignalCode ?? "Reminder";
            notifyArgs["body"] = message ?? signal.SourceText ?? "Reminder";
        }

        var dispatchRequest = new McpToolCallRequest
        {
            ToolCode = toolCode,
            Arguments = notifyArgs,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId
        };

        var result = await _dispatcher.DispatchAsync(toolCode, dispatchRequest, ct);

        signal.Status = result.Success ? "completed" : "failed";
        signal.ErrorMessage = result.Success ? null : result.Message;
        signal.RetryCount = result.Success ? signal.RetryCount : signal.RetryCount + 1;
        await _db.SaveChangesAsync(ct);

        return result;
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/TodoExecuteHandler.cs
git commit -m "feat: add TodoExecuteHandler — MCP tool for executing todo notification"
```

---

### Task 12: TodoCompleteHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/TodoCompleteHandler.cs`

- [ ] **Step 1: Create TodoCompleteHandler**

```csharp
// admin-api/Services/McpTools/Handlers/TodoCompleteHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Services.McpTools.Handlers;

public class TodoCompleteHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;

    public TodoCompleteHandler(AiAdminDbContext db) => _db = db;

    public string ToolCode => McpSystemToolCodes.TodoComplete;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var signalId = request.Arguments["signal_id"]?.GetValue<string>();
        var note = request.Arguments["result_note"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(signalId))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: signal_id" };

        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(s => s.Id == signalId, ct);
        if (signal == null)
            return new McpToolCallResult { Success = false, Message = $"Signal not found: {signalId}" };

        signal.Status = "completed";
        signal.ProcessedAt = DateTime.UtcNow;
        signal.UpdatedAt = DateTime.UtcNow;

        if (!string.IsNullOrWhiteSpace(note))
            signal.SourceText = (signal.SourceText ?? "") + $"\n[Result] {note}";

        await _db.SaveChangesAsync(ct);

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Signal {signalId} marked as completed",
            Data = new JsonObject { ["signal_id"] = signalId, ["status"] = "completed" }
        };
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/TodoCompleteHandler.cs
git commit -m "feat: add TodoCompleteHandler — MCP tool for completing tasks"
```

---

### Task 13: RiskCreateHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/RiskCreateHandler.cs`

- [ ] **Step 1: Create RiskCreateHandler**

```csharp
// admin-api/Services/McpTools/Handlers/RiskCreateHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools.Handlers;

public class RiskCreateHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public RiskCreateHandler(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public string ToolCode => McpSystemToolCodes.RiskCreate;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var title = request.Arguments["title"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();
        var severity = request.Arguments["severity"]?.GetValue<string>() ?? "high";
        var evidence = request.Arguments["evidence"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(title))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: title" };

        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N")[..32],
            SignalType = "risk",
            SignalCode = title,
            Severity = severity,
            Status = "pending",
            SourceText = content,
            PayloadJson = evidence != null ? JsonNode.Parse($"{{\"evidence\":\"{evidence}\"}}")?.ToJsonString() : null,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId,
            SessionId = request.SessionId,
            UserId = request.UserId,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(ct);

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Created risk: {title}",
            Data = new JsonObject { ["signal_id"] = signal.Id, ["severity"] = severity }
        };
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/RiskCreateHandler.cs
git commit -m "feat: add RiskCreateHandler — MCP tool for creating risk signals"
```

---

### Task 14: HealthFollowupCreateHandler

**Files:**
- Create: `admin-api/Services/McpTools/Handlers/HealthFollowupCreateHandler.cs`

- [ ] **Step 1: Create HealthFollowupCreateHandler**

```csharp
// admin-api/Services/McpTools/Handlers/HealthFollowupCreateHandler.cs
using System;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.McpTools.Dtos;
using Volo.Abp.Guids;

namespace AiAdmin.Services.McpTools.Handlers;

public class HealthFollowupCreateHandler : IMcpToolHandler
{
    private readonly AiAdminDbContext _db;
    private readonly IGuidGenerator _guidGenerator;

    public HealthFollowupCreateHandler(AiAdminDbContext db, IGuidGenerator guidGenerator)
    {
        _db = db;
        _guidGenerator = guidGenerator;
    }

    public string ToolCode => McpSystemToolCodes.HealthFollowupCreate;

    public async Task<McpToolCallResult> ExecuteAsync(McpToolCallRequest request, CancellationToken ct)
    {
        var title = request.Arguments["title"]?.GetValue<string>();
        var content = request.Arguments["content"]?.GetValue<string>();
        var followupType = request.Arguments["followup_type"]?.GetValue<string>();
        var scheduledAtStr = request.Arguments["scheduled_at"]?.GetValue<string>();

        if (string.IsNullOrWhiteSpace(title))
            return new McpToolCallResult { Success = false, Message = "Missing required parameter: title" };

        DateTime scheduledAt;
        if (!string.IsNullOrWhiteSpace(scheduledAtStr) && DateTime.TryParse(scheduledAtStr, out var parsed))
            scheduledAt = parsed;
        else
            scheduledAt = DateTime.UtcNow.AddHours(2); // default: 2-hour followup

        var now = DateTime.UtcNow;
        var signal = new AiRuntimeSignal
        {
            Id = _guidGenerator.Create().ToString("N")[..32],
            SignalType = "health_followup",
            SignalCode = title,
            Severity = "normal",
            Status = scheduledAt > now ? "scheduled" : "pending",
            SourceText = content,
            ScheduledAt = scheduledAt,
            PayloadJson = followupType != null ? JsonNode.Parse($"{{\"followup_type\":\"{followupType}\"}}")?.ToJsonString() : null,
            AgentRoleId = request.AgentRoleId,
            DeviceId = request.DeviceId,
            SessionId = request.SessionId,
            UserId = request.UserId,
            CreatedAt = now,
            UpdatedAt = now
        };

        _db.AiRuntimeSignals.Add(signal);
        await _db.SaveChangesAsync(ct);

        return new McpToolCallResult
        {
            Success = true,
            Message = $"Created health followup: {title} (scheduled at {scheduledAt:O})",
            Data = new JsonObject { ["signal_id"] = signal.Id, ["scheduled_at"] = scheduledAt.ToString("O") }
        };
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/HealthFollowupCreateHandler.cs
git commit -m "feat: add HealthFollowupCreateHandler — MCP tool for creating health followup signals"
```

---

### Task 15: Update AiAdminDataSeeder — Seed 8 system tools

**Files:**
- Modify: `admin-api/Data/AiAdminDataSeeder.cs`

- [ ] **Step 1: Rewrite SeedNotificationMcpTools → SeedSystemMcpTools**

Replace the old `SeedNotificationMcpTools()` method with:

```csharp
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
```

- [ ] **Step 2: Update the SeedAsync method — rename call**

Replace `await SeedNotificationMcpTools();` with `await SeedSystemMcpTools();`.

- [ ] **Step 3: Remove old ActionRule seed if present**

Search the seeder for any `AiActionRule` seed data and remove it.

- [ ] **Step 4: Add missing using statements**

Add `using AiAdmin.Services.McpTools;` at top of file.

- [ ] **Step 5: Verify build**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`

Expected: build succeeds.

- [ ] **Step 6: Commit**

```bash
git add admin-api/Data/AiAdminDataSeeder.cs
git commit -m "feat: seed 8 system MCP tools (notification/task/monitoring categories)"
```

---

### Task 16: Add WakeupJobId to AiRuntimeSignal entity

**Files:**
- Modify: `admin-api/Entities/AiRuntimeSignal.cs`

- [ ] **Step 1: Add WakeupJobId property**

Add after `ErrorMessage`:

```csharp
public string WakeupJobId { get; set; }
```

- [ ] **Step 2: Generate EF migration**

Run: `dotnet ef migrations add AddWakeupJobIdToRuntimeSignal -p e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`

Expected: migration file created in `admin-api/Migrations/`.

- [ ] **Step 3: Commit**

```bash
git add admin-api/Entities/AiRuntimeSignal.cs admin-api/Migrations/
git commit -m "feat: add WakeupJobId column to ai_runtime_signal"
```

---

### Task 17: Add Hangfire scheduling to RuntimeSignalService

**Files:**
- Modify: `admin-api/Services/Memory/RuntimeSignalService.cs`

- [ ] **Step 1: Add CreateAsync method with Hangfire scheduling**

Add a new method after existing methods:

```csharp
public async Task<AiRuntimeSignal> CreateSignalAsync(
    AiRuntimeSignal signal,
    CancellationToken cancellationToken = default)
{
    _db.AiRuntimeSignals.Add(signal);
    await _db.SaveChangesAsync(cancellationToken);
    return signal;
}

public async Task ScheduleWakeupIfNeededAsync(
    AiRuntimeSignal signal)
{
    // Cancel old job if exists
    if (!string.IsNullOrEmpty(signal.WakeupJobId))
    {
        Hangfire.BackgroundJob.Delete(signal.WakeupJobId);
        signal.WakeupJobId = null;
    }

    // Schedule new if scheduled_at is in the future
    if (signal.ScheduledAt.HasValue && signal.ScheduledAt.Value > DateTime.UtcNow
        && signal.Status != "completed" && signal.Status != "ignored" && signal.Status != "failed")
    {
        signal.WakeupJobId = Hangfire.BackgroundJob.Schedule<AgentWakeupJob>(
            job => job.WakeAsync(signal.Id),
            signal.ScheduledAt.Value);
        await _db.SaveChangesAsync();
    }
}

public async Task CancelWakeupIfExistsAsync(AiRuntimeSignal signal)
{
    if (!string.IsNullOrEmpty(signal.WakeupJobId))
    {
        Hangfire.BackgroundJob.Delete(signal.WakeupJobId);
        signal.WakeupJobId = null;
        await _db.SaveChangesAsync();
    }
}
```

- [ ] **Step 2: Add required using statement**

```csharp
using AiAdmin.Services.Runtime;
```

- [ ] **Step 3: Verify build**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`

- [ ] **Step 4: Commit**

```bash
git add admin-api/Services/Memory/RuntimeSignalService.cs
git commit -m "feat: add Hangfire scheduling methods to RuntimeSignalService"
```

---

### Task 18: AgentWakeupJob

**Files:**
- Create: `admin-api/Services/Runtime/AgentWakeupJob.cs`

- [ ] **Step 1: Create AgentWakeupJob**

```csharp
// admin-api/Services/Runtime/AgentWakeupJob.cs
using System;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Data;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public class AgentWakeupJob : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly DeviceConversationRuntimeService _runtime;

    public AgentWakeupJob(AiAdminDbContext db, DeviceConversationRuntimeService runtime)
    {
        _db = db;
        _runtime = runtime;
    }

    public virtual async Task WakeAsync(string signalId)
    {
        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(s => s.Id == signalId);
        if (signal == null) return;

        var finishStatuses = new[] { "completed", "ignored", "failed" };
        if (finishStatuses.Contains(signal.Status)) return;

        signal.Status = "processing";
        signal.ProcessedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        try
        {
            var request = new DeviceConversationTurnRequest
            {
                CredentialId = signal.DeviceId != null
                    ? (await _db.AiDevices.FirstOrDefaultAsync(d => d.Id == signal.DeviceId))?.CredentialId
                    : null,
                MacAddress = (await _db.AiDevices.FirstOrDefaultAsync(d => d.Id == signal.DeviceId))?.MacAddress,
                SessionId = signal.SessionId
            };

            // Note: DeviceConversationTurnRequest needs a system-message pathway.
            // The ExecuteTurnAsync method will need a new overload accepting a
            // system message string instead of audio input.
            // This is addressed in Task 20 (ConversationToolLoop integration).
        }
        catch (Exception)
        {
            signal.Status = "failed";
            signal.ErrorMessage = "Wakeup job failed to trigger conversation turn";
            signal.RetryCount += 1;
            await _db.SaveChangesAsync();
        }
    }
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/Runtime/AgentWakeupJob.cs
git commit -m "feat: add AgentWakeupJob for precise Hangfire-based wake-up scheduling"
```

---

### Task 19: ConversationToolLoop

**Files:**
- Create: `admin-api/Services/Runtime/ConversationToolLoop.cs`

- [ ] **Step 1: Create ConversationToolLoop**

```csharp
// admin-api/Services/Runtime/ConversationToolLoop.cs
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools;
using AiAdmin.Services.McpTools.Dtos;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public class ConversationToolLoop : ITransientDependency
{
    private readonly McpToolDispatcher _dispatcher;
    private readonly ILogger<ConversationToolLoop> _logger;

    private const int MaxRounds = 5;
    private const int ToolCallTimeoutMs = 10000;

    public ConversationToolLoop(McpToolDispatcher dispatcher, ILogger<ConversationToolLoop> logger)
    {
        _dispatcher = dispatcher;
        _logger = logger;
    }

    public async Task<ConversationToolLoopResult> RunAsync(
        string systemPrompt,
        string userMessage,
        List<object> history, // List<ChatMessage> from the LLM provider's message type
        List<McpToolDefinition> toolDefs,
        ConversationContext context,
        Func<string, List<object>, List<McpToolDefinition>, CancellationToken, Task<LlmResponse>> chatFunc,
        CancellationToken ct)
    {
        var messages = new List<object>(history ?? new List<object>());
        // Add user message to history
        // messages.Add(userMessage);

        var audits = new List<ToolCallAudit>();
        var rounds = 0;

        while (rounds < MaxRounds && !ct.IsCancellationRequested)
        {
            rounds++;
            var response = await chatFunc(systemPrompt, messages, toolDefs, ct);

            if (response.ToolCalls == null || response.ToolCalls.Count == 0)
            {
                return new ConversationToolLoopResult
                {
                    FinalReply = response.Content,
                    ToolCalls = audits,
                    TotalRounds = rounds
                };
            }

            foreach (var toolCall in response.ToolCalls)
            {
                var sw = Stopwatch.StartNew();
                var request = new McpToolCallRequest
                {
                    ToolCode = toolCall.Name,
                    Arguments = toolCall.Arguments,
                    AgentRoleId = context.AgentRoleId,
                    DeviceId = context.DeviceId,
                    SessionId = context.SessionId,
                    UserId = context.UserId
                };

                McpToolCallResult result;
                using (var timeoutCts = new CancellationTokenSource(ToolCallTimeoutMs))
                using (var linkedCts = CancellationTokenSource.CreateLinkedTokenSource(ct, timeoutCts.Token))
                {
                    try
                    {
                        result = await _dispatcher.DispatchAsync(toolCall.Name, request, linkedCts.Token);
                    }
                    catch (OperationCanceledException)
                    {
                        result = new McpToolCallResult { Success = false, Message = $"Tool call timed out after {ToolCallTimeoutMs}ms" };
                    }
                }
                sw.Stop();

                audits.Add(new ToolCallAudit
                {
                    ToolCode = toolCall.Name,
                    Arguments = toolCall.Arguments,
                    Success = result.Success,
                    ResultSummary = result.Message,
                    ElapsedMs = sw.ElapsedMilliseconds
                });

                // Append tool result to messages for next round
                // messages.Add(new ToolMessage { ToolCallId = toolCall.Id, Content = result.Message });
            }
        }

        return new ConversationToolLoopResult
        {
            FinalReply = "I've processed the pending items. Is there anything else you need?",
            ToolCalls = audits,
            TotalRounds = rounds
        };
    }
}

public class ConversationContext
{
    public string AgentRoleId { get; set; }
    public string DeviceId { get; set; }
    public string SessionId { get; set; }
    public long? UserId { get; set; }
}

public class McpToolDefinition
{
    public string Name { get; set; }
    public string Description { get; set; }
    public JsonObject InputSchema { get; set; }
}

public class LlmResponse
{
    public string Content { get; set; }
    public List<LlmToolCall> ToolCalls { get; set; }
}

public class LlmToolCall
{
    public string Id { get; set; }
    public string Name { get; set; }
    public JsonObject Arguments { get; set; }
}

public class ConversationToolLoopResult
{
    public string FinalReply { get; set; }
    public List<ToolCallAudit> ToolCalls { get; set; }
    public int TotalRounds { get; set; }
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

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/Runtime/ConversationToolLoop.cs
git commit -m "feat: add ConversationToolLoop for LLM tool-use multi-turn conversation"
```

---

### Task 20: Integrate ConversationToolLoop into DeviceConversationRuntimeService

**Files:**
- Modify: `admin-api/Services/Runtime/DeviceConversationRuntimeService.cs`

- [ ] **Step 1: Replace ActionRuleExecutionService dependency**

In the constructor, remove `ActionRuleExecutionService actionRuleExecutionService` and add `ConversationToolLoop toolLoop`.

- [ ] **Step 2: Replace the single LLM call with tool-use loop**

Locate the LLM chat call inside `ExecuteTurnStreamingAsync`. Replace the single-turn call pattern with a call to `_toolLoop.RunAsync(...)`.

- [ ] **Step 3: Remove AppendActionConfirmationAsync call**

Remove the call to `AppendActionConfirmationAsync(...)` and the method itself, plus the `BuildActionConfirmation` helper.

- [ ] **Step 4: Add system-wakeup-message overload**

Add a new method overload (or optional parameter on `ExecuteTurnAsync`) to accept a system wakeup message string instead of audio input:

```csharp
public async Task<DeviceConversationTurnResult?> ExecuteSystemTurnAsync(
    string deviceId,
    string systemMessage,
    CancellationToken cancellationToken = default)
{
    // Resolve device, agent role, context
    // Call _toolLoop.RunAsync(systemPrompt, systemMessage, ...)
    // Return result with TTS audio
}
```

- [ ] **Step 5: Update AgentWakeupJob to use the new method**

Update `AgentWakeupJob.WakeAsync` to call `_runtime.ExecuteSystemTurnAsync(...)`.

- [ ] **Step 6: Verify build**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`

- [ ] **Step 7: Commit**

```bash
git add admin-api/Services/Runtime/DeviceConversationRuntimeService.cs admin-api/Services/Runtime/AgentWakeupJob.cs
git commit -m "feat: integrate ConversationToolLoop into DeviceConversationRuntimeService"
```

---

### Task 21: Update TodoCreateHandler — integrate Hangfire scheduling

**Files:**
- Modify: `admin-api/Services/McpTools/Handlers/TodoCreateHandler.cs`

- [ ] **Step 1: Add Hangfire scheduling after signal creation**

Add after `await _db.SaveChangesAsync(ct)` in `ExecuteAsync`:

```csharp
if (scheduledAt.HasValue && scheduledAt.Value > now)
{
    signal.WakeupJobId = Hangfire.BackgroundJob.Schedule<AgentWakeupJob>(
        job => job.WakeAsync(signal.Id),
        scheduledAt.Value);
    await _db.SaveChangesAsync(ct);
}
```

- [ ] **Step 2: Add required using**

```csharp
using AiAdmin.Services.Runtime;
```

- [ ] **Step 3: Do the same for HealthFollowupCreateHandler**

Add identical Hangfire scheduling logic after signal creation.

- [ ] **Step 4: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/TodoCreateHandler.cs admin-api/Services/McpTools/Handlers/HealthFollowupCreateHandler.cs
git commit -m "feat: integrate Hangfire wake-up scheduling into signal creation handlers"
```

---

### Task 22: Update TodoCompleteHandler — cancel scheduled wakeup

**Files:**
- Modify: `admin-api/Services/McpTools/Handlers/TodoCompleteHandler.cs`

- [ ] **Step 1: Cancel Hangfire job on completion**

Add after loading the signal, before setting status:

```csharp
if (!string.IsNullOrEmpty(signal.WakeupJobId))
{
    Hangfire.BackgroundJob.Delete(signal.WakeupJobId);
    signal.WakeupJobId = null;
}
```

- [ ] **Step 2: Commit**

```bash
git add admin-api/Services/McpTools/Handlers/TodoCompleteHandler.cs
git commit -m "feat: cancel scheduled wakeup job on todo completion"
```

---

### Task 23: Remove Services/Notifications/ directory

**Files:**
- Delete: `admin-api/Services/Notifications/EmailService.cs`
- Delete: `admin-api/Services/Notifications/McpToolExecutionService.cs`
- Delete: `admin-api/Services/Notifications/TodoExecutionService.cs`
- Delete: `admin-api/Services/Notifications/TodoScanBackgroundJob.cs`

- [ ] **Step 1: Verify no remaining references**

```bash
rg "Notifications\." e:\GitHub\otto-ai\admin-api --type cs
rg "Services\.Notifications" e:\GitHub\otto-ai\admin-api --type cs
rg "TodoScanBackgroundJob|TodoExecutionService|McpToolExecutionService" e:\GitHub\otto-ai\admin-api --type cs
```

Expected: no results (all references already migrated to new McpTools/Handlers/).

- [ ] **Step 2: Delete the files**

```powershell
Remove-Item -Recurse -Force e:\GitHub\otto-ai\admin-api\Services\Notifications
```

- [ ] **Step 3: Remove recurring job registration from AiAdminModule.cs**

In `AiAdminModule.cs`, remove these lines (currently around line 73-78):

```csharp
RecurringJob.AddOrUpdate<TodoScanBackgroundJob>(
    "todo-execution-scan",
    job => job.ScanAndExecuteAsync(CancellationToken.None),
    "*/1 * * * *");
```

Also remove the `using AiAdmin.Services.Notifications;` directive if present.

- [ ] **Step 4: Verify build**

Run: `dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj`

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "refactor: remove Services/Notifications/ directory and Hangfire recurring job"
```

---

### Task 24: Remove ActionRule chain

**Files:**
- Delete: `admin-api/Entities/AiActionRule.cs`
- Delete: `admin-api/Services/AgentRoles/ActionRuleService.cs`
- Delete: `admin-api/Services/AgentRoles/ActionRuleExecutionService.cs`
- Delete: `admin-api/Controllers/ActionRuleController.cs`
- Delete: `admin-web/src/app/features/agent-roles/action-rules/action-rules.component.ts`
- Delete: `admin-web/src/app/features/agent-roles/action-rules/action-rules.component.html`
- Delete: `admin-web/src/app/features/agent-roles/action-rules/action-rules.component.css`
- Delete: `admin-web/src/app/features/agent-roles/shared/action-rule.models.ts`
- Delete: `admin-web/src/app/features/agent-roles/shared/action-rule.service.ts`

- [ ] **Step 1: Verify no remaining backend references**

```bash
rg "ActionRule" e:\GitHub\otto-ai\admin-api --type cs
```

Clean up any remaining references in `AiAdminDbContext.cs` (remove `DbSet<AiActionRule>`), `AiAdminModule.cs`, etc.

- [ ] **Step 2: Verify no remaining frontend references**

```bash
rg "actionRule\|ActionRule\|action-rule" e:\GitHub\otto-ai\admin-web\src --type ts
```

Clean up any references in routing, feature manifests, menu configs, agent-role form.

- [ ] **Step 3: Delete the backend files**

```powershell
Remove-Item e:\GitHub\otto-ai\admin-api\Entities\AiActionRule.cs
Remove-Item e:\GitHub\otto-ai\admin-api\Services\AgentRoles\ActionRuleService.cs
Remove-Item e:\GitHub\otto-ai\admin-api\Services\AgentRoles\ActionRuleExecutionService.cs
Remove-Item e:\GitHub\otto-ai\admin-api\Controllers\ActionRuleController.cs
```

- [ ] **Step 4: Delete the frontend files**

```powershell
Remove-Item -Recurse -Force e:\GitHub\otto-ai\admin-web\src\app\features\agent-roles\action-rules
Remove-Item e:\GitHub\otto-ai\admin-web\src\app\features\agent-roles\shared\action-rule.models.ts
Remove-Item e:\GitHub\otto-ai\admin-web\src\app\features\agent-roles\shared\action-rule.service.ts
```

- [ ] **Step 5: Remove DbSet and modelBuilder references from AiAdminDbContext.cs**

Remove:
```csharp
public DbSet<AiActionRule> AiActionRules { get; set; }
```

- [ ] **Step 6: Generate EF migration to drop ai_action_rule table**

```bash
dotnet ef migrations add DropActionRuleTable -p e:\GitHub\otto-ai\admin-api\AiAdmin.csproj
```

- [ ] **Step 7: Verify both builds**

```bash
dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj
cd admin-web && npm run build
```

- [ ] **Step 8: Commit**

```bash
git add -A
git commit -m "refactor: remove ActionRule entity, service, controller, and frontend pages"
```

---

### Task 25: End-to-end verification and test suite

**Files:**
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/McpTools/McpToolDispatcherTests.cs`
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/TodoCreateHandlerTests.cs`
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/TodoExecuteHandlerTests.cs`
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/TodoCompleteHandlerTests.cs`
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/RiskCreateHandlerTests.cs`
- Create: `admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/HealthFollowupCreateHandlerTests.cs`

- [ ] **Step 1: Write McpToolDispatcherTests**

```csharp
// admin-api/test/AiAdmin.Application.Tests/Services/McpTools/McpToolDispatcherTests.cs
using AiAdmin.Services.McpTools;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.Services.McpTools.Handlers;
using AiAdmin.TestBase;
using Shouldly;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
using Xunit;

namespace AiAdmin.Application.Tests.Services.McpTools;

public class McpToolDispatcherTests : AiAdminIntegratedTest
{
    private readonly McpToolDispatcher _dispatcher;

    public McpToolDispatcherTests()
    {
        _dispatcher = GetRequiredService<McpToolDispatcher>();
    }

    [Fact]
    public async Task Should_Return_Error_For_Unknown_Tool()
    {
        var result = await _dispatcher.DispatchAsync("nonexistent-tool",
            new McpToolCallRequest { ToolCode = "nonexistent-tool", Arguments = new JsonObject() },
            CancellationToken.None);

        result.Success.ShouldBeFalse();
        result.Message.ShouldContain("Unknown tool");
    }

    [Fact]
    public async Task Should_Dispatch_To_Registered_Handler()
    {
        var result = await _dispatcher.DispatchAsync(McpSystemToolCodes.TodoList,
            new McpToolCallRequest
            {
                ToolCode = McpSystemToolCodes.TodoList,
                Arguments = new JsonObject { ["limit"] = 5 }
            },
            CancellationToken.None);

        result.Success.ShouldBeTrue();
    }
}
```

- [ ] **Step 2: Write TodoCreateHandlerTests**

```csharp
// admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/TodoCreateHandlerTests.cs
using AiAdmin.Services.McpTools.Handlers;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.TestBase;
using Shouldly;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace AiAdmin.Application.Tests.Services.McpTools.Handlers;

public class TodoCreateHandlerTests : AiAdminIntegratedTest
{
    private readonly TodoCreateHandler _handler;

    public TodoCreateHandlerTests()
    {
        _handler = GetRequiredService<TodoCreateHandler>();
    }

    [Fact]
    public async Task Should_Create_Todo_Signal()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.TodoCreate,
            Arguments = new JsonObject
            {
                ["title"] = "Test todo",
                ["content"] = "Test content",
                ["signal_type"] = "todo"
            }
        }, CancellationToken.None);

        result.Success.ShouldBeTrue();
        result.Message.ShouldContain("Test todo");
        result.Data["signal_id"].ShouldNotBeNull();
    }

    [Fact]
    public async Task Should_Reject_Missing_Title()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.TodoCreate,
            Arguments = new JsonObject { ["content"] = "No title" }
        }, CancellationToken.None);

        result.Success.ShouldBeFalse();
        result.Message.ShouldContain("Missing required parameter: title");
    }
}
```

- [ ] **Step 3: Write TodoExecuteHandlerTests**

```csharp
// admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/TodoExecuteHandlerTests.cs
using AiAdmin.Services.McpTools.Handlers;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.TestBase;
using Shouldly;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace AiAdmin.Application.Tests.Services.McpTools.Handlers;

public class TodoExecuteHandlerTests : AiAdminIntegratedTest
{
    private readonly TodoExecuteHandler _handler;

    public TodoExecuteHandlerTests()
    {
        _handler = GetRequiredService<TodoExecuteHandler>();
    }

    [Fact]
    public async Task Should_Reject_Missing_SignalId()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.TodoExecute,
            Arguments = new JsonObject { ["notification_channel"] = "sms" }
        }, CancellationToken.None);

        result.Success.ShouldBeFalse();
        result.Message.ShouldContain("Missing required parameter: signal_id");
    }

    [Fact]
    public async Task Should_Return_Error_For_Nonexistent_Signal()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.TodoExecute,
            Arguments = new JsonObject
            {
                ["signal_id"] = "nonexistent-id",
                ["notification_channel"] = "sms",
                ["notification_message"] = "test"
            }
        }, CancellationToken.None);

        result.Success.ShouldBeFalse();
        result.Message.ShouldContain("Signal not found");
    }
}
```

- [ ] **Step 4: Write TodoCompleteHandlerTests**

```csharp
// admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/TodoCompleteHandlerTests.cs
using AiAdmin.Services.McpTools.Handlers;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.TestBase;
using Shouldly;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace AiAdmin.Application.Tests.Services.McpTools.Handlers;

public class TodoCompleteHandlerTests : AiAdminIntegratedTest
{
    private readonly TodoCompleteHandler _handler;

    public TodoCompleteHandlerTests()
    {
        _handler = GetRequiredService<TodoCompleteHandler>();
    }

    [Fact]
    public async Task Should_Reject_Missing_SignalId()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.TodoComplete,
            Arguments = new JsonObject()
        }, CancellationToken.None);

        result.Success.ShouldBeFalse();
        result.Message.ShouldContain("Missing required parameter: signal_id");
    }
}
```

- [ ] **Step 5: Write RiskCreateHandlerTests**

```csharp
// admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/RiskCreateHandlerTests.cs
using AiAdmin.Services.McpTools.Handlers;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.TestBase;
using Shouldly;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace AiAdmin.Application.Tests.Services.McpTools.Handlers;

public class RiskCreateHandlerTests : AiAdminIntegratedTest
{
    private readonly RiskCreateHandler _handler;

    public RiskCreateHandlerTests()
    {
        _handler = GetRequiredService<RiskCreateHandler>();
    }

    [Fact]
    public async Task Should_Create_Risk_With_Default_High_Severity()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.RiskCreate,
            Arguments = new JsonObject
            {
                ["title"] = "Fall detected",
                ["content"] = "User reported a fall"
            }
        }, CancellationToken.None);

        result.Success.ShouldBeTrue();
        result.Data["severity"].GetValue<string>().ShouldBe("high");
    }
}
```

- [ ] **Step 6: Write HealthFollowupCreateHandlerTests**

```csharp
// admin-api/test/AiAdmin.Application.Tests/Services/McpTools/Handlers/HealthFollowupCreateHandlerTests.cs
using AiAdmin.Services.McpTools.Handlers;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.TestBase;
using Shouldly;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using Xunit;

namespace AiAdmin.Application.Tests.Services.McpTools.Handlers;

public class HealthFollowupCreateHandlerTests : AiAdminIntegratedTest
{
    private readonly HealthFollowupCreateHandler _handler;

    public HealthFollowupCreateHandlerTests()
    {
        _handler = GetRequiredService<HealthFollowupCreateHandler>();
    }

    [Fact]
    public async Task Should_Default_ScheduledAt_To_Two_Hours_Ahead()
    {
        var result = await _handler.ExecuteAsync(new McpToolCallRequest
        {
            ToolCode = McpSystemToolCodes.HealthFollowupCreate,
            Arguments = new JsonObject { ["title"] = "Check blood pressure" }
        }, CancellationToken.None);

        result.Success.ShouldBeTrue();
        result.Data["scheduled_at"].ShouldNotBeNull();
    }
}
```

- [ ] **Step 7: Run all tests**

```bash
dotnet test e:\GitHub\otto-ai\admin-api\test\AiAdmin.Application.Tests\AiAdmin.Application.Tests.csproj
```

Expected: all tests pass.

- [ ] **Step 8: Commit**

```bash
git add admin-api/test/
git commit -m "test: add integration tests for MCP tool handlers and dispatcher"
```

---

### Task 26: Final cleanup — unused usings and dead references

**Files:**
- Modify: `admin-api/AiAdminModule.cs`
- Modify: `admin-api/Data/AiAdminDbContext.cs`

- [ ] **Step 1: Clean AiAdminModule.cs**

Verify no remaining `using` directives referencing:
- `AiAdmin.Services.Notifications`
- `AiAdmin.Services.AgentRoles` (for ActionRule types)

- [ ] **Step 2: Clean AiAdminDbContext.cs**

Remove `DbSet<AiActionRule> AiActionRules { get; set; }` if not already done.

- [ ] **Step 3: Full build verification**

```bash
dotnet build e:\GitHub\otto-ai\admin-api\AiAdmin.csproj
cd e:\GitHub\otto-ai\admin-web && npm run build 2>&1 | Select-Object -Last 20
```

- [ ] **Step 4: Full test suite**

```bash
dotnet test e:\GitHub\otto-ai\admin-api\test\AiAdmin.Application.Tests\AiAdmin.Application.Tests.csproj
dotnet test e:\GitHub\otto-ai\admin-api\test\AiAdmin.Domain.Tests\AiAdmin.Domain.Tests.csproj
```

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "chore: final cleanup — remove unused usings and dead references"
```
