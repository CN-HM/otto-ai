namespace AiAdmin.Controllers;

/// <summary>智能体模型配置请求DTO</summary>
public class AgentModelsConfigDto
{
    /// <summary>设备MAC地址</summary>
    public string MacAddress { get; set; } = string.Empty;
    /// <summary>MQTT客户端ID</summary>
    public string ClientId { get; set; } = string.Empty;
    /// <summary>用户选择的模块映射</summary>
    public Dictionary<string, string>? SelectedModule { get; set; }
}
