import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const bindingConfigsFeature: AdminFeatureManifest = {
  key: 'binding-configs',
  navigation: [
    {
      label: 'menu.bindingConfigs',
      icon: 'pi pi-sliders-h',
      route: '/binding-configs/pipeline',
      permission: 'agent-role:list',
      children: [
        {
          label: 'bindingConfigs.integration',
          icon: 'pi pi-key',
          route: '/binding-configs/integration',
          permission: 'agent-role:list'
        },
        {
          label: 'bindingConfigs.asr',
          icon: 'pi pi-microphone',
          route: '/binding-configs/asr',
          permission: 'agent-role:list'
        },
        {
          label: 'bindingConfigs.vad',
          icon: 'pi pi-wave-pulse',
          route: '/binding-configs/vad',
          permission: 'agent-role:list'
        },
        {
          label: 'bindingConfigs.llm',
          icon: 'pi pi-comments',
          route: '/binding-configs/llm',
          permission: 'agent-role:list'
        },
        {
          label: 'bindingConfigs.tts',
          icon: 'pi pi-volume-up',
          route: '/binding-configs/tts',
          permission: 'agent-role:list'
        },
        {
          label: 'bindingConfigs.embedding',
          icon: 'pi pi-database',
          route: '/binding-configs/embedding',
          permission: 'agent-role:list'
        }
      ]
    }
  ],
  protectedRoutes: [
    {
      path: 'binding-configs/:kind',
      loadComponent: () =>
        import('../../features/binding-configs/list/binding-configs-page.component').then(
          m => m.BindingConfigsPageComponent
        ),
      title: 'bindingConfigs.title'
    },
    {
      path: 'binding-configs/:kind/new',
      loadComponent: () =>
        import('../../features/binding-configs/form/binding-config-form-page.component').then(
          m => m.BindingConfigFormPageComponent
        ),
      title: 'bindingConfigs.new'
    },
    {
      path: 'binding-configs/:kind/:id/edit',
      loadComponent: () =>
        import('../../features/binding-configs/form/binding-config-form-page.component').then(
          m => m.BindingConfigFormPageComponent
        ),
      title: 'bindingConfigs.edit'
    }
  ]
};
