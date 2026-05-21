import { Injectable, inject, signal } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../http/api-client.service';
import { ApiResponse } from '../models/api.models';

export interface PubConfig {
  sm2PublicKey?: string;
  allowUserRegister?: boolean;
  enableMobileRegister?: boolean;
  name?: string;
  version?: string;
  [key: string]: unknown;
}

@Injectable({
  providedIn: 'root'
})
export class PubConfigService {
  private readonly api = inject(ApiClientService);
  private readonly _config = signal<PubConfig | null>(null);

  readonly config = this._config.asReadonly();

  get sm2PublicKey(): string {
    return this._config()?.sm2PublicKey ?? '';
  }

  fetchConfig(): void {
    (this.api.get<PubConfig>('/user/pub-config') as unknown as Observable<ApiResponse<PubConfig>>).subscribe({
      next: (response: ApiResponse<PubConfig>) => {
        if (response.code === 0 && response.data) {
          this._config.set(response.data);
        }
      },
      error: () => {
        // pub-config fetch failed silently; login will show error if key is missing
      }
    });
  }
}
