import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from './api-client.service';
import { ApiResponse } from '../models/api.models';

export interface GenerateCodeResponse {
  code: string;
}

@Injectable({ providedIn: 'root' })
export class CommonService {
  private readonly api = inject(ApiClientService);

  generateCode(prefix: string): Observable<ApiResponse<GenerateCodeResponse>> {
    return this.api.get<GenerateCodeResponse>('/admin/common/generate-code', { prefix });
  }
}
