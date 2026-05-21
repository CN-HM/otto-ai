using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution;

public class ConversationStageExecutionService : IConversationStageExecutionService, ITransientDependency
{
    private readonly IConversationOrchestrationService _conversationOrchestrationService;
    private readonly IModelExecutionConfigResolver _modelExecutionConfigResolver;
    private readonly ExecutableAsrProviderAdapterRegistry _executableAsrProviderAdapterRegistry;
    private readonly ExecutableLlmProviderAdapterRegistry _executableLlmProviderAdapterRegistry;
    private readonly ExecutableTtsProviderAdapterRegistry _executableTtsProviderAdapterRegistry;
    private readonly ConversationRuntimeTraceAggregator _traceAggregator;
    private readonly ILogger<ConversationStageExecutionService> _logger;

    public ConversationStageExecutionService(
        IConversationOrchestrationService conversationOrchestrationService,
        IModelExecutionConfigResolver modelExecutionConfigResolver,
        ExecutableAsrProviderAdapterRegistry executableAsrProviderAdapterRegistry,
        ExecutableLlmProviderAdapterRegistry executableLlmProviderAdapterRegistry,
        ExecutableTtsProviderAdapterRegistry executableTtsProviderAdapterRegistry,
        ConversationRuntimeTraceAggregator traceAggregator,
        ILogger<ConversationStageExecutionService> logger)
    {
        _conversationOrchestrationService = conversationOrchestrationService;
        _modelExecutionConfigResolver = modelExecutionConfigResolver;
        _executableAsrProviderAdapterRegistry = executableAsrProviderAdapterRegistry;
        _executableLlmProviderAdapterRegistry = executableLlmProviderAdapterRegistry;
        _executableTtsProviderAdapterRegistry = executableTtsProviderAdapterRegistry;
        _traceAggregator = traceAggregator;
        _logger = logger;
    }

    public async Task<AsrRecognitionResponseDto> RecognizeAsync(ConversationOrchestrationRequestDto orchestrationRequest, AsrRecognitionRequestDto request, CancellationToken cancellationToken = default)
    {
        return await ExecuteStageAsync<IExecutableAsrProviderAdapter, AsrRecognitionRequestDto, AsrRecognitionResponseDto>(
            orchestrationRequest,
            request,
            ConversationRuntimeObservationCodes.Stages.Asr,
            plan => plan.Asr,
            "当前编排计划未配置 ASR 模型",
            "当前编排计划缺少 ASR 模型配置",
            _executableAsrProviderAdapterRegistry,
            static (adapter, context, input, ct) => adapter.RecognizeAsync(context, input, ct),
            static (response, trace) => response.StageTrace = trace,
            static response => response.InvocationMode,
            cancellationToken);
    }

    public async Task<IAsrRecognitionSession> CreateRecognitionSessionAsync(
        ConversationOrchestrationRequestDto orchestrationRequest,
        AsrRecognitionRequestDto request,
        Func<AsrRecognitionStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default)
    {
        var (profile, context, scope, adapter) = await PrepareStreamingStageAsync<IExecutableAsrProviderAdapter>(
            orchestrationRequest,
            ConversationRuntimeObservationCodes.Stages.Asr,
            plan => plan.Asr,
            "当前编排计划未配置 ASR 模型",
            "当前编排计划缺少 ASR 模型配置",
            _executableAsrProviderAdapterRegistry,
            cancellationToken);

        if (adapter is not IStreamingExecutableAsrProviderAdapter streamingAdapter)
        {
            var ex = new InvalidOperationException($"当前 ASR 适配器不支持流式会话：{FormatProvider(profile)}");
            scope.CompleteFailure(ex, ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, null, profile);
            throw ex;
        }

        try
        {
            var innerSession = await streamingAdapter.CreateRecognitionSessionAsync(context, request, onEvent, cancellationToken);
            return new TraceableAsrRecognitionSession(innerSession, scope);
        }
        catch (Exception ex)
        {
            scope.CompleteFailure(ex, ResolveFailureReason(ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, ex, cancellationToken), null, profile);
            throw;
        }
    }

