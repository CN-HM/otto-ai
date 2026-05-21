namespace AiAdmin.Services.Admin.Dtos;

/// <summary>审计日志操作VO</summary>
public class AuditLogActionVo
{
    /// <summary>服务名称</summary>
    public string? ServiceName { get; set; }
    /// <summary>方法名称</summary>
    public string? MethodName { get; set; }
    /// <summary>参数</summary>
    public string? Parameters { get; set; }
    /// <summary>执行时间</summary>
    public DateTime ExecutionTime { get; set; }
    /// <summary>执行耗时（毫秒）</summary>
    public int ExecutionDuration { get; set; }
}

