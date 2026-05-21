import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const todosFeature: AdminFeatureManifest = {
  key: 'todos',
  navigation: [
    {
      label: '待办事项',
      icon: 'pi pi-check-square',
      route: '/todos',
      permission: 'memory-library:list',
      roleCapabilityKey: 'memory.short_term'
    }
  ],
  protectedRoutes: [
    {
      path: 'todos',
      loadComponent: () => import('../../features/todos/todos-page.component').then(m => m.TodosPageComponent),
      title: '待办事项',
      data: {
        title: '待办事项',
        description: '管理对话过程中生成的待办任务，支持完成、忽略和删除。',
        roleCapabilityKey: 'memory.short_term'
      }
    }
  ]
};
