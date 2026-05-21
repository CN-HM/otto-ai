import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const agentRolesFeature: AdminFeatureManifest = {
  key: 'agent-roles',
  navigation: [
    {
      label: 'menu.agentRoles',
      icon: 'pi pi-bolt',
      route: '/agent-roles',
      permission: 'agent-role:list'
    }
  ],
  protectedRoutes: [
    {
      path: 'agent-roles',
      loadComponent: () =>
        import('../../features/agent-roles/list/agent-roles-page.component').then(m => m.AgentRolesPageComponent),
      title: 'menu.agentRoles',
      data: {
        title: 'menu.agentRoles',
        description: 'agentRoles.pageDescription',
        permission: 'agent-role:list'
      }
    },
    {
      path: 'agent-roles/:id/runtime-test',
      loadComponent: () =>
        import('../../features/agent-roles/runtime-test/agent-role-runtime-test-page.component').then(
          m => m.AgentRoleRuntimeTestPageComponent
        ),
      title: '智能体链路测试',
      data: {
        permission: 'agent-role:list'
      }
    },
    {
      path: 'agent-roles/new',
      loadComponent: () =>
        import('../../features/agent-roles/form/agent-role-form-page.component').then(
          m => m.AgentRoleFormPageComponent
        ),
      title: 'agentRoles.new',
      data: {
        permission: 'agent-role:create'
      }
    },
    {
      path: 'agent-roles/:id/edit',
      loadComponent: () =>
        import('../../features/agent-roles/form/agent-role-form-page.component').then(
          m => m.AgentRoleFormPageComponent
        ),
      title: 'agentRoles.edit',
      data: {
        permission: 'agent-role:update'
      }
    }
  ]
};
