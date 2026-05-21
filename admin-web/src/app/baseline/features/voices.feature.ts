import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const voicesFeature: AdminFeatureManifest = {
  key: 'voices',
  navigation: [
    {
      label: 'menu.voices',
      icon: 'pi pi-volume-up',
      route: '/voices',
      permission: 'voice:list'
    }
  ],
  protectedRoutes: [
    {
      path: 'voices',
      loadComponent: () => import('../../features/voices/list/voices-page.component').then(m => m.VoicesPageComponent),
      title: 'menu.voices',
      data: {
        title: 'menu.voices',
        description: 'voices.pageDescription'
      }
    },
    {
      path: 'voices/new',
      loadComponent: () =>
        import('../../features/voices/list/voice-form-page.component').then(m => m.VoiceFormPageComponent),
      title: 'voices.new'
    },
    {
      path: 'voices/:id/edit',
      loadComponent: () =>
        import('../../features/voices/list/voice-form-page.component').then(m => m.VoiceFormPageComponent),
      title: 'voices.edit'
    }
  ]
};
