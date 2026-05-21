using System.Text.Json.Nodes;
using AiAdmin.Entities;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class ModelExecutionConfigDto
{
    public string ProfileId { get; set; } = string.Empty;
    public string? ModelType { get; set; }
    public string? ModelCode { get; set; }
    public string? ModelName { get; set; }
    public string? ProviderCode { get; set; }
    public ProviderType? ProviderType { get; set; }
    public string? ProviderName { get; set; }
    public string? ProviderEndpoint { get; set; }
    public JsonObject? ConfigObject { get; set; }
    public string? RawConfigJson { get; set; }
}
