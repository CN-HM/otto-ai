namespace AiAdmin.Services.BindingConfigs.Dtos;

public class BindingConfigListQuery
{
    public string? Keyword { get; set; }
    public string? Status { get; set; }
    public int? Page { get; set; }
    public int? Limit { get; set; }
}
