using AiAdmin.Services.Runtime.Execution.Dtos;

namespace AiAdmin.Services.Runtime.Execution;

public interface IModelExecutionConfigResolver
{
    Task<ModelExecutionConfigDto> ResolveAsync(string profileId, CancellationToken cancellationToken = default);
}
