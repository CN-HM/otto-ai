using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

public class WorkflowLlmProviderAdapter : ProviderAdapterBase, ILlmProviderAdapter, ITransientDependency
{
    public string AdapterCode => "llm_workflow_api";
    public string AdapterName => "Workflow LLM Adapter";
    public int Order => 20;

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return MatchByProviderCode(profile.ProviderCode, "dify", "coze", "fastgpt");
    }
}
