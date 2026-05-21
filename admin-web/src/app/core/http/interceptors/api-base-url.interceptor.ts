import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { APP_API_CONFIG } from '../../config/app-config';

export const apiBaseUrlInterceptor: HttpInterceptorFn = (req, next) => {
  const config = inject(APP_API_CONFIG);

  if (/^https?:\/\//i.test(req.url)) {
    return next(req);
  }

  const normalizedPath = req.url.startsWith('/') ? req.url : `/${req.url}`;
  const normalizedBaseUrl = config.apiBaseUrl.endsWith('/') ? config.apiBaseUrl.slice(0, -1) : config.apiBaseUrl;

  return next(
    req.clone({
      url: `${normalizedBaseUrl}${normalizedPath}`
    })
  );
};
