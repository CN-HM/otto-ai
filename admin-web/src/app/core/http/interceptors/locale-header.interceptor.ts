import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { I18nService } from '../../i18n/i18n.service';

export const localeHeaderInterceptor: HttpInterceptorFn = (req, next) => {
  const i18n = inject(I18nService);

  return next(
    req.clone({
      setHeaders: {
        'Accept-Language': i18n.currentLocale
      }
    })
  );
};
