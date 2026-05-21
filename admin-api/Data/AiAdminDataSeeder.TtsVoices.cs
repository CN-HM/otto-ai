using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private static readonly string[] BuiltInTtsVoiceIds =
    [
        // "TTS_EdgeTTS0002",
        // "TTS_EdgeTTS0003",
        // "TTS_EdgeTTS0004",
        // "TTS_EdgeTTS0001",
        // "TTS_EdgeTTS0005",
        // "TTS_EdgeTTS0006",
        // "TTS_EdgeTTS0007",
        // "TTS_EdgeTTS0008",
        // "TTS_EdgeTTS0009",
        // "TTS_EdgeTTS0010",
        // "TTS_EdgeTTS0011",
        // "TTS_CosyVoiceSiliconflow0001",
        // "TTS_CosyVoiceSiliconflow0002",
        "TTS_AliyunTTS0001",
        "TTS_AliyunTTS0002",
        "TTS_DoubaoTTS0001",
        "TTS_DoubaoTTS0002"
    ];

    private async Task SeedTtsVoices()
    {
        var voices = new List<AiTtsVoice>
        {
            // new() { Id = "TTS_AliyunTTS0002", TtsProfileId = "TTS_AliyunTTS", Name = "阿里云小刚", TtsVoice = "xiaogang", Languages = "普通话", Sort = 2 },
            // new() { Id = "TTS_DoubaoTTS0001", TtsProfileId = "TTS_DoubaoTTS", Name = "豆包灿灿", TtsVoice = "zh_female_cancan_mars_bigtts", Languages = "普通话", Sort = 1 },
            // new() { Id = "TTS_DoubaoTTS0002", TtsProfileId = "TTS_DoubaoTTS", Name = "豆包双快思思", TtsVoice = "zh_female_shuangkuaisisi_moon_bigtts", Languages = "普通话", Sort = 2 },
            // new() { Id = "TTS_AliyunTTS0001", TtsProfileId = "TTS_AliyunTTS", Name = "阿里云小云", TtsVoice = "xiaoyun", Languages = "普通话", Sort = 1 },
        };

        var retainedIds = voices.Select(x => x.Id).ToArray();
        await RemoveObsoleteTtsVoices(retainedIds);

        var existingVoices = await _db.AiTtsVoices
            .Where(x => retainedIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id);

        foreach (var voice in voices)
        {
            if (existingVoices.TryGetValue(voice.Id, out var existing))
            {
                UpdateTtsVoice(existing, voice);
                continue;
            }

            _db.AiTtsVoices.Add(voice);
        }

        await _db.SaveChangesAsync();
    }

    private async Task RemoveObsoleteTtsVoices(string[] retainedIds)
    {
        var obsoleteVoices = await _db.AiTtsVoices
            .Where(x => BuiltInTtsVoiceIds.Contains(x.Id) && !retainedIds.Contains(x.Id))
            .ToListAsync();
        if (obsoleteVoices.Count == 0)
            return;

        _db.AiTtsVoices.RemoveRange(obsoleteVoices);
        await _db.SaveChangesAsync();
    }

    private static void UpdateTtsVoice(AiTtsVoice target, AiTtsVoice source)
    {
        target.TtsProfileId = source.TtsProfileId;
        target.Name = source.Name;
        target.TtsVoice = source.TtsVoice;
        target.Languages = source.Languages;
        target.Sort = source.Sort;
    }
}
