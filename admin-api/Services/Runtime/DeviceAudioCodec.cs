using System.Buffers.Binary;
using Concentus;
using Concentus.Enums;
using AiAdmin.Protocol.Runtime;

namespace AiAdmin.Services.Runtime;

public static class DeviceAudioCodec
{
    public static byte[] DecodeOpusFrameToPcm16Le(byte[] opusFrame, DeviceAudioParameters audioParameters)
    {
        var decoder = OpusCodecFactory.CreateDecoder(audioParameters.SampleRate, audioParameters.Channels, TextWriter.Null);
        var frameBuffer = new short[audioParameters.SamplesPerFrame * audioParameters.Channels * 2];
        var decodedSamples = decoder.Decode(opusFrame, frameBuffer, audioParameters.SamplesPerFrame);
        if (decodedSamples <= 0)
            return [];

        var pcmBytes = new byte[decodedSamples * audioParameters.Channels * sizeof(short)];
        Buffer.BlockCopy(frameBuffer, 0, pcmBytes, 0, pcmBytes.Length);
        return pcmBytes;
    }

    public static IReadOnlyList<(byte[] OpusFrame, uint Timestamp)> EncodePcm16LeToOpusFrames(byte[] pcm16Le, int sampleRate, int channels, int frameDurationMs)
    {
        var normalized = NormalizePcm16Le(pcm16Le, sampleRate, channels, 16000);
        var encoder = OpusCodecFactory.CreateEncoder(16000, 1, OpusApplication.OPUS_APPLICATION_AUDIO, TextWriter.Null);
        encoder.Bitrate = 32000;
        var samplesPerFrame = Math.Max(1, 16000 * frameDurationMs / 1000);
        var pcmShorts = new short[normalized.Length / sizeof(short)];
        Buffer.BlockCopy(normalized, 0, pcmShorts, 0, normalized.Length);

        var frames = new List<(byte[] OpusFrame, uint Timestamp)>();
        var encodedBuffer = new byte[4000];
        uint timestamp = 0;
        for (var offset = 0; offset < pcmShorts.Length; offset += samplesPerFrame)
        {
            var frame = new short[samplesPerFrame];
            var copyCount = Math.Min(samplesPerFrame, pcmShorts.Length - offset);
            Array.Copy(pcmShorts, offset, frame, 0, copyCount);
            var encodedLength = encoder.Encode(frame, samplesPerFrame, encodedBuffer, encodedBuffer.Length);
            if (encodedLength > 0)
            {
                var opus = new byte[encodedLength];
                Buffer.BlockCopy(encodedBuffer, 0, opus, 0, encodedLength);
                frames.Add((opus, timestamp));
                timestamp += (uint)frameDurationMs;
            }
        }

        return frames;
    }

    public static byte[] EnsureWaveContainer(byte[] pcm16Le, int sampleRate, int channels)
    {
        var dataLength = pcm16Le.Length;
        var blockAlign = channels * sizeof(short);
        var byteRate = sampleRate * blockAlign;
        var buffer = new byte[44 + dataLength];
        buffer[0] = (byte)'R';
        buffer[1] = (byte)'I';
        buffer[2] = (byte)'F';
        buffer[3] = (byte)'F';
        BinaryPrimitives.WriteInt32LittleEndian(buffer.AsSpan(4, 4), 36 + dataLength);
        buffer[8] = (byte)'W';
        buffer[9] = (byte)'A';
        buffer[10] = (byte)'V';
        buffer[11] = (byte)'E';
        buffer[12] = (byte)'f';
        buffer[13] = (byte)'m';
        buffer[14] = (byte)'t';
        buffer[15] = (byte)' ';
        BinaryPrimitives.WriteInt32LittleEndian(buffer.AsSpan(16, 4), 16);
        BinaryPrimitives.WriteInt16LittleEndian(buffer.AsSpan(20, 2), 1);
        BinaryPrimitives.WriteInt16LittleEndian(buffer.AsSpan(22, 2), (short)channels);
        BinaryPrimitives.WriteInt32LittleEndian(buffer.AsSpan(24, 4), sampleRate);
        BinaryPrimitives.WriteInt32LittleEndian(buffer.AsSpan(28, 4), byteRate);
        BinaryPrimitives.WriteInt16LittleEndian(buffer.AsSpan(32, 2), (short)blockAlign);
        BinaryPrimitives.WriteInt16LittleEndian(buffer.AsSpan(34, 2), 16);
        buffer[36] = (byte)'d';
        buffer[37] = (byte)'a';
        buffer[38] = (byte)'t';
        buffer[39] = (byte)'a';
        BinaryPrimitives.WriteInt32LittleEndian(buffer.AsSpan(40, 4), dataLength);
        Buffer.BlockCopy(pcm16Le, 0, buffer, 44, dataLength);
        return buffer;
    }

