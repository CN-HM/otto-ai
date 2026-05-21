using System.Buffers.Binary;
using System.IO.Compression;
using System.Text;
using System.Text.Json.Nodes;

namespace AiAdmin.Services.Runtime.Execution;

internal static class DoubaoSpeechWebSocketFrameCodec
{
    public const int ProtocolVersion = 0b0001;
    public const int HeaderSize = 0b0001;

    public const int SerializationRaw = 0b0000;
    public const int SerializationJson = 0b0001;

    public const int CompressionNone = 0b0000;
    public const int CompressionGzip = 0b0001;

    public const int MessageTypeFullClientRequest = 0b0001;
    public const int MessageTypeAudioOnlyRequest = 0b0010;
    public const int MessageTypeFullServerResponse = 0b1001;
    public const int MessageTypeAudioOnlyResponse = 0b1011;
    public const int MessageTypeError = 0b1111;

    public static byte[] BuildAsrFrame(int messageType, int messageFlags, int serializationMethod, int compressionMethod, byte[] payloadBytes)
    {
        using var stream = new MemoryStream();
        stream.Write(BuildHeader(messageType, messageFlags, serializationMethod, compressionMethod));
        WriteInt32(stream, payloadBytes.Length);
        stream.Write(payloadBytes);
        return stream.ToArray();
    }

    public static byte[] BuildTtsFrame(int messageType, int messageFlags, int eventCode, string? sessionId, int serializationMethod, int compressionMethod, byte[] payloadBytes)
    {
        using var stream = new MemoryStream();
        stream.Write(BuildHeader(messageType, messageFlags, serializationMethod, compressionMethod));
        WriteInt32(stream, eventCode);

        if (!string.IsNullOrWhiteSpace(sessionId))
        {
            var sessionIdBytes = Encoding.UTF8.GetBytes(sessionId);
            WriteInt32(stream, sessionIdBytes.Length);
            stream.Write(sessionIdBytes);
        }

        WriteInt32(stream, payloadBytes.Length);
        stream.Write(payloadBytes);
        return stream.ToArray();
    }

    public static DoubaoSpeechWebSocketFrame ParseFrame(ReadOnlySpan<byte> data, Func<FrameParseContext, DoubaoSpeechWebSocketFrameMetadata> metadataParser)
    {
        if (data.Length < 4)
            throw new InvalidOperationException("豆包 WebSocket 二进制帧长度不足");

        var protocolVersion = (data[0] >> 4) & 0x0F;
        var headerSizeBytes = (data[0] & 0x0F) * 4;
        var messageType = (data[1] >> 4) & 0x0F;
        var messageFlags = data[1] & 0x0F;
        var serializationMethod = (data[2] >> 4) & 0x0F;
        var compressionMethod = data[2] & 0x0F;
        var offset = headerSizeBytes;

        if (data.Length < offset)
            throw new InvalidOperationException("豆包 WebSocket 二进制帧 header 非法");

        var context = new FrameParseContext(data, offset, messageType, messageFlags, compressionMethod);
        var metadata = metadataParser(context);

        return new DoubaoSpeechWebSocketFrame
        {
            ProtocolVersion = protocolVersion,
            HeaderSizeBytes = headerSizeBytes,
            MessageType = messageType,
            MessageTypeSpecificFlags = messageFlags,
            SerializationMethod = serializationMethod,
            CompressionMethod = compressionMethod,
            Sequence = metadata.Sequence,
            EventCode = metadata.EventCode,
            ConnectionId = metadata.ConnectionId,
            SessionId = metadata.SessionId,
            ErrorCode = metadata.ErrorCode,
            PayloadBytes = metadata.PayloadBytes
        };
    }

    public static int ReadInt32(ReadOnlySpan<byte> data, ref int offset)
    {
        if (data.Length - offset < 4)
            throw new InvalidOperationException("豆包 WebSocket 二进制帧长度不足，无法读取 int32");

        var value = BinaryPrimitives.ReadInt32BigEndian(data.Slice(offset, 4));
        offset += 4;
        return value;
    }

    public static byte[] ReadPayload(ReadOnlySpan<byte> data, ref int offset, int payloadSize, int compressionMethod)
    {
        if (payloadSize < 0 || data.Length - offset < payloadSize)
            throw new InvalidOperationException("豆包 WebSocket 二进制帧 payload 长度非法");

        var payloadBytes = data.Slice(offset, payloadSize).ToArray();
        offset += payloadSize;
        return compressionMethod == CompressionGzip ? DecompressGzip(payloadBytes) : payloadBytes;
    }

    public static bool TryReadIdentityAndPayload(ReadOnlySpan<byte> data, ref int offset, out string? identity, out byte[] payloadBytes, int compressionMethod)
    {
        identity = null;
        payloadBytes = [];

        if (data.Length - offset < 4)
            return false;

        var firstLength = ReadInt32(data, ref offset);
        if (firstLength < 0)
            throw new InvalidOperationException("豆包 WebSocket 二进制帧长度非法");

        if (data.Length - offset < firstLength + 4)
        {
            offset -= 4;
            return false;
        }

        identity = Encoding.UTF8.GetString(data.Slice(offset, firstLength));
        offset += firstLength;
        var payloadSize = ReadInt32(data, ref offset);
        payloadBytes = ReadPayload(data, ref offset, payloadSize, compressionMethod);
        return true;
    }

