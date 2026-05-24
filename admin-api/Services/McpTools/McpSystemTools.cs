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

    public static bool IsSystemCode(string? code) => code != null && All.Contains(code);
}
