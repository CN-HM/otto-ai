import { AdminFeatureManifest } from '../../core/microfrontends/admin-app.manifest';

export const authFeature: AdminFeatureManifest = {
  key: 'auth',
  publicRoutes: [
    {
      path: 'login',
      loadComponent: () => import('../../features/auth/login/login-page.component').then(m => m.LoginPageComponent),
      title: 'common.login'
    },
    {
      path: 'register',
      loadComponent: () =>
        import('../../features/auth/register/register-page.component').then(m => m.RegisterPageComponent),
      title: 'auth.register'
    },
    {
      path: 'retrieve-password',
      loadComponent: () =>
        import('../../features/auth/retrieve-password/retrieve-password-page.component').then(
          m => m.RetrievePasswordPageComponent
        ),
      title: 'auth.retrievePassword'
    }
  ],
  protectedRoutes: [
    {
      path: 'change-password',
      loadComponent: () =>
        import('../../features/auth/change-password/change-password-page.component').then(
          m => m.ChangePasswordPageComponent
        ),
      title: 'common.changePassword'
    }
  ]
};
