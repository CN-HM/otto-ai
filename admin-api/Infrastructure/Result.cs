namespace AiAdmin.Infrastructure;

/// <summary>
/// Unified API response format: { code, msg, data }
/// Compatible with frontend ApiResponse&lt;T&gt;
/// </summary>
public class Result<T>
{
    public int Code { get; set; }
    public string Msg { get; set; } = "success";
    public T? Data { get; set; }

    public static Result<T> Ok(T? data = default, string msg = "success") =>
        new() { Code = 0, Msg = msg, Data = data };

    public static Result<T> Error(string msg, int code = 1) =>
        new() { Code = code, Msg = msg };
}
