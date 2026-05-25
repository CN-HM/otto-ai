using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

[ExposeServices(typeof(ISystemPromptVariableProvider))]
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