    public async Task<LlmChatResponseDto> ChatAsync(ConversationOrchestrationRequestDto orchestrationRequest, LlmChatRequestDto request, CancellationToken cancellationToken = default)
    {
        return await ExecuteStageAsync<IExecutableLlmProviderAdapter, LlmChatRequestDto, LlmChatResponseDto>(
            orchestrationRequest,
            request,
            ConversationRuntimeObservationCodes.Stages.Llm,
            plan => plan.Llm,
            "当前编排计划未配置 LLM 模型",
            "当前编排计划缺少 LLM 模型配置",
            _executableLlmProviderAdapterRegistry,
            static (adapter, context, input, ct) => adapter.ChatAsync(context, input, ct),
            static (response, trace) => response.StageTrace = trace,
            static response => response.InvocationMode,
            cancellationToken);
    }

    public async Task<LlmChatResponseDto> ChatStreamingAsync(ConversationOrchestrationRequestDto orchestrationRequest, LlmChatRequestDto request, Func<LlmChatStreamChunkDto, CancellationToken, Task> onChunk, CancellationToken cancellationToken = default)
    {
        ConversationOrchestrationPlanDto? plan = null;
        ModelInvocationProfileDto? profile = null;
        var scope = new ConversationStageExecutionScope(orchestrationRequest, ConversationRuntimeObservationCodes.Stages.Llm, _traceAggregator, _logger);
        var failureReason = ConversationRuntimeObservationCodes.FailureReasons.OrchestrationFailed;

        try
        {
            plan = await _conversationOrchestrationService.BuildPlanAsync(orchestrationRequest, cancellationToken);
            failureReason = ConversationRuntimeObservationCodes.FailureReasons.StageProfileMissing;
            profile = plan.Llm ?? throw new InvalidOperationException("当前编排计划未配置 LLM 模型");
            scope.EnsureTrace(plan, profile);

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.ModelConfigMissing;
            if (string.IsNullOrWhiteSpace(profile.ProfileId))
                throw new InvalidOperationException("当前编排计划缺少 LLM Profile 配置");

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.AdapterNotFound;
            var resolution = _executableLlmProviderAdapterRegistry.Resolve(profile);
            if (resolution is not { Match.IsMatch: true, Adapter: not null })
                throw new InvalidOperationException($"未找到可执行的 {ConversationRuntimeObservationCodes.Stages.Llm} 适配器：{FormatProvider(profile)}");

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.ModelConfigResolveFailed;
            var modelConfig = await _modelExecutionConfigResolver.ResolveAsync(profile.ProfileId, cancellationToken);
            var context = new StageExecutionContext
            {
                InvocationProfile = profile,
                ModelConfig = modelConfig
            };

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed;
            LlmChatResponseDto response;
            if (resolution.Adapter is IStreamingExecutableLlmProviderAdapter streamingAdapter)
            {
                response = await streamingAdapter.ChatStreamingAsync(context, request, onChunk, cancellationToken);
            }
            else
            {
                response = await resolution.Adapter.ChatAsync(context, request, cancellationToken);
                await onChunk(new LlmChatStreamChunkDto
                {
                    TextDelta = response.Text,
                    ProviderResponseId = response.ProviderResponseId,
                    Model = response.Model,
                    FinishReason = response.FinishReason,
                    IsFinal = true
                }, cancellationToken);
            }

            scope.CompleteSuccess(response.InvocationMode);
            response.StageTrace = scope.Trace;
            return response;
        }
        catch (Exception ex)
        {
            scope.CompleteFailure(ex, ResolveFailureReason(failureReason, ex, cancellationToken), plan, profile);
            throw;
        }
    }

