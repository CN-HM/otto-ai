using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class CloudSpeechAsrProviderAdapter : ProviderAdapterBase, IAsrProviderAdapter, ITransientDependency
{
    public string AdapterCode => "asr_cloud_speech_api";
    public string AdapterName => "Cloud Speech ASR Adapter";
    public int Order => 30;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.DashScope),
            MatchByProviderFamily(profile.ProviderFamily, "alibaba_dashscope"),
            MatchByProviderCode(profile.ProviderCode, "doubao", "tencent", "aliyun", "dashscope"));
    }
}
