using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Orchestration;

public interface IModelProviderCapabilityResolver
{
    Task<ModelProviderCapabilityDto?> ResolveAsync(string? profileId, CancellationToken cancellationToken = default);
}
