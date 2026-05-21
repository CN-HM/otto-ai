using System.Text;
using System.Text.Json.Nodes;

namespace AiAdmin.Services.Runtime.Execution;

internal sealed class DoubaoSpeechWebSocketFrame
{
    public int ProtocolVersion { get; init; }
    public int HeaderSizeBytes { get; init; }
    public int MessageType { get; init; }
    public int MessageTypeSpecificFlags { get; init; }
    public int SerializationMethod { get; init; }
    public int CompressionMethod { get; init; }
    public int? Sequence { get; init; }
    public int? EventCode { get; init; }
    public string? ConnectionId { get; init; }
    public string? SessionId { get; init; }
    public int? ErrorCode { get; init; }
    public byte[] PayloadBytes { get; init; } = [];
}

internal static class DoubaoSpeechWebSocketPayloadReader
{
    public static JsonObject? TryParsePayloadAsJson(DoubaoSpeechWebSocketFrame frame)
    {
        if (frame.PayloadBytes.Length == 0)
            return null;

        try
        {
            return JsonNode.Parse(Encoding.UTF8.GetString(frame.PayloadBytes)) as JsonObject;
        }
        catch
        {
            return null;
        }
    }

    public static string? TryGetPayloadText(DoubaoSpeechWebSocketFrame frame)
    {
        if (frame.PayloadBytes.Length == 0)
            return null;

        return Encoding.UTF8.GetString(frame.PayloadBytes);
    }
}
