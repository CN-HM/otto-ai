import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const usersFeature: AdminFeatureManifest = {
  key: 'users',
  navigation: [
    {
      label: 'menu.users',
      icon: 'pi pi-users',
      route: '/users',
      permission: 'user:list',
      children: [
        { label: 'users.roles', icon: 'pi pi-shield', route: '/users/roles', permission: 'role:list' },
        { label: 'menu.auditLogs', icon: 'pi pi-history', route: '/users/audit-logs', permission: 'audit-log:list' }
      ]
    }
  ],
  protectedRoutes: [
    {
      path: 'users',
      loadComponent: () =>
        import('../../features/system/users/list/users-page.component').then(m => m.UsersPageComponent),
      title: 'menu.users',
      data: {
        title: 'menu.users',
        description: 'users.pageDescription',
        permission: 'user:list'
      }
    },
    {
      path: 'users/roles',
      loadComponent: () =>
        import('../../features/system/roles/list/roles-page.component').then(m => m.RolesPageComponent),
      title: 'users.roles',
      data: {
        title: 'users.roles',
        permission: 'role:list'
      }
    },
    {
      path: 'users/roles/new',
      loadComponent: () =>
        import('../../features/system/roles/form/role-form-page.component').then(m => m.RoleFormPageComponent),
      title: 'users.newRole'
    },
    {
      path: 'users/roles/:id/edit',
      loadComponent: () =>
        import('../../features/system/roles/form/role-form-page.component').then(m => m.RoleFormPageComponent),
      title: 'users.editRole'
    },
    {
      path: 'users/roles/:id/permissions',
      loadComponent: () =>
        import('../../features/system/roles/form/role-permissions-page.component').then(
          m => m.RolePermissionsPageComponent
        ),
      title: 'users.rolePermissions'
    },
    {
      path: 'users/audit-logs',
      loadComponent: () =>
        import('../../features/system/audit-logs/list/audit-logs-page.component').then(m => m.AuditLogsPageComponent),
      title: 'menu.auditLogs',
      data: {
        title: 'menu.auditLogs',
        permission: 'audit-log:list'
      }
    }
  ]
};
