using Hangfire;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.Extensions.Logging;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Memory;

public sealed class MemoryExtractionBackgroundJobArgs
{
    public string? AgentRoleId { get; set; }
    public string? MemoryLibraryId { get; set; }
    public string? MemoryEntityScope { get; set; }
    public string DeviceId { get; set; } = string.Empty;
    public long? DeviceUserId { get; set; }
    public string? DeviceMacAddress { get; set; }
    public string? SessionId { get; set; }
    public string UserText { get; set; } = string.Empty;
    public string AssistantText { get; set; } = string.Empty;
    public string? OrchestrationAgentRoleId { get; set; }
    public string? OrchestrationAgentRoleCode { get; set; }
    public string? OrchestrationAgentRoleReleaseId { get; set; }
    public string? OrchestrationSessionId { get; set; }
    public string? OrchestrationDeviceId { get; set; }
    public string? VadProfileId { get; set; }
    public string? AsrProfileId { get; set; }
    public string? LlmProfileId { get; set; }
    public string? TtsProfileId { get; set; }
    public string? RequestedInvocationMode { get; set; }
    public bool? PreferStreaming { get; set; }

    public AgentRoleRuntimeDescriptorDto ToAgentRole()
    {
        return new AgentRoleRuntimeDescriptorDto
        {
            Id = AgentRoleId,
            MemoryLibraryId = MemoryLibraryId,
            MemoryEntityScope = MemoryEntityScope
        };
    }

    public AiDevice ToDevice()
    {
        return new AiDevice
        {
            Id = DeviceId,
            UserId = DeviceUserId,
            MacAddress = DeviceMacAddress
        };
    }

    public ConversationOrchestrationRequestDto ToOrchestrationRequest()
    {
        return new ConversationOrchestrationRequestDto
        {
            AgentRoleId = OrchestrationAgentRoleId,
            AgentRoleCode = OrchestrationAgentRoleCode,
            AgentRoleReleaseId = OrchestrationAgentRoleReleaseId,
            SessionId = OrchestrationSessionId,
            DeviceId = OrchestrationDeviceId,
            VadProfileId = VadProfileId,
            AsrProfileId = AsrProfileId,
            LlmProfileId = LlmProfileId,
            TtsProfileId = TtsProfileId,
            RequestedInvocationMode = RequestedInvocationMode,
            PreferStreaming = PreferStreaming
        };
    }
}

[Queue("memory-extraction")]
public sealed class MemoryExtractionBackgroundJob : AsyncBackgroundJob<MemoryExtractionBackgroundJobArgs>, ITransientDependency
{
    private readonly MemoryExtractionService _memoryExtractionService;
    private readonly ILogger<MemoryExtractionBackgroundJob> _logger;

    public MemoryExtractionBackgroundJob(
        MemoryExtractionService memoryExtractionService,
        ILogger<MemoryExtractionBackgroundJob> logger)
    {
        _memoryExtractionService = memoryExtractionService;
        _logger = logger;
    }

    public override async Task ExecuteAsync(MemoryExtractionBackgroundJobArgs args)
    {
        try
        {
            await _memoryExtractionService.ExtractFromConversationTurnAsync(
                args.ToAgentRole(),
                args.ToDevice(),
                args.ToOrchestrationRequest(),
                args.SessionId,
                args.UserText,
                args.AssistantText);
        }
        catch (Exception ex)
        {
            _logger.LogWarning(ex, "Memory extraction background job failed for device {DeviceId}, session {SessionId}", args.DeviceId, args.SessionId);
            throw;
        }
    }
}
