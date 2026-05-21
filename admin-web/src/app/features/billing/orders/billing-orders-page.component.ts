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
import { HasPermissionDirective } from '../../../shared/directives/has-permission.directive';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import { BillingAdminService } from '../subscriptions/billing-admin.service';
import { BILLING_ORDER_STATUS, BillingOrderItem, BillingOrderStatus } from '../subscriptions/billing-admin.models';

@Component({
  selector: 'app-billing-orders-page',
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
    SummaryMetricGridComponent,
    HasPermissionDirective
  ],
  templateUrl: './billing-orders-page.component.html',
  styleUrl: './billing-orders-page.component.css'
})
export class BillingOrdersPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly billingAdminService = inject(BillingAdminService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly errorMessage = signal('');
  readonly items = signal<BillingOrderItem[]>([]);
  readonly total = signal(0);
  readonly page = signal(1);
  readonly pageSize = signal(10);

  readonly searchForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    status: ['']
  });

  readonly pendingCount = computed(
    () =>
      this.items().filter(
        item => item.status === BILLING_ORDER_STATUS.pending || item.status === BILLING_ORDER_STATUS.created
      ).length
  );
  readonly activatedCount = computed(
    () => this.items().filter(item => item.status === BILLING_ORDER_STATUS.activated).length
  );
  readonly amountSum = computed(() => this.items().reduce((sum, item) => sum + (item.amount || 0), 0));
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('订单总数'), value: this.total() },
      {
        title: this.localize('当前页待处理'),
        value: this.pendingCount(),
        severity: this.pendingCount() > 0 ? 'warn' : 'success'
      },
      { title: this.localize('当前页已激活'), value: this.activatedCount(), severity: 'success' },
      { title: this.localize('当前页金额'), value: this.amountSum().toFixed(2), severity: 'info' }
    ];
  });

  ngOnInit(): void {
    this.loadOrders();
  }

  loadOrders(page = this.page()): void {
    this.page.set(page);
    this.errorMessage.set('');
    this.loading.set(true);

    const { keyword, status } = this.searchForm.getRawValue();
    this.billingAdminService
      .getOrderPage({
        keyword: keyword || undefined,
        status: this.parseStatus(status),
        page: this.page(),
        limit: this.pageSize()
      })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<{ total: number; list: BillingOrderItem[] }>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || this.localize('订单列表获取失败。'));
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.items.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || this.localize('订单列表请求失败，请稍后重试。'));
        }
      });
  }

  search(): void {
    this.loadOrders(1);
  }

  reset(): void {
    this.searchForm.reset({ keyword: '', status: '' });
    this.loadOrders(1);
  }

  onPageChange(page: number): void {
    this.loadOrders(page);
  }

  onLimitChange(limit: number): void {
    this.pageSize.set(limit);
    this.loadOrders(1);
  }

  canMarkPaid(item: BillingOrderItem): boolean {
    return item.status === BILLING_ORDER_STATUS.created || item.status === BILLING_ORDER_STATUS.pending;
  }

  markPaid(item: BillingOrderItem): void {
    if (!this.canMarkPaid(item)) {
      return;
    }

    const planLabel = item.planName || item.planCode || item.planId;
    this.confirmDialog.confirmDanger({
      header: this.localize('确认支付并激活订单'),
      message: this.localize(`确认将订单 ${item.orderNo}（${planLabel}）标记为已支付并立即激活吗？`),
      acceptLabel: this.localize('确认激活'),
      accept: () => {
        this.loading.set(true);
        this.errorMessage.set('');
        this.billingAdminService
          .markOrderPaid(item.id, {
            transactionNo: item.externalTradeNo,
            remark: this.localize('后台手工确认支付')
          })
          .pipe(finalize(() => this.loading.set(false)))
          .subscribe({
            next: (response: ApiResponse<unknown>) => {
              if (response.code !== 0) {
                this.errorMessage.set(response.msg || this.localize('订单确认支付失败。'));
                return;
              }

              this.loadOrders(this.page());
            },
            error: (error: { error?: { msg?: string }; message?: string }) => {
              this.errorMessage.set(error.error?.msg || error.message || this.localize('订单确认支付请求失败。'));
            }
          });
      }
    });
  }

  statusSeverity(status: BillingOrderStatus): 'success' | 'warn' | 'danger' | 'secondary' | 'info' {
    return BILLING_ORDER_STATUS_SEVERITIES[status] ?? 'secondary';
  }

  statusLabel(status: BillingOrderStatus): string {
    return BILLING_ORDER_STATUS_LABELS[status] ? this.localize(BILLING_ORDER_STATUS_LABELS[status]) : '-';
  }

  private parseStatus(value?: string): BillingOrderStatus | undefined {
    return isRecordValue(BILLING_ORDER_STATUS, value) ? value : undefined;
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}

const BILLING_ORDER_STATUS_LABELS: Record<BillingOrderStatus, string> = {
  created: '待发起支付',
  pending: '待确认支付',
  paid: '已支付',
  activated: '已激活',
  cancelled: '已取消',
  failed: '失败'
};

const BILLING_ORDER_STATUS_SEVERITIES: Record<
  BillingOrderStatus,
  'success' | 'warn' | 'danger' | 'secondary' | 'info'
> = {
  created: 'warn',
  pending: 'warn',
  paid: 'info',
  activated: 'success',
  cancelled: 'danger',
  failed: 'danger'
};

function isRecordValue<T extends string>(record: Record<string, T>, value?: string): value is T {
  return Object.values(record).includes(value as T);
}
