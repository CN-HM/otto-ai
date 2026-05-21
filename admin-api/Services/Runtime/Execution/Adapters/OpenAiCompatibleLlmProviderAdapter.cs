using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using AiAdmin.Entities;
using AiAdmin.Services.Runtime.Execution.Dtos;
using AiAdmin.Services.Runtime.Orchestration.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime.Execution.Adapters;

[ExposeServices(typeof(IExecutableLlmProviderAdapter), typeof(IStreamingExecutableLlmProviderAdapter), typeof(OpenAiCompatibleLlmProviderAdapter))]
public class OpenAiCompatibleLlmProviderAdapter : OpenAiCompatibleHttpAdapterBase, IStreamingExecutableLlmProviderAdapter, ITransientDependency
{
    public string AdapterCode => "llm_openai_compatible";
    public string AdapterName => "OpenAI Compatible LLM Adapter";
    public int Order => 10;

    public OpenAiCompatibleLlmProviderAdapter(IHttpClientFactory httpClientFactory)
        : base(httpClientFactory)
    {
    }

    public ProviderAdapterMatch Match(ModelInvocationProfileDto profile)
    {
        return FirstMatch(
            MatchByProviderType(profile.ProviderType, ProviderType.Ark, ProviderType.DashScope),
            MatchByProviderFamily(profile.ProviderFamily, "openai_compatible"),
            MatchByProviderCode(profile.ProviderCode, "openai", "azure_openai", "azure-openai", "openrouter", "aliyun", "doubao"));
    }

    public async Task<LlmChatResponseDto> ChatAsync(StageExecutionContext context, LlmChatRequestDto request, CancellationToken cancellationToken = default)
    {
        return await ExecuteChatAsync(context, request, null, cancellationToken);
    }

    public async Task<LlmChatResponseDto> ChatStreamingAsync(StageExecutionContext context, LlmChatRequestDto request, Func<LlmChatStreamChunkDto, CancellationToken, Task> onChunk, CancellationToken cancellationToken = default)
    {
        return await ExecuteChatAsync(context, request, onChunk, cancellationToken);
    }

    private async Task<LlmChatResponseDto> ExecuteChatAsync(StageExecutionContext context, LlmChatRequestDto request, Func<LlmChatStreamChunkDto, CancellationToken, Task>? onChunk, CancellationToken cancellationToken)
    {
        var endpoint = ResolveEndpoint(context.ModelConfig,
            "/chat/completions",
            "chat_url",
            "chatUrl",
            "chat.endpoint");
        var model = ResolveRequiredString(context.ModelConfig,
            "LLM 模型配置缺少 model_name / model",
            "model_name",
            "model",
            "deployment",
            "deployment_name");
        var stream = request.Stream
            ?? string.Equals(context.InvocationProfile.InvocationMode, "streaming", StringComparison.OrdinalIgnoreCase);

        var body = new JsonObject
        {
            ["model"] = model,
            ["messages"] = BuildOpenAiMessages(request),
            ["stream"] = stream
        };

        var temperature = request.Temperature ?? ResolveOptionalDouble(context.ModelConfig, "temperature");
        if (temperature.HasValue)
            body["temperature"] = temperature.Value;

        var maxTokens = request.MaxTokens ?? ResolveOptionalInt(context.ModelConfig, "max_tokens", "max_completion_tokens");
        if (maxTokens.HasValue)
            body["max_tokens"] = maxTokens.Value;

        var topP = request.TopP ?? ResolveOptionalDouble(context.ModelConfig, "top_p");
        if (topP.HasValue)
            body["top_p"] = topP.Value;

        foreach (var option in request.ExtraOptions)
        {
            body[option.Key] = ExecutionJsonHelper.ToJsonNode(option.Value);
        }
        body["stream"] = stream;

        using var httpRequest = new HttpRequestMessage(HttpMethod.Post, endpoint);
        ApplyAuthorization(httpRequest, context.ModelConfig);
        httpRequest.Content = CreateJsonContent(body);

        var client = CreateClient();
        if (stream)
        {
            using var streamingResponse = await client.SendAsync(httpRequest,
                HttpCompletionOption.ResponseHeadersRead,
                cancellationToken);
            return await ReadStreamingResponseAsync(streamingResponse, model, onChunk, cancellationToken);
        }

        using var response = await client.SendAsync(httpRequest, cancellationToken);
        var nonStreamingResponse = await ReadNonStreamingResponseAsync(response, model, cancellationToken);
        if (onChunk != null)
        {
            await onChunk(new LlmChatStreamChunkDto
            {
                TextDelta = nonStreamingResponse.Text,
                ProviderResponseId = nonStreamingResponse.ProviderResponseId,
                Model = nonStreamingResponse.Model,
                FinishReason = nonStreamingResponse.FinishReason,
                IsFinal = true
            }, cancellationToken);
        }

        return nonStreamingResponse;
    }

