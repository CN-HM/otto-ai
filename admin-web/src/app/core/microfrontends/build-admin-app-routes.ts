import { Routes } from '@angular/router';
import { AdminAppManifest } from './admin-app.manifest';
import { authGuard } from '../guards/auth.guard';
import { AdminShellComponent } from '../layout/admin-shell.component';

export function buildAdminAppRoutes(manifest: AdminAppManifest): Routes {
  return [
    ...manifest.publicRoutes,
    {
      path: '',
      component: AdminShellComponent,
      canActivate: [authGuard],
      canActivateChild: [authGuard],
      children: [
        {
          path: '',
          pathMatch: 'full',
          redirectTo: 'dashboard'
        },
        ...manifest.protectedRoutes
      ]
    },
    {
      path: '**',
      redirectTo: 'dashboard'
    }
  ];
}
