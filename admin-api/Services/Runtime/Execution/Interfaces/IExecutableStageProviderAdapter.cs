using AiAdmin.Services.Runtime.Execution.Dtos;

namespace AiAdmin.Services.Runtime.Execution;

public interface IExecutableAsrProviderAdapter : IAsrProviderAdapter
{
    Task<AsrRecognitionResponseDto> RecognizeAsync(StageExecutionContext context, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default);
}

public interface IAsrRecognitionSession : IAsyncDisposable
{
    Task SendAudioAsync(byte[] audioBytes, CancellationToken cancellationToken = default);
    Task<AsrRecognitionResponseDto> CompleteAsync(CancellationToken cancellationToken = default);
    Task CancelAsync(CancellationToken cancellationToken = default);
}

public interface IStreamingExecutableAsrProviderAdapter : IExecutableAsrProviderAdapter
{
    Task<IAsrRecognitionSession> CreateRecognitionSessionAsync(
        StageExecutionContext context,
        AsrRecognitionRequestDto request,
        Func<AsrRecognitionStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default);
}

public interface IExecutableLlmProviderAdapter : ILlmProviderAdapter
{
    Task<LlmChatResponseDto> ChatAsync(StageExecutionContext context, LlmChatRequestDto request, CancellationToken cancellationToken = default);
}

public interface IStreamingExecutableLlmProviderAdapter : IExecutableLlmProviderAdapter
{
    Task<LlmChatResponseDto> ChatStreamingAsync(
        StageExecutionContext context,
        LlmChatRequestDto request,
        Func<LlmChatStreamChunkDto, CancellationToken, Task> onChunk,
        CancellationToken cancellationToken = default);
}

public interface IExecutableTtsProviderAdapter : ITtsProviderAdapter
{
    Task<TtsSynthesisResponseDto> SynthesizeAsync(StageExecutionContext context, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default);
}

public interface ITtsSynthesisSession : IAsyncDisposable
{
    Task<TtsSynthesisResponseDto> SynthesizeAsync(TtsSynthesisRequestDto request, CancellationToken cancellationToken = default);
}

public interface ITtsStreamingSession : IAsyncDisposable
{
    Task SendTextAsync(string text, CancellationToken cancellationToken = default);
    Task<TtsSynthesisResponseDto> CompleteAsync(CancellationToken cancellationToken = default);
    Task CancelAsync(CancellationToken cancellationToken = default);
}

public interface IBidirectionalStreamingExecutableTtsProviderAdapter : IExecutableTtsProviderAdapter
{
    Task<ITtsStreamingSession> CreateStreamingSessionAsync(
        StageExecutionContext context,
        TtsSynthesisRequestDto request,
        Func<TtsSynthesisStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default);
}

public interface IReusableExecutableTtsProviderAdapter : IExecutableTtsProviderAdapter
{
    Task<ITtsSynthesisSession> CreateSessionAsync(StageExecutionContext context, CancellationToken cancellationToken = default);
}
