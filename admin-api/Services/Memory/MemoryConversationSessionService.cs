using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.Extensions.Caching.Distributed;
using Volo.Abp.BackgroundJobs;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Memory;

public sealed class MemoryConversationTurnBufferItem
{
    public string UserText { get; set; } = string.Empty;
    public string AssistantText { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
}

public sealed class MemoryConversationSessionBuffer
{
    public string SessionId { get; set; } = string.Empty;
    public string? EndReason { get; set; }
    public MemoryExtractionBackgroundJobArgs? JobArgs { get; set; }
    public List<MemoryConversationTurnBufferItem> Turns { get; set; } = [];
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}

public class MemoryConversationSessionService : ITransientDependency
{
    private static readonly JsonSerializerOptions JsonOptions = new(JsonSerializerDefaults.Web);
    private static readonly DistributedCacheEntryOptions CacheOptions = new()
    {
        AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(60)
    };

    private readonly IDistributedCache _cache;
    private readonly IBackgroundJobManager _backgroundJobManager;

    public MemoryConversationSessionService(
        IDistributedCache cache,
        IBackgroundJobManager backgroundJobManager)
    {
        _cache = cache;
        _backgroundJobManager = backgroundJobManager;
    }

    public async Task AppendTurnAsync(
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string? sessionId,
        string userText,
        string assistantText,
        CancellationToken cancellationToken = default)
    {
        var normalizedSessionId = NormalizeSessionId(sessionId);
        if (normalizedSessionId == null)
            return;

        var buffer = await ReadBufferAsync(normalizedSessionId, cancellationToken) ?? new MemoryConversationSessionBuffer
        {
            SessionId = normalizedSessionId,
            CreatedAt = DateTime.UtcNow
        };

        buffer.JobArgs = BuildJobArgs(agentRole, device, orchestrationRequest, normalizedSessionId, string.Empty, string.Empty);
        buffer.Turns.Add(new MemoryConversationTurnBufferItem
        {
            UserText = userText,
            AssistantText = assistantText,
            CreatedAt = DateTime.UtcNow
        });
        buffer.UpdatedAt = DateTime.UtcNow;

        await WriteBufferAsync(buffer, cancellationToken);
    }

    public async Task FinalizeSessionAsync(string? sessionId, string? endReason = null, CancellationToken cancellationToken = default)
    {
        var normalizedSessionId = NormalizeSessionId(sessionId);
        if (normalizedSessionId == null)
            return;

        var finalizeKey = FinalizeKey(normalizedSessionId);
        var finalizeToken = Convert.ToHexString(RandomNumberGenerator.GetBytes(8));
        var existingToken = await _cache.GetStringAsync(finalizeKey, cancellationToken);
        if (!string.IsNullOrWhiteSpace(existingToken))
            return;

        await _cache.SetStringAsync(finalizeKey, finalizeToken, new DistributedCacheEntryOptions
        {
            AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(30)
        }, cancellationToken);

        var buffer = await ReadBufferAsync(normalizedSessionId, cancellationToken);
        if (buffer == null || buffer.Turns.Count == 0 || buffer.JobArgs == null)
            return;

        var conversationText = BuildConversationText(buffer.Turns);
        if (string.IsNullOrWhiteSpace(conversationText))
            return;

        buffer.EndReason = endReason;
        buffer.JobArgs.UserText = conversationText;
        buffer.JobArgs.AssistantText = string.Empty;
        buffer.JobArgs.SessionId = normalizedSessionId;
        buffer.JobArgs.OrchestrationSessionId = normalizedSessionId;

        await _backgroundJobManager.EnqueueAsync(buffer.JobArgs);
        await _cache.RemoveAsync(BufferKey(normalizedSessionId), cancellationToken);
    }

    private static MemoryExtractionBackgroundJobArgs BuildJobArgs(
        AgentRoleRuntimeDescriptorDto agentRole,
        AiDevice device,
        ConversationOrchestrationRequestDto orchestrationRequest,
        string? sessionId,
        string userText,
        string assistantText)
    {
        return new MemoryExtractionBackgroundJobArgs
        {
            AgentRoleId = agentRole.Id,
            MemoryLibraryId = agentRole.MemoryLibraryId,
            MemoryEntityScope = agentRole.MemoryEntityScope,
            DeviceId = device.Id,
            DeviceUserId = device.UserId,
            DeviceMacAddress = device.MacAddress,
            SessionId = sessionId,
            UserText = userText,
            AssistantText = assistantText,
            OrchestrationAgentRoleId = orchestrationRequest.AgentRoleId,
            OrchestrationAgentRoleCode = orchestrationRequest.AgentRoleCode,
            OrchestrationAgentRoleReleaseId = orchestrationRequest.AgentRoleReleaseId,
            OrchestrationSessionId = orchestrationRequest.SessionId,
            OrchestrationDeviceId = orchestrationRequest.DeviceId,
            VadProfileId = orchestrationRequest.VadProfileId,
            AsrProfileId = orchestrationRequest.AsrProfileId,
            LlmProfileId = orchestrationRequest.LlmProfileId,
            TtsProfileId = orchestrationRequest.TtsProfileId,
            RequestedInvocationMode = orchestrationRequest.RequestedInvocationMode,
            PreferStreaming = orchestrationRequest.PreferStreaming
        };
    }

    private async Task<MemoryConversationSessionBuffer?> ReadBufferAsync(string sessionId, CancellationToken cancellationToken)
    {
        var json = await _cache.GetStringAsync(BufferKey(sessionId), cancellationToken);
        return string.IsNullOrWhiteSpace(json)
            ? null
            : JsonSerializer.Deserialize<MemoryConversationSessionBuffer>(json, JsonOptions);
    }

    private Task WriteBufferAsync(MemoryConversationSessionBuffer buffer, CancellationToken cancellationToken)
    {
        return _cache.SetStringAsync(BufferKey(buffer.SessionId), JsonSerializer.Serialize(buffer, JsonOptions), CacheOptions, cancellationToken);
    }

    private static string BuildConversationText(IEnumerable<MemoryConversationTurnBufferItem> turns)
    {
        var builder = new StringBuilder();
        foreach (var turn in turns)
        {
            var userText = NormalizeOptionalText(turn.UserText);
            var assistantText = NormalizeOptionalText(turn.AssistantText);
            if (userText != null)
                builder.AppendLine($"用户：{userText}");
            if (assistantText != null)
                builder.AppendLine($"助手：{assistantText}");
        }

        return builder.ToString().Trim();
    }

    private static string? NormalizeSessionId(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private static string BufferKey(string sessionId) => $"memory:conversation-session:{sessionId}";

    private static string FinalizeKey(string sessionId) => $"memory:conversation-session:{sessionId}:finalized";
}
