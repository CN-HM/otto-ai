import { inject } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivateFn, Router, RouterStateSnapshot } from '@angular/router';
import { AuthService } from '../auth/auth.service';
import { PermissionService } from '../auth/permission.service';

export const authGuard: CanActivateFn = async (_route: ActivatedRouteSnapshot, state: RouterStateSnapshot) => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const permissionService = inject(PermissionService);

  if (!authService.isAuthenticated()) {
    return router.createUrlTree(['/login'], {
      queryParams: {
        redirect: state.url
      }
    });
  }

  // 页面刷新时自动加载权限
  if (!permissionService.loaded()) {
    await permissionService.loadPermissions();
  }

  // 检查路由权限
  const requiredPermission = _route.data?.['permission'] as string | undefined;
  if (requiredPermission && !permissionService.hasPermission(requiredPermission)) {
    return router.createUrlTree(['/forbidden']);
  }

  return true;
};
