import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const systemFeature: AdminFeatureManifest = {
  key: 'system',
  navigation: [
    {
      label: 'menu.system',
      icon: 'pi pi-cog',
      route: '/system',
      permission: 'sys-param:list',
      roleTabKey: 'settings',
      children: [
        {
          label: 'system.platformConfig',
          icon: 'pi pi-sliders-h',
          route: '/system/params',
          permission: 'sys-param:list',
          roleTabKey: 'settings'
        }
      ]
    }
  ],
  protectedRoutes: [
    {
      path: 'system',
      loadComponent: () =>
        import('../../features/system/params/list/system-params-page.component').then(m => m.SystemParamsPageComponent),
      title: 'menu.system',
      data: {
        title: 'menu.system',
        description: 'system.pageDescription',
        permission: 'sys-param:list',
        roleTabKey: 'settings'
      }
    },
    {
      path: 'system/params',
      loadComponent: () =>
        import('../../features/system/params/list/system-params-page.component').then(m => m.SystemParamsPageComponent),
      title: 'menu.system',
      data: {
        roleTabKey: 'settings'
      }
    },
    {
      path: 'system/roles',
      redirectTo: 'users/roles',
      pathMatch: 'full',
      data: {
        roleTabKey: 'settings'
      }
    },
    {
      path: 'system/roles/new',
      redirectTo: 'users/roles/new',
      pathMatch: 'full',
      data: {
        roleTabKey: 'settings'
      }
    },
    {
      path: 'system/roles/:id/edit',
      redirectTo: 'users/roles/:id/edit',
      data: {
        roleTabKey: 'settings'
      }
    },
    {
      path: 'system/roles/:id/permissions',
      redirectTo: 'users/roles/:id/permissions',
      data: {
        roleTabKey: 'settings'
      }
    }
  ]
};
