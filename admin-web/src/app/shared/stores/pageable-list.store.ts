import { signal } from '@angular/core';
import { localizeChineseText } from '../../core/i18n/chinese-script-localizer';
import { Locale } from '../../core/i18n/i18n.service';

function resolveCurrentLocale(): Locale {
  if (typeof localStorage === 'undefined') {
    return 'zh-Hans';
  }

  return localStorage.getItem('locale') === 'zh-TW' ? 'zh-TW' : 'zh-Hans';
}

export class PageableListStore<TItem> {
  readonly loading = signal(false);
  readonly errorMessage = signal('');
  readonly items = signal<TItem[]>([]);
  readonly total = signal(0);
  page = 1;
  limit = 10;
  private requestVersion = 0;

  constructor(private readonly fetchFn: (page: number, limit: number) => Promise<{ total: number; list: TItem[] }>) {}

  async load(): Promise<void> {
    const version = ++this.requestVersion;
    this.loading.set(true);
    this.errorMessage.set('');
    try {
      const { total, list } = await this.fetchFn(this.page, this.limit);
      if (version !== this.requestVersion) return;
      this.items.set(list ?? []);
      this.total.set(total ?? 0);
    } catch (err: any) {
      if (version !== this.requestVersion) return;
      this.errorMessage.set(
        localizeChineseText(err?.error?.msg || err?.error?.message || err?.message || '加载失败', resolveCurrentLocale())
      );
    } finally {
      if (version === this.requestVersion) {
        this.loading.set(false);
      }
    }
  }

  search(): void {
    this.page = 1;
    void this.load();
  }
  changePage(event: { first: number; rows: number }): void {
    this.page = Math.floor(event.first / event.rows) + 1;
    this.limit = event.rows;
    void this.load();
  }
  setPage(page: number): void {
    this.page = page;
    void this.load();
  }
  setLimit(limit: number): void {
    this.limit = limit;
    this.page = 1;
    void this.load();
  }
}
