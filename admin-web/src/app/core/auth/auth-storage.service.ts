import { Injectable } from '@angular/core';
import { AuthSession, TokenPayload } from './auth.models';

@Injectable({
  providedIn: 'root'
})
export class AuthStorageService {
  private readonly storageKey = 'ai-admin.auth-session';

  getSession(): AuthSession | null {
    try {
      const rawValue = localStorage.getItem(this.storageKey);

      if (!rawValue) {
        return null;
      }

      return JSON.parse(rawValue) as AuthSession;
    } catch {
      return null;
    }
  }

  getToken(): string | null {
    return this.getSession()?.token ?? null;
  }

  saveSession(tokenPayload: TokenPayload, username?: string): void {
    const session: AuthSession = {
      ...tokenPayload,
      username
    };

    localStorage.setItem(this.storageKey, JSON.stringify(session));
  }

  clearSession(): void {
    localStorage.removeItem(this.storageKey);
  }

  isAuthenticated(): boolean {
    return Boolean(this.getToken());
  }
}
