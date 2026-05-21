import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const errorsFeature: AdminFeatureManifest = {
  key: 'errors',
  protectedRoutes: [
    {
      path: 'forbidden',
      loadComponent: () => import('../../features/errors/forbidden-page.component').then(m => m.ForbiddenPageComponent),
      title: 'errors.forbidden'
    }
  ]
};
