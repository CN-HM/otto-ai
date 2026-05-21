import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../../core/http/api-client.service';
import { ApiResponse } from '../../../../core/models/api.models';
import { AdminSystemSettings } from './system-params.models';

@Injectable({
  providedIn: 'root'
})
export class SystemParamsService {
  private readonly api = inject(ApiClientService);

  getSettings(): Observable<ApiResponse<AdminSystemSettings>> {
    return this.api.get<AdminSystemSettings>('/admin/params/settings');
  }

  updateSettings(payload: AdminSystemSettings): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>('/admin/params/settings', payload);
  }
}
