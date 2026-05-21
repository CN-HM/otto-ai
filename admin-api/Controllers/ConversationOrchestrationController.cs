using AiAdmin.Infrastructure;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace AiAdmin.Controllers;

[ApiController]
[Route("admin/runtime/orchestration")]
[Authorize]
public class ConversationOrchestrationController : AiAdminBaseController
{
    private readonly IConversationExecutionBindingService _conversationExecutionBindingService;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly IConversationOrchestrationService _conversationOrchestrationService;

    public ConversationOrchestrationController(
        IConversationOrchestrationService conversationOrchestrationService,
        IConversationExecutionBindingService conversationExecutionBindingService,
        IConversationStageExecutionService conversationStageExecutionService)
    {
        _conversationOrchestrationService = conversationOrchestrationService;
        _conversationExecutionBindingService = conversationExecutionBindingService;
        _conversationStageExecutionService = conversationStageExecutionService;
    }

    [HttpPost("plan")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<ConversationOrchestrationPlanDto>> BuildPlan([FromBody] ConversationOrchestrationRequestDto request, CancellationToken cancellationToken)
    {
        var result = await _conversationOrchestrationService.BuildPlanAsync(request, cancellationToken);
        return Result<ConversationOrchestrationPlanDto>.Ok(result);
    }

    [HttpPost("binding")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<ConversationExecutionBindingDto>> BuildBinding([FromBody] ConversationOrchestrationRequestDto request, CancellationToken cancellationToken)
    {
        var result = await _conversationExecutionBindingService.ResolveAsync(request, cancellationToken);
        return Result<ConversationExecutionBindingDto>.Ok(result);
    }

    [HttpPost("llm/chat")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<LlmChatResponseDto>> Chat([FromBody] ConversationLlmExecutionRequestDto request, CancellationToken cancellationToken)
    {
        var result = await _conversationStageExecutionService.ChatAsync(request.Orchestration, request.Request, cancellationToken);
        return Result<LlmChatResponseDto>.Ok(result);
    }

    [HttpPost("tts/synthesize")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<TtsSynthesisResponseDto>> Synthesize([FromBody] ConversationTtsExecutionRequestDto request, CancellationToken cancellationToken)
    {
        var result = await _conversationStageExecutionService.SynthesizeAsync(request.Orchestration, request.Request, cancellationToken);
        return Result<TtsSynthesisResponseDto>.Ok(result);
    }

    [HttpPost("asr/recognize")]
    [RequirePermission("agent-role:list")]
    public async Task<Result<AsrRecognitionResponseDto>> Recognize([FromBody] ConversationAsrExecutionRequestDto request, CancellationToken cancellationToken)
    {
        var result = await _conversationStageExecutionService.RecognizeAsync(request.Orchestration, request.Request, cancellationToken);
        return Result<AsrRecognitionResponseDto>.Ok(result);
    }
}