    public static byte[] EncodeJsonPayload(JsonObject payload, bool gzip)
    {
        var payloadBytes = Encoding.UTF8.GetBytes(payload.ToJsonString());
        return gzip ? CompressGzip(payloadBytes) : payloadBytes;
    }

    public static byte[] EncodeRawPayload(byte[] payload, bool gzip)
    {
        return gzip ? CompressGzip(payload) : payload;
    }

    private static byte[] BuildHeader(int messageType, int messageFlags, int serializationMethod, int compressionMethod)
    {
        return
        [
            (byte)((ProtocolVersion << 4) | HeaderSize),
            (byte)((messageType << 4) | messageFlags),
            (byte)((serializationMethod << 4) | compressionMethod),
            0x00
        ];
    }

    private static void WriteInt32(Stream stream, int value)
    {
        Span<byte> buffer = stackalloc byte[4];
        BinaryPrimitives.WriteInt32BigEndian(buffer, value);
        stream.Write(buffer);
    }

    private static byte[] CompressGzip(byte[] data)
    {
        using var output = new MemoryStream();
        using (var gzip = new GZipStream(output, CompressionLevel.SmallestSize, leaveOpen: true))
        {
            gzip.Write(data, 0, data.Length);
        }

        return output.ToArray();
    }

    private static byte[] DecompressGzip(byte[] data)
    {
        using var input = new MemoryStream(data);
        using var gzip = new GZipStream(input, CompressionMode.Decompress);
        using var output = new MemoryStream();
        gzip.CopyTo(output);
        return output.ToArray();
    }

    internal sealed class FrameParseContext
    {
        public FrameParseContext(ReadOnlySpan<byte> data, int offset, int messageType, int messageFlags, int compressionMethod)
        {
            Data = data.ToArray();
            Offset = offset;
            MessageType = messageType;
            MessageFlags = messageFlags;
            CompressionMethod = compressionMethod;
        }

        public byte[] Data { get; }
        public int Offset { get; set; }
        public int MessageType { get; }
        public int MessageFlags { get; }
        public int CompressionMethod { get; }
    }

    internal sealed class DoubaoSpeechWebSocketFrameMetadata
    {
        public int? Sequence { get; init; }
        public int? EventCode { get; init; }
        public string? ConnectionId { get; init; }
        public string? SessionId { get; init; }
        public int? ErrorCode { get; init; }
        public byte[] PayloadBytes { get; init; } = [];
    }
}

internal static class DoubaoAsrWebSocketProtocol
{
    public const int FlagNone = 0b0000;
    public const int FlagPositiveSequence = 0b0001;
    public const int FlagFinalWithoutSequence = 0b0010;
    public const int FlagFinalWithSequence = 0b0011;

    public static byte[] BuildFullClientRequest(JsonObject payload)
    {
        return DoubaoSpeechWebSocketFrameCodec.BuildAsrFrame(
            DoubaoSpeechWebSocketFrameCodec.MessageTypeFullClientRequest,
            FlagNone,
            DoubaoSpeechWebSocketFrameCodec.SerializationJson,
            DoubaoSpeechWebSocketFrameCodec.CompressionGzip,
            DoubaoSpeechWebSocketFrameCodec.EncodeJsonPayload(payload, gzip: true));
    }

    public static byte[] BuildAudioOnlyRequest(byte[] audioBytes, bool isFinal)
    {
        return DoubaoSpeechWebSocketFrameCodec.BuildAsrFrame(
            DoubaoSpeechWebSocketFrameCodec.MessageTypeAudioOnlyRequest,
            isFinal ? FlagFinalWithoutSequence : FlagNone,
            DoubaoSpeechWebSocketFrameCodec.SerializationRaw,
            DoubaoSpeechWebSocketFrameCodec.CompressionGzip,
            DoubaoSpeechWebSocketFrameCodec.EncodeRawPayload(audioBytes, gzip: true));
    }

    public static DoubaoSpeechWebSocketFrame ParseFrame(ReadOnlySpan<byte> data)
    {
        return DoubaoSpeechWebSocketFrameCodec.ParseFrame(data, ParseMetadata);
    }

    public static bool IsFinalResponse(DoubaoSpeechWebSocketFrame frame)
    {
        return frame.MessageTypeSpecificFlags is FlagFinalWithSequence or FlagFinalWithoutSequence;
    }

