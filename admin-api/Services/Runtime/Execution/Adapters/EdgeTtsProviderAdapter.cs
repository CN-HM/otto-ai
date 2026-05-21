using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class EdgeTtsProviderAdapter : ProviderAdapterBase, ITtsProviderAdapter, ITransientDependency
{
    public string AdapterCode => "tts_edge_runtime";
    public string AdapterName => "Edge TTS Runtime Adapter";
    public int Order => 40;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "edge");
    }
}
