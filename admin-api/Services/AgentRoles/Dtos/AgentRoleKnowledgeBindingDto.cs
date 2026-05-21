namespace AiAdmin.Services.AgentRoles.Dtos;

public class AgentRoleKnowledgeBindingDto
{
    public long? Id { get; set; }
    public string? DatasetId { get; set; }
    public string? DatasetName { get; set; }
    public int? Sort { get; set; }
    public bool? Enabled { get; set; }
    public int? TopK { get; set; }
    public double? MinScore { get; set; }
    public bool? RerankEnabled { get; set; }
    public int? MaxChunks { get; set; }
}
