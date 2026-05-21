namespace AiAdmin.Services.Runtime.Execution;

public class ProviderAdapterResolution<TAdapter>
    where TAdapter : IStageProviderAdapter
{
    public TAdapter? Adapter { get; init; }
    public ProviderAdapterMatch Match { get; init; } = ProviderAdapterMatch.None();
}
