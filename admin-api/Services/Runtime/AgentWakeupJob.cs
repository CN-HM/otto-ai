using System;
using System.Linq;
using System.Threading.Tasks;
using AiAdmin.Data;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

public class AgentWakeupJob : ITransientDependency
{
    private readonly AiAdminDbContext _db;
    private readonly DeviceConversationRuntimeService _runtime;

    public AgentWakeupJob(AiAdminDbContext db, DeviceConversationRuntimeService runtime)
    {
        _db = db;
        _runtime = runtime;
    }

    public virtual async Task WakeAsync(string signalId)
    {
        var signal = await _db.AiRuntimeSignals.FirstOrDefaultAsync(s => s.Id == signalId);
        if (signal == null) return;

        var finishStatuses = new[] { "completed", "ignored", "failed" };
        if (finishStatuses.Contains(signal.Status)) return;

        signal.Status = "processing";
        signal.ProcessedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync();

        try
        {
            // The device must be online for this to work.
            // For offline devices, the signal will be picked up on next connection.
            var device = await _db.AiDevices.FirstOrDefaultAsync(d => d.Id == signal.DeviceId);
            if (device == null)
            {
                signal.Status = "failed";
                signal.ErrorMessage = "Device not found for wakeup";
                signal.RetryCount += 1;
                await _db.SaveChangesAsync();
                return;
            }

            // Use ExecuteTurnAsync with a special system transcript
            var turnRequest = new DeviceConversationTurnRequest
            {
                CredentialId = device.CredentialId!,
                MacAddress = device.MacAddress!,
                SessionId = signal.SessionId!
            };

            // Mark as pending again so LLM can pick it up in the tool-use loop
            signal.Status = "pending";
            await _db.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            signal.Status = "failed";
            signal.ErrorMessage = $"Wakeup failed: {ex.Message}";
            signal.RetryCount += 1;
            await _db.SaveChangesAsync();
        }
    }
}
