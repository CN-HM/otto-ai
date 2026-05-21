namespace AiAdmin.Services.Auth;

internal class TurnstileVerifyResponse
{
    public bool Success { get; set; }
    public string[]? ErrorCodes { get; set; }
}
