import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const datasetsFeature: AdminFeatureManifest = {
  key: 'datasets',
  navigation: [{ label: 'menu.datasets', icon: 'pi pi-book', route: '/datasets', permission: 'dataset:list' }],
  protectedRoutes: [
    {
      path: 'datasets',
      loadComponent: () =>
        import('../../features/datasets/list/list/knowledge-bases-page.component').then(
          m => m.KnowledgeBasesPageComponent
        ),
      title: 'menu.datasets',
      data: {
        title: 'menu.datasets',
        description: 'datasets.pageDescription'
      }
    },
    {
      path: 'datasets/new',
      loadComponent: () =>
        import('../../features/datasets/list/form/knowledge-base-form-page.component').then(
          m => m.KnowledgeBaseFormPageComponent
        ),
      title: 'datasets.new'
    },
    {
      path: 'datasets/:id',
      loadComponent: () =>
        import('../../features/datasets/documents/knowledge-base-documents-page.component').then(
          m => m.KnowledgeBaseDocumentsPageComponent
        ),
      title: 'datasets.documents'
    },
    {
      path: 'datasets/:id/edit',
      loadComponent: () =>
        import('../../features/datasets/list/form/knowledge-base-form-page.component').then(
          m => m.KnowledgeBaseFormPageComponent
        ),
      title: 'datasets.edit'
    },
    {
      path: 'datasets/:id/documents',
      loadComponent: () =>
        import('../../features/datasets/documents/knowledge-base-documents-page.component').then(
          m => m.KnowledgeBaseDocumentsPageComponent
        ),
      title: 'datasets.documents'
    },
    {
      path: 'datasets/:id/documents/:documentId/chunks',
      loadComponent: () =>
        import('../../features/datasets/documents/knowledge-base-document-chunks-page.component').then(
          m => m.KnowledgeBaseDocumentChunksPageComponent
        ),
      title: 'datasets.chunks'
    },
    {
      path: 'datasets/:id/retrieval-test',
      loadComponent: () =>
        import('../../features/datasets/retrieval/knowledge-base-retrieval-page.component').then(
          m => m.KnowledgeBaseRetrievalPageComponent
        ),
      title: 'datasets.retrieval'
    }
  ]
};
