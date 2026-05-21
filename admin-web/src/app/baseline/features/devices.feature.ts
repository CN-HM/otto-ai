import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const devicesFeature: AdminFeatureManifest = {
  key: 'devices',
  navigation: [
    {
      label: 'menu.devices',
      icon: 'pi pi-desktop',
      route: '/devices',
      permission: 'device:list',
      roleTabKey: 'devices',
      children: [
        {
          label: 'devices.ota',
          icon: 'pi pi-cloud-upload',
          route: '/devices/ota',
          permission: 'ota:list',
          roleTabKey: 'devices'
        }
      ]
    }
  ],
  protectedRoutes: [
    {
      path: 'devices',
      loadComponent: () =>
        import('../../features/devices/list/devices-page.component').then(m => m.DevicesPageComponent),
      title: 'menu.devices',
      data: {
        title: 'menu.devices',
        description: 'devices.pageDescription',
        roleTabKey: 'devices'
      }
    },
    {
      path: 'devices/ota',
      loadComponent: () =>
        import('../../features/devices/ota/ota-list-page.component').then(m => m.OtaListPageComponent),
      title: 'devices.ota',
      data: {
        roleTabKey: 'devices'
      }
    },
    {
      path: 'devices/ota/new',
      loadComponent: () =>
        import('../../features/devices/ota/ota-form-page.component').then(m => m.OtaFormPageComponent),
      title: 'devices.otaNew',
      data: {
        roleTabKey: 'devices'
      }
    },
    {
      path: 'devices/ota/:id',
      loadComponent: () =>
        import('../../features/devices/ota/ota-detail-page.component').then(m => m.OtaDetailPageComponent),
      title: 'devices.otaDetail',
      data: {
        roleTabKey: 'devices'
      }
    },
    {
      path: 'devices/ota/:id/edit',
      loadComponent: () =>
        import('../../features/devices/ota/ota-form-page.component').then(m => m.OtaFormPageComponent),
      title: 'devices.otaEdit',
      data: {
        roleTabKey: 'devices'
      }
    },
    {
      path: 'devices/:id',
      loadComponent: () =>
        import('../../features/devices/list/device-detail-page.component').then(m => m.DeviceDetailPageComponent),
      title: 'devices.detail',
      data: {
        roleTabKey: 'devices'
      }
    }
  ]
};
