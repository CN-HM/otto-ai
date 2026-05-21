import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ApiResponse } from '../models/api.models';

@Injectable({
  providedIn: 'root'
})
export class ApiClientService {
  private readonly http = inject(HttpClient);

  get<T>(url: string, query?: object, headers?: HttpHeaders): Observable<ApiResponse<T>> {
    return this.http.get<ApiResponse<T>>(url, {
      params: this.buildParams(query),
      headers
    });
  }

  post<T>(url: string, body?: unknown, query?: object, headers?: HttpHeaders): Observable<ApiResponse<T>> {
    return this.http.post<ApiResponse<T>>(url, body, {
      params: this.buildParams(query),
      headers
    });
  }

  postForm<T>(url: string, formData: FormData, query?: object, headers?: HttpHeaders): Observable<ApiResponse<T>> {
    return this.http.post<ApiResponse<T>>(url, formData, {
      params: this.buildParams(query),
      headers
    });
  }

  put<T>(url: string, body?: unknown, query?: object, headers?: HttpHeaders): Observable<ApiResponse<T>> {
    return this.http.put<ApiResponse<T>>(url, body, {
      params: this.buildParams(query),
      headers
    });
  }

  delete<T>(url: string, query?: object, headers?: HttpHeaders): Observable<ApiResponse<T>> {
    return this.http.delete<ApiResponse<T>>(url, {
      params: this.buildParams(query),
      headers
    });
  }

  deleteWithBody<T>(url: string, body?: unknown, headers?: HttpHeaders): Observable<ApiResponse<T>> {
    return this.http.delete<ApiResponse<T>>(url, {
      body,
      headers
    });
  }

  private buildParams(query?: object): HttpParams | undefined {
    if (!query) {
      return undefined;
    }

    let params = new HttpParams();

    for (const [key, value] of Object.entries(query)) {
      if (value === undefined || value === null || value === '') {
        continue;
      }

      params = params.set(key, String(value));
    }

    return params;
  }
}
