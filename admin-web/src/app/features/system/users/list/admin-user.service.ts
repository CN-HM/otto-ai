import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../../core/http/api-client.service';
import { ApiResponse } from '../../../../core/models/api.models';
import { AdminUserPageData, AdminUserQuery } from './admin-user.models';

@Injectable({
  providedIn: 'root'
})
export class AdminUserService {
  private readonly api = inject(ApiClientService);

  getUserPage(query: AdminUserQuery): Observable<ApiResponse<AdminUserPageData>> {
    return this.api.get<AdminUserPageData>('/admin/users', query);
  }

  resetPassword(id: string): Observable<ApiResponse<string>> {
    return this.api.put<string>(`/admin/users/${id}`);
  }

  deleteUser(id: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/admin/users/${id}`);
  }

  changeStatus(status: number, userIds: string[]): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/admin/users/changeStatus/${status}`, userIds);
  }
}
