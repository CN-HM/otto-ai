using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution;

public class ConversationExecutionBindingService : IConversationExecutionBindingService, ITransientDependency
{
    private readonly IConversationOrchestrationService _conversationOrchestrationService;
    private readonly ExecutableAsrProviderAdapterRegistry _executableAsrProviderAdapterRegistry;
    private readonly ExecutableLlmProviderAdapterRegistry _executableLlmProviderAdapterRegistry;
    private readonly ExecutableTtsProviderAdapterRegistry _executableTtsProviderAdapterRegistry;

    public ConversationExecutionBindingService(
        IConversationOrchestrationService conversationOrchestrationService,
        ExecutableAsrProviderAdapterRegistry executableAsrProviderAdapterRegistry,
        ExecutableLlmProviderAdapterRegistry executableLlmProviderAdapterRegistry,
        ExecutableTtsProviderAdapterRegistry executableTtsProviderAdapterRegistry)
    {
        _conversationOrchestrationService = conversationOrchestrationService;
        _executableAsrProviderAdapterRegistry = executableAsrProviderAdapterRegistry;
        _executableLlmProviderAdapterRegistry = executableLlmProviderAdapterRegistry;
        _executableTtsProviderAdapterRegistry = executableTtsProviderAdapterRegistry;
    }

    public async Task<ConversationExecutionBindingDto> ResolveAsync(ConversationOrchestrationRequestDto request, CancellationToken cancellationToken = default)
    {
        var plan = await _conversationOrchestrationService.BuildPlanAsync(request, cancellationToken);
        var result = new ConversationExecutionBindingDto
        {
            Orchestration = plan,
            Warnings = plan.Warnings.ToList(),
            Asr = BuildBinding(plan.Asr,
                plan.Asr == null ? null : _executableAsrProviderAdapterRegistry.Resolve(plan.Asr),
                out var asrWarning),
            Llm = BuildBinding(plan.Llm,
                plan.Llm == null ? null : _executableLlmProviderAdapterRegistry.Resolve(plan.Llm),
                out var llmWarning),
            Tts = BuildBinding(plan.Tts,
                plan.Tts == null ? null : _executableTtsProviderAdapterRegistry.Resolve(plan.Tts),
                out var ttsWarning)
        };

        AddWarning(result.Warnings, asrWarning);
        AddWarning(result.Warnings, llmWarning);
        AddWarning(result.Warnings, ttsWarning);

        result.MissingStages = new[] { result.Asr, result.Llm, result.Tts }
            .Where(x => x is { IsResolved: false })
            .Select(x => x!.Stage)
            .ToList();
        result.IsFullyResolved = result.MissingStages.Count == 0;
        result.AdapterRoute = BuildAdapterRoute(result.Asr, result.Llm, result.Tts);
        result.UsesMixedAdapters = result.AdapterRoute
            .Select(x => x[(x.IndexOf(':') + 1)..].Trim())
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .Count() > 1;

        if (!result.IsFullyResolved)
        {
            AddWarning(result.Warnings,
                $"以下阶段尚未绑定到执行适配器：{string.Join(" / ", result.MissingStages)}。",
                true);
        }

        return result;
    }

    private static StageExecutionBindingDto? BuildBinding<TAdapter>(
        ModelInvocationProfileDto? profile,
        ProviderAdapterResolution<TAdapter>? resolution,
        out string? warning)
        where TAdapter : IStageProviderAdapter
    {
        warning = null;
        if (profile == null)
            return null;

        var binding = new StageExecutionBindingDto
        {
            Stage = profile.Stage,
            ProfileId = profile.ProfileId,
            ModelType = profile.ModelType,
            ModelCode = profile.ModelCode,
            ModelName = profile.ModelName,
            ProviderCode = profile.ProviderCode,
            ProviderType = profile.ProviderType,
            ProviderName = profile.ProviderName,
            ProviderFamily = profile.ProviderFamily,
            InvocationMode = profile.InvocationMode,
            SupportsStreamingInput = profile.SupportsStreamingInput,
            SupportsStreamingOutput = profile.SupportsStreamingOutput,
            CapabilitySource = profile.CapabilitySource,
            CapabilityTags = profile.CapabilityTags.ToList()
        };

        if (resolution is { Match.IsMatch: true, Adapter: not null })
        {
            binding.AdapterCode = resolution.Adapter.AdapterCode;
            binding.AdapterName = resolution.Adapter.AdapterName;
            binding.IsResolved = true;
            binding.ResolutionMode = resolution.Match.ResolutionMode;
            binding.ResolutionDetail = resolution.Match.ResolutionDetail;
            return binding;
        }

        binding.IsResolved = false;
        binding.ResolutionMode = "unresolved";
        binding.ResolutionDetail = profile.ProviderCode ?? profile.ProviderFamily ?? profile.ProviderName;
        warning = $"{profile.Stage} 阶段尚未找到可执行适配器：{FormatProvider(profile)}。";
        binding.Warnings.Add(warning);
        return binding;
    }

    private static List<string> BuildAdapterRoute(params StageExecutionBindingDto?[] bindings)
    {
        return bindings
            .Where(x => x != null)
            .Select(x => $"{x!.Stage}: {FormatAdapterLabel(x)}")
            .ToList();
    }

    private static string FormatAdapterLabel(StageExecutionBindingDto binding)
    {
        if (!string.IsNullOrWhiteSpace(binding.AdapterName) && !string.IsNullOrWhiteSpace(binding.AdapterCode))
            return $"{binding.AdapterName} ({binding.AdapterCode})";
        if (!string.IsNullOrWhiteSpace(binding.AdapterName))
            return binding.AdapterName;
        if (!string.IsNullOrWhiteSpace(binding.AdapterCode))
            return binding.AdapterCode;
        return "unresolved";
    }

    private static string FormatProvider(ModelInvocationProfileDto profile)
    {
        if (!string.IsNullOrWhiteSpace(profile.ProviderName) && !string.IsNullOrWhiteSpace(profile.ProviderCode))
            return $"{profile.ProviderName} ({profile.ProviderCode})";
        if (!string.IsNullOrWhiteSpace(profile.ProviderName))
            return profile.ProviderName;
        if (!string.IsNullOrWhiteSpace(profile.ProviderCode))
            return profile.ProviderCode;
        return profile.ProviderFamily ?? "unknown";
    }

    private static void AddWarning(List<string> warnings, string? warning, bool allowDuplicate = false)
    {
        if (string.IsNullOrWhiteSpace(warning))
            return;
        if (allowDuplicate || !warnings.Contains(warning))
            warnings.Add(warning);
    }
}
