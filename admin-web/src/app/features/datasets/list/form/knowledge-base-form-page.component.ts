import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { ToggleSwitchModule } from 'primeng/toggleswitch';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { FormDetailLayoutComponent } from '../../../../shared/components/form-detail-layout.component';
import { ApiResponse } from '../../../../core/models/api.models';
import { KnowledgeBaseItem, KnowledgeBasePayload } from '../shared/knowledge-base.models';
import { KnowledgeBaseService } from '../shared/knowledge-base.service';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-knowledge-base-form-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    ButtonModule,
    InputTextModule,
    ToggleSwitchModule,
    FeedbackMessageComponent,
    FormDetailLayoutComponent
  ],
  templateUrl: './knowledge-base-form-page.component.html',
  styleUrl: './knowledge-base-form-page.component.css'
})
export class KnowledgeBaseFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);

  readonly datasetId = signal('');
  readonly loading = signal(false);
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');

  readonly form = this.formBuilder.nonNullable.group({
    name: ['', [Validators.required]],
    description: [''],
    status: [1]
  });

  ngOnInit(): void {
    const datasetId = this.route.snapshot.paramMap.get('id') || '';
    if (datasetId) {
      this.datasetId.set(datasetId);
      this.loadDetail(datasetId);
    }
  }

  loadDetail(datasetId: string): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.knowledgeBaseService
      .getDetail(datasetId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<KnowledgeBaseItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || '知识库详情获取失败。');
            return;
          }

          const item = response.data;
          this.form.patchValue({
            name: item.name || '',
            description: item.description || '',
            status: item.status ?? 1
          });
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '知识库详情请求失败。');
        }
      });
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();

    const payload: KnowledgeBasePayload = {
      name: raw.name,
      description: raw.description || undefined,
      permission: 'public',
      chunkMethod: 'default',
      status: raw.status
    };

    this.feedbackMessage.set('');
    this.submitting.set(true);

    const request$ = this.datasetId()
      ? this.knowledgeBaseService.update(this.datasetId(), payload)
      : this.knowledgeBaseService.create(payload);

    request$.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (response: ApiResponse<KnowledgeBaseItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || '知识库保存失败。');
          return;
        }

        void this.router.navigate(['/datasets']);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || '知识库保存请求失败。');
      }
    });
  }

  backToList(): void {
    void this.router.navigate(['/datasets']);
  }

  isStatusActive(): boolean {
    return (this.form.controls.status.value ?? 1) === 1;
  }

  setStatusByToggle(active: boolean): void {
    this.form.controls.status.setValue(active ? 1 : 0, { emitEvent: false });
  }
}
