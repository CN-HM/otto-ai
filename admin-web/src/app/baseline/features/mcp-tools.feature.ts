import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const mcpToolsFeature: AdminFeatureManifest = {
  key: 'mcp-tools',
  navigation: [
    {
      label: 'menu.mcpTools',
      icon: 'pi pi-box',
      route: '/mcp-tools',
      permission: 'mcp-tool:list'
    }
  ],
  protectedRoutes: [
    {
      path: 'mcp-tools',
      loadComponent: () =>
        import('../../features/mcp-tools/list/mcp-tools-page.component').then(m => m.McpToolsPageComponent),
      title: 'menu.mcpTools',
      data: {
        title: 'menu.mcpTools',
        description: 'mcpTools.pageDescription',
        permission: 'mcp-tool:list'
      }
    },
    {
      path: 'mcp-tools/new',
      loadComponent: () =>
        import('../../features/mcp-tools/form/mcp-tool-form-page.component').then(m => m.McpToolFormPageComponent),
      title: 'mcpTools.new',
      data: {
        permission: 'mcp-tool:create'
      }
    },
    {
      path: 'mcp-tools/:id/edit',
      loadComponent: () =>
        import('../../features/mcp-tools/form/mcp-tool-form-page.component').then(m => m.McpToolFormPageComponent),
      title: 'mcpTools.edit',
      data: {
        permission: 'mcp-tool:update'
      }
    }
  ]
};
