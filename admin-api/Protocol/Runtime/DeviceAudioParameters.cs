namespace AiAdmin.Protocol.Runtime;

public sealed class DeviceAudioParameters
{
    public string Format { get; init; } = "opus";
    public int SampleRate { get; init; } = 16000;
    public int Channels { get; init; } = 1;
    public int FrameDurationMs { get; init; } = 60;
    public int SamplesPerFrame => Math.Max(1, SampleRate * FrameDurationMs / 1000);
}
