import { HttpErrorResponse } from '@angular/common/http';
import { ApiResponse } from '../models/api.models';

export function isApiSuccess<T>(response: ApiResponse<T> | null | undefined): boolean {
  return !!response && response.code === 0;
}

export function resolveApiMessage<T>(response: ApiResponse<T> | null | undefined, fallback: string): string {
  if (!response) {
    return fallback;
  }

  return pickFirstString(response, ['msg', 'message', 'errorMsg']) || fallback;
}

export function resolveHttpErrorMessage(error: unknown, fallback: string): string {
  if (!error) {
    return fallback;
  }

  if (error instanceof HttpErrorResponse) {
    const httpError = error as HttpErrorResponse;

    return (
      pickFirstString(httpError.error, ['msg', 'message', 'error_description', 'errorMessage']) ||
      httpError.message ||
      fallback
    );
  }

  if (typeof error === 'object') {
    return pickFirstString(error, ['msg', 'message', 'error_description', 'errorMessage']) || fallback;
  }

  if (typeof error === 'string' && error.trim()) {
    return error;
  }

  return fallback;
}

function pickFirstString(source: unknown, keys: string[]): string {
  if (!source || typeof source !== 'object') {
    return '';
  }

  const record = source as Record<string, unknown>;
  for (const key of keys) {
    const value = record[key];
    if (typeof value === 'string' && value.trim()) {
      return value;
    }
  }

  return '';
}
