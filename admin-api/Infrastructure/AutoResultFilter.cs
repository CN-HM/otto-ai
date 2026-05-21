using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Reflection;

namespace AiAdmin.Infrastructure;

/// <summary>
/// 自动将 Controller Action 的裸返回值包装为 Result&lt;T&gt;.Ok(data)。
/// 如果返回值已经是 Result&lt;T&gt; 类型，则跳过包装。
/// 配合 GlobalExceptionFilter 中 InvalidOperationException → code=1 的分支，
/// 可替代 Controller 中手动的 Result.TryAsync(...) 包裹。
/// </summary>
public class AutoResultFilter : IAsyncResultFilter
{
    public async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
    {
        if (context.Result is ObjectResult objectResult)
        {
            if (objectResult.StatusCode is >= 400)
            {
                await next();
                return;
            }

            var value = objectResult.Value;

            if (value != null)
            {
                var valueType = value.GetType();
                if (!IsGenericResult(valueType) && value is not ProblemDetails)
                {
                    var wrapped = WrapInResult(value, valueType);
                    if (wrapped != null)
                    {
                        objectResult.Value = wrapped;
                    }
                }
            }
            else if (objectResult.DeclaredType != null)
            {
                // Value 为 null 但 DeclaredType 已知：包装为 Result<DeclaredType>.Ok(null)
                var declaredType = objectResult.DeclaredType;
                if (!IsGenericResult(declaredType))
                {
                    var wrapped = WrapInResult(null, declaredType);
                    if (wrapped != null)
                    {
                        objectResult.Value = wrapped;
                    }
                }
            }
        }

        await next();
    }

    private static bool IsGenericResult(Type type)
    {
        if (!type.IsGenericType)
            return false;

        return type.GetGenericTypeDefinition() == typeof(Result<>);
    }

    private static object? WrapInResult(object? value, Type valueType)
    {
        try
        {
            var resultType = typeof(Result<>).MakeGenericType(valueType);
            var okMethod = resultType.GetMethod(
                "Ok",
                BindingFlags.Public | BindingFlags.Static,
                new[] { valueType, typeof(string) });

            if (okMethod == null)
                return null;

            return okMethod.Invoke(null, new[] { value, "success" });
        }
        catch
        {
            return null;
        }
    }
}