    private static DoubaoSpeechWebSocketFrameCodec.DoubaoSpeechWebSocketFrameMetadata ParseMetadata(DoubaoSpeechWebSocketFrameCodec.FrameParseContext context)
    {
        var data = context.Data.AsSpan();
        var offset = context.Offset;
        int? sequence = null;
        int? errorCode = null;
        byte[] payloadBytes;

        if (context.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
        {
            errorCode = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            var payloadSize = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            payloadBytes = DoubaoSpeechWebSocketFrameCodec.ReadPayload(data, ref offset, payloadSize, context.CompressionMethod);
        }
        else
        {
            if (context.MessageFlags is FlagPositiveSequence or FlagFinalWithSequence)
                sequence = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);

            var payloadSize = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            payloadBytes = DoubaoSpeechWebSocketFrameCodec.ReadPayload(data, ref offset, payloadSize, context.CompressionMethod);
        }

        return new DoubaoSpeechWebSocketFrameCodec.DoubaoSpeechWebSocketFrameMetadata
        {
            Sequence = sequence,
            ErrorCode = errorCode,
            PayloadBytes = payloadBytes
        };
    }
}

internal static class DoubaoTtsWebSocketProtocol
{
    public const int FlagWithEvent = 0b0100;

    public const int EventStartConnection = 1;
    public const int EventFinishConnection = 2;
    public const int EventConnectionStarted = 50;
    public const int EventConnectionFailed = 51;
    public const int EventConnectionFinished = 52;
    public const int EventStartSession = 100;
    public const int EventCancelSession = 101;
    public const int EventFinishSession = 102;
    public const int EventSessionStarted = 150;
    public const int EventSessionCanceled = 151;
    public const int EventSessionFinished = 152;
    public const int EventSessionFailed = 153;
    public const int EventTaskRequest = 200;
    public const int EventTtsSentenceStart = 350;
    public const int EventTtsSentenceEnd = 351;
    public const int EventTtsResponse = 352;

    public static byte[] BuildConnectionFrame(int eventCode, JsonObject payload)
    {
        return DoubaoSpeechWebSocketFrameCodec.BuildTtsFrame(
            DoubaoSpeechWebSocketFrameCodec.MessageTypeFullClientRequest,
            FlagWithEvent,
            eventCode,
            null,
            DoubaoSpeechWebSocketFrameCodec.SerializationJson,
            DoubaoSpeechWebSocketFrameCodec.CompressionNone,
            DoubaoSpeechWebSocketFrameCodec.EncodeJsonPayload(payload, gzip: false));
    }

    public static byte[] BuildSessionFrame(int eventCode, string sessionId, JsonObject payload)
    {
        return DoubaoSpeechWebSocketFrameCodec.BuildTtsFrame(
            DoubaoSpeechWebSocketFrameCodec.MessageTypeFullClientRequest,
            FlagWithEvent,
            eventCode,
            sessionId,
            DoubaoSpeechWebSocketFrameCodec.SerializationJson,
            DoubaoSpeechWebSocketFrameCodec.CompressionNone,
            DoubaoSpeechWebSocketFrameCodec.EncodeJsonPayload(payload, gzip: false));
    }

    public static DoubaoSpeechWebSocketFrame ParseFrame(ReadOnlySpan<byte> data)
    {
        return DoubaoSpeechWebSocketFrameCodec.ParseFrame(data, ParseMetadata);
    }

    public static bool IsFailureEvent(int eventCode)
    {
        return eventCode is EventConnectionFailed or EventSessionFailed;
    }

    private static DoubaoSpeechWebSocketFrameCodec.DoubaoSpeechWebSocketFrameMetadata ParseMetadata(DoubaoSpeechWebSocketFrameCodec.FrameParseContext context)
    {
        var data = context.Data.AsSpan();
        var offset = context.Offset;
        int? eventCode = null;
        int? errorCode = null;
        string? connectionId = null;
        string? sessionId = null;
        byte[] payloadBytes;

        if (context.MessageType == DoubaoSpeechWebSocketFrameCodec.MessageTypeError)
        {
            errorCode = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            var payloadSize = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            payloadBytes = DoubaoSpeechWebSocketFrameCodec.ReadPayload(data, ref offset, payloadSize, context.CompressionMethod);
        }
        else if (context.MessageFlags == FlagWithEvent)
        {
            eventCode = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            if (DoubaoSpeechWebSocketFrameCodec.TryReadIdentityAndPayload(data, ref offset, out var identity, out payloadBytes, context.CompressionMethod))
            {
                if (IsConnectionEvent(eventCode.Value))
                    connectionId = identity;
                else
                    sessionId = identity;
            }
            else
            {
                var payloadSize = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
                payloadBytes = DoubaoSpeechWebSocketFrameCodec.ReadPayload(data, ref offset, payloadSize, context.CompressionMethod);
            }
        }
        else
        {
            var payloadSize = DoubaoSpeechWebSocketFrameCodec.ReadInt32(data, ref offset);
            payloadBytes = DoubaoSpeechWebSocketFrameCodec.ReadPayload(data, ref offset, payloadSize, context.CompressionMethod);
        }

        return new DoubaoSpeechWebSocketFrameCodec.DoubaoSpeechWebSocketFrameMetadata
        {
            EventCode = eventCode,
            ConnectionId = connectionId,
            SessionId = sessionId,
            ErrorCode = errorCode,
            PayloadBytes = payloadBytes
        };
    }

    private static bool IsConnectionEvent(int eventCode)
    {
        return eventCode is EventConnectionStarted or EventConnectionFailed or EventConnectionFinished;
    }
}
