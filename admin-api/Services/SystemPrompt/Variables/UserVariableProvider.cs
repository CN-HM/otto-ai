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
