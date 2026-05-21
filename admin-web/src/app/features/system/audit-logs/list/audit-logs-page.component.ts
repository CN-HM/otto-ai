import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../../core/models/api.models';
import { EmptyStateComponent } from '../../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';
import { PaginationBarComponent } from '../../../../shared/components/pagination-bar.component';
import { SearchFilterCardComponent } from '../../../../shared/components/search-filter-card.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../../shared/components/summary-metric-grid.component';
import { AuditEntityChangeItem, AuditLogActionItem, AuditLogItem } from '../shared/audit-log.models';
import { AuditLogService } from '../shared/audit-log.service';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';

@Component({
  selector: 'app-audit-logs-page',
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
    EmptyStateComponent,
    FeedbackMessageComponent,
    PageToolbarComponent,
    PaginationBarComponent,
    SearchFilterCardComponent,
    SummaryMetricGridComponent,
    TranslatePipe
  ],
  templateUrl: './audit-logs-page.component.html',
  styleUrl: './audit-logs-page.component.css'
})
export class AuditLogsPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly auditLogService = inject(AuditLogService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly errorMessage = signal('');
  readonly auditLogs = signal<AuditLogItem[]>([]);
  readonly total = signal(0);
  readonly page = signal(1);
  readonly pageSize = signal(10);
  expandedRows: Record<string, boolean> = {};

  readonly searchForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    method: [''],
    result: ['']
  });

  readonly errorCount = computed(() => this.auditLogs().filter(log => this.isError(log)).length);
  readonly entityChangeCount = computed(() =>
    this.auditLogs().reduce((total, log) => total + (log.entityChangeCount ?? 0), 0)
  );
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.i18n.translate('auditLogs.totalCount'), value: this.total() },
      {
        title: this.i18n.translate('auditLogs.currentPageErrorRequests'),
        value: this.errorCount(),
        severity: this.errorCount() > 0 ? 'danger' : 'success'
      },
      {
        title: this.i18n.translate('auditLogs.currentPageEntityChanges'),
        value: this.entityChangeCount(),
        severity: this.entityChangeCount() > 0 ? 'info' : 'secondary'
      }
    ];
  });

  ngOnInit(): void {
    this.loadAuditLogs();
  }

  loadAuditLogs(page = this.page()): void {
    this.page.set(page);
    this.errorMessage.set('');
    this.loading.set(true);
    this.expandedRows = {};

    const { keyword, method, result } = this.searchForm.getRawValue();
    this.auditLogService
      .getAuditLogPage({
        keyword: keyword || undefined,
        method: method || undefined,
        result: result || undefined,
        page: this.page(),
        limit: this.pageSize()
      })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<{ total: number; list: AuditLogItem[] }>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || this.i18n.translate('auditLogs.loadFailed'));
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.auditLogs.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || this.i18n.translate('auditLogs.requestFailed'));
        }
      });
  }

  search(): void {
    this.loadAuditLogs(1);
  }

  reset(): void {
    this.searchForm.reset({ keyword: '', method: '', result: '' });
    this.loadAuditLogs(1);
  }

  onPageChange(page: number): void {
    this.loadAuditLogs(page);
  }

  onLimitChange(limit: number): void {
    this.pageSize.set(limit);
    this.loadAuditLogs(1);
  }

  isError(log: AuditLogItem): boolean {
    return !!log.hasException || !!(log.httpStatusCode && log.httpStatusCode >= 400);
  }

  resultLabel(log: AuditLogItem): string {
    return this.isError(log) ? this.i18n.translateUiText('异常') : this.i18n.translate('auditLogs.success');
  }

  resultSeverity(log: AuditLogItem): 'danger' | 'success' {
    return this.isError(log) ? 'danger' : 'success';
  }

  methodSeverity(method?: string): 'success' | 'info' | 'warn' | 'danger' | 'secondary' | 'contrast' {
    switch ((method || '').toUpperCase()) {
      case 'POST':
        return 'success';
      case 'PUT':
        return 'info';
      case 'DELETE':
        return 'danger';
      case 'PATCH':
        return 'warn';
      case 'GET':
        return 'secondary';
      default:
        return 'contrast';
    }
  }

  actionLabel(action: AuditLogActionItem): string {
    const serviceName = action.serviceName?.split('.').pop() || '-';
    return action.methodName ? `${serviceName}.${action.methodName}` : serviceName;
  }

  changeTypeLabel(change: AuditEntityChangeItem): string {
    switch ((change.changeType || '').toLowerCase()) {
      case 'created':
        return this.i18n.translateUiText('新增');
      case 'updated':
        return this.i18n.translateUiText('更新');
      case 'deleted':
        return this.i18n.translateUiText('删除');
      default:
        return change.changeType || '-';
    }
  }

  changeTypeSeverity(change: AuditEntityChangeItem): 'success' | 'warn' | 'danger' | 'secondary' {
    switch ((change.changeType || '').toLowerCase()) {
      case 'created':
        return 'success';
      case 'updated':
        return 'warn';
      case 'deleted':
        return 'danger';
      default:
        return 'secondary';
    }
  }

  shortEntityName(entityTypeFullName?: string): string {
    if (!entityTypeFullName) {
      return '-';
    }

    return entityTypeFullName.split('.').pop() || entityTypeFullName;
  }

  formatValue(value?: string | number | null): string {
    return value === undefined || value === null || value === '' ? '-' : String(value);
  }
}
