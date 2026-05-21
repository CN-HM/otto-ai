import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import {
  AgentRoleBindingOptions,
  AgentRoleItem,
  AgentRolePageData,
  AgentRolePayload,
  AgentRoleReleaseItem
} from './agent-role.models';

@Injectable({
  providedIn: 'root'
})
export class AgentRoleService {
  private readonly api = inject(ApiClientService);

  getPage(query: {
    keyword?: string;
    status?: string;
    page: number;
    limit: number;
  }): Observable<ApiResponse<AgentRolePageData>> {
    return this.api.get<AgentRolePageData>('/admin/agent-roles', query);
  }

  getAllActive(): Observable<ApiResponse<AgentRoleItem[]>> {
    return this.api.get<AgentRoleItem[]>('/admin/agent-roles/all');
  }

  getDetail(id: string): Observable<ApiResponse<AgentRoleItem>> {
    return this.api.get<AgentRoleItem>(`/admin/agent-roles/${id}`);
  }

  getReleases(id: string): Observable<ApiResponse<AgentRoleReleaseItem[]>> {
    return this.api.get<AgentRoleReleaseItem[]>(`/admin/agent-roles/${id}/releases`);
  }

  publish(id: string, payload: { version?: string; remark?: string }): Observable<ApiResponse<AgentRoleReleaseItem>> {
    return this.api.post<AgentRoleReleaseItem>(`/admin/agent-roles/${id}/publish`, payload);
  }

  activateRelease(id: string, releaseId: string): Observable<ApiResponse<AgentRoleReleaseItem>> {
    return this.api.put<AgentRoleReleaseItem>(`/admin/agent-roles/${id}/releases/${releaseId}/activate`, {});
  }

  create(payload: AgentRolePayload): Observable<ApiResponse<AgentRoleItem>> {
    return this.api.post<AgentRoleItem>('/admin/agent-roles', payload);
  }

  update(id: string, payload: AgentRolePayload): Observable<ApiResponse<AgentRoleItem>> {
    return this.api.put<AgentRoleItem>(`/admin/agent-roles/${id}`, payload);
  }

  delete(id: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/admin/agent-roles/${id}`);
  }

  getIconOptions(): Observable<ApiResponse<{ label: string; value: string; description?: string }[]>> {
    return this.api.get<{ label: string; value: string; description?: string }[]>('/admin/agent-roles/icon-options');
  }

  getThemeOptions(): Observable<ApiResponse<{ label: string; value: string; description?: string }[]>> {
    return this.api.get<{ label: string; value: string; description?: string }[]>('/admin/agent-roles/theme-options');
  }

  getBindingOptions(): Observable<ApiResponse<AgentRoleBindingOptions>> {
    return this.api.get<AgentRoleBindingOptions>('/admin/agent-roles/binding-options');
  }
}
