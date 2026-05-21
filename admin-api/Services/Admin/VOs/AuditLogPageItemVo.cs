namespace AiAdmin.Services.Admin.Dtos;

/// <summary>审计日志分页项VO</summary>
public class AuditLogPageItemVo
{
    /// <summary>日志ID</summary>
    public string Id { get; set; } = string.Empty;
    /// <summary>应用名称</summary>
    public string? ApplicationName { get; set; }
    /// <summary>操作人ID</summary>
    public string? OperatorId { get; set; }
    /// <summary>用户名</summary>
    public string? UserName { get; set; }
    /// <summary>客户端IP地址</summary>
    public string? ClientIpAddress { get; set; }
    /// <summary>浏览器信息</summary>
    public string? BrowserInfo { get; set; }
    /// <summary>关联ID</summary>
    public string? CorrelationId { get; set; }
    /// <summary>HTTP方法</summary>
    public string? HttpMethod { get; set; }
    /// <summary>HTTP状态码</summary>
    public int? HttpStatusCode { get; set; }
    /// <summary>请求URL</summary>
    public string? Url { get; set; }
    /// <summary>执行时间</summary>
    public DateTime ExecutionTime { get; set; }
    /// <summary>执行耗时（毫秒）</summary>
    public int ExecutionDuration { get; set; }
    /// <summary>是否有异常</summary>
    public bool HasException { get; set; }
    /// <summary>异常信息</summary>
    public string? Exceptions { get; set; }
    /// <summary>备注</summary>
    public string? Comments { get; set; }
    /// <summary>操作数量</summary>
    public int ActionCount { get; set; }
    /// <summary>实体变更数量</summary>
    public int EntityChangeCount { get; set; }
    /// <summary>操作列表</summary>
    public List<AuditLogActionVo> Actions { get; set; } = [];
    /// <summary>实体变更列表</summary>
    public List<AuditEntityChangeVo> EntityChanges { get; set; } = [];
}

