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
import { BillingAdminService } from '../subscriptions/billing-admin.service';
import { BILLING_CHARGE_STATUS, BillingChargeStatus, BillingUsageItem } from '../subscriptions/billing-admin.models';

@Component({
  selector: 'app-billing-usage-page',
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
  templateUrl: './billing-usage-page.component.html',
  styleUrl: './billing-usage-page.component.css'
})
export class BillingUsagePageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly billingAdminService = inject(BillingAdminService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly errorMessage = signal('');
  readonly items = signal<BillingUsageItem[]>([]);
  readonly total = signal(0);
  readonly page = signal(1);
  readonly pageSize = signal(10);

  readonly searchForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    serviceType: ['']
  });

  readonly chargeCount = computed(
    () => this.items().filter(item => item.chargeStatus === BILLING_CHARGE_STATUS.charged).length
  );
  readonly partialCount = computed(
    () => this.items().filter(item => item.chargeStatus === BILLING_CHARGE_STATUS.partial).length
  );
  readonly exhaustedCount = computed(
    () => this.items().filter(item => item.chargeStatus === BILLING_CHARGE_STATUS.exhausted).length
  );
  readonly tokenSum = computed(() => this.items().reduce((sum, item) => sum + (item.normalizedTokens || 0), 0));
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('用量记录数'), value: this.total() },
      { title: this.localize('当前页扣减成功'), value: this.chargeCount(), severity: 'success' },
      {
        title: this.localize('当前页部分扣减'),
        value: this.partialCount(),
        severity: this.partialCount() > 0 ? 'warn' : 'success'
      },
      { title: this.localize('当前页折算 token'), value: this.tokenSum(), severity: 'info' },
      {
        title: this.localize('当前页额度耗尽'),
        value: this.exhaustedCount(),
        severity: this.exhaustedCount() > 0 ? 'danger' : 'success'
      }
    ];
  });

  ngOnInit(): void {
    this.loadUsage();
  }

  loadUsage(page = this.page()): void {
    this.page.set(page);
    this.errorMessage.set('');
    this.loading.set(true);

    const { keyword, serviceType } = this.searchForm.getRawValue();
    this.billingAdminService
      .getUsagePage({
        keyword: keyword || undefined,
        serviceType: serviceType || undefined,
        page: this.page(),
        limit: this.pageSize()
      })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<{ total: number; list: BillingUsageItem[] }>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || this.localize('用量列表获取失败。'));
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.items.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || this.localize('用量列表请求失败，请稍后重试。'));
        }
      });
  }

  search(): void {
    this.loadUsage(1);
  }

  reset(): void {
    this.searchForm.reset({ keyword: '', serviceType: '' });
    this.loadUsage(1);
  }

  onPageChange(page: number): void {
    this.loadUsage(page);
  }

  onLimitChange(limit: number): void {
    this.pageSize.set(limit);
    this.loadUsage(1);
  }

  chargeStatusLabel(status?: BillingChargeStatus): string {
    return status ? this.localize(BILLING_CHARGE_STATUS_LABELS[status]) : '-';
  }

  chargeStatusSeverity(status?: BillingChargeStatus): 'success' | 'warn' | 'danger' | 'secondary' {
    return status ? BILLING_CHARGE_STATUS_SEVERITIES[status] : 'secondary';
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}

const BILLING_CHARGE_STATUS_LABELS: Record<BillingChargeStatus, string> = {
  charged: '已扣减',
  partial: '部分扣减',
  exhausted: '额度耗尽'
};

const BILLING_CHARGE_STATUS_SEVERITIES: Record<BillingChargeStatus, 'success' | 'warn' | 'danger'> = {
  charged: 'success',
  partial: 'warn',
  exhausted: 'danger'
};
