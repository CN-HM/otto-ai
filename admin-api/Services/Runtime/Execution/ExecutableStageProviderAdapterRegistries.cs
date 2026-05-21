using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution;

public class ExecutableAsrProviderAdapterRegistry : StageProviderAdapterRegistryBase<IExecutableAsrProviderAdapter>, ITransientDependency
{
    public ExecutableAsrProviderAdapterRegistry(IEnumerable<IExecutableAsrProviderAdapter> adapters)
        : base(adapters)
    {
    }
}

public class ExecutableLlmProviderAdapterRegistry : StageProviderAdapterRegistryBase<IExecutableLlmProviderAdapter>, ITransientDependency
{
    public ExecutableLlmProviderAdapterRegistry(IEnumerable<IExecutableLlmProviderAdapter> adapters)
        : base(adapters)
    {
    }
}

public class ExecutableTtsProviderAdapterRegistry : StageProviderAdapterRegistryBase<IExecutableTtsProviderAdapter>, ITransientDependency
{
    public ExecutableTtsProviderAdapterRegistry(IEnumerable<IExecutableTtsProviderAdapter> adapters)
        : base(adapters)
    {
    }
}
