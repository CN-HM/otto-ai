using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace AiAdmin.Infrastructure;

/// <summary>
/// Wraps all controller return values into { code: 0, msg: "success", data: T }
/// unless the controller already returns a Result&lt;T&gt;.
/// </summary>
public class IotResultFilter : IAsyncResultFilter
{
    private readonly LocalizedMessageResolver _messageResolver;

    public IotResultFilter(LocalizedMessageResolver messageResolver)
    {
        _messageResolver = messageResolver;
    }

    /// <summary>
    /// 处理结果执行，将非Result类型的返回值包装为统一响应格式
    /// </summary>
    public async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
    {
        if (context.Result is ObjectResult objectResult
            && objectResult.Value is not null
            && !IsAlreadyWrapped(objectResult.Value))
        {
            objectResult.Value = new { code = 0, msg = "success", data = objectResult.Value };
        }
        else if (context.Result is ObjectResult alreadyWrappedResult
            && alreadyWrappedResult.Value is not null
            && IsAlreadyWrapped(alreadyWrappedResult.Value))
        {
            LocalizeWrappedMessage(alreadyWrappedResult.Value);
        }

        await next();
    }

    /// <summary>
    /// 检查返回值是否已经是统一响应格式
    /// </summary>
    /// <param name="value">返回值对象</param>
    /// <returns>如果已是Result类型或包含Code/Msg/Data属性则返回true</returns>
    private static bool IsAlreadyWrapped(object value)
    {
        var type = value.GetType();
        if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Result<>))
            return true;
        return type.GetProperty("Code") != null && type.GetProperty("Msg") != null && type.GetProperty("Data") != null;
    }

    private void LocalizeWrappedMessage(object value)
    {
        var msgProperty = value.GetType().GetProperty("Msg");
        if (msgProperty?.CanRead != true || msgProperty.CanWrite != true || msgProperty.PropertyType != typeof(string))
        {
            return;
        }

        var msg = msgProperty.GetValue(value) as string;
        msgProperty.SetValue(value, _messageResolver.Resolve(msg));
    }
}
