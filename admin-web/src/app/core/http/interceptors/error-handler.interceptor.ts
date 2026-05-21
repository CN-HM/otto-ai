import { HttpErrorResponse, HttpHandlerFn, HttpInterceptorFn, HttpRequest } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AuthStorageService } from '../../auth/auth-storage.service';
import { resolveHttpErrorMessage } from '../api-error.utils';

export const errorHandlerInterceptor: HttpInterceptorFn = (req: HttpRequest<unknown>, next: HttpHandlerFn) => {
  const router = inject(Router);
  const authStorage = inject(AuthStorageService);

  return next(req).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error.status === 401) {
        authStorage.clearSession();
        void router.navigate(['/login']);
      }

      if (!error.error || typeof error.error !== 'object') {
        error = new HttpErrorResponse({
          error: {
            msg: resolveHttpErrorMessage(error, '请求失败，请稍后重试。')
          },
          headers: error.headers,
          status: error.status,
          statusText: error.statusText,
          url: error.url ?? undefined
        });
      }

      return throwError(() => error);
    })
  );
};
