import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject } from '@angular/core';
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
import { SearchFilterCardComponent } from '../../../../shared/components/search-filter-card.component';
import { ConfirmDialogService } from '../../../../shared/services/confirm-dialog.service';
import { PageableListStore } from '../../../../shared/stores/pageable-list.store';
import { KnowledgeBaseItem } from '../shared/knowledge-base.models';
import { KnowledgeBaseService } from '../shared/knowledge-base.service';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';

@Component({
  selector: 'app-knowledge-bases-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
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
    SearchFilterCardComponent,
    TranslatePipe
  ],
  templateUrl: './knowledge-bases-page.component.html',
  styleUrl: './knowledge-bases-page.component.css'
})
export class KnowledgeBasesPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly store = new PageableListStore<KnowledgeBaseItem>(async () => {
    const { name, page, limit } = this.queryForm.getRawValue();
    const res = await firstValueFrom(
      this.knowledgeBaseService.getPage({
        name: name || undefined,
        page,
        page_size: limit
      })
    );
    if (res.code !== 0) throw new Error(res.msg || '知识库列表获取失败');
    return res.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly datasets = this.store.items;
  readonly total = this.store.total;
  expandedRows: Record<string, boolean> = {};

  readonly queryForm = this.formBuilder.nonNullable.group({
    name: [''],
    page: [1],
    limit: [10]
  });

  readonly enabledCount = computed(() => this.datasets().filter((item: KnowledgeBaseItem) => item.status === 1).length);
  readonly documentCount = computed(() =>
    this.datasets().reduce((sum: number, item: KnowledgeBaseItem) => sum + Number(item.documentCount || 0), 0)
  );

  ngOnInit(): void {
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

  changePage(page: number): void {
    this.queryForm.patchValue({ page });
    this.store.page = page;
    void this.store.load();
  }

  changeLimit(limit: number): void {
    this.queryForm.patchValue({ page: 1, limit });
    this.store.limit = limit;
    this.store.page = 1;
    void this.store.load();
  }

  deleteDataset(item: KnowledgeBaseItem): void {
    const datasetId = item.datasetId || item.id || '';
    if (!datasetId) {
      this.feedbackMessage.set('当前知识库缺少 datasetId，暂时无法删除。');
      return;
    }

    const datasetLabel = item.name || datasetId;

    this.confirmDialog.confirmDanger({
      header: '删除知识库',
      message: `确认删除知识库“${datasetLabel}”吗？该操作不可撤销。`,
      accept: () => {
        this.feedbackMessage.set('');
        this.knowledgeBaseService.delete(datasetId).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || '知识库删除失败。');
              return;
            }

            this.feedbackMessage.set('知识库删除成功。');
            void this.store.load();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || '知识库删除请求失败。');
          }
        });
      }
    });
  }

  statusLabel(status?: number): string {
    return status === 1 ? '启用' : '停用';
  }

  statusSeverity(status?: number): 'success' | 'danger' {
    return status === 1 ? 'success' : 'danger';
  }

  datasetKey(item: KnowledgeBaseItem): string {
    return item.datasetId || item.id || '';
  }
}
