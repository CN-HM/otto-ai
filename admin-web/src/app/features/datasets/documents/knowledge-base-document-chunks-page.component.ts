import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { KnowledgeChunkItem } from '../list/shared/knowledge-base.models';
import { KnowledgeBaseService } from '../list/shared/knowledge-base.service';

@Component({
  selector: 'app-knowledge-base-document-chunks-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    PaginationBarComponent,
    SearchFilterCardComponent,
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    InputTextModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    TableModule,
    TagModule
  ],
  templateUrl: './knowledge-base-document-chunks-page.component.html',
  styleUrl: './knowledge-base-document-chunks-page.component.css'
})
export class KnowledgeBaseDocumentChunksPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);

  private readonly store = new PageableListStore<KnowledgeChunkItem>(async (page, limit) => {
    const { keywords } = this.queryForm.getRawValue();
    const response = await firstValueFrom(
      this.knowledgeBaseService.getDocumentChunks(this.datasetId(), this.documentId(), {
        keywords: keywords || undefined,
        page,
        page_size: limit
      })
    );
    if (response.code !== 0) throw new Error(response.msg || '文档切片列表获取失败。');
    const normalized = this.normalizeChunks(response.data);
    return { total: normalized.total, list: normalized.items };
  });

  readonly datasetId = signal('');
  readonly documentId = signal('');
  readonly documentName = signal('');
  readonly documentStatus = signal('');
  readonly chunks = this.store.items;
  readonly selectedChunk = signal<KnowledgeChunkItem | null>(null);
  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly chunkTotal = this.store.total;

  readonly queryForm = this.formBuilder.nonNullable.group({
    keywords: [''],
    page: [1],
    page_size: [20]
  });

  readonly previewText = computed(() => {
    const chunk = this.selectedChunk();
    if (!chunk) {
      return '';
    }

    const value = chunk.content || chunk.text || chunk.chunkText;
    if (typeof value === 'string' && value.trim()) {
      return value;
    }

    return JSON.stringify(chunk, null, 2);
  });

  ngOnInit(): void {
    const datasetId = this.route.snapshot.paramMap.get('id') || '';
    const documentId = this.route.snapshot.paramMap.get('documentId') || '';
    this.datasetId.set(datasetId);
    this.documentId.set(documentId);
    this.documentName.set(this.route.snapshot.queryParamMap.get('name') || '');
    this.documentStatus.set(this.route.snapshot.queryParamMap.get('status') || '');

    if (datasetId && documentId) {
      this.loadChunks();
    }
  }

  loadChunks(): void {
    if (!this.datasetId() || !this.documentId()) {
      return;
    }
    const { page, page_size } = this.queryForm.getRawValue();
    this.store.page = page;
    this.store.limit = page_size;
    void this.store.load();
  }

  reset(): void {
    this.queryForm.reset({ keywords: '', page: 1, page_size: 20 });
    this.store.page = 1;
    this.store.limit = 20;
    void this.store.load();
  }

  changePage(page: number): void {
    this.queryForm.patchValue({ page });
    this.store.setPage(page);
  }

  changePageSize(pageSize: number): void {
    this.queryForm.patchValue({ page: 1, page_size: pageSize });
    this.store.setLimit(pageSize);
  }

  preview(item: KnowledgeChunkItem): void {
    this.selectedChunk.set(item);
  }

  statusLabel(status?: number | string): string {
    const normalized = this.normalizeStatus(status);
    if (normalized === 'INDEXING' || normalized === '1') {
      return '处理中';
    }
    if (normalized === 'DONE' || normalized === '2') {
      return '已完成';
    }
    if (normalized === 'FAILED' || normalized === '3') {
      return '失败';
    }
    return '待处理';
  }

  statusSeverity(status?: number | string): 'info' | 'success' | 'danger' | 'contrast' {
    const normalized = this.normalizeStatus(status);
    if (normalized === 'INDEXING' || normalized === '1') {
      return 'info';
    }
    if (normalized === 'DONE' || normalized === '2') {
      return 'success';
    }
    if (normalized === 'FAILED' || normalized === '3') {
      return 'danger';
    }
    return 'contrast';
  }

  chunkKey(item: KnowledgeChunkItem, index: number): string {
    const candidate = item.id || item['chunkId'] || item['chunk_id'];
    return typeof candidate === 'string' && candidate ? candidate : String(index + 1);
  }

  chunkSummary(item: KnowledgeChunkItem): string {
    const value = item.content || item.text || item.chunkText || item['body'] || item['segment'];
    if (typeof value === 'string' && value.trim()) {
      return value.length > 120 ? `${value.slice(0, 120)}...` : value;
    }

    return JSON.stringify(item).slice(0, 120);
  }

  chunkTokenLabel(item: KnowledgeChunkItem): string {
    const token = item['tokenCount'] || item['token_count'] || item['tokens'];
    return typeof token === 'number' ? String(token) : '-';
  }

  private normalizeStatus(status?: number | string): string {
    return status == null ? '' : String(status).toUpperCase();
  }

  private normalizeChunks(data: Record<string, unknown> | undefined): { items: KnowledgeChunkItem[]; total: number } {
    if (!data) {
      return { items: [], total: 0 };
    }

    const items = this.findChunkArray(data);
    const total = this.findTotal(data) ?? items.length;
    return { items, total };
  }

  private findChunkArray(source: unknown): KnowledgeChunkItem[] {
    if (Array.isArray(source)) {
      return source.filter((item: unknown) => typeof item === 'object' && item !== null) as KnowledgeChunkItem[];
    }

    if (!this.isRecord(source)) {
      return [];
    }

    for (const key of ['list', 'items', 'chunks', 'records', 'data', 'result']) {
      const candidate = source[key];
      if (Array.isArray(candidate)) {
        return candidate.filter((item: unknown) => typeof item === 'object' && item !== null) as KnowledgeChunkItem[];
      }
      if (this.isRecord(candidate)) {
        const nested = this.findChunkArray(candidate);
        if (nested.length) {
          return nested;
        }
      }
    }

    return [];
  }

  private findTotal(source: unknown): number | null {
    if (!this.isRecord(source)) {
      return null;
    }

    const directTotal = source['total'];
    if (typeof directTotal === 'number') {
      return directTotal;
    }

    for (const key of ['data', 'result', 'page']) {
      const candidate = source[key];
      if (this.isRecord(candidate)) {
        const nestedTotal = this.findTotal(candidate);
        if (nestedTotal !== null) {
          return nestedTotal;
        }
      }
    }

    return null;
  }

  private isRecord(value: unknown): value is Record<string, unknown> {
    return typeof value === 'object' && value !== null;
  }
}
