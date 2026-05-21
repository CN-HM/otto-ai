using AiAdmin.Localization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Localization;
using Volo.Abp;

namespace AiAdmin.Infrastructure;

/// <summary>
/// Catches exceptions and returns { code: 500, msg: "error message", data: null }
/// </summary>
public class GlobalExceptionFilter : IAsyncExceptionFilter
{
    /// <summary>日志记录器</summary>
    private readonly ILogger<GlobalExceptionFilter> _logger;
    private readonly IStringLocalizer<AiAdminResource> _localizer;
    private readonly LocalizedMessageResolver _messageResolver;

    /// <summary>创建全局异常过滤器实例</summary>
    public GlobalExceptionFilter(
        ILogger<GlobalExceptionFilter> logger,
        IStringLocalizer<AiAdminResource> localizer,
        LocalizedMessageResolver messageResolver)
    {
        _logger = logger;
        _localizer = localizer;
        _messageResolver = messageResolver;
    }

    public Task OnExceptionAsync(ExceptionContext context)
    {
        var exception = context.Exception;
        _logger.LogError(exception, "Unhandled exception: {Message}", exception.Message);

        var (code, msg) = exception switch
        {
            LocalizedBusinessException lbe => (lbe.Code, _messageResolver.Resolve(lbe.MessageKey, lbe.Parameters)),
            UserFriendlyException uf => (uf.Code != null && int.TryParse(uf.Code, out var c) ? c : 1, _messageResolver.Resolve(uf.Message)),
            InvalidOperationException ioe => (1, _messageResolver.Resolve(ioe.Message)),
            UnauthorizedAccessException uae when ContainsChinese(uae.Message) => (401, _messageResolver.Resolve(uae.Message)),
            UnauthorizedAccessException => (401, _localizer["Error:Unauthorized"].Value),
            _ => (500, _localizer["Error:InternalServerError"].Value)
        };
        var statusCode = exception is InvalidOperationException
            ? StatusCodes.Status200OK
            : code >= 400 && code < 600 ? code : 500;

        context.Result = new ObjectResult(Result.Error(msg, code))
        {
            StatusCode = statusCode
        };
        context.ExceptionHandled = true;

        return Task.CompletedTask;
    }

    private static bool ContainsChinese(string value)
    {
        return value.Any(c => c >= '\u4e00' && c <= '\u9fff');
    }
}
