using AiAdmin.Services.SystemPrompt.Dtos;

namespace AiAdmin.Services.SystemPrompt;

public interface ISystemPromptVariableProvider
{
    IEnumerable<string> SupportedVariables { get; }
    IEnumerable<VariableDefinition> GetDefinitions();
    Task<string?> ResolveAsync(string variableName, VariableResolveContext context);
}
