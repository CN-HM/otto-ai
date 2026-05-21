import { Injectable, inject, signal, computed } from '@angular/core';
import { ApiClientService } from '../http/api-client.service';
import { ApiResponse } from '../models/api.models';
import { UserInfo } from './rbac.models';

@Injectable({
  providedIn: 'root'
})
export class PermissionService {
  private readonly api = inject(ApiClientService);

  private readonly _userInfo = signal<UserInfo | null>(null);
  private readonly _loaded = signal(false);

  readonly userInfo = this._userInfo.asReadonly();
  readonly loaded = this._loaded.asReadonly();

  readonly permissions = computed(() => this._userInfo()?.permissions ?? []);
  readonly roles = computed(() => this._userInfo()?.roles ?? []);
  readonly isSuperAdmin = computed(() => this._userInfo()?.superAdmin === 1);

  hasPermission(code: string): boolean {
    if (this._userInfo()?.superAdmin === 1) return true;
    return this.permissions().includes(code);
  }

  loadPermissions(): Promise<void> {
    return new Promise(resolve => {
      this.api.get<UserInfo>('/user/info').subscribe({
        next: (res: ApiResponse<UserInfo>) => {
          if (res.code === 0 && res.data) {
            this._userInfo.set(res.data);
            this._loaded.set(true);
          }
          resolve();
        },
        error: () => {
          resolve(); // 静默失败，不阻塞路由
        }
      });
    });
  }

  clear(): void {
    this._userInfo.set(null);
    this._loaded.set(false);
  }
}
