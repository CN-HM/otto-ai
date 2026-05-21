import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../../core/http/api-client.service';
import { ApiResponse } from '../../../../core/models/api.models';
import { AuditLogPageData, AuditLogQuery } from './audit-log.models';

@Injectable({
  providedIn: 'root'
})
export class AuditLogService {
  private readonly api = inject(ApiClientService);

  getAuditLogPage(query: AuditLogQuery): Observable<ApiResponse<AuditLogPageData>> {
    return this.api.get<AuditLogPageData>('/admin/audit-logs', query as object) as Observable<
      ApiResponse<AuditLogPageData>
    >;
  }
}
