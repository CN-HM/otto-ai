using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Orchestration;

public interface IConversationOrchestrationService
{
    Task<ConversationOrchestrationPlanDto> BuildPlanAsync(ConversationOrchestrationRequestDto request, CancellationToken cancellationToken = default);
}
