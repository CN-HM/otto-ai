using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private static readonly string[] BuiltInAgentRoleIds =
    [
        "AGENT_ROLE_DefaultOtto"
    ];

    private async Task SeedAgentRoles()
    {
        var obsolete = await _db.AiAgentRoles
            .Where(x => BuiltInAgentRoleIds.Contains(x.Id))
            .ToListAsync();
        if (obsolete.Count == 0)
            return;

        var obsoleteIds = obsolete.Select(x => x.Id).ToArray();

        await _db.AiDevices
            .Where(x => x.AgentRoleId != null && obsoleteIds.Contains(x.AgentRoleId))
            .ExecuteUpdateAsync(setters => setters
                .SetProperty(x => x.AgentRoleId, (string?)null)
                .SetProperty(x => x.AgentRoleReleaseId, (string?)null));

        await _db.AiMemoryLibraries
            .Where(x => x.AgentId != null && obsoleteIds.Contains(x.AgentId))
            .ExecuteUpdateAsync(setters => setters.SetProperty(x => x.AgentId, (string?)null));

        await _db.AiAgentRolePluginMappings
            .Where(x => obsoleteIds.Contains(x.AgentRoleId))
            .ExecuteDeleteAsync();
        await _db.AiAgentRoleContextProviders
            .Where(x => obsoleteIds.Contains(x.AgentRoleId))
            .ExecuteDeleteAsync();
        await _db.AiAgentRoleKnowledgeBindings
            .Where(x => obsoleteIds.Contains(x.AgentRoleId))
            .ExecuteDeleteAsync();
        await _db.AiAgentRoleReleases
            .Where(x => obsoleteIds.Contains(x.RoleId))
            .ExecuteDeleteAsync();

        _db.AiAgentRoles.RemoveRange(obsolete);

        await _db.SaveChangesAsync();
    }
}
