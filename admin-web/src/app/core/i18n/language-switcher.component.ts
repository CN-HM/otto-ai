import { Component, computed, inject, OnInit, OnDestroy } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { DropdownModule } from 'primeng/dropdown';
import { I18nService, Locale } from './i18n.service';
import { Subscription } from 'rxjs';

interface LanguageOption {
  value: Locale;
  label: string;
}

@Component({
  selector: 'app-language-switcher',
  standalone: true,
  imports: [FormsModule, DropdownModule],
  template: `
    <p-dropdown
      [options]="languageOptions()"
      [(ngModel)]="currentLocale"
      (onChange)="onLanguageChange($event)"
      optionLabel="label"
      optionValue="value"
      [style]="{ minWidth: '120px' }"
    />
  `
})
export class LanguageSwitcherComponent implements OnInit, OnDestroy {
  private readonly i18nService = inject(I18nService);

  currentLocale: Locale = 'zh-Hans';
  private subscription: Subscription | null = null;

  readonly languageOptions = computed<LanguageOption[]>(() => {
    this.i18nService.localeVersion();
    return [
      { value: 'zh-Hans', label: this.i18nService.translateUiText('简体中文') },
      { value: 'zh-TW', label: this.i18nService.translateUiText('繁體中文') }
    ];
  });

  ngOnInit(): void {
    this.currentLocale = this.i18nService.currentLocale;
    this.subscription = this.i18nService.currentLocale$.subscribe(locale => {
      this.currentLocale = locale;
    });
  }

  ngOnDestroy(): void {
    if (this.subscription) {
      this.subscription.unsubscribe();
      this.subscription = null;
    }
  }

  onLanguageChange(event: any): void {
    this.i18nService.setLocale(event.value);
  }
}
