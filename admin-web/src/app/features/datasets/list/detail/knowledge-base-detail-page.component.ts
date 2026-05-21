import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../../core/models/api.models';
import { KnowledgeBaseItem } from '../shared/knowledge-base.models';
import { KnowledgeBaseService } from '../shared/knowledge-base.service';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-knowledge-base-detail-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    FeedbackMessageComponent,
    TagModule
  ],
  templateUrl: './knowledge-base-detail-page.component.html',
  styleUrl: './knowledge-base-detail-page.component.css'
})
export class KnowledgeBaseDetailPageComponent implements OnInit {
  private readonly route = inject(ActivatedRoute);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly dataset = signal<KnowledgeBaseItem | null>(null);
  readonly datasetId = signal('');

  ngOnInit(): void {
    const datasetId = this.route.snapshot.paramMap.get('id') || '';
    this.datasetId.set(datasetId);
    if (datasetId) {
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

          this.dataset.set(response.data);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '知识库详情请求失败。');
        }
      });
  }

  statusLabel(status?: number): string {
    return status === 1 ? '启用' : '停用';
  }

  statusSeverity(status?: number): 'success' | 'danger' {
    return status === 1 ? 'success' : 'danger';
  }
}
