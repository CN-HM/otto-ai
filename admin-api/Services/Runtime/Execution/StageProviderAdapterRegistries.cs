using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution;

public abstract class StageProviderAdapterRegistryBase<TAdapter>
    where TAdapter : IStageProviderAdapter
{
    private readonly IReadOnlyList<TAdapter> _adapters;

    protected StageProviderAdapterRegistryBase(IEnumerable<TAdapter> adapters)
    {
        _adapters = adapters.OrderBy(x => x.Order).ToList();
    }

    public ProviderAdapterResolution<TAdapter> Resolve(ModelInvocationProfileDto profile)
    {
        foreach (var adapter in _adapters)
        {
            var match = adapter.Match(profile);
            if (match.IsMatch)
            {
                return new ProviderAdapterResolution<TAdapter>
                {
                    Adapter = adapter,
                    Match = match
                };
            }
        }

        return new ProviderAdapterResolution<TAdapter>
        {
            Match = ProviderAdapterMatch.None()
        };
    }
}

public class AsrProviderAdapterRegistry : StageProviderAdapterRegistryBase<IAsrProviderAdapter>, ITransientDependency
{
    public AsrProviderAdapterRegistry(IEnumerable<IAsrProviderAdapter> adapters)
        : base(adapters)
    {
    }
}

public class LlmProviderAdapterRegistry : StageProviderAdapterRegistryBase<ILlmProviderAdapter>, ITransientDependency
{
    public LlmProviderAdapterRegistry(IEnumerable<ILlmProviderAdapter> adapters)
        : base(adapters)
    {
    }
}

public class TtsProviderAdapterRegistry : StageProviderAdapterRegistryBase<ITtsProviderAdapter>, ITransientDependency
{
    public TtsProviderAdapterRegistry(IEnumerable<ITtsProviderAdapter> adapters)
        : base(adapters)
    {
    }
}
