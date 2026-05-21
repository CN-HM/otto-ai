import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const dashboardFeature: AdminFeatureManifest = {
  key: 'dashboard',
  navigation: [{ label: 'menu.dashboard', icon: 'pi pi-home', route: '/dashboard' }],
  protectedRoutes: [
    {
      path: 'dashboard',
      loadComponent: () =>
        import('../../features/dashboard/list/dashboard-page.component').then(m => m.DashboardPageComponent),
      title: 'menu.dashboard'
    }
  ],
  dashboardQuickActions: [
    {
      label: 'menu.users',
      description: 'dashboard.quickAction.users.description',
      route: '/users',
      icon: 'pi pi-users',
      permission: 'user:list'
    },
    {
      label: 'menu.devices',
      description: 'dashboard.quickAction.devices.description',
      route: '/devices',
      icon: 'pi pi-desktop',
      permission: 'device:list',
      roleTabKey: 'devices',
      roleQuickActionKey: 'device.status'
    },
    {
      label: 'menu.agentRoles',
      description: 'dashboard.quickAction.agentRoles.description',
      route: '/agent-roles',
      icon: 'pi pi-microchip-ai',
      permission: 'agent-role:list'
    },
    {
      label: 'menu.datasets',
      description: 'dashboard.quickAction.datasets.description',
      route: '/datasets',
      icon: 'pi pi-database',
      permission: 'dataset:list'
    },
    {
      label: 'menu.memoryLibraries',
      description: 'dashboard.quickAction.memoryLibraries.description',
      route: '/memory-libraries',
      icon: 'pi pi-database',
      permission: 'memory-library:list',
      roleCapabilityKey: 'memory.short_term'
    },
    {
      label: 'menu.billing',
      description: 'dashboard.quickAction.billing.description',
      route: '/billing',
      icon: 'pi pi-wallet',
      permission: 'billing-subscription:list',
      roleCapabilityKey: 'billing.subscription'
    },
    {
      label: 'common.changePassword',
      description: 'dashboard.quickAction.changePassword.description',
      route: '/change-password',
      icon: 'pi pi-key'
    }
  ]
};
