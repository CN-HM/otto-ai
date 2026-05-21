using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class AliBailianAppLlmProviderAdapter : ProviderAdapterBase, ILlmProviderAdapter, ITransientDependency
{
    public string AdapterCode => "llm_ali_bailian_app";
    public string AdapterName => "Ali Bailian App Adapter";
    public int Order => 40;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "alibl", "ali", "aliyun");
    }
}
