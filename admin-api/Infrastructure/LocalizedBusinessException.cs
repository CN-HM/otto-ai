namespace AiAdmin.Infrastructure;

public class LocalizedBusinessException : InvalidOperationException
{
    public LocalizedBusinessException(string messageKey, params (string Key, object? Value)[] parameters)
        : this(messageKey, parameters.ToDictionary(x => x.Key, x => x.Value), 1)
    {
    }

    public LocalizedBusinessException(string messageKey, IReadOnlyDictionary<string, object?> parameters, int code)
        : base(messageKey)
    {
        MessageKey = messageKey;
        Parameters = parameters;
        Code = code;
    }

    public string MessageKey { get; }

    public IReadOnlyDictionary<string, object?> Parameters { get; }

    public int Code { get; }
}
