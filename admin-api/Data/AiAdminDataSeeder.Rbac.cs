using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private async Task SeedRbac()
    {
        var now = DateTime.UtcNow;
        var roleSeeds = new[]
        {
            new { PreferredId = 1L, Name = "超级管理员", Code = "admin", Remark = "拥有所有权限", Status = (short)1, Sort = 0 },
            new { PreferredId = 2L, Name = "普通用户", Code = "user", Remark = "默认角色，仅可管理自己的数据", Status = (short)1, Sort = 1 }
        };

        var existingRoles = await _db.SysRoles
            .Where(x => roleSeeds.Select(seed => seed.Code).Contains(x.Code))
            .ToListAsync();
        var usedRoleIds = await _db.SysRoles.Select(x => x.Id).ToHashSetAsync();
        var nextRoleId = usedRoleIds.Count == 0 ? 1L : usedRoleIds.Max() + 1;

        foreach (var seed in roleSeeds)
        {
            if (existingRoles.Any(x => x.Code == seed.Code))
                continue;

            var role = new SysRole
            {
                Id = AllocateLongId(usedRoleIds, ref nextRoleId, seed.PreferredId),
                Name = seed.Name,
                Code = seed.Code,
                Remark = seed.Remark,
                Status = seed.Status,
                Sort = seed.Sort,
                CreateDate = now,
                UpdateDate = now
            };

            existingRoles.Add(role);
            _db.SysRoles.Add(role);
        }

        if (_db.ChangeTracker.HasChanges())
            await _db.SaveChangesAsync();

        var roleMap = existingRoles.ToDictionary(x => x.Code, x => x);
        var adminRole = roleMap["admin"];
        var userRole = roleMap["user"];

        (long PreferredId, string? ParentCode, string Name, string Code, short Type, int Sort, short Status)[] menuSeeds =
        {
            (1L, null, "工作台", "dashboard", (short)1, 0, (short)1),
            (3L, null, "用户管理", "user:list", (short)1, 1, (short)1),
            (8L, "user:list", "角色管理", "role:list", (short)1, 0, (short)1),
            (9L, "role:list", "新增角色", "role:create", (short)2, 0, (short)1),
            (10L, "role:list", "编辑角色", "role:update", (short)2, 1, (short)1),
            (11L, "role:list", "删除角色", "role:delete", (short)2, 2, (short)1),
            (12L, "role:list", "分配权限", "role:assign-permission", (short)2, 3, (short)1),
            (13L, "user:list", "审计日志", "audit-log:list", (short)1, 1, (short)1),
            (4L, "user:list", "重置密码", "user:reset-password", (short)2, 10, (short)1),
            (5L, "user:list", "删除用户", "user:delete", (short)2, 11, (short)1),
            (6L, "user:list", "修改状态", "user:change-status", (short)2, 12, (short)1),
            (7L, "user:list", "分配角色", "user:assign-role", (short)2, 13, (short)1),
            (14L, null, "智能体中心", "agent:list", (short)1, 2, (short)1),
            (15L, "agent:list", "新增智能体", "agent:create", (short)2, 0, (short)1),
            (16L, "agent:list", "编辑智能体", "agent:update", (short)2, 1, (short)1),
            (17L, "agent:list", "删除智能体", "agent:delete", (short)2, 2, (short)1),
            (18L, "agent:list", "智能体模板", "agent-template:list", (short)1, 3, (short)1),
            (19L, "agent-template:list", "编辑模板", "agent-template:update", (short)2, 0, (short)1),
            (22L, null, "设备中心", "device:list", (short)1, 3, (short)1),
            (23L, "device:list", "设备绑定", "device:bind", (short)2, 0, (short)1),
            (24L, "device:list", "设备解绑", "device:unbind", (short)2, 1, (short)1),
            (25L, "device:list", "OTA管理", "ota:list", (short)1, 2, (short)1),
            (26L, "ota:list", "新增OTA", "ota:create", (short)2, 0, (short)1),
            (27L, "ota:list", "删除OTA", "ota:delete", (short)2, 1, (short)1),
            (28L, null, "模型中心", "model-config:list", (short)1, 4, (short)1),
            (29L, "model-config:list", "新增模型配置", "model-config:create", (short)2, 0, (short)1),
            (30L, "model-config:list", "删除模型配置", "model-config:delete", (short)2, 1, (short)1),
            (31L, "model-config:list", "模型供应商", "model-provider:list", (short)1, 2, (short)1),
            (32L, "model-provider:list", "新增供应商", "model-provider:create", (short)2, 0, (short)1),
            (33L, "model-provider:list", "删除供应商", "model-provider:delete", (short)2, 1, (short)1),
            (34L, null, "知识库中心", "dataset:list", (short)1, 5, (short)1),
            (35L, "dataset:list", "新增知识库", "dataset:create", (short)2, 0, (short)1),
            (36L, "dataset:list", "删除知识库", "dataset:delete", (short)2, 1, (short)1),
            (37L, null, "音色中心", "voice:list", (short)1, 6, (short)1),
            (38L, "voice:list", "新增音色", "voice:create", (short)2, 0, (short)1),
            (39L, "voice:list", "删除音色", "voice:delete", (short)2, 1, (short)1),
            (40L, "voice:list", "音色资源", "voice-resource:list", (short)1, 2, (short)1),
            (41L, "voice:list", "声音克隆", "voice-clone:list", (short)1, 3, (short)1),
            (46L, null, "计费中心", "billing-plan:list", (short)1, 7, (short)1),
            (47L, "billing-plan:list", "订阅管理", "billing-subscription:list", (short)1, 0, (short)1),
            (48L, "billing-subscription:list", "人工调额", "billing-subscription:manual-adjust", (short)2, 0, (short)1),
            (49L, "billing-plan:list", "用量明细", "billing-usage:list", (short)1, 1, (short)1),
            (50L, "billing-plan:list", "订单管理", "billing-order:list", (short)1, 2, (short)1),
            (51L, "billing-order:list", "确认支付", "billing-order:mark-paid", (short)2, 0, (short)1),
            (57L, null, "智能体角色", "agent-role:list", (short)1, 8, (short)1),
            (58L, "agent-role:list", "新增智能体角色", "agent-role:create", (short)2, 0, (short)1),
            (59L, "agent-role:list", "编辑智能体角色", "agent-role:update", (short)2, 1, (short)1),
            (60L, "agent-role:list", "删除智能体角色", "agent-role:delete", (short)2, 2, (short)1),
            (61L, "agent-role:list", "发布智能体角色", "agent-role:publish", (short)2, 3, (short)1),
            (62L, null, "MCP 工具中心", "mcp-tool:list", (short)1, 9, (short)1),
            (63L, "mcp-tool:list", "新增 MCP 工具", "mcp-tool:create", (short)2, 0, (short)1),
            (64L, "mcp-tool:list", "编辑 MCP 工具", "mcp-tool:update", (short)2, 1, (short)1),
            (65L, "mcp-tool:list", "删除 MCP 工具", "mcp-tool:delete", (short)2, 2, (short)1),
            (42L, null, "系统设置", "system", (short)0, 7, (short)1),
            (43L, "system", "平台配置", "sys-param:list", (short)1, 0, (short)1),
            (44L, "sys-param:list", "保存配置", "sys-param:create", (short)2, 0, (short)1)
        };

        var menuSeedCodes = menuSeeds.Select(seed => seed.Code).ToHashSet();
        var obsoleteMenuCodes = new HashSet<string>
        {
            "user-manage",
            "dict-type:list",
            "dict-type:create",
            "dict-type:delete",
            "dict-data:list",
            "sys-param:delete",
            "product-role:list",
            "product-role:create",
            "product-role:update",
            "product-role:delete",
            "product-role:publish"
        };

        var existingMenus = await _db.SysMenus
            .Where(x => menuSeedCodes.Contains(x.Code) || obsoleteMenuCodes.Contains(x.Code))
            .ToListAsync();
        var usedMenuIds = await _db.SysMenus.Select(x => x.Id).ToHashSetAsync();
        var nextMenuId = usedMenuIds.Count == 0 ? 1L : usedMenuIds.Max() + 1;

        foreach (var seed in menuSeeds)
        {
            if (existingMenus.Any(x => x.Code == seed.Code))
                continue;

            var parentId = seed.ParentCode == null
                ? (long?)null
                : existingMenus.FirstOrDefault(x => x.Code == seed.ParentCode)?.Id;

            var menu = new SysMenu
            {
                Id = AllocateLongId(usedMenuIds, ref nextMenuId, seed.PreferredId),
                ParentId = parentId,
                Name = seed.Name,
                Code = seed.Code,
                Type = seed.Type,
                Sort = seed.Sort,
                Status = seed.Status
            };

            existingMenus.Add(menu);
            _db.SysMenus.Add(menu);
        }

        if (_db.ChangeTracker.HasChanges())
            await _db.SaveChangesAsync();

        var menuMap = existingMenus
            .Where(x => menuSeedCodes.Contains(x.Code))
            .ToDictionary(x => x.Code, x => x);
        var menusChanged = false;

        foreach (var seed in menuSeeds)
        {
            var menu = menuMap[seed.Code];
            var parentId = seed.ParentCode == null ? (long?)null : menuMap[seed.ParentCode].Id;

            if (menu.ParentId == parentId &&
                menu.Name == seed.Name &&
                menu.Type == seed.Type &&
                menu.Sort == seed.Sort &&
                menu.Status == seed.Status)
            {
                continue;
            }

            menu.ParentId = parentId;
            menu.Name = seed.Name;
            menu.Type = seed.Type;
            menu.Sort = seed.Sort;
            menu.Status = seed.Status;
            menusChanged = true;
        }

        var obsoleteMenus = existingMenus.Where(x => obsoleteMenuCodes.Contains(x.Code)).ToList();
        if (obsoleteMenus.Count > 0)
        {
            var obsoleteMenuIds = obsoleteMenus.Select(x => x.Id).ToHashSet();
            var obsoleteRoleMenus = await _db.SysRoleMenus
                .Where(x => obsoleteMenuIds.Contains(x.MenuId))
                .ToListAsync();

            if (obsoleteRoleMenus.Count > 0)
            {
                _db.SysRoleMenus.RemoveRange(obsoleteRoleMenus);
                menusChanged = true;
            }

            _db.SysMenus.RemoveRange(obsoleteMenus);
            existingMenus.RemoveAll(x => obsoleteMenuCodes.Contains(x.Code));
            menusChanged = true;
        }

        if (menusChanged)
            await _db.SaveChangesAsync();

        var menus = existingMenus.Where(x => menuSeedCodes.Contains(x.Code)).ToList();
        var existingRoleMenuKeys = await _db.SysRoleMenus
            .Select(x => $"{x.RoleId}|{x.MenuId}")
            .ToHashSetAsync();
        var usedRoleMenuIds = await _db.SysRoleMenus.Select(x => x.Id).ToHashSetAsync();
        var nextRoleMenuId = usedRoleMenuIds.Count == 0 ? 1L : usedRoleMenuIds.Max() + 1;
        var missingRoleMenus = new List<SysRoleMenu>();

        foreach (var menu in menus)
        {
            var key = $"{adminRole.Id}|{menu.Id}";
            if (!existingRoleMenuKeys.Add(key))
                continue;

            missingRoleMenus.Add(new SysRoleMenu
            {
                Id = AllocateLongId(usedRoleMenuIds, ref nextRoleMenuId, menu.Id),
                RoleId = adminRole.Id,
                MenuId = menu.Id
            });
        }

        var userMenuCodes = new HashSet<string>
        {
            "dashboard", "device:list", "agent:list", "agent:create", "agent:update",
            "agent-template:list",
            "model-config:list", "model-provider:list",
            "dataset:list", "dataset:create",
            "voice:list", "voice:create", "voice-resource:list", "voice-clone:list"
        };

        foreach (var menu in menus.Where(m => userMenuCodes.Contains(m.Code)))
        {
            var key = $"{userRole.Id}|{menu.Id}";
            if (!existingRoleMenuKeys.Add(key))
                continue;

            missingRoleMenus.Add(new SysRoleMenu
            {
                Id = AllocateLongId(usedRoleMenuIds, ref nextRoleMenuId, nextRoleMenuId),
                RoleId = userRole.Id,
                MenuId = menu.Id
            });
        }

        if (missingRoleMenus.Count > 0)
        {
            _db.SysRoleMenus.AddRange(missingRoleMenus);
            await _db.SaveChangesAsync();
        }

        var existingUserRoleKeys = await _db.SysUserRoles
            .Select(x => $"{x.UserId}|{x.RoleId}")
            .ToHashSetAsync();
        var adminUserRoleKey = $"1|{adminRole.Id}";
        if (existingUserRoleKeys.Contains(adminUserRoleKey))
            return;

        var usedUserRoleIds = await _db.SysUserRoles.Select(x => x.Id).ToHashSetAsync();
        var nextUserRoleId = usedUserRoleIds.Count == 0 ? 1L : usedUserRoleIds.Max() + 1;
        _db.SysUserRoles.Add(new SysUserRole
        {
            Id = AllocateLongId(usedUserRoleIds, ref nextUserRoleId, 1),
            UserId = 1,
            RoleId = adminRole.Id
        });

        await _db.SaveChangesAsync();
    }
}
