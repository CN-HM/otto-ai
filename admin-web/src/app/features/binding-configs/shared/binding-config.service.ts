import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import {
  BindingConfigItem,
  BindingConfigKind,
  BindingConfigKindMeta,
  BindingConfigOption,
  BindingConfigPageData,
  BindingConfigPageQuery,
  BindingConfigPayload,
  ProviderScope
} from './binding-config.models';

@Injectable({
  providedIn: 'root'
})
export class BindingConfigService {
  private readonly api = inject(ApiClientService);

  getKinds(): Observable<ApiResponse<BindingConfigKindMeta[]>> {
    return this.api.get<BindingConfigKindMeta[]>('/admin/binding-configs/kinds');
  }

  getIntegrationOptions(
    providerCode?: string | null,
    scope?: ProviderScope | null
  ): Observable<ApiResponse<BindingConfigOption[]>> {
    const query: Record<string, string> = {};
    if (providerCode?.trim()) {
      query['providerCode'] = providerCode.trim();
    }
    if (scope?.trim()) {
      query['scope'] = scope.trim();
    }
    return this.api.get<BindingConfigOption[]>(
      '/admin/binding-configs/integration-options',
      Object.keys(query).length ? query : undefined
    );
  }

  getPage(kind: BindingConfigKind, query: BindingConfigPageQuery): Observable<ApiResponse<BindingConfigPageData>> {
    return this.api.get<BindingConfigPageData>(`/admin/binding-configs/${kind}`, query);
  }

  getDetail(kind: BindingConfigKind, id: string): Observable<ApiResponse<BindingConfigItem>> {
    return this.api.get<BindingConfigItem>(`/admin/binding-configs/${kind}/${id}`);
  }

  create(kind: BindingConfigKind, payload: BindingConfigPayload): Observable<ApiResponse<BindingConfigItem>> {
    return this.api.post<BindingConfigItem>(`/admin/binding-configs/${kind}`, payload);
  }

  update(
    kind: BindingConfigKind,
    id: string,
    payload: BindingConfigPayload
  ): Observable<ApiResponse<BindingConfigItem>> {
    return this.api.put<BindingConfigItem>(`/admin/binding-configs/${kind}/${id}`, payload);
  }

  delete(kind: BindingConfigKind, id: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/admin/binding-configs/${kind}/${id}`);
  }
}
