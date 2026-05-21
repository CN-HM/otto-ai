import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { ApiClientService } from '../http/api-client.service';
import { ApiResponse } from '../models/api.models';
import {
  ChangePasswordRequest,
  LoginRequest,
  RegisterRequest,
  RetrievePasswordRequest,
  SmsVerificationRequest,
  TokenPayload
} from './auth.models';
import { AuthStorageService } from './auth-storage.service';
import { PermissionService } from './permission.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private readonly api = inject(ApiClientService);
  private readonly http = inject(HttpClient);
  private readonly authStorage = inject(AuthStorageService);
  private readonly permissionService = inject(PermissionService);

  login(payload: LoginRequest): Observable<ApiResponse<TokenPayload>> {
    return this.api.post<TokenPayload>('/user/login', payload).pipe(
      tap((response: ApiResponse<TokenPayload>) => {
        if (response.code === 0 && response.data?.token) {
          this.authStorage.saveSession(response.data, payload.username);
          this.permissionService.loadPermissions();
        }
      })
    );
  }

  register(payload: RegisterRequest): Observable<ApiResponse<unknown>> {
    return this.api.post('/user/register', payload);
  }

  smsVerification(payload: SmsVerificationRequest): Observable<ApiResponse<unknown>> {
    return this.api.post('/user/smsVerification', payload);
  }

  retrievePassword(payload: RetrievePasswordRequest): Observable<ApiResponse<unknown>> {
    return this.api.put('/user/retrieve-password', payload);
  }

  changePassword(payload: ChangePasswordRequest): Observable<ApiResponse<unknown>> {
    return this.api.put('/user/change-password', payload);
  }

  getCaptcha(uuid: string): Observable<Blob> {
    return this.http.get(`/user/captcha?uuid=${uuid}`, { responseType: 'blob' });
  }

  logout(): void {
    this.authStorage.clearSession();
    this.permissionService.clear();
  }

  isAuthenticated(): boolean {
    return this.authStorage.isAuthenticated();
  }

  getToken(): string | null {
    return this.authStorage.getToken();
  }

  getUsername(): string {
    return this.authStorage.getSession()?.username ?? '未登录';
  }
}
