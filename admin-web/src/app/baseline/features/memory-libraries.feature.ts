import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const memoryLibrariesFeature: AdminFeatureManifest = {
  key: 'memory-libraries',
  navigation: [
    {
      label: '记忆与信号',
      icon: 'pi pi-database',
      route: '/memory-libraries',
      permission: 'memory-library:list',
      roleCapabilityKey: 'memory.short_term',
      children: [
        {
          label: '运行时信号',
          icon: 'pi pi-bell',
          route: '/runtime-signals',
          permission: 'memory-library:list',
          roleCapabilityKey: 'memory.short_term'
        }
      ]
    }
  ],
  protectedRoutes: [
    {
      path: 'memory-libraries',
      loadComponent: () =>
        import('../../features/memory-libraries/list/memory-libraries-page.component').then(
          m => m.MemoryLibrariesPageComponent
        ),
      title: 'menu.memoryLibraries',
      data: {
        title: 'menu.memoryLibraries',
        description: 'memoryLibraries.pageDescription',
        roleCapabilityKey: 'memory.short_term'
      }
    },
    {
      path: 'runtime-signals',
      loadComponent: () =>
        import('../../features/memory-libraries/signals/runtime-signals-page.component').then(
          m => m.RuntimeSignalsPageComponent
        ),
      title: '运行时信号',
      data: {
        title: '运行时信号',
        description: '风险、健康、待办和提醒信号核对',
        roleCapabilityKey: 'memory.short_term'
      }
    },
    {
      path: 'memory-libraries/:id',
      loadComponent: () =>
        import('../../features/memory-libraries/detail/memory-library-detail-page.component').then(
          m => m.MemoryLibraryDetailPageComponent
        ),
      title: 'memoryLibraries.detail',
      data: {
        roleCapabilityKey: 'memory.short_term'
      }
    }
  ]
};