    private async Task<(ModelInvocationProfileDto Profile, StageExecutionContext Context, ConversationStageExecutionScope Scope, TAdapter Adapter)> PrepareStreamingStageAsync<TAdapter>(
        ConversationOrchestrationRequestDto orchestrationRequest,
        string stage,
        Func<ConversationOrchestrationPlanDto, ModelInvocationProfileDto?> profileSelector,
        string missingProfileMessage,
        string missingModelConfigMessage,
        StageProviderAdapterRegistryBase<TAdapter> registry,
        CancellationToken cancellationToken)
        where TAdapter : IStageProviderAdapter
    {
        ConversationOrchestrationPlanDto? plan = null;
        ModelInvocationProfileDto? profile = null;
        var scope = new ConversationStageExecutionScope(orchestrationRequest, stage, _traceAggregator, _logger);
        try
        {
            plan = await _conversationOrchestrationService.BuildPlanAsync(orchestrationRequest, cancellationToken);
            profile = profileSelector(plan) ?? throw new InvalidOperationException(missingProfileMessage);
            scope.EnsureTrace(plan, profile);
            if (string.IsNullOrWhiteSpace(profile.ProfileId))
                throw new InvalidOperationException(missingModelConfigMessage);

            var resolution = registry.Resolve(profile);
            if (resolution is not { Match.IsMatch: true, Adapter: not null })
                throw new InvalidOperationException($"未找到可执行的 {stage} 适配器：{FormatProvider(profile)}");

            var modelConfig = await _modelExecutionConfigResolver.ResolveAsync(profile.ProfileId, cancellationToken);
            return (profile,
                new StageExecutionContext
                {
                    InvocationProfile = profile,
                    ModelConfig = modelConfig
                },
                scope,
                resolution.Adapter);
        }
        catch (Exception ex)
        {
            scope.CompleteFailure(ex, ResolveFailureReason(ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, ex, cancellationToken), plan, profile);
            throw;
        }
    }

    public async Task<TtsSynthesisResponseDto> SynthesizeAsync(ConversationOrchestrationRequestDto orchestrationRequest, TtsSynthesisRequestDto request, CancellationToken cancellationToken = default)
    {
        return await ExecuteStageAsync<IExecutableTtsProviderAdapter, TtsSynthesisRequestDto, TtsSynthesisResponseDto>(
            orchestrationRequest,
            request,
            ConversationRuntimeObservationCodes.Stages.Tts,
            plan => plan.Tts,
            "当前编排计划未配置 TTS 模型",
            "当前编排计划缺少 TTS 模型配置",
            _executableTtsProviderAdapterRegistry,
            static (adapter, context, input, ct) => adapter.SynthesizeAsync(context, input, ct),
            static (response, trace) => response.StageTrace = trace,
            static response => response.InvocationMode,
            cancellationToken);
    }

    public async Task<ITtsStreamingSession> CreateStreamingTtsSessionAsync(
        ConversationOrchestrationRequestDto orchestrationRequest,
        TtsSynthesisRequestDto request,
        Func<TtsSynthesisStreamEventDto, CancellationToken, Task> onEvent,
        CancellationToken cancellationToken = default)
    {
        var (profile, context, scope, adapter) = await PrepareStreamingStageAsync<IExecutableTtsProviderAdapter>(
            orchestrationRequest,
            ConversationRuntimeObservationCodes.Stages.Tts,
            plan => plan.Tts,
            "当前编排计划未配置 TTS 模型",
            "当前编排计划缺少 TTS 模型配置",
            _executableTtsProviderAdapterRegistry,
            cancellationToken);

        if (adapter is not IBidirectionalStreamingExecutableTtsProviderAdapter streamingAdapter)
        {
            var ex = new InvalidOperationException($"当前 TTS 适配器不支持双向流式会话：{FormatProvider(profile)}");
            scope.CompleteFailure(ex, ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, null, profile);
            throw ex;
        }

        try
        {
            var innerSession = await streamingAdapter.CreateStreamingSessionAsync(context, request, onEvent, cancellationToken);
            return new TraceableTtsStreamingSession(innerSession, scope);
        }
        catch (Exception ex)
        {
            scope.CompleteFailure(ex, ResolveFailureReason(ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, ex, cancellationToken), null, profile);
            throw;
        }
    }

