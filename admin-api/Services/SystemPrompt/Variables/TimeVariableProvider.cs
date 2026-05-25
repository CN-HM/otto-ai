using AiAdmin.Services.SystemPrompt.Dtos;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.SystemPrompt.Variables;

[ExposeServices(typeof(ISystemPromptVariableProvider))]
public class TimeVariableProvider : ISystemPromptVariableProvider, ITransientDependency
{
    private static readonly Dictionary<string, VariableDefinition> Definitions = new()
    {
        ["current_datetime"] = new() { Name = "current_datetime", Category = "时间", Description = "当前完整日期时间", Example = "2026年5月24日 周日 15:30" },
        ["current_date"] = new() { Name = "current_date", Category = "时间", Description = "当前日期", Example = "2026年5月24日" },
        ["current_time"] = new() { Name = "current_time", Category = "时间", Description = "当前时间（24小时制）", Example = "15:30" },
        ["current_weekday"] = new() { Name = "current_weekday", Category = "时间", Description = "当前星期（中文）", Example = "周日" },
        ["current_year"] = new() { Name = "current_year", Category = "时间", Description = "当前年份", Example = "2026" },
        ["current_month"] = new() { Name = "current_month", Category = "时间", Description = "当前月份", Example = "5" },
        ["current_day"] = new() { Name = "current_day", Category = "时间", Description = "当前日期（日）", Example = "24" },
        ["current_hour"] = new() { Name = "current_hour", Category = "时间", Description = "当前小时", Example = "15" },
        ["current_minute"] = new() { Name = "current_minute", Category = "时间", Description = "当前分钟", Example = "30" },
        ["current_timestamp"] = new() { Name = "current_timestamp", Category = "时间", Description = "ISO 8601 时间戳", Example = "2026-05-24T15:30:00+08:00" },
    };

    public IEnumerable<string> SupportedVariables => Definitions.Keys;
    public IEnumerable<VariableDefinition> GetDefinitions() => Definitions.Values;

    public Task<string?> ResolveAsync(string variableName, VariableResolveContext context)
    {
        var now = DateTime.Now;
        var weekday = now.DayOfWeek switch
        {
            DayOfWeek.Sunday => "周日",
            DayOfWeek.Monday => "周一",
            DayOfWeek.Tuesday => "周二",
            DayOfWeek.Wednesday => "周三",
            DayOfWeek.Thursday => "周四",
            DayOfWeek.Friday => "周五",
            DayOfWeek.Saturday => "周六",
            _ => now.DayOfWeek.ToString()
        };

        var value = variableName switch
        {
            "current_datetime" => $"{now:yyyy年M月d日} {weekday} {now:H:mm}",
            "current_date" => now.ToString("yyyy年M月d日"),
            "current_time" => now.ToString("H:mm"),
            "current_weekday" => weekday,
            "current_year" => now.Year.ToString(),
            "current_month" => now.Month.ToString(),
            "current_day" => now.Day.ToString(),
            "current_hour" => now.Hour.ToString(),
            "current_minute" => now.Minute.ToString(),
            "current_timestamp" => now.ToString("yyyy-MM-ddTHH:mm:sszzz"),
            _ => null
        };

        return Task.FromResult(value);
    }
}