    private static async Task<LlmChatResponseDto> ReadNonStreamingResponseAsync(HttpResponseMessage response, string model, CancellationToken cancellationToken)
    {
        var responseBody = await ReadSuccessBodyAsync(response, cancellationToken);
        var root = JsonNode.Parse(responseBody) as JsonObject
            ?? throw new InvalidOperationException("LLM 响应解析失败");
        return BuildChatResponse(root, model, "non_streaming", responseBody);
    }

    private static async Task<LlmChatResponseDto> ReadStreamingResponseAsync(HttpResponseMessage response, string model, Func<LlmChatStreamChunkDto, CancellationToken, Task>? onChunk, CancellationToken cancellationToken)
    {
        if (!response.IsSuccessStatusCode)
        {
            var errorBody = await response.Content.ReadAsStringAsync(cancellationToken);
            throw new InvalidOperationException($"上游模型调用失败：{(int)response.StatusCode} {response.ReasonPhrase} - {errorBody}");
        }

        var mediaType = response.Content.Headers.ContentType?.MediaType;
        if (!string.Equals(mediaType, "text/event-stream", StringComparison.OrdinalIgnoreCase))
        {
            var responseBody = await response.Content.ReadAsStringAsync(cancellationToken);
            var root = JsonNode.Parse(responseBody) as JsonObject
                ?? throw new InvalidOperationException("LLM 流式响应解析失败");
            return BuildChatResponse(root, model, "streaming", responseBody);
        }

        using var stream = await response.Content.ReadAsStreamAsync(cancellationToken);
        using var reader = new StreamReader(stream, Encoding.UTF8);
        var rawEvents = new JsonArray();
        var textBuilder = new StringBuilder();
        var dataLines = new List<string>();
        var state = new StreamingResponseState();

        while (true)
        {
            cancellationToken.ThrowIfCancellationRequested();
            var line = await reader.ReadLineAsync();
            if (line == null)
            {
                await ProcessSseEventAsync(dataLines,
                    rawEvents,
                    textBuilder,
                    state,
                    onChunk,
                    cancellationToken);
                break;
            }

            if (string.IsNullOrWhiteSpace(line))
            {
                if (await ProcessSseEventAsync(dataLines,
                        rawEvents,
                        textBuilder,
                        state,
                        onChunk,
                        cancellationToken))
                {
                    break;
                }

                continue;
            }

            if (line.StartsWith("data:", StringComparison.OrdinalIgnoreCase))
            {
                dataLines.Add(line[5..].TrimStart());
                continue;
            }

            if (line.StartsWith(":", StringComparison.Ordinal)
                || line.StartsWith("event:", StringComparison.OrdinalIgnoreCase)
                || line.StartsWith("id:", StringComparison.OrdinalIgnoreCase)
                || line.StartsWith("retry:", StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            dataLines.Add(line.Trim());
        }

        return new LlmChatResponseDto
        {
            InvocationMode = "streaming",
            ProviderResponseId = state.ProviderResponseId,
            Model = state.ResponseModel ?? model,
            Text = textBuilder.Length == 0 ? null : textBuilder.ToString(),
            FinishReason = state.FinishReason,
            Usage = BuildUsageDto(state.Usage),
            RawResponseJson = rawEvents.Count == 0 ? null : rawEvents.ToJsonString()
        };
    }

    private static LlmChatResponseDto BuildChatResponse(JsonObject root, string defaultModel, string invocationMode, string rawResponseJson)
    {
        var choice = (root["choices"] as JsonArray)?.OfType<JsonObject>().FirstOrDefault();
        var text = ExtractMessageText(choice?["message"]?["content"])
            ?? ExtractMessageText(choice?["delta"]?["content"]);
        var usage = ExtractUsage(root);

        return new LlmChatResponseDto
        {
            InvocationMode = invocationMode,
            ProviderResponseId = root["id"]?.GetValue<string>(),
            Model = root["model"]?.GetValue<string>() ?? defaultModel,
            Text = text,
            FinishReason = choice?["finish_reason"]?.GetValue<string>(),
            Usage = BuildUsageDto(usage),
            RawResponseJson = rawResponseJson
        };
    }

    private static async Task<bool> ProcessSseEventAsync(
        List<string> dataLines,
        JsonArray rawEvents,
        StringBuilder textBuilder,
        StreamingResponseState state,
        Func<LlmChatStreamChunkDto, CancellationToken, Task>? onChunk,
        CancellationToken cancellationToken)
    {
        if (dataLines.Count == 0)
            return false;

        var payload = string.Join("\n", dataLines);
        dataLines.Clear();

        if (string.Equals(payload.Trim(), "[DONE]", StringComparison.Ordinal))
            return true;

        var root = TryParseJsonObject(payload);
        JsonNode? rawEvent = root;
        rawEvent ??= JsonValue.Create(payload);
        rawEvents.Add(rawEvent);
        if (root == null)
            return false;

        state.ProviderResponseId ??= root["id"]?.GetValue<string>();
        state.ResponseModel ??= root["model"]?.GetValue<string>();
        state.Usage = MergeUsage(state.Usage, ExtractUsage(root));

        foreach (var choice in (root["choices"] as JsonArray)?.OfType<JsonObject>() ?? Enumerable.Empty<JsonObject>())
        {
            var text = ExtractMessageText(choice["delta"]?["content"])
                ?? ExtractMessageText(choice["message"]?["content"])
                ?? ExtractMessageText(choice["text"]);
            if (!string.IsNullOrWhiteSpace(text))
            {
                textBuilder.Append(text);
                if (onChunk != null)
                {
                    await onChunk(new LlmChatStreamChunkDto
                    {
                        TextDelta = text,
                        ProviderResponseId = root["id"]?.GetValue<string>() ?? state.ProviderResponseId,
                        Model = root["model"]?.GetValue<string>() ?? state.ResponseModel,
                        FinishReason = choice["finish_reason"]?.GetValue<string>(),
                        IsFinal = false
                    }, cancellationToken);
                }
            }

            state.FinishReason = choice["finish_reason"]?.GetValue<string>() ?? state.FinishReason;
        }

        if (onChunk != null && !string.IsNullOrWhiteSpace(state.FinishReason))
        {
            await onChunk(new LlmChatStreamChunkDto
            {
                ProviderResponseId = state.ProviderResponseId,
                Model = state.ResponseModel,
                FinishReason = state.FinishReason,
                IsFinal = true
            }, cancellationToken);
        }

        return false;
    }

    private sealed class StreamingResponseState
    {
        public string? ProviderResponseId { get; set; }
        public string? ResponseModel { get; set; }
        public string? FinishReason { get; set; }
        public (int? PromptTokens, int? CompletionTokens, int? TotalTokens) Usage { get; set; }
    }

    private static JsonObject? TryParseJsonObject(string payload)
    {
        try
        {
            return JsonNode.Parse(payload) as JsonObject;
        }
        catch
        {
            return null;
        }
    }

    private static (int? PromptTokens, int? CompletionTokens, int? TotalTokens) MergeUsage(
        (int? PromptTokens, int? CompletionTokens, int? TotalTokens) current,
        (int? PromptTokens, int? CompletionTokens, int? TotalTokens) incoming)
    {
        return (
            incoming.PromptTokens ?? current.PromptTokens,
            incoming.CompletionTokens ?? current.CompletionTokens,
            incoming.TotalTokens ?? current.TotalTokens);
    }

    private static LlmChatUsageDto? BuildUsageDto((int? PromptTokens, int? CompletionTokens, int? TotalTokens) usage)
    {
        return usage == (null, null, null)
            ? null
            : new LlmChatUsageDto
            {
                PromptTokens = usage.PromptTokens,
                CompletionTokens = usage.CompletionTokens,
                TotalTokens = usage.TotalTokens
            };
    }
}
