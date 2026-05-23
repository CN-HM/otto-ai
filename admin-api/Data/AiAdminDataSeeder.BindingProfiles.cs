using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private static readonly string[] BuiltInEmbeddingProfileIds =
    [
        "EMBEDDING_DoubaoVision"
    ];

    private async Task SeedEmbeddingProfiles()
    {
        var now = DateTime.UtcNow;
        var profiles = new List<AiEmbeddingProfile>
        {
            new()
            {
                Id = "EMBEDDING_DoubaoVision",
                Name = "豆包向量模型（知识库/记忆库）",
                Description = "知识库与记忆库默认向量模型：豆包 Embedding，运行时读取绑定的 Integration API Key 调用火山方舟 embedding 接口。",
                Status = "active",
                IsEnabled = true,
                IsDefault = true,
                Endpoint = "https://ark.cn-beijing.volces.com/api/v3/embeddings/multimodal",
                IntegrationId = ArkDefaultProviderIntegrationId,
                Model = "doubao-embedding-vision-251215",
                Dimension = 1024,
                Sort = 1,
                CreatedAt = now,
                UpdatedAt = now
            }
        };

        var retainedIds = profiles.Select(x => x.Id).ToArray();
        var obsolete = await _db.AiEmbeddingProfiles
            .Where(x => BuiltInEmbeddingProfileIds.Contains(x.Id) && !retainedIds.Contains(x.Id))
            .ToListAsync();
        if (obsolete.Count > 0)
            _db.AiEmbeddingProfiles.RemoveRange(obsolete);

        var existing = await _db.AiEmbeddingProfiles
            .Where(x => retainedIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id);

        foreach (var profile in profiles)
        {
            if (existing.TryGetValue(profile.Id, out var current))
            {
                current.Name = profile.Name;
                current.Description = profile.Description;
                current.Status = profile.Status;
                current.IsEnabled = profile.IsEnabled;
                current.IsDefault = profile.IsDefault;
                current.Endpoint = profile.Endpoint;
                current.IntegrationId = profile.IntegrationId;
                current.Model = profile.Model;
                current.Dimension = profile.Dimension;
                current.Sort = profile.Sort;
                current.UpdatedAt = now;
                continue;
            }

            _db.AiEmbeddingProfiles.Add(profile);
        }

        await _db.SaveChangesAsync();
    }
}
