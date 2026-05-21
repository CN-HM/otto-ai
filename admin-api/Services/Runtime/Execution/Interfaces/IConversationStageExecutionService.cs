using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution;

public interface IConversationStageExecutionService
{
    Task<AsrRecognitionResponseDto> RecognizeAsync(ConversationOrchestrationRequestDto orchestrationRequest, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default);
    Task<IAsrRecognitionSession> CreateRecognitionSessionAsync(
        ConversationOrchestrationRequestDto orchestrationRequest,
        AsrRecognitionRequestDto request,
        Func<AsrRecognitionStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default);
    Task<LlmChatResponseDto> ChatAsync(ConversationOrchestrationRequestDto orchestrationRequest, LlmChatRequestDto request, CancellationToken cancellationToken = default);
    Task<LlmChatResponseDto> ChatStreamingAsync(ConversationOrchestrationRequestDto orchestrationRequest, LlmChatRequestDto request, Func<LlmChatStreamChunkDto, CancellationToken, Task> onChunk, CancellationToken cancellationToken = default);
    Task<TtsSynthesisResponseDto> SynthesizeAsync(ConversationOrchestrationRequestDto orchestrationRequest, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default);
    Task<ITtsStreamingSession> CreateStreamingTtsSessionAsync(
        ConversationOrchestrationRequestDto orchestrationRequest,
        TtsSynthesisRequestDto request,
        Func<TtsSynthesisStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default);
}
