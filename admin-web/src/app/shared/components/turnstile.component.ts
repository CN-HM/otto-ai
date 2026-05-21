import { Component, ElementRef, Input, OnDestroy, OnInit, ViewChild, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { environment } from '../../../environments/environment';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

declare global {
  interface Window {
    turnstile?: {
      render: (container: string | HTMLElement, options: TurnstileRenderOptions) => string;
      reset: (widgetId: string) => void;
      remove: (widgetId: string) => void;
    };
    onTurnstileLoad?: () => void;
  }
}

interface TurnstileRenderOptions {
  sitekey: string;
  callback: (token: string) => void;
  'error-callback'?: () => void;
  'expired-callback'?: () => void;
  theme?: 'light' | 'dark' | 'auto';
  size?: 'normal' | 'compact';
}

@Component({
  selector: 'app-turnstile',
  standalone: true,
  imports: [CommonModule, TranslatePipe],
  template: `
    @if (enabled()) {
      <div class="turnstile-container">
        <div #turnstileWidget class="cf-turnstile"></div>
        @if (error()) {
          <small class="turnstile-error">{{ error() ?? '' | translate }}</small>
        }
      </div>
    }
  `,
  styles: [
    `
      .turnstile-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0.5rem 0;
      }
      .turnstile-error {
        color: var(--p-red-500, #e57575);
        margin-top: 0.25rem;
      }
    `
  ]
})
export class TurnstileComponent implements OnInit, OnDestroy {
  @Input() theme: 'light' | 'dark' | 'auto' = 'light';
  @Input() size: 'normal' | 'compact' = 'normal';

  @ViewChild('turnstileWidget', { static: false }) widgetElement!: ElementRef;

  readonly enabled = signal(false);
  readonly error = signal<string | null>(null);
  readonly token = signal<string | null>(null);

  private widgetId: string | null = null;
  private scriptLoaded = false;

  ngOnInit(): void {
    // Check if Turnstile is enabled in environment
    const turnstileConfig = environment.turnstile;
    if (!turnstileConfig?.enabled) {
      this.enabled.set(false);
      return;
    }

    this.enabled.set(true);
    this.loadTurnstileScript();
  }

  ngOnDestroy(): void {
    this.removeWidget();
  }

  private loadTurnstileScript(): void {
    // Check if script already loaded
    if (window.turnstile) {
      this.scriptLoaded = true;
      setTimeout(() => this.renderWidget(), 0);
      return;
    }

    // Check if script is being loaded
    if (document.querySelector('script[src*="challenges.cloudflare.com/turnstile"]')) {
      window.onTurnstileLoad = () => {
        this.scriptLoaded = true;
        this.renderWidget();
      };
      return;
    }

    // Load script
    window.onTurnstileLoad = () => {
      this.scriptLoaded = true;
      this.renderWidget();
    };

    const script = document.createElement('script');
    script.src = 'https://challenges.cloudflare.com/turnstile/v0/api.js?onload=onTurnstileLoad';
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);
  }

  private renderWidget(): void {
    if (!window.turnstile || !this.widgetElement?.nativeElement) {
      return;
    }

    const siteKey = environment.turnstile?.siteKey;
    if (!siteKey) {
      this.error.set('shared.turnstile.configError');
      return;
    }

    try {
      this.widgetId = window.turnstile.render(this.widgetElement.nativeElement, {
        sitekey: siteKey,
        callback: (token: string) => {
          this.token.set(token);
          this.error.set(null);
        },
        'error-callback': () => {
          this.error.set('shared.turnstile.verifyFailed');
          this.token.set(null);
        },
        'expired-callback': () => {
          this.token.set(null);
        },
        theme: this.theme,
        size: this.size
      });
    } catch {
      this.error.set('shared.turnstile.loadFailed');
    }
  }

  private removeWidget(): void {
    if (this.widgetId && window.turnstile) {
      try {
        window.turnstile.remove(this.widgetId);
      } catch {
        // Ignore removal errors
      }
      this.widgetId = null;
    }
  }

  /** Reset the widget and clear the token */
  reset(): void {
    this.token.set(null);
    this.error.set(null);
    if (this.widgetId && window.turnstile) {
      try {
        window.turnstile.reset(this.widgetId);
      } catch {
        // If reset fails, try re-rendering
        this.removeWidget();
        setTimeout(() => this.renderWidget(), 0);
      }
    }
  }

  /** Get the current token */
  getToken(): string | null {
    return this.token();
  }

  /** Check if token is valid */
  isValid(): boolean {
    return this.token() !== null;
  }
}
