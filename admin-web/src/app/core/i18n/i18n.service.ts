import { Injectable, inject, signal } from '@angular/core';
import { HttpBackend, HttpClient } from '@angular/common/http';
import { BehaviorSubject, of } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { localizeChineseText } from './chinese-script-localizer';

export type Locale = 'zh-Hans' | 'zh-TW';

export interface Translations {
  [key: string]: string | Translations;
}

@Injectable({
  providedIn: 'root'
})
export class I18nService {
  private readonly http = new HttpClient(inject(HttpBackend));
  private readonly currentLocaleSubject = new BehaviorSubject<Locale>(this.resolveInitialLocale());
  currentLocale$ = this.currentLocaleSubject.asObservable();

  private translations: Translations = {};
  private readonly translationsSubject = new BehaviorSubject<Translations>({});
  translations$ = this.translationsSubject.asObservable();
  private readonly localeVersionSignal = signal(0);
  readonly localeVersion = this.localeVersionSignal.asReadonly();
  private loadedLocale: Locale | null = null;

  constructor() {}

  get currentLocale(): Locale {
    return this.currentLocaleSubject.value;
  }

  setLocale(locale: Locale): void {
    if (this.currentLocaleSubject.value !== locale) {
      this.currentLocaleSubject.next(locale);
    }

    if (this.loadedLocale === locale) {
      return;
    }

    this.loadTranslations(locale);
  }

  private loadTranslations(locale: Locale): void {
    const langMap: Record<Locale, string> = {
      'zh-Hans': 'zh-Hans',
      'zh-TW': 'zh-TW'
    };

    const lang = langMap[locale];
    this.http
      .get<Translations>(`assets/locales/${lang}.json`)
      .pipe(
        tap(translations => {
          this.translations = translations;
          this.translationsSubject.next(translations);
          this.localeVersionSignal.update(version => version + 1);
          this.loadedLocale = locale;
          localStorage.setItem('locale', locale);
        }),
        catchError(error => {
          console.error(`Failed to load translations for locale: ${locale}`, error);
          this.translations = {};
          this.translationsSubject.next({});
          this.localeVersionSignal.update(version => version + 1);
          this.loadedLocale = null;
          return of({});
        })
      )
      .subscribe();
  }

  translate(key: string, params?: Record<string, string>): string {
    if (!key) {
      return '';
    }

    const keys = key.split('.');
    let value: any = this.translations;

    for (const k of keys) {
      if (value && typeof value === 'object' && k in value) {
        value = value[k];
      } else {
        return this.translateUiText(key); // Return key if translation not found
      }
    }

    if (typeof value !== 'string') {
      return this.translateUiText(key);
    }

    // Replace parameters if provided
    if (params) {
      const translated = Object.keys(params).reduce((str, param) => {
        return str.replace(new RegExp(`{${param}}`, 'g'), params[param]);
      }, value);
      return this.translateUiText(translated);
    }

    return this.translateUiText(value);
  }

  instant(key: string, params?: Record<string, string>): string {
    return this.translate(key, params);
  }

  translateUiText(text: string): string {
    if (!text) {
      return '';
    }

    const uiText = this.translations['uiText'];
    if (uiText && typeof uiText === 'object' && text in uiText) {
      const value = uiText[text];
      if (typeof value === 'string') {
        return value;
      }
    }

    return localizeChineseText(text, this.currentLocale);
  }

  init(): void {
    this.setLocale(this.currentLocaleSubject.value);
  }

  private resolveInitialLocale(): Locale {
    const savedLocale = localStorage.getItem('locale') as Locale;
    return savedLocale && (savedLocale === 'zh-Hans' || savedLocale === 'zh-TW') ? savedLocale : 'zh-Hans';
  }
}
