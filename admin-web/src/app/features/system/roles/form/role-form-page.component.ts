import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { InputNumberModule } from 'primeng/inputnumber';
import { SelectModule } from 'primeng/select';
import { ApiResponse } from '../../../../core/models/api.models';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { FormDetailLayoutComponent } from '../../../../shared/components/form-detail-layout.component';
import { RoleService } from '../shared/role.service';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-role-form-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    InputTextModule,
    InputNumberModule,
    SelectModule,
    TranslatePipe,
    FeedbackMessageComponent,
    FormDetailLayoutComponent
  ],
  templateUrl: './role-form-page.component.html',
  styleUrl: './role-form-page.component.css'
})
export class RoleFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly roleService = inject(RoleService);
  private readonly i18n = inject(I18nService);

  readonly roleId = signal(0);
  readonly loading = signal(false);
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');
  readonly isEdit = signal(false);

  readonly statusOptions = computed(() => {
    this.i18n.localeVersion();
    return [
      { label: this.localize('启用'), value: 1 },
      { label: this.localize('停用'), value: 0 }
    ];
  });

  readonly form = this.formBuilder.nonNullable.group({
    name: ['', [Validators.required]],
    code: ['', [Validators.required]],
    remark: [''],
    status: [1],
    sort: [0]
  });

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.roleId.set(Number(id));
      this.isEdit.set(true);
      this.loadDetail(Number(id));
    }
  }

  loadDetail(id: number): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.roleService
      .getRolePage({ page: 1, limit: 100 })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: response => {
          if (response.code !== 0 || !response.data?.list) {
            this.feedbackMessage.set(response.msg || this.localize('角色详情获取失败。'));
            return;
          }
          const role = response.data.list.find(r => r.id === id);
          if (role) {
            this.form.patchValue({
              name: role.name,
              code: role.code,
              remark: role.remark || '',
              status: role.status,
              sort: role.sort
            });
          }
        },
        error: () => this.feedbackMessage.set(this.localize('角色详情请求失败。'))
      });
  }

  submit(): void {
    if (this.form.invalid) return;

    const payload = this.form.getRawValue();
    this.feedbackMessage.set('');
    this.submitting.set(true);

    const obs = this.isEdit()
      ? this.roleService.updateRole(this.roleId(), payload)
      : this.roleService.createRole(payload);

    obs.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (res: ApiResponse<unknown>) => {
        if (res.code === 0) {
          void this.router.navigate(['/users/roles']);
        } else {
          this.feedbackMessage.set(res.msg || this.localize('操作失败'));
        }
      },
      error: () => this.feedbackMessage.set(this.localize('请求失败'))
    });
  }

  cancel(): void {
    void this.router.navigate(['/users/roles']);
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