    private async Task<TResponse> ExecuteStageAsync<TAdapter, TRequest, TResponse>(
        ConversationOrchestrationRequestDto orchestrationRequest,
        TRequest request,
        string stage,
        Func<ConversationOrchestrationPlanDto, ModelInvocationProfileDto?> profileSelector,
        string missingProfileMessage,
        string missingModelConfigMessage,
        StageProviderAdapterRegistryBase<TAdapter> registry,
        Func<TAdapter, StageExecutionContext, TRequest, CancellationToken, Task<TResponse>> executor,
        Action<TResponse, StageExecutionTraceDto> attachTrace,
        Func<TResponse, string?> resolveInvocationMode,
        CancellationToken cancellationToken)
        where TAdapter : IStageProviderAdapter
    {
        ConversationOrchestrationPlanDto? plan = null;
        ModelInvocationProfileDto? profile = null;
        var scope = new ConversationStageExecutionScope(orchestrationRequest, stage, _traceAggregator, _logger);
        var failureReason = ConversationRuntimeObservationCodes.FailureReasons.OrchestrationFailed;

        try
        {
            plan = await _conversationOrchestrationService.BuildPlanAsync(orchestrationRequest, cancellationToken);
            failureReason = ConversationRuntimeObservationCodes.FailureReasons.StageProfileMissing;
            profile = profileSelector(plan) ?? throw new InvalidOperationException(missingProfileMessage);
            scope.EnsureTrace(plan, profile);

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.ModelConfigMissing;
            if (string.IsNullOrWhiteSpace(profile.ProfileId))
                throw new InvalidOperationException(missingModelConfigMessage);

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.AdapterNotFound;
            var resolution = registry.Resolve(profile);
            if (resolution is not { Match.IsMatch: true, Adapter: not null })
                throw new InvalidOperationException($"未找到可执行的 {stage} 适配器：{FormatProvider(profile)}");

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.ModelConfigResolveFailed;
            var modelConfig = await _modelExecutionConfigResolver.ResolveAsync(profile.ProfileId, cancellationToken);

            failureReason = ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed;
            var response = await executor(resolution.Adapter,
                new StageExecutionContext
                {
                    InvocationProfile = profile,
                    ModelConfig = modelConfig
                },
                request,
                cancellationToken);

            scope.CompleteSuccess(resolveInvocationMode(response));
            attachTrace(response, scope.Trace!);
            return response;
        }
        catch (Exception ex)
        {
            scope.CompleteFailure(ex, ResolveFailureReason(failureReason, ex, cancellationToken), plan, profile);
            throw;
        }
    }

    private static string ResolveFailureReason(string failureReason, Exception ex, CancellationToken cancellationToken)
    {
        if (ex is TimeoutException)
            return ConversationRuntimeObservationCodes.FailureReasons.Timeout;
        if (ex is TaskCanceledException && !cancellationToken.IsCancellationRequested)
            return ConversationRuntimeObservationCodes.FailureReasons.Timeout;
        if (ex is OperationCanceledException)
            return ConversationRuntimeObservationCodes.FailureReasons.Cancelled;
        return failureReason;
    }

    private static string FormatProvider(ModelInvocationProfileDto profile)
    {
        if (!string.IsNullOrWhiteSpace(profile.ProviderName) && !string.IsNullOrWhiteSpace(profile.ProviderCode))
            return $"{profile.ProviderName} ({profile.ProviderCode})";
        if (!string.IsNullOrWhiteSpace(profile.ProviderName))
            return profile.ProviderName;
        if (!string.IsNullOrWhiteSpace(profile.ProviderCode))
            return profile.ProviderCode;
        return profile.ProviderFamily ?? "unknown";
    }

