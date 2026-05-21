namespace AiAdmin.Infrastructure;

/// <summary>
/// Non-generic helper for controllers
/// </summary>
public static class Result
{
    public static Result<object?> Ok(object? data = null, string msg = "success") =>
        Result<object?>.Ok(data, msg);

    public static Result<object?> Error(string msg, int code = 1) =>
        Result<object?>.Error(msg, code);

    public static Result<PageData<T>> Page<T>(List<T> list, long total) =>
        Result<PageData<T>>.Ok(new PageData<T> { List = list, Total = total });

    public static async Task<Result<T>> TryAsync<T>(Func<Task<T>> action)
    {
        try
        {
            var data = await action();
            return Result<T>.Ok(data);
        }
        catch (InvalidOperationException ex)
        {
            return Result<T>.Error(ex.Message);
        }
    }

    public static async Task<Result<object>> TryAsync(Func<Task> action)
    {
        try
        {
            await action();
            return Result<object>.Ok();
        }
        catch (InvalidOperationException ex)
        {
            return Result<object>.Error(ex.Message);
        }
    }
}
