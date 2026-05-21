import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../shared/components/summary-metric-grid.component';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import {
  RUNTIME_SIGNAL_SEVERITY,
  RUNTIME_SIGNAL_STATUS,
  RUNTIME_SIGNAL_TYPE,
  RuntimeSignalItem,
  RuntimeSignalSeverity,
  RuntimeSignalStatus,
  RuntimeSignalType
} from '../shared/memory-library.models';
import { MemoryLibraryService } from '../shared/memory-library.service';

@Component({
  selector: 'app-runtime-signals-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    DatePipe,
    ButtonModule,
    CardModule,
    InputTextModule,
    TableModule,
    TagModule,
    TranslatePipe,
    EmptyStateComponent,
    FeedbackMessageComponent,
    SearchFilterCardComponent,
    PaginationBarComponent,
    SummaryMetricGridComponent
  ],
  templateUrl: './runtime-signals-page.component.html',
  styleUrl: './runtime-signals-page.component.css'
})
export class RuntimeSignalsPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<RuntimeSignalItem>(async (page, limit) => {
    const raw = this.queryForm.getRawValue();
    const response = await firstValueFrom(
      this.memoryLibraryService.getRuntimeSignals({
        page,
        limit,
        signalType: this.parseSignalType(raw.signalType),
        status: this.parseStatus(raw.status),
        severity: this.parseSeverity(raw.severity),
        keyword: raw.keyword || undefined
      })
    );
    if (response.code !== 0) throw new Error(response.msg || this.localize('运行时信号列表获取失败。'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly signals = this.store.items;
  readonly total = this.store.total;
  readonly pendingCount = computed(
    () =>
      this.signals().filter(
        item => item.status === RUNTIME_SIGNAL_STATUS.pending || item.status === RUNTIME_SIGNAL_STATUS.scheduled
      ).length
  );
  readonly riskCount = computed(
    () => this.signals().filter(item => item.signalType === RUNTIME_SIGNAL_TYPE.risk).length
  );
  readonly highCount = computed(
    () =>
      this.signals().filter(
        item => item.severity === RUNTIME_SIGNAL_SEVERITY.high || item.severity === RUNTIME_SIGNAL_SEVERITY.critical
      ).length
  );
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('信号总数'), value: this.total() },
      { title: this.localize('待处理'), value: this.pendingCount() },
      { title: this.localize('高风险/严重'), value: this.highCount() }
    ];
  });

  readonly queryForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    signalType: [''],
    status: [''],
    severity: [''],
    page: [1],
    limit: [10]
  });

  ngOnInit(): void {
    this.loadSignals();
  }

  loadSignals(): void {
    const { page, limit } = this.queryForm.getRawValue();
    this.store.page = page;
    this.store.limit = limit;
    void this.store.load();
  }

  search(): void {
    this.queryForm.patchValue({ page: 1 });
    this.store.search();
  }

  reset(): void {
    this.queryForm.reset({ keyword: '', signalType: '', status: '', severity: '', page: 1, limit: 10 });
    this.store.page = 1;
    this.store.limit = 10;
    void this.store.load();
  }

  changePage(page: number): void {
    this.queryForm.patchValue({ page });
    this.store.setPage(page);
  }

  changeLimit(limit: number): void {
    this.queryForm.patchValue({ limit, page: 1 });
    this.store.setLimit(limit);
  }

  updateStatus(item: RuntimeSignalItem, status: RuntimeSignalStatus): void {
    this.memoryLibraryService.updateRuntimeSignalStatus(item.id, { status }).subscribe({
      next: response => {
        if (response.code !== 0) {
          this.store.errorMessage.set(response.msg || this.localize('状态更新失败。'));
          return;
        }
        void this.store.load();
      },
      error: error => this.store.errorMessage.set(error?.error?.msg || error?.message || this.localize('状态更新请求失败。'))
    });
  }

  typeLabel(value?: RuntimeSignalType): string {
    return value ? this.localize(RUNTIME_SIGNAL_TYPE_LABELS[value]) : '-';
  }

  statusLabel(value?: RuntimeSignalStatus): string {
    return value ? this.localize(RUNTIME_SIGNAL_STATUS_LABELS[value]) : '-';
  }

  severityLabel(value?: RuntimeSignalSeverity): string {
    return value ? this.localize(RUNTIME_SIGNAL_SEVERITY_LABELS[value]) : '-';
  }

  statusSeverity(value?: RuntimeSignalStatus): 'success' | 'info' | 'warn' | 'danger' | 'secondary' {
    if (value === RUNTIME_SIGNAL_STATUS.completed) return 'success';
    if (value === RUNTIME_SIGNAL_STATUS.pending || value === RUNTIME_SIGNAL_STATUS.scheduled) return 'warn';
    if (value === RUNTIME_SIGNAL_STATUS.failed) return 'danger';
    if (value === RUNTIME_SIGNAL_STATUS.processing) return 'info';
    return 'secondary';
  }

  severitySeverity(value?: RuntimeSignalSeverity): 'success' | 'info' | 'warn' | 'danger' | 'secondary' {
    if (value === RUNTIME_SIGNAL_SEVERITY.critical || value === RUNTIME_SIGNAL_SEVERITY.high) return 'danger';
    if (value === RUNTIME_SIGNAL_SEVERITY.medium) return 'warn';
    if (value === RUNTIME_SIGNAL_SEVERITY.low) return 'info';
    return 'secondary';
  }

  private parseSignalType(value?: string): RuntimeSignalType | undefined {
    return isRecordValue(RUNTIME_SIGNAL_TYPE, value) ? value : undefined;
  }

  private parseStatus(value?: string): RuntimeSignalStatus | undefined {
    return isRecordValue(RUNTIME_SIGNAL_STATUS, value) ? value : undefined;
  }

  private parseSeverity(value?: string): RuntimeSignalSeverity | undefined {
    return isRecordValue(RUNTIME_SIGNAL_SEVERITY, value) ? value : undefined;
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}

const RUNTIME_SIGNAL_TYPE_LABELS: Record<RuntimeSignalType, string> = {
  risk: '风险',
  health_followup: '健康',
  todo: '待办',
  reminder: '提醒'
};

const RUNTIME_SIGNAL_STATUS_LABELS: Record<RuntimeSignalStatus, string> = {
  pending: '待处理',
  scheduled: '已排程',
  processing: '处理中',
  completed: '已完成',
  ignored: '已忽略',
  failed: '失败'
};

const RUNTIME_SIGNAL_SEVERITY_LABELS: Record<RuntimeSignalSeverity, string> = {
  critical: '严重',
  high: '高',
  medium: '中',
  low: '低'
};

function isRecordValue<T extends string>(record: Record<string, T>, value?: string): value is T {
  return Object.values(record).includes(value as T);
}
