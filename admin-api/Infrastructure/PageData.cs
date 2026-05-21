namespace AiAdmin.Infrastructure;

/// <summary>
/// Paged result data: { total, list }
/// </summary>
public class PageData<T>
{
    public long Total { get; set; }
    public List<T> List { get; set; } = [];
}
