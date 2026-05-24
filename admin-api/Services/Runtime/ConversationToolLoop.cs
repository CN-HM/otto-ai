using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Threading;
using System.Threading.Tasks;
using AiAdmin.Services.McpTools;
using AiAdmin.Services.McpTools.Dtos;
using AiAdmin.Services.Runtime.Execution;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Microsoft.Extensions.Logging;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public class ConversationToolLoop : ITransientDependency
{
    private readonly McpToolDispatcher _dispatcher;
    private readonly IConversationStageExecutionService _conversationStageExecutionService;
    private readonly ILogger<ConversationToolLoop> _logger;

    private const int MaxRounds = 5;
    private const int ToolCallTimeoutMs = 10000;

    public ConversationToolLoop(
        McpToolDispatcher dispatcher,
        IConversationStageExecutionService conversationStageExecutionService,
        ILogger<ConversationToolLoop> logger)
    {
        _dispatcher = dispatcher;
        _conversationStageExecutionService = conversationStageExecutionService;
        _logger = logger;
    }

    public async Task<ConversationToolLoopResult> RunAsync(
        ConversationOrchestrationRequestDto orchestrationRequest,
        string? systemPrompt,
        List<LlmChatMessageDto> messages,
        List<McpToolDefinition> toolDefinitions,
        ConversationContext context,
        CancellationToken cancellationToken = default)
    {
        var result = new ConversationToolLoopResult();
        var roundMessages = new List<LlmChatMessageDto>(messages);

        var enhancedSystemPrompt = systemPrompt;
        if (toolDefinitions.Count > 0)
        {
            enhancedSystemPrompt = (systemPrompt ?? string.Empty) + BuildToolGuidanceSection(toolDefinitions);
        }

        for (var round = 0; round < MaxRounds; round++)
        {
            cancellationToken.ThrowIfCancellationRequested();

            _logger.LogDebug("ConversationToolLoop round {Round}/{MaxRounds} with {MessageCount} messages",
                round + 1, MaxRounds, roundMessages.Count);

            var request = new LlmChatRequestDto
            {
                SystemPrompt = enhancedSystemPrompt,
                Stream = false,
                Messages = [.. roundMessages]
            };

            if (toolDefinitions.Count > 0)
            {
                request.ExtraOptions["tools"] = BuildOpenAiTools(toolDefinitions);
                request.ExtraOptions["tool_choice"] = "auto";
            }

            LlmChatResponseDto llmResponse;
            try
            {
                llmResponse = await _conversationStageExecutionService.ChatAsync(
                    orchestrationRequest, request, cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "LLM call failed in round {Round}", round + 1);
                throw;
            }

            var toolCalls = ParseToolCalls(llmResponse.RawResponseJson);

            if (toolCalls.Count == 0)
            {
                result.FinalReply = llmResponse.Text ?? string.Empty;
                result.TotalRounds = round + 1;
                return result;
            }

            _logger.LogDebug("LLM returned {ToolCallCount} tool calls in round {Round}",
                toolCalls.Count, round + 1);

            // Append the assistant message that contained the tool calls
            roundMessages.Add(new LlmChatMessageDto
            {
                Role = "assistant",
                Content = llmResponse.Text ?? string.Empty,
                ToolCalls = BuildToolCallsJson(toolCalls)
            });

            // Execute each tool call
            foreach (var toolCall in toolCalls)
            {
                var audit = new ToolCallAudit
                {
                    ToolCode = toolCall.Name,
                    Arguments = toolCall.Arguments
                };

                var stopwatch = Stopwatch.StartNew();

                try
                {
                    using var toolCts = new CancellationTokenSource(ToolCallTimeoutMs);
                    using var linkedCts = CancellationTokenSource.CreateLinkedTokenSource(
                        toolCts.Token, cancellationToken);

                    var dispatchResult = await _dispatcher.DispatchAsync(
                        toolCall.Name,
                        new McpToolCallRequest
                        {
                            ToolCode = toolCall.Name,
                            Arguments = toolCall.Arguments ?? new JsonObject(),
                            AgentRoleId = context.AgentRoleId ?? string.Empty,
                            DeviceId = context.DeviceId ?? string.Empty,
                            SessionId = context.SessionId ?? string.Empty,
                            UserId = context.UserId
                        },
                        linkedCts.Token);

                    stopwatch.Stop();
                    audit.Success = dispatchResult.Success;
                    audit.ResultSummary = Truncate(dispatchResult.Message, 500);
                    audit.ElapsedMs = stopwatch.ElapsedMilliseconds;

                    var toolResultContent = dispatchResult.Success
                        ? dispatchResult.Message
                        : $"Error: {dispatchResult.Message}";

                    roundMessages.Add(new LlmChatMessageDto
                    {
                        Role = "tool",
                        ToolCallId = toolCall.Id,
                        Content = toolResultContent
                    });
                }
                catch (OperationCanceledException) when (!cancellationToken.IsCancellationRequested)
                {
                    stopwatch.Stop();
                    audit.Success = false;
                    audit.ResultSummary = "Tool call timed out";
                    audit.ElapsedMs = stopwatch.ElapsedMilliseconds;

                    roundMessages.Add(new LlmChatMessageDto
                    {
                        Role = "tool",
                        ToolCallId = toolCall.Id,
                        Content = "Error: tool execution timed out"
                    });
                }
                catch (Exception ex)
                {
                    stopwatch.Stop();
                    audit.Success = false;
                    audit.ResultSummary = Truncate($"Tool execution error: {ex.Message}", 500);
                    audit.ElapsedMs = stopwatch.ElapsedMilliseconds;

                    roundMessages.Add(new LlmChatMessageDto
                    {
                        Role = "tool",
                        ToolCallId = toolCall.Id,
                        Content = $"Error: {ex.Message}"
                    });
                }

                result.ToolCalls.Add(audit);
            }

            result.TotalRounds = round + 1;
        }

        _logger.LogWarning("ConversationToolLoop reached max rounds ({MaxRounds})", MaxRounds);

        // If we've exhausted all rounds, try one final LLM call without tools to get a text reply
        try
        {
            var finalRequest = new LlmChatRequestDto
            {
                SystemPrompt = enhancedSystemPrompt,
                Stream = false,
                Messages = [.. roundMessages]
            };

            var finalResponse = await _conversationStageExecutionService.ChatAsync(
                orchestrationRequest, finalRequest, cancellationToken);
            result.FinalReply = finalResponse.Text ?? string.Empty;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Final LLM call after max rounds failed");
        }

        return result;
    }

    private static JsonArray BuildOpenAiTools(List<McpToolDefinition> definitions)
    {
        var tools = new JsonArray();
        foreach (var def in definitions)
        {
            var function = new JsonObject
            {
                ["name"] = def.Name,
                ["description"] = def.Description ?? string.Empty
            };

            if (def.InputSchema is { Count: > 0 })
                function["parameters"] = def.InputSchema.DeepClone();
            else
                function["parameters"] = new JsonObject
                {
                    ["type"] = "object",
                    ["properties"] = new JsonObject()
                };

            tools.Add(new JsonObject
            {
                ["type"] = "function",
                ["function"] = function
            });
        }

        return tools;
    }

    private List<LlmToolCall> ParseToolCalls(string? rawResponseJson)
    {
        var toolCalls = new List<LlmToolCall>();

        if (string.IsNullOrWhiteSpace(rawResponseJson))
            return toolCalls;

        try
        {
            var root = JsonNode.Parse(rawResponseJson);
            if (root is not JsonObject rootObj)
                return toolCalls;

            var choices = rootObj["choices"] as JsonArray;
            if (choices is not { Count: > 0 })
                return toolCalls;

            foreach (var choice in choices.OfType<JsonObject>())
            {
                var message = choice["message"] as JsonObject;
                var rawToolCalls = message?["tool_calls"] as JsonArray;
                if (rawToolCalls is not { Count: > 0 })
                    continue;

                foreach (var tc in rawToolCalls.OfType<JsonObject>())
                {
                    var function = tc["function"] as JsonObject;
                    if (function == null)
                        continue;

                    var name = function["name"]?.GetValue<string>();
                    if (string.IsNullOrWhiteSpace(name))
                        continue;

                    var arguments = ParseArguments(function["arguments"]);
                    toolCalls.Add(new LlmToolCall
                    {
                        Id = tc["id"]?.GetValue<string>() ?? string.Empty,
                        Name = name,
                        Arguments = arguments
                    });
                }
            }
        }
        catch (Exception ex)
        {
            _logger.LogWarning(ex, "Failed to parse tool calls from LLM response");
        }

        return toolCalls;
    }

    private static JsonObject? ParseArguments(JsonNode? node)
    {
        return node switch
        {
            JsonObject obj => obj,
            JsonValue value when value.TryGetValue<string>(out var text) => TryParseJsonObject(text),
            _ => null
        };
    }

    private static JsonObject? TryParseJsonObject(string text)
    {
        if (string.IsNullOrWhiteSpace(text))
            return null;

        try
        {
            return JsonNode.Parse(text) as JsonObject;
        }
        catch
        {
            return null;
        }
    }

    private static JsonArray BuildToolCallsJson(List<LlmToolCall> toolCalls)
    {
        var array = new JsonArray();
        foreach (var tc in toolCalls)
        {
            array.Add(new JsonObject
            {
                ["id"] = tc.Id,
                ["type"] = "function",
                ["function"] = new JsonObject
                {
                    ["name"] = tc.Name,
                    ["arguments"] = tc.Arguments?.DeepClone() ?? new JsonObject()
                }
            });
        }

        return array;
    }

    private static string BuildToolGuidanceSection(List<McpToolDefinition> tools)
    {
        if (tools.Count == 0)
            return string.Empty;

        var sb = new StringBuilder();
        sb.AppendLine();
        sb.AppendLine("## 可用工具");
        sb.AppendLine("你可以使用以下工具来帮助用户。当用户提到相关需求时，请主动调用对应的工具，而不是告诉用户你做不到：");
        sb.AppendLine();

        foreach (var tool in tools)
        {
            var hint = GetToolUsageHint(tool.Name);
            sb.AppendLine($"- **{tool.Name}**: {hint}");
        }

        return sb.ToString().Trim();
    }

    private static string GetToolUsageHint(string toolCode)
    {
        return toolCode switch
        {
            "todo-list" => "当需要查看用户的待处理任务或提醒列表时使用",
            "todo-create" => "当用户要求设置闹钟、创建提醒、安排定时任务、记录待办事项时使用。可以指定scheduled_at来设置触发时间",
            "todo-execute" => "执行已创建任务的提醒通知（短信或邮件）",
            "todo-complete" => "当任务完成或需要标记为已完成时使用",
            "risk-create" => "当检测到安全风险、异常情况或需要标记风险线索时使用",
            "health-followup-create" => "当需要安排健康随访、用药提醒等健康相关定时任务时使用",
            "send-sms" => "发送短信通知到用户手机",
            "send-email" => "发送邮件通知到用户邮箱",
            _ => string.Empty
        };
    }

    private static string Truncate(string value, int maxLength)
    {
        return value.Length <= maxLength ? value : value[..maxLength] + "...";
    }
}

public class ConversationContext
{
    public string? AgentRoleId { get; set; }
    public string? DeviceId { get; set; }
    public string? SessionId { get; set; }
    public long? UserId { get; set; }
}

public class McpToolDefinition
{
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public JsonObject? InputSchema { get; set; }
}

public class LlmToolCall
{
    public string Id { get; set; } = string.Empty;
    public string Name { get; set; } = string.Empty;
    public JsonObject? Arguments { get; set; }
}

public class ConversationToolLoopResult
{
    public string FinalReply { get; set; } = string.Empty;
    public List<ToolCallAudit> ToolCalls { get; set; } = new();
    public int TotalRounds { get; set; }
}

public class ToolCallAudit
{
    public string ToolCode { get; set; } = string.Empty;
    public JsonObject? Arguments { get; set; }
    public bool Success { get; set; }
    public string ResultSummary { get; set; } = string.Empty;
    public long ElapsedMs { get; set; }
}
