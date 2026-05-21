using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution;

public interface IStageProviderAdapter
{
    string AdapterCode { get; }
    string AdapterName { get; }
    int Order { get; }
    ProviderAdapterMatch Match(ModelInvocationProfileDto profile);
}

public interface IAsrProviderAdapter : IStageProviderAdapter
{
}

public interface ILlmProviderAdapter : IStageProviderAdapter
{
}

public interface ITtsProviderAdapter : IStageProviderAdapter
{
}
