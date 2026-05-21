import { CommonModule } from '@angular/common';
import { Component, computed, inject, signal } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  Router,
  RouterLink,
  RouterLinkActive,
  RouterOutlet,
  UrlSegment
} from '@angular/router';
import { ButtonModule } from 'primeng/button';
import { TagModule } from 'primeng/tag';
import { AuthService } from '../auth/auth.service';
import { ADMIN_APP_MANIFEST, AdminBranding, AdminNavigationItem } from '../microfrontends/admin-app.manifest';
import { PermissionService } from '../auth/permission.service';
import { LanguageSwitcherComponent } from '../i18n/language-switcher.component';
import { TranslatePipe } from '../i18n/translate.pipe';

interface BreadcrumbItem {
  label: string;
  route: string;
}

@Component({
  selector: 'app-admin-shell',
  standalone: true,
  imports: [
    CommonModule,
    RouterOutlet,
    RouterLink,
    RouterLinkActive,
    ButtonModule,
    TagModule,
    LanguageSwitcherComponent,
    TranslatePipe
  ],
  templateUrl: './admin-shell.component.html',
  styleUrl: './admin-shell.component.css'
})
export class AdminShellComponent {
  private readonly authService = inject(AuthService);
  private readonly router = inject(Router);
  private readonly permissionService = inject(PermissionService);
  private readonly manifest = inject(ADMIN_APP_MANIFEST);

  readonly sidebarOpen = signal(false);
  readonly collapsedGroups = signal<Set<string>>(new Set());

  toggleGroup(label: string): void {
    const next = new Set(this.collapsedGroups());
    if (next.has(label)) {
      next.delete(label);
    } else {
      next.add(label);
    }
    this.collapsedGroups.set(next);
  }

  isGroupCollapsed(label: string): boolean {
    return this.collapsedGroups().has(label);
  }

  get branding(): AdminBranding {
    return this.manifest.branding;
  }

  toggleSidebar(): void {
    this.sidebarOpen.update(v => !v);
  }

  closeSidebar(): void {
    this.sidebarOpen.set(false);
  }

  readonly navigationItems = computed<AdminNavigationItem[]>(() => {
    // 触发信号读取，确保权限加载后重新计算
    this.permissionService.permissions();
    return this.filterByPermission(this.manifest.navigation);
  });

  private filterByPermission(items: AdminNavigationItem[]): AdminNavigationItem[] {
    return items.flatMap(item => {
      const children = item.children ? this.filterByPermission(item.children) : undefined;
      const selfAllowed = !item.permission || this.permissionService.hasPermission(item.permission);

      if (!selfAllowed && (!children || children.length === 0)) {
        return [];
      }

      return [
        {
          ...item,
          children: children && children.length > 0 ? children : undefined
        }
      ];
    });
  }

  get username(): string {
    return this.authService.getUsername();
  }

  private get dashboardLabel(): string {
    return this.manifest.navigation.find(item => item.route === '/dashboard')?.label || 'menu.dashboard';
  }

  get breadcrumbs(): BreadcrumbItem[] {
    const root = this.router.routerState.snapshot.root;
    const breadcrumbs: BreadcrumbItem[] = [{ label: this.dashboardLabel, route: '/dashboard' }];

    const collect = (snapshot: ActivatedRouteSnapshot, parentRoute: string): void => {
      for (const child of snapshot.children) {
        const pathSegment = child.url.map((segment: UrlSegment) => segment.path).join('/');
        const currentRoute = pathSegment ? `${parentRoute}/${pathSegment}` : parentRoute;

        const label = (child.title as string | undefined) ?? (child.data['title'] as string | undefined);
        if (label && currentRoute && currentRoute !== '/dashboard') {
          breadcrumbs.push({ label, route: currentRoute });
        }

        collect(child, currentRoute);
      }
    };

    collect(root, '');

    return breadcrumbs;
  }

  logout(): void {
    this.authService.logout();
    void this.router.navigate(['/login']);
  }
}
