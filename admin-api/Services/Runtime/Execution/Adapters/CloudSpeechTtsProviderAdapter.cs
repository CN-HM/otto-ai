using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class CloudSpeechTtsProviderAdapter : ProviderAdapterBase, ITtsProviderAdapter, ITransientDependency
{
    public string AdapterCode => "tts_cloud_speech_api";
    public string AdapterName => "Cloud Speech TTS Adapter";
    public int Order => 20;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.DashScope),
            MatchByProviderFamily(profile.ProviderFamily, "alibaba_dashscope"),
            MatchByProviderCode(profile.ProviderCode,
                "doubao",
                "tencent",
                "aliyun",
                "minimax",
                "siliconflow",
                "cozecn",
                "302ai",
                "gizwits",
                "ttson"));
    }
}
