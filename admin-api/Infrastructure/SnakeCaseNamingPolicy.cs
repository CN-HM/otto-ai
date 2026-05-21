using System.Text.Json;

namespace AiAdmin.Infrastructure;

/// <summary>
/// JSON naming policy: PascalCase → camelCase (default System.Text.Json behavior).
/// The frontend expects camelCase property names.
/// </summary>
public static class JsonDefaults
{
    /// <summary>
    /// 默认JSON序列化选项：使用camelCase命名策略，序列化时忽略null值
    /// </summary>
    public static readonly JsonSerializerOptions CamelCase = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
        DefaultIgnoreCondition = System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull
    };
}
