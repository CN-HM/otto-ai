import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { SelectModule } from 'primeng/select';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../shared/components/summary-metric-grid.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { MemoryLibraryListItem } from '../shared/memory-library.models';
import { MemoryLibraryService } from '../shared/memory-library.service';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';

@Component({
  selector: 'app-memory-libraries-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    InputTextModule,
    SelectModule,
    TableModule,
    TagModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    SearchFilterCardComponent,
    SummaryMetricGridComponent,
    PaginationBarComponent,
    TranslatePipe
  ],
  templateUrl: './memory-libraries-page.component.html',
  styleUrl: './memory-libraries-page.component.css'
})
export class MemoryLibrariesPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<MemoryLibraryListItem>(async (page, limit) => {
    const { keyword, status } = this.queryForm.getRawValue();
    const response = await firstValueFrom(
      this.memoryLibraryService.getPage({
        keyword: keyword || undefined,
        status: status ?? undefined,
        page,
        limit
      })
    );
    if (response.code !== 0) throw new Error(response.msg || this.localize('记忆库列表获取失败。'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly libraries = this.store.items;
  readonly total = this.store.total;
  expandedRows: Record<string, boolean> = {};

  readonly queryForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    status: [null as number | null],
    page: [1],
    limit: [10]
  });

  readonly enabledCount = computed(
    () => this.libraries().filter((item: MemoryLibraryListItem) => item.status === 1).length
  );
  readonly defaultCount = computed(
    () => this.libraries().filter((item: MemoryLibraryListItem) => item.isDefault === 1).length
  );
  readonly associatedCount = computed(
    () =>
      new Set(
        this.libraries()
          .map((item: MemoryLibraryListItem) => item.agentId)
          .filter(Boolean)
      ).size
  );

  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('记忆库总数'), value: this.total() },
      { title: this.localize('已启用'), value: this.enabledCount() },
      { title: this.localize('关联智能体'), value: this.associatedCount() }
    ];
  });

  ngOnInit(): void {
    this.loadLibraries();
  }

  loadLibraries(): void {
    const { page, limit } = this.queryForm.getRawValue();
    this.expandedRows = {};
    this.store.page = page;
    this.store.limit = limit;
    void this.store.load();
  }

  changePage(newPage: number): void {
    this.queryForm.patchValue({ page: newPage });
    this.expandedRows = {};
    this.store.setPage(newPage);
  }

  changeLimit(newLimit: number): void {
    this.queryForm.patchValue({ limit: newLimit, page: 1 });
    this.expandedRows = {};
    this.store.setLimit(newLimit);
  }

  search(): void {
    this.queryForm.patchValue({ page: 1 });
    this.expandedRows = {};
    this.store.search();
  }

  reset(): void {
    this.queryForm.reset({ keyword: '', status: null, page: 1, limit: 10 });
    this.expandedRows = {};
    this.store.page = 1;
    this.store.limit = 10;
    void this.store.load();
  }

  statusLabel(status?: number): string {
    return status === 1 ? this.localize('启用') : this.localize('停用');
  }

  statusSeverity(status?: number): 'success' | 'danger' {
    return status === 1 ? 'success' : 'danger';
  }

  scopeLabel(scope?: string): string {
    switch (scope) {
      case 'user':
        return this.localize('用户级');
      case 'device':
        return this.localize('设备级');
      case 'session':
        return this.localize('会话级');
      case 'global':
        return this.localize('全局');
      default:
        return scope || '-';
    }
  }

  scopeSeverity(scope?: string): string {
    switch (scope) {
      case 'user':
        return 'info';
      case 'device':
        return 'success';
      case 'session':
        return 'warn';
      case 'global':
        return 'secondary';
      default:
        return 'secondary';
    }
  }

  defaultLabel(isDefault?: number): string {
    return isDefault === 1 ? this.localize('是') : this.localize('否');
  }

  defaultSeverity(isDefault?: number): 'success' | 'secondary' {
    return isDefault === 1 ? 'success' : 'secondary';
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