    private sealed class TraceableAsrRecognitionSession : IAsrRecognitionSession
    {
        private readonly IAsrRecognitionSession _inner;
        private readonly ConversationStageExecutionScope _scope;
        private int _completed;

        public TraceableAsrRecognitionSession(IAsrRecognitionSession inner, ConversationStageExecutionScope scope)
        {
            _inner = inner;
            _scope = scope;
        }

        public Task SendAudioAsync(byte[] audioBytes, CancellationToken cancellationToken = default)
        {
            return _inner.SendAudioAsync(audioBytes, cancellationToken);
        }

        public async Task<AsrRecognitionResponseDto> CompleteAsync(CancellationToken cancellationToken = default)
        {
            try
            {
                var response = await _inner.CompleteAsync(cancellationToken);
                if (Interlocked.Exchange(ref _completed, 1) == 0)
                    _scope.CompleteSuccess(response.InvocationMode);
                response.StageTrace = _scope.Trace;
                return response;
            }
            catch (Exception ex)
            {
                if (Interlocked.Exchange(ref _completed, 1) == 0)
                    _scope.CompleteFailure(ex, ResolveFailureReason(ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, ex, cancellationToken), null, null);
                throw;
            }
        }

        public async Task CancelAsync(CancellationToken cancellationToken = default)
        {
            try
            {
                await _inner.CancelAsync(cancellationToken);
            }
            finally
            {
                if (Interlocked.Exchange(ref _completed, 1) == 0)
                {
                    var ex = new OperationCanceledException("ASR 流式会话已取消", cancellationToken);
                    _scope.CompleteFailure(ex, ConversationRuntimeObservationCodes.FailureReasons.Cancelled, null, null);
                }
            }
        }

        public ValueTask DisposeAsync()
        {
            return _inner.DisposeAsync();
        }
    }

    private sealed class TraceableTtsStreamingSession : ITtsStreamingSession
    {
        private readonly ITtsStreamingSession _inner;
        private readonly ConversationStageExecutionScope _scope;
        private int _completed;

        public TraceableTtsStreamingSession(ITtsStreamingSession inner, ConversationStageExecutionScope scope)
        {
            _inner = inner;
            _scope = scope;
        }

        public Task SendTextAsync(string text, CancellationToken cancellationToken = default)
        {
            return _inner.SendTextAsync(text, cancellationToken);
        }

        public async Task<TtsSynthesisResponseDto> CompleteAsync(CancellationToken cancellationToken = default)
        {
            try
            {
                var response = await _inner.CompleteAsync(cancellationToken);
                if (Interlocked.Exchange(ref _completed, 1) == 0)
                    _scope.CompleteSuccess(response.InvocationMode);
                response.StageTrace = _scope.Trace;
                return response;
            }
            catch (Exception ex)
            {
                if (Interlocked.Exchange(ref _completed, 1) == 0)
                    _scope.CompleteFailure(ex, ResolveFailureReason(ConversationRuntimeObservationCodes.FailureReasons.ProviderExecutionFailed, ex, cancellationToken), null, null);
                throw;
            }
        }

        public async Task CancelAsync(CancellationToken cancellationToken = default)
        {
            try
            {
                await _inner.CancelAsync(cancellationToken);
            }
            finally
            {
                if (Interlocked.Exchange(ref _completed, 1) == 0)
                {
                    var ex = new OperationCanceledException("TTS 流式会话已取消", cancellationToken);
                    _scope.CompleteFailure(ex, ConversationRuntimeObservationCodes.FailureReasons.Cancelled, null, null);
                }
            }
        }

        public ValueTask DisposeAsync()
        {
            return _inner.DisposeAsync();
        }
    }
}
