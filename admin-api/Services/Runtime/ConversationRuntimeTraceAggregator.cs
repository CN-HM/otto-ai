using AiAdmin.Services.Runtime.Execution.Dtos;

namespace AiAdmin.Services.Runtime;

public sealed record ConversationRuntimeTraceSnapshotDto(
    int TotalStageCount,
    int SuccessfulStageCount,
    int FailedStageCount,
    int FallbackStageCount,
    IReadOnlyList<ConversationStageAggregateDto> StageAggregates,
    IReadOnlyList<ConversationTurnTraceSummaryDto> RecentTurns);

public sealed record ConversationStageAggregateDto(
    string Stage,
    int TotalCount,
    int SuccessfulCount,
    int FailedCount,
    int FallbackCount,
    DateTimeOffset? LastSeenAtUtc);

public sealed record ConversationTurnTraceSummaryDto(
    DateTimeOffset RecordedAtUtc,
    string? SessionId,
    string? DeviceId,
    bool Succeeded,
    int StageCount,
    int FailedStageCount,
    int FallbackStageCount,
    string? Outcome,
    string? FailureReason,
    string? ErrorCode);

public class ConversationRuntimeTraceAggregator
{
    private const int MaxRecentTurns = 20;

    private readonly object _lock = new();
    private readonly Dictionary<string, MutableStageAggregate> _stageAggregates = new(StringComparer.OrdinalIgnoreCase);
    private readonly Queue<ConversationTurnTraceSummaryDto> _recentTurns = new();

    private int _totalStageCount;
    private int _successfulStageCount;
    private int _failedStageCount;
    private int _fallbackStageCount;

    public void RecordStageTrace(StageExecutionTraceDto trace)
    {
        if (string.IsNullOrWhiteSpace(trace.Stage))
            return;

        var hasFallback = !string.IsNullOrWhiteSpace(trace.FallbackReason);
        lock (_lock)
        {
            _totalStageCount += 1;
            if (trace.Succeeded)
                _successfulStageCount += 1;
            else
                _failedStageCount += 1;
            if (hasFallback)
                _fallbackStageCount += 1;

            if (!_stageAggregates.TryGetValue(trace.Stage, out var stageAggregate))
            {
                stageAggregate = new MutableStageAggregate();
                _stageAggregates[trace.Stage] = stageAggregate;
            }

            stageAggregate.TotalCount += 1;
            if (trace.Succeeded)
                stageAggregate.SuccessfulCount += 1;
            else
                stageAggregate.FailedCount += 1;
            if (hasFallback)
                stageAggregate.FallbackCount += 1;
            stageAggregate.LastSeenAtUtc = DateTimeOffset.UtcNow;
        }
    }

    public void RecordTurn(string? sessionId, string? deviceId, IReadOnlyList<StageExecutionTraceDto> traces, bool succeeded, string? outcome, string? failureReason = null, string? errorCode = null)
    {
        var failedTrace = traces.LastOrDefault(trace => !trace.Succeeded);
        var summary = new ConversationTurnTraceSummaryDto(
            DateTimeOffset.UtcNow,
            NormalizeValue(sessionId),
            NormalizeValue(deviceId),
            succeeded,
            traces.Count,
            traces.Count(trace => !trace.Succeeded),
            traces.Count(trace => !string.IsNullOrWhiteSpace(trace.FallbackReason)),
            NormalizeValue(outcome),
            NormalizeValue(failureReason) ?? NormalizeValue(failedTrace?.FailureReason),
            NormalizeValue(errorCode) ?? NormalizeValue(failedTrace?.ErrorCode));

        lock (_lock)
        {
            _recentTurns.Enqueue(summary);
            while (_recentTurns.Count > MaxRecentTurns)
                _recentTurns.Dequeue();
        }
    }

    public ConversationRuntimeTraceSnapshotDto GetSnapshot()
    {
        lock (_lock)
        {
            var stageAggregates = _stageAggregates
                .OrderBy(entry => entry.Key, StringComparer.OrdinalIgnoreCase)
                .Select(entry => new ConversationStageAggregateDto(
                    entry.Key,
                    entry.Value.TotalCount,
                    entry.Value.SuccessfulCount,
                    entry.Value.FailedCount,
                    entry.Value.FallbackCount,
                    entry.Value.LastSeenAtUtc))
                .ToList();

            var recentTurns = _recentTurns
                .OrderByDescending(item => item.RecordedAtUtc)
                .ToList();

            return new ConversationRuntimeTraceSnapshotDto(
                _totalStageCount,
                _successfulStageCount,
                _failedStageCount,
                _fallbackStageCount,
                stageAggregates,
                recentTurns);
        }
    }

    private static string? NormalizeValue(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }

    private sealed class MutableStageAggregate
    {
        public int TotalCount { get; set; }
        public int SuccessfulCount { get; set; }
        public int FailedCount { get; set; }
        public int FallbackCount { get; set; }
        public DateTimeOffset? LastSeenAtUtc { get; set; }
    }
}
