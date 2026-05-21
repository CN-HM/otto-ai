import { ApplicationConfig } from '@angular/core';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { provideRouter, TitleStrategy } from '@angular/router';
import { providePrimeNG } from 'primeng/config';
import Aura from '@primeng/themes/aura';
import { APP_API_CONFIG, appApiConfig } from './core/config/app-config';
import { apiBaseUrlInterceptor } from './core/http/interceptors/api-base-url.interceptor';
import { authTokenInterceptor } from './core/http/interceptors/auth-token.interceptor';
import { errorHandlerInterceptor } from './core/http/interceptors/error-handler.interceptor';
import { httpDebugInterceptor } from './core/http/interceptors/http-debug.interceptor';
import { localeHeaderInterceptor } from './core/http/interceptors/locale-header.interceptor';
import { ADMIN_APP_MANIFEST } from './core/microfrontends/admin-app.manifest';
import { currentAdminManifest } from './current-admin.manifest';
import { appRoutes } from './app.routes';
import { provideApi } from './api/openapi/provide-api';
import { I18nService } from './core/i18n/i18n.service';
import { I18nTitleStrategy } from './core/i18n/i18n-title.strategy';

export const appConfig: ApplicationConfig = {
  providers: [
    provideAnimations(),
    provideRouter(appRoutes),
    I18nService,
    {
      provide: TitleStrategy,
      useClass: I18nTitleStrategy
    },
    {
      provide: APP_API_CONFIG,
      useValue: appApiConfig
    },
    {
      provide: ADMIN_APP_MANIFEST,
      useValue: currentAdminManifest
    },
    provideHttpClient(
      withInterceptors([
        apiBaseUrlInterceptor,
        localeHeaderInterceptor,
        authTokenInterceptor,
        httpDebugInterceptor,
        errorHandlerInterceptor
      ])
    ),
    provideApi(''),
    providePrimeNG({
      theme: {
        preset: Aura,
        options: {
          darkModeSelector: '.dark-mode'
        }
      }
    })
  ]
};
