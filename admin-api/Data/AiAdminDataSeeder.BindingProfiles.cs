using System.Text.Json;
using System.Text.Json.Nodes;
using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private static readonly string[] BuiltInPipelineTemplateIds =
    [
        "PIPELINE_DefaultVoiceChain"
    ];

    private static readonly string[] BuiltInEmbeddingProfileIds =
    [
        "EMBEDDING_DoubaoVision"
    ];

    private async Task SeedPipelineTemplates()
    {
        var now = DateTime.UtcNow;
        var templates = new List<AiPipelineTemplate>
        {
            new()
            {
                Id = "PIPELINE_DefaultVoiceChain",
                Code = "default_voice_chain",
                Name = "默认语音对话链路",
                Description = "标准 VAD -> ASR -> LLM -> TTS 语音对话编排。",
                Status = "active",
                IsSystem = true,
                IsDefault = true,
                GraphJson = "{\"version\":1,\"nodes\":[{\"key\":\"vad\",\"type\":\"VAD\"},{\"key\":\"asr\",\"type\":\"ASR\"},{\"key\":\"llm\",\"type\":\"LLM\"},{\"key\":\"tts\",\"type\":\"TTS\"}],\"edges\":[{\"from\":\"vad\",\"to\":\"asr\"},{\"from\":\"asr\",\"to\":\"llm\"},{\"from\":\"llm\",\"to\":\"tts\"}]}",
                Sort = 1,
                CreatedAt = now,
                UpdatedAt = now
            }
        };

        var retainedIds = templates.Select(x => x.Id).ToArray();
        var obsolete = await _db.AiPipelineTemplates
            .Where(x => BuiltInPipelineTemplateIds.Contains(x.Id) && !retainedIds.Contains(x.Id))
            .ToListAsync();
        if (obsolete.Count > 0)
            _db.AiPipelineTemplates.RemoveRange(obsolete);

        var existing = await _db.AiPipelineTemplates
            .Where(x => retainedIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id);

        foreach (var template in templates)
        {
            if (existing.TryGetValue(template.Id, out var current))
            {
                current.Code = template.Code;
                current.Name = template.Name;
                current.Description = template.Description;
                current.Status = template.Status;
                current.IsSystem = template.IsSystem;
                current.GraphJson = template.GraphJson;
                current.Sort = template.Sort;
                current.UpdatedAt = now;
                continue;
            }

            _db.AiPipelineTemplates.Add(template);
        }

        var pipelineTemplates = await _db.AiPipelineTemplates.ToListAsync();
        foreach (var pipelineTemplate in pipelineTemplates)
        {
            if (!TryStripPipelineProfileBindings(pipelineTemplate.GraphJson, out var graphJson))
                continue;

            pipelineTemplate.GraphJson = graphJson;
            pipelineTemplate.UpdatedAt = now;
        }

        await _db.SaveChangesAsync();
    }

    private static bool TryStripPipelineProfileBindings(string? graphJson, out string normalizedGraphJson)
    {
        normalizedGraphJson = string.IsNullOrWhiteSpace(graphJson) ? "{}" : graphJson;

        try
        {
            var node = JsonNode.Parse(normalizedGraphJson);
            if (node is not JsonObject jsonObject || !jsonObject.Remove("profileBindings"))
                return false;

            normalizedGraphJson = jsonObject.ToJsonString();
            return true;
        }
        catch (JsonException)
        {
            return false;
        }
    }

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
                IntegrationId = DoubaoDefaultProviderIntegrationId,
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
