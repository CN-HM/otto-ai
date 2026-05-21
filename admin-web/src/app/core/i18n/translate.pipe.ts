import { Pipe, PipeTransform, inject, ChangeDetectorRef, OnDestroy } from '@angular/core';
import { I18nService } from './i18n.service';
import { Subscription } from 'rxjs';

@Pipe({
  name: 'translate',
  standalone: true,
  pure: false
})
export class TranslatePipe implements PipeTransform, OnDestroy {
  private i18nService = inject(I18nService);
  private cdr = inject(ChangeDetectorRef);
  private subscription: Subscription | null = null;
  private lastKey = '';
  private lastParams: Record<string, string> | undefined;
  private lastValue = '';

  transform(key: string, params?: Record<string, string>): string {
    this.lastKey = key;
    this.lastParams = params;
    this.lastValue = this.i18nService.translate(key, params);

    if (!this.subscription) {
      this.subscription = this.i18nService.translations$.subscribe(() => {
        this.lastValue = this.i18nService.translate(this.lastKey, this.lastParams);
        this.cdr.markForCheck();
      });
    }

    return this.lastValue;
  }

  ngOnDestroy(): void {
    if (this.subscription) {
      this.subscription.unsubscribe();
      this.subscription = null;
    }
  }
}
