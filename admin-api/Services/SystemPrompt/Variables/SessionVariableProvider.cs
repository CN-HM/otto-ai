using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

[ExposeServices(typeof(ISystemPromptVariableProvider))]
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