    public static byte[] ExtractPcm16Le(byte[] audioBytes, string? format, out int sampleRate, out int channels)
    {
        var normalizedFormat = format?.Trim().ToLowerInvariant();
        if (normalizedFormat == "pcm")
        {
            sampleRate = 16000;
            channels = 1;
            return audioBytes;
        }

        if (audioBytes.Length >= 12
            && audioBytes[0] == 'R'
            && audioBytes[1] == 'I'
            && audioBytes[2] == 'F'
            && audioBytes[3] == 'F'
            && audioBytes[8] == 'W'
            && audioBytes[9] == 'A'
            && audioBytes[10] == 'V'
            && audioBytes[11] == 'E')
        {
            return ReadWavePcm16(audioBytes, out sampleRate, out channels);
        }

        throw new InvalidOperationException($"暂不支持的 TTS 音频格式：{format ?? "unknown"}");
    }

    private static byte[] NormalizePcm16Le(byte[] pcm16Le, int sampleRate, int channels, int targetSampleRate)
    {
        var mono = channels == 1 ? pcm16Le : DownmixToMono(pcm16Le, channels);
        if (sampleRate == targetSampleRate)
            return mono;
        return ResampleMonoPcm16Le(mono, sampleRate, targetSampleRate);
    }

    private static byte[] DownmixToMono(byte[] pcm16Le, int channels)
    {
        var sampleCount = pcm16Le.Length / sizeof(short) / channels;
        var output = new byte[sampleCount * sizeof(short)];
        for (var i = 0; i < sampleCount; i++)
        {
            var sum = 0;
            for (var channel = 0; channel < channels; channel++)
            {
                var sourceOffset = ((i * channels) + channel) * sizeof(short);
                sum += BinaryPrimitives.ReadInt16LittleEndian(pcm16Le.AsSpan(sourceOffset, sizeof(short)));
            }

            var mixed = (short)(sum / channels);
            BinaryPrimitives.WriteInt16LittleEndian(output.AsSpan(i * sizeof(short), sizeof(short)), mixed);
        }

        return output;
    }

    private static byte[] ResampleMonoPcm16Le(byte[] pcm16Le, int sourceSampleRate, int targetSampleRate)
    {
        if (sourceSampleRate <= 0 || targetSampleRate <= 0)
            throw new InvalidOperationException("音频采样率无效");

        var sourceSamples = pcm16Le.Length / sizeof(short);
        if (sourceSamples == 0)
            return pcm16Le;

        var targetSamples = (int)Math.Max(1, Math.Round(sourceSamples * (targetSampleRate / (double)sourceSampleRate), MidpointRounding.AwayFromZero));
        var output = new byte[targetSamples * sizeof(short)];
        for (var i = 0; i < targetSamples; i++)
        {
            var sourceIndex = i * (sourceSamples - 1d) / Math.Max(1, targetSamples - 1);
            var lower = (int)Math.Floor(sourceIndex);
            var upper = Math.Min(sourceSamples - 1, lower + 1);
            var weight = sourceIndex - lower;
            var lowerValue = BinaryPrimitives.ReadInt16LittleEndian(pcm16Le.AsSpan(lower * sizeof(short), sizeof(short)));
            var upperValue = BinaryPrimitives.ReadInt16LittleEndian(pcm16Le.AsSpan(upper * sizeof(short), sizeof(short)));
            var interpolated = (short)Math.Round(lowerValue + ((upperValue - lowerValue) * weight), MidpointRounding.AwayFromZero);
            BinaryPrimitives.WriteInt16LittleEndian(output.AsSpan(i * sizeof(short), sizeof(short)), interpolated);
        }

        return output;
    }

    private static byte[] ReadWavePcm16(byte[] wavBytes, out int sampleRate, out int channels)
    {
        sampleRate = 16000;
        channels = 1;
        var offset = 12;
        var dataOffset = -1;
        var dataLength = 0;

        while (offset + 8 <= wavBytes.Length)
        {
            var chunkId = BinaryPrimitives.ReadUInt32LittleEndian(wavBytes.AsSpan(offset, 4));
            var chunkSize = BinaryPrimitives.ReadInt32LittleEndian(wavBytes.AsSpan(offset + 4, 4));
            var chunkDataOffset = offset + 8;
            if (chunkSize < 0 || chunkDataOffset + chunkSize > wavBytes.Length)
                break;

            if (chunkId == 0x20746d66)
            {
                var audioFormat = BinaryPrimitives.ReadInt16LittleEndian(wavBytes.AsSpan(chunkDataOffset, 2));
                channels = BinaryPrimitives.ReadInt16LittleEndian(wavBytes.AsSpan(chunkDataOffset + 2, 2));
                sampleRate = BinaryPrimitives.ReadInt32LittleEndian(wavBytes.AsSpan(chunkDataOffset + 4, 4));
                var bitsPerSample = BinaryPrimitives.ReadInt16LittleEndian(wavBytes.AsSpan(chunkDataOffset + 14, 2));
                if (audioFormat != 1 || bitsPerSample != 16)
                    throw new InvalidOperationException("当前仅支持 PCM16 WAV");
            }
            else if (chunkId == 0x61746164)
            {
                dataOffset = chunkDataOffset;
                dataLength = chunkSize;
                break;
            }

            offset = chunkDataOffset + chunkSize + (chunkSize % 2);
        }

        if (dataOffset < 0 || dataLength <= 0)
            throw new InvalidOperationException("WAV 音频数据缺少 data chunk");

        var pcm = new byte[dataLength];
        Buffer.BlockCopy(wavBytes, dataOffset, pcm, 0, dataLength);
        return pcm;
    }
}
