import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../../core/models/api.models';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { EmptyStateComponent } from '../../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { SearchFilterCardComponent } from '../../../../shared/components/search-filter-card.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../../shared/components/summary-metric-grid.component';
import { ConfirmDialogService } from '../../../../shared/services/confirm-dialog.service';
import { PageableListStore } from '../../../../shared/stores/pageable-list.store';
import { AdminUserItem } from './admin-user.models';
import { AdminUserService } from './admin-user.service';

@Component({
  selector: 'app-users-page',
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
    SummaryMetricGridComponent
  ],
  templateUrl: './users-page.component.html',
  styleUrl: './users-page.component.css'
})
export class UsersPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly adminUserService = inject(AdminUserService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<AdminUserItem>(async (page, limit) => {
    const response = await firstValueFrom(
      this.adminUserService.getUserPage({
        mobile: this.searchForm.getRawValue().mobile || undefined,
        page,
        limit
      })
    );
    if (response.code !== 0) throw new Error(response.msg || this.localize('用户列表获取失败。'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly errorMessage = this.store.errorMessage;
  readonly users = this.store.items;
  readonly total = this.store.total;
  readonly selectedUsers = signal<AdminUserItem[]>([]);
  expandedRows: Record<string, boolean> = {};

  readonly searchForm = this.formBuilder.nonNullable.group({
    mobile: ['']
  });

  readonly activeCount = computed(() => this.users().filter((item: AdminUserItem) => item.status === 1).length);
  readonly disabledCount = computed(() => this.users().filter((item: AdminUserItem) => item.status !== 1).length);
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('用户总数'), value: this.total() },
      { title: this.localize('当前页启用用户'), value: this.activeCount() },
      { title: this.localize('当前页停用用户'), value: this.disabledCount() }
    ];
  });

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers(page = this.store.page): void {
    this.store.page = page;
    void this.store.load();
  }

  search(): void {
    this.loadUsers(1);
  }

  reset(): void {
    this.searchForm.reset({ mobile: '' });
    this.loadUsers(1);
  }

  resetPassword(user: AdminUserItem): void {
    this.errorMessage.set('');
    this.adminUserService.resetPassword(user.userid).subscribe({
      next: (response: ApiResponse<string>) => {
        if (response.code !== 0) {
          this.errorMessage.set(response.msg || this.localize('重置密码失败。'));
          return;
        }

        this.errorMessage.set(this.localize(`已触发用户 ${user.mobile} 的密码重置。${response.data ? ` 返回信息：${response.data}` : ''}`));
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.errorMessage.set(error.error?.msg || error.message || this.localize('重置密码请求失败。'));
      }
    });
  }

  toggleStatus(user: AdminUserItem): void {
    const targetStatus = user.status === 1 ? 0 : 1;
    this.errorMessage.set('');
    this.adminUserService.changeStatus(targetStatus, [user.userid]).subscribe({
      next: (response: ApiResponse<unknown>) => {
        if (response.code !== 0) {
          this.errorMessage.set(response.msg || this.localize('修改状态失败。'));
          return;
        }

        this.loadUsers(this.store.page);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.errorMessage.set(error.error?.msg || error.message || this.localize('状态修改请求失败。'));
      }
    });
  }

  batchChangeStatus(targetStatus: number): void {
    const selected = this.selectedUsers();
    if (selected.length === 0) return;

    const label = targetStatus === 1 ? this.localize('启用') : this.localize('停用');
    this.confirmDialog.confirmDanger({
      header: this.localize(`批量${label}用户`),
      message: this.localize(`确认将选中的 ${selected.length} 个用户${label}吗？`),
      accept: () => {
        this.errorMessage.set('');
        const userIds = selected.map(u => u.userid);
        this.adminUserService.changeStatus(targetStatus, userIds).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.errorMessage.set(response.msg || this.localize(`批量${label}失败。`));
              return;
            }
            this.selectedUsers.set([]);
            this.loadUsers(this.store.page);
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.errorMessage.set(error.error?.msg || error.message || this.localize(`批量${label}请求失败。`));
          }
        });
      }
    });
  }

  get hasSelection(): boolean {
    return this.selectedUsers().length > 0;
  }

  deleteUser(user: AdminUserItem): void {
    const userLabel = user.mobile || String(user.userid);

    this.confirmDialog.confirmDanger({
      header: this.localize('删除用户'),
      message: this.localize(`确认删除用户“${userLabel}”吗？该操作不可撤销。`),
      accept: () => {
        this.errorMessage.set('');
        this.adminUserService.deleteUser(user.userid).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.errorMessage.set(response.msg || this.localize('删除用户失败。'));
              return;
            }

            this.loadUsers(this.store.page);
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.errorMessage.set(error.error?.msg || error.message || this.localize('删除用户请求失败。'));
          }
        });
      }
    });
  }

  statusLabel(status: number): string {
    return status === 1 ? this.localize('启用') : this.localize('停用');
  }

  statusSeverity(status: number): 'success' | 'danger' {
    return status === 1 ? 'success' : 'danger';
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
