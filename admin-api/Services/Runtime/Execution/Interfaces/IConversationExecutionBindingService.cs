using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution;

public interface IConversationExecutionBindingService
{
    Task<ConversationExecutionBindingDto> ResolveAsync(ConversationOrchestrationRequestDto request, CancellationToken cancellationToken = default);
}
