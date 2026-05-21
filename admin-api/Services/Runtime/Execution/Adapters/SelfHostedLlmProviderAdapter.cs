using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class SelfHostedLlmProviderAdapter : ProviderAdapterBase, ILlmProviderAdapter, ITransientDependency
{
    public string AdapterCode => "llm_self_hosted";
    public string AdapterName => "Self Hosted LLM Adapter";
    public int Order => 30;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "ollama", "xinference", "chatglm");
    }
}
