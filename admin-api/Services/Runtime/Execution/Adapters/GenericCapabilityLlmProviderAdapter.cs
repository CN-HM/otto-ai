using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class GenericCapabilityLlmProviderAdapter : ProviderAdapterBase, ILlmProviderAdapter, ITransientDependency
{
    public string AdapterCode => "llm_generic_capability";
    public string AdapterName => "Generic Capability LLM Adapter";
    public int Order => 900;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByCapabilityTag(profile.CapabilityTags, "chat_completion", "text_output_streaming");
    }
}
