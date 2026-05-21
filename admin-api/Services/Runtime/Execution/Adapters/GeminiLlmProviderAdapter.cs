using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class GeminiLlmProviderAdapter : ProviderAdapterBase, ILlmProviderAdapter, ITransientDependency
{
    public string AdapterCode => "llm_gemini_native";
    public string AdapterName => "Gemini Native Adapter";
    public int Order => 50;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "gemini");
    }
}
