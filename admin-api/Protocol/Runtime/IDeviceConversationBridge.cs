namespace AiAdmin.Protocol.Runtime;

public interface IDeviceConversationBridge : IAsyncDisposable
{
    bool IsAlive { get; }
    event Action? OnClosed;
    Task SendJsonAsync(string json);
    Task SendBinaryAsync(byte[] data);
}
