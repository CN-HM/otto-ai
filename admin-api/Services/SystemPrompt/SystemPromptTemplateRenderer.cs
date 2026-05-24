using System.Text.RegularExpressions;
using AiAdmin.Services.SystemPrompt.Dtos;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt;

public partial class SystemPromptTemplateRenderer : ITransientDependency
{
    private readonly Dictionary<string, ISystemPromptVariableProvider> _index;
    private readonly ILogger<SystemPromptTemplateRenderer> _logger;

    public SystemPromptTemplateRenderer(
        IEnumerable<ISystemPromptVariableProvider> providers,
        ILogger<SystemPromptTemplateRenderer> logger)
    {
        _index = providers
            .SelectMany(p => p.SupportedVariables.Select(v => (name: v, provider: p)))
            .ToDictionary(x => x.name, x => x.provider);
        _logger = logger;
    }

    public List<VariableDefinition> GetAvailableVariables()
    {
        return _index.Values
            .Distinct()
            .SelectMany(p => p.GetDefinitions())
            .ToList();
    }

    public async Task<string> RenderAsync(string? template, VariableResolveContext context)
    {
        if (string.IsNullOrWhiteSpace(template))
            return template ?? string.Empty;

        var result = template;
        var matches = VariablePattern().Matches(template);

        foreach (Match match in matches)
        {
            var varName = match.Groups[1].Value;
            if (_index.TryGetValue(varName, out var provider))
            {
                var value = await provider.ResolveAsync(varName, context);
                if (value != null)
                    result = result.Replace(match.Value, value);
            }
            else
            {
                _logger.LogWarning("Unknown template variable: {{{VariableName}}}", varName);
            }
        }

        return result;
    }

    [GeneratedRegex(@"\{\{(\w+)\}\}")]
    private static partial Regex VariablePattern();
}
