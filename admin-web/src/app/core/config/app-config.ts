import { InjectionToken } from '@angular/core';
import { environment } from '../../../environments/environment';

export interface AppApiConfig {
  apiBaseUrl: string;
  production: boolean;
  enableHttpDebug: boolean;
}

export const appApiConfig: AppApiConfig = {
  apiBaseUrl: environment.apiBaseUrl,
  production: environment.production,
  enableHttpDebug: environment.enableHttpDebug
};

export const APP_API_CONFIG = new InjectionToken<AppApiConfig>('APP_API_CONFIG');
