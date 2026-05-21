import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../shared/components/summary-metric-grid.component';
import { BillingAdminService } from './billing-admin.service';
import { BillingSubscriptionItem, BillingSubscriptionStatus } from './billing-admin.models';

@Component({
  selector: 'app-billing-subscriptions-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    CardModule,
    InputTextModule,
    TableModule,
    TagModule,
    TranslatePipe,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PageToolbarComponent,
    PaginationBarComponent,
    SearchFilterCardComponent,
    SummaryMetricGridComponent
  ],
  templateUrl: './billing-subscriptions-page.component.html',
  styleUrl: './billing-subscriptions-page.component.css'
})
export class BillingSubscriptionsPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly billingAdminService = inject(BillingAdminService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly errorMessage = signal('');
  readonly items = signal<BillingSubscriptionItem[]>([]);
  readonly total = signal(0);
  readonly page = signal(1);
  readonly pageSize = signal(10);

  readonly searchForm = this.formBuilder.nonNullable.group({
    mobile: ['']
  });

  readonly exhaustedCount = computed(() => this.items().filter(item => item.isExhausted).length);
  readonly lowBalanceCount = computed(() => this.items().filter(item => item.isLowBalance && !item.isExhausted).length);
  readonly totalRemainingTokens = computed(() =>
    this.items().reduce((sum, item) => sum + (item.remainingTokens || 0), 0)
  );
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('订阅用户数'), value: this.total() },
      {
        title: this.localize('当前页低余额'),
        value: this.lowBalanceCount(),
        severity: this.lowBalanceCount() > 0 ? 'warn' : 'success'
      },
      {
        title: this.localize('当前页已耗尽'),
        value: this.exhaustedCount(),
        severity: this.exhaustedCount() > 0 ? 'danger' : 'success'
      },
      { title: this.localize('当前页剩余总量'), value: this.totalRemainingTokens(), severity: 'info' }
    ];
  });

  ngOnInit(): void {
    this.loadSubscriptions();
  }

  loadSubscriptions(page = this.page()): void {
    this.page.set(page);
    this.errorMessage.set('');
    this.loading.set(true);

    this.billingAdminService
      .getSubscriptionPage({
        mobile: this.searchForm.getRawValue().mobile || undefined,
        page: this.page(),
        limit: this.pageSize()
      })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<{ total: number; list: BillingSubscriptionItem[] }>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || this.localize('订阅列表获取失败。'));
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.items.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || this.localize('订阅列表请求失败，请稍后重试。'));
        }
      });
  }

  search(): void {
    this.loadSubscriptions(1);
  }

  reset(): void {
    this.searchForm.reset({ mobile: '' });
    this.loadSubscriptions(1);
  }

  onPageChange(page: number): void {
    this.loadSubscriptions(page);
  }

  onLimitChange(limit: number): void {
    this.pageSize.set(limit);
    this.loadSubscriptions(1);
  }

  quotaRatio(item: BillingSubscriptionItem): number {
    if (!item.totalTokens || item.totalTokens <= 0) {
      return 0;
    }

    return Number(((item.remainingTokens / item.totalTokens) * 100).toFixed(1));
  }

  statusLabel(status?: BillingSubscriptionStatus): string {
    return status ? this.localize(BILLING_SUBSCRIPTION_STATUS_LABELS[status]) : '-';
  }

  statusSeverity(status?: BillingSubscriptionStatus): 'success' | 'warn' | 'danger' | 'secondary' {
    return status ? BILLING_SUBSCRIPTION_STATUS_SEVERITIES[status] : 'secondary';
  }

  quotaSeverity(item: BillingSubscriptionItem): 'success' | 'warn' | 'danger' {
    if (item.isExhausted) {
      return 'danger';
    }

    if (item.isLowBalance) {
      return 'warn';
    }

    return 'success';
  }

  quotaLabel(item: BillingSubscriptionItem): string {
    if (item.isExhausted) {
      return this.localize('已耗尽');
    }

    if (item.isLowBalance) {
      return this.localize('低余额');
    }

    return this.localize('充足');
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}

const BILLING_SUBSCRIPTION_STATUS_LABELS: Record<BillingSubscriptionStatus, string> = {
  active: '生效中',
  expired: '已到期',
  paused: '已暂停'
};

const BILLING_SUBSCRIPTION_STATUS_SEVERITIES: Record<BillingSubscriptionStatus, 'success' | 'warn' | 'danger'> = {
  active: 'success',
  expired: 'danger',
  paused: 'warn'
};
