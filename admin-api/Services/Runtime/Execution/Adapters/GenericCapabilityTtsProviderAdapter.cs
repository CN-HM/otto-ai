using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class GenericCapabilityTtsProviderAdapter : ProviderAdapterBase, ITtsProviderAdapter, ITransientDependency
{
    public string AdapterCode => "tts_generic_capability";
    public string AdapterName => "Generic Capability TTS Adapter";
    public int Order => 900;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByCapabilityTag(profile.CapabilityTags, "audio_output_streaming", "speech_synthesis");
    }
}
