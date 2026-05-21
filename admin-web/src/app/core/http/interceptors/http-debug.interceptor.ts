import {
  HttpErrorResponse,
  HttpEvent,
  HttpEventType,
  HttpHandlerFn,
  HttpInterceptorFn,
  HttpRequest,
  HttpResponse
} from '@angular/common/http';
import { inject } from '@angular/core';
import { tap } from 'rxjs/operators';
import { APP_API_CONFIG } from '../../config/app-config';

const STORAGE_KEY = 'ai.http.debug';

export const httpDebugInterceptor: HttpInterceptorFn = (req: HttpRequest<unknown>, next: HttpHandlerFn) => {
  const config = inject(APP_API_CONFIG);
  const debugEnabled = config.enableHttpDebug || readDebugFlagFromStorage();

  if (!debugEnabled) {
    return next(req);
  }

  const startedAt = Date.now();
  const requestLabel = `[HTTP ${req.method}] ${req.urlWithParams}`;

  console.groupCollapsed(`${requestLabel} -> request`);
  console.log(
    'headers',
    headersToRecord(req.headers.keys(), (key: string) => req.headers.getAll(key))
  );
  console.log('body', req.body instanceof FormData ? describeFormData(req.body) : req.body);
  console.groupEnd();

  return next(req).pipe(
    tap({
      next: (event: HttpEvent<unknown>) => {
        if (event.type !== HttpEventType.Response) {
          return;
        }

        const response = event as HttpResponse<unknown>;
        console.groupCollapsed(`${requestLabel} <- response ${response.status} (${Date.now() - startedAt}ms)`);
        console.log(
          'headers',
          headersToRecord(response.headers.keys(), (key: string) => response.headers.getAll(key))
        );
        console.log('body', response.body);
        console.groupEnd();
      },
      error: (error: unknown) => {
        const httpError = error as HttpErrorResponse;
        console.groupCollapsed(
          `${requestLabel} <- error ${httpError.status || 'unknown'} (${Date.now() - startedAt}ms)`
        );
        console.log('message', httpError.message);
        console.log('error', httpError.error);
        console.groupEnd();
      }
    })
  );
};

function readDebugFlagFromStorage(): boolean {
  if (typeof globalThis === 'undefined' || !('localStorage' in globalThis)) {
    return false;
  }

  try {
    return globalThis.localStorage.getItem(STORAGE_KEY) === 'true';
  } catch {
    return false;
  }
}

function headersToRecord(keys: string[], getter: (key: string) => string[] | null): Record<string, string | string[]> {
  return keys.reduce<Record<string, string | string[]>>((accumulator, key) => {
    const values = getter(key) ?? [];
    accumulator[key] = values.length <= 1 ? values[0] || '' : values;
    return accumulator;
  }, {});
}

function describeFormData(formData: FormData): Record<string, unknown[]> {
  const summary: Record<string, unknown[]> = {};

  formData.forEach((value: FormDataEntryValue, key: string) => {
    if (!summary[key]) {
      summary[key] = [];
    }

    summary[key].push(
      value instanceof File
        ? {
            type: 'file',
            name: value.name,
            size: value.size,
            mimeType: value.type
          }
        : value
    );
  });

  return summary;
}
