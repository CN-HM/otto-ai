using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private async Task SeedVadProfiles()
    {
        var now = DateTime.UtcNow;
        var profiles = new List<AiVadProfile>
        {
            new()
            {
                Id = "VAD_SileroVAD",
                Name = "语音活动检测",
                Description = "SileroVAD 本地语音活动检测，无需网络连接。",
                Status = "active",
                IsEnabled = true,
                IsDefault = true,
                ModelDir = "models/snakers4_silero-vad",
                Threshold = 0.5,
                MinSilenceDurationMs = 700,
                Sort = 1,
                CreatedAt = now,
                UpdatedAt = now
            }
        };

        var retainedIds = profiles.Select(x => x.Id).ToArray();
        var existingProfiles = await _db.AiVadProfiles
            .Where(x => retainedIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id);

        foreach (var profile in profiles)
        {
            if (existingProfiles.TryGetValue(profile.Id, out var existing))
            {
                existing.Name = profile.Name;
                existing.Description = profile.Description;
                existing.Status = profile.Status;
                existing.IsEnabled = profile.IsEnabled;
                existing.IsDefault = profile.IsDefault;
                existing.ModelDir = profile.ModelDir;
                existing.Threshold = profile.Threshold;
                existing.MinSilenceDurationMs = profile.MinSilenceDurationMs;
                existing.SpeechPadMs = profile.SpeechPadMs;
                existing.Sort = profile.Sort;
                existing.UpdatedAt = now;
                continue;
            }

            _db.AiVadProfiles.Add(profile);
        }

        await _db.SaveChangesAsync();
    }
}
