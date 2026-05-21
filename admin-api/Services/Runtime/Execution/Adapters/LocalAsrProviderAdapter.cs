using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class LocalAsrProviderAdapter : ProviderAdapterBase, IAsrProviderAdapter, ITransientDependency
{
    public string AdapterCode => "asr_local_runtime";
    public string AdapterName => "Local ASR Runtime Adapter";
    public int Order => 10;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "fun_local", "sherpa_onnx_local");
    }
}
