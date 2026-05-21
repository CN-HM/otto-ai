import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../../core/models/api.models';
import { EmptyStateComponent } from '../../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { PaginationBarComponent } from '../../../../shared/components/pagination-bar.component';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';
import { SearchFilterCardComponent } from '../../../../shared/components/search-filter-card.component';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { ConfirmDialogService } from '../../../../shared/services/confirm-dialog.service';
import { HasPermissionDirective } from '../../../../shared/directives/has-permission.directive';
import { PageableListStore } from '../../../../shared/stores/pageable-list.store';
import { RoleDto } from '../../../../core/auth/rbac.models';
import { RoleService } from '../shared/role.service';

@Component({
  selector: 'app-roles-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    InputTextModule,
    TableModule,
    TagModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PaginationBarComponent,
    PageToolbarComponent,
    SearchFilterCardComponent,
    TranslatePipe,
    HasPermissionDirective
  ],
  templateUrl: './roles-page.component.html',
  styleUrl: './roles-page.component.css'
})
export class RolesPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly roleService = inject(RoleService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<RoleDto>(async (page, limit) => {
    const { name } = this.queryForm.getRawValue();
    const response = await firstValueFrom(this.roleService.getRolePage({ name: name || undefined, page, limit }));
    if (response.code !== 0) throw new Error(response.msg || this.localize('角色列表获取失败。'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly roles = this.store.items;
  readonly total = this.store.total;

  readonly queryForm = this.formBuilder.nonNullable.group({
    name: [''],
    page: [1],
    limit: [10]
  });

  ngOnInit(): void {
    this.loadRoles();
  }

  loadRoles(): void {
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
    this.queryForm.reset({ name: '', page: 1, limit: 10 });
    this.store.page = 1;
    this.store.limit = 10;
    void this.store.load();
  }

  onPageChange(page: number): void {
    this.queryForm.patchValue({ page });
    this.store.setPage(page);
  }

  deleteRole(role: RoleDto): void {
    this.confirmDialog.confirmDanger({
      message: this.localize(`确认删除角色「${role.name}」吗？`),
      accept: () => {
        this.roleService.deleteRole(role.id).subscribe({
          next: (res: ApiResponse<unknown>) => {
            if (res.code === 0) {
              void this.store.load();
            } else {
              this.feedbackMessage.set(res.msg || this.localize('删除失败'));
            }
          },
          error: () => this.feedbackMessage.set(this.localize('删除请求失败'))
        });
      }
    });
  }

  statusLabel(status: number): string {
    return status === 1 ? this.localize('启用') : this.localize('停用');
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
