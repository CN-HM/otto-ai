import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../../core/http/api-client.service';
import { ApiResponse } from '../../../../core/models/api.models';
import { MenuTreeItem, RoleCreateDto, RoleDto, RoleUpdateDto } from '../../../../core/auth/rbac.models';

interface RolePageData {
  total: number;
  list: RoleDto[];
}

@Injectable({
  providedIn: 'root'
})
export class RoleService {
  private readonly api = inject(ApiClientService);

  getRolePage(query: { name?: string; page: number; limit: number }): Observable<ApiResponse<RolePageData>> {
    return this.api.get<RolePageData>('/system/roles', query);
  }

  getAllRoles(): Observable<ApiResponse<RoleDto[]>> {
    return this.api.get<RoleDto[]>('/system/roles/all');
  }

  createRole(dto: RoleCreateDto): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>('/system/roles', dto);
  }

  updateRole(id: number, dto: RoleUpdateDto): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/system/roles/${id}`, dto);
  }

  deleteRole(id: number): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/system/roles/${id}`);
  }

  getRoleMenus(id: number): Observable<ApiResponse<number[]>> {
    return this.api.get<number[]>(`/system/roles/${id}/menus`);
  }

  assignMenus(id: number, menuIds: number[]): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/system/roles/${id}/menus`, { menuIds });
  }

  getMenuTree(): Observable<ApiResponse<MenuTreeItem[]>> {
    return this.api.get<MenuTreeItem[]>('/system/roles/menu-tree');
  }

  getUserRoles(userId: number): Observable<ApiResponse<number[]>> {
    return this.api.get<number[]>(`/system/roles/user/${userId}`);
  }

  assignUserRoles(userId: number, roleIds: number[]): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/system/roles/user/${userId}`, { roleIds });
  }
}
