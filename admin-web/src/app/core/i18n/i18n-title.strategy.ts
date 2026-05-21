import { Injectable, inject } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { RouterStateSnapshot, TitleStrategy } from '@angular/router';
import { I18nService } from './i18n.service';

@Injectable()
export class I18nTitleStrategy extends TitleStrategy {
  private readonly title = inject(Title);
  private readonly i18n = inject(I18nService);
  private lastRawTitle: string | undefined;

  constructor() {
    super();
    this.i18n.translations$.subscribe(() => {
      this.applyTitle(this.lastRawTitle);
    });
  }

  override updateTitle(snapshot: RouterStateSnapshot): void {
    this.lastRawTitle = this.buildTitle(snapshot) ?? undefined;
    this.applyTitle(this.lastRawTitle);
  }

  private applyTitle(rawTitle?: string): void {
    this.title.setTitle(rawTitle ? this.i18n.translate(rawTitle) : 'AI');
  }
}
