using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class GenericCapabilityAsrProviderAdapter : ProviderAdapterBase, IAsrProviderAdapter, ITransientDependency
{
    public string AdapterCode => "asr_generic_capability";
    public string AdapterName => "Generic Capability ASR Adapter";
    public int Order => 900;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByCapabilityTag(profile.CapabilityTags, "transcription_streaming", "audio_input_streaming");
    }
}
