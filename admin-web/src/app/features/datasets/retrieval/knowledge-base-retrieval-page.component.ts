import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { SliderModule } from 'primeng/slider';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { KnowledgeBaseItem } from '../list/shared/knowledge-base.models';
import { KnowledgeBaseService } from '../list/shared/knowledge-base.service';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';

@Component({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    InputTextModule,
    SliderModule,
    FeedbackMessageComponent,
    PageToolbarComponent
  ],
  standalone: true,
  templateUrl: './knowledge-base-retrieval-page.component.html',
  styleUrl: './knowledge-base-retrieval-page.component.css'
})
export class KnowledgeBaseRetrievalPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);

  readonly loading = signal(false);
  readonly testing = signal(false);
  readonly feedbackMessage = signal('');
  readonly dataset = signal<KnowledgeBaseItem | null>(null);
  readonly datasetId = signal('');
  readonly testResult = signal<Record<string, unknown> | null>(null);

  readonly form = this.formBuilder.nonNullable.group({
    query: ['', [Validators.required]],
    topK: [5],
    threshold: [0.3],
    rewriteQuery: ['']
  });

  ngOnInit(): void {
    const datasetId = this.route.snapshot.paramMap.get('id') || '';
    this.datasetId.set(datasetId);
    if (datasetId) {
      this.loadDetail(datasetId);
    }
  }

  loadDetail(datasetId: string): void {
    this.loading.set(true);
    this.feedbackMessage.set('');

    this.knowledgeBaseService
      .getDetail(datasetId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<KnowledgeBaseItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || '知识库详情获取失败。');
            return;
          }

          this.dataset.set(response.data);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '知识库详情请求失败。');
        }
      });
  }

  runTest(): void {
    if (this.form.invalid || this.testing() || !this.datasetId()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const payload: Record<string, unknown> = {
      query: raw.query,
      topK: Number(raw.topK || 5),
      threshold: Number(raw.threshold ?? 0.3)
    };

    if (raw.rewriteQuery) {
      payload['rewriteQuery'] = raw.rewriteQuery;
    }

    this.feedbackMessage.set('');
    this.testResult.set(null);
    this.testing.set(true);

    this.knowledgeBaseService
      .retrievalTest(this.datasetId(), payload)
      .pipe(finalize(() => this.testing.set(false)))
      .subscribe({
        next: (response: ApiResponse<Record<string, unknown>>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || '检索测试失败。');
            return;
          }

          this.testResult.set(response.data || {});
          this.feedbackMessage.set('检索测试完成。');
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '检索测试请求失败。');
        }
      });
  }
}
