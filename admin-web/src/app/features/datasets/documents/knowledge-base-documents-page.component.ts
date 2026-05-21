import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnDestroy, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize, firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { CheckboxModule } from 'primeng/checkbox';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../core/models/api.models';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { UploadPanelComponent } from '../../../shared/components/upload-panel.component';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { KnowledgeBaseItem, KnowledgeFileItem } from '../list/shared/knowledge-base.models';
import { KnowledgeBaseService } from '../list/shared/knowledge-base.service';

@Component({
  selector: 'app-knowledge-base-documents-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    PaginationBarComponent,
    SearchFilterCardComponent,
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    CheckboxModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    InputTextModule,
    SelectModule,
    TableModule,
    TagModule,
    UploadPanelComponent
  ],
  templateUrl: './knowledge-base-documents-page.component.html',
  styleUrl: './knowledge-base-documents-page.component.css'
})
export class KnowledgeBaseDocumentsPageComponent implements OnInit, OnDestroy {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);
  private readonly confirmDialog = inject(ConfirmDialogService);

  private readonly store = new PageableListStore<KnowledgeFileItem>(async (page, limit) => {
    const { name, status } = this.queryForm.getRawValue();
    const response = await firstValueFrom(
      this.knowledgeBaseService.getDocumentPage(this.datasetId(), {
        name: name || undefined,
        status: status || undefined,
        page,
        page_size: limit
      })
    );
    if (response.code !== 0) throw new Error(response.msg || '知识内容列表获取失败。');
    return response.data ?? { total: 0, list: [] };
  });

  readonly datasetId = signal('');
  readonly dataset = signal<KnowledgeBaseItem | null>(null);
  readonly documents = this.store.items;
  readonly selectedDocuments = signal<KnowledgeFileItem[]>([]);
  readonly loading = this.store.loading;
  readonly uploading = signal(false);
  readonly textImporting = signal(false);
  readonly parsing = signal(false);
  readonly feedbackMessage = this.store.errorMessage;
  readonly selectedFile = signal<File | null>(null);
  readonly selectedFileName = signal('');
  readonly total = this.store.total;
  readonly autoRefreshEnabled = signal(false);
  readonly inputMode = signal<'file' | 'text'>('file');
  private refreshTimer: ReturnType<typeof setInterval> | null = null;

  readonly statusFilterOptions = [
    { label: '全部状态', value: '' },
    { label: '待处理', value: 'UNSTART' },
    { label: '处理中', value: 'INDEXING' },
    { label: '已完成', value: 'DONE' },
    { label: '失败', value: 'FAILED' }
  ];

  readonly textImportExample = `问题：设备无法联网怎么办？
答案：请先确认设备靠近路由器，手机连接 2.4G Wi-Fi，并长按设备复位键 5 秒进入配网模式。

问题：如何联系客服？
答案：工作日 09:00-18:00 可拨打 400-123-4567。`;

  readonly queryForm = this.formBuilder.nonNullable.group({
    name: [''],
    status: [''],
    page: [1],
    page_size: [10]
  });

  readonly textImportForm = this.formBuilder.nonNullable.group({
    title: [''],
    content: ['', [Validators.required]],
    source: ['manual']
  });

  readonly doneCount = computed(
    () =>
      this.documents().filter(
        item => this.normalizeStatus(item.status) === 'DONE' || this.normalizeStatus(item.status) === '2'
      ).length
  );
  readonly processingCount = computed(
    () =>
      this.documents().filter(
        item => this.normalizeStatus(item.status) === 'INDEXING' || this.normalizeStatus(item.status) === '1'
      ).length
  );
  readonly failedCount = computed(
    () =>
      this.documents().filter(
        item => this.normalizeStatus(item.status) === 'FAILED' || this.normalizeStatus(item.status) === '3'
      ).length
  );

  ngOnInit(): void {
    const datasetId = this.route.snapshot.paramMap.get('id') || '';
    this.datasetId.set(datasetId);
    if (datasetId) {
      this.loadDataset(datasetId);
      this.loadDocuments();
    }
  }

  ngOnDestroy(): void {
    this.stopAutoRefresh();
  }

  loadDataset(datasetId: string): void {
    this.knowledgeBaseService.getDetail(datasetId).subscribe({
      next: (response: ApiResponse<KnowledgeBaseItem>) => {
        if (response.code === 0 && response.data) {
          this.dataset.set(response.data);
        }
      }
    });
  }

  loadDocuments(): void {
    if (!this.datasetId()) {
      return;
    }
    const { page, page_size } = this.queryForm.getRawValue();
    this.store.page = page;
    this.store.limit = page_size;
    void this.store.load();
  }

  applyFilters(): void {
    this.queryForm.patchValue({ page: 1 });
    this.store.search();
  }

  reset(): void {
    this.queryForm.reset({ name: '', status: '', page: 1, page_size: 10 });
    this.store.page = 1;
    this.store.limit = 10;
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

  setInputMode(mode: 'file' | 'text'): void {
    this.inputMode.set(mode);
  }

  toggleAutoRefresh(): void {
    if (this.autoRefreshEnabled()) {
      this.stopAutoRefresh();
      return;
    }
    this.startAutoRefresh();
  }

  onFileSelected(file: File | null): void {
    this.selectedFile.set(file);
    this.selectedFileName.set(file?.name || '');
  }

  upload(): void {
    const file = this.selectedFile();
    if (!file || !this.datasetId()) {
      this.feedbackMessage.set('请先选择要导入的文件。');
      return;
    }

    const formData = new FormData();
    formData.append('file', file);
    this.feedbackMessage.set('');
    this.uploading.set(true);

    this.knowledgeBaseService
      .uploadDocument(this.datasetId(), formData)
      .pipe(finalize(() => this.uploading.set(false)))
      .subscribe({
        next: (response: ApiResponse<KnowledgeFileItem>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || '文件导入失败。');
            return;
          }

          this.feedbackMessage.set('文件已导入，系统会自动解析、切片并写入向量库。');
          this.selectedFile.set(null);
          this.selectedFileName.set('');
          this.startAutoRefresh();
          this.loadDocuments();
          this.loadDataset(this.datasetId());
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '文件导入请求失败。');
        }
      });
  }

  importText(): void {
    if (!this.datasetId() || this.textImportForm.invalid || this.textImporting()) {
      this.textImportForm.markAllAsTouched();
      return;
    }

    const raw = this.textImportForm.getRawValue();
    this.feedbackMessage.set('');
    this.textImporting.set(true);

    this.knowledgeBaseService
      .importText(this.datasetId(), {
        title: raw.title || undefined,
        content: raw.content,
        source: raw.source || 'manual'
      })
      .pipe(finalize(() => this.textImporting.set(false)))
      .subscribe({
        next: (response: ApiResponse<KnowledgeFileItem>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || '文本导入失败。');
            return;
          }

          this.feedbackMessage.set('文本已导入并完成索引，可在列表中查看切片结果。');
          this.textImportForm.reset({ title: '', content: '', source: 'manual' });
          this.loadDocuments();
          this.loadDataset(this.datasetId());
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '文本导入请求失败。');
        }
      });
  }

  reprocessDocument(item: KnowledgeFileItem): void {
    const documentId = this.documentKey(item);
    if (!documentId || !this.datasetId() || this.parsing()) {
      this.feedbackMessage.set('当前文档缺少有效 ID，无法重新处理。');
      return;
    }

    this.feedbackMessage.set('');
    this.parsing.set(true);
    this.knowledgeBaseService
      .parseDocuments(this.datasetId(), { documentIds: [documentId] })
      .pipe(finalize(() => this.parsing.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || '重新处理请求提交失败。');
            return;
          }

          this.feedbackMessage.set('已提交重新处理，列表会自动刷新状态。');
          this.startAutoRefresh();
          this.loadDocuments();
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '重新处理请求失败。');
        }
      });
  }

  deleteDocument(item: KnowledgeFileItem): void {
    const documentId = this.documentKey(item);
    if (!documentId || !this.datasetId()) {
      this.feedbackMessage.set('当前文档缺少有效 ID，无法删除。');
      return;
    }

    const documentLabel = item.name || documentId;

    this.confirmDialog.confirmDanger({
      header: '删除知识内容',
      message: `确认删除“${documentLabel}”吗？关联切片也会一起删除，该操作不可撤销。`,
      accept: () => {
        this.feedbackMessage.set('');
        this.knowledgeBaseService.deleteDocument(this.datasetId(), documentId).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || '知识内容删除失败。');
              return;
            }

            this.feedbackMessage.set('知识内容已删除。');
            this.loadDocuments();
            this.loadDataset(this.datasetId());
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || '知识内容删除请求失败。');
          }
        });
      }
    });
  }

  batchDeleteDocuments(): void {
    const selected = this.selectedDocuments();
    if (selected.length === 0 || !this.datasetId()) {
      this.feedbackMessage.set('请先勾选要删除的知识内容。');
      return;
    }

    const ids = selected.map(item => this.documentKey(item)).filter(Boolean);
    if (ids.length === 0) {
      this.feedbackMessage.set('所选知识内容缺少有效 ID，无法删除。');
      return;
    }

    this.confirmDialog.confirmDanger({
      header: '批量删除知识内容',
      message: `确认删除选中的 ${ids.length} 条知识内容吗？关联切片也会一起删除，该操作不可撤销。`,
      accept: () => {
        this.feedbackMessage.set('');
        this.knowledgeBaseService.batchDeleteDocuments(this.datasetId(), ids).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || '批量删除失败。');
              return;
            }

            this.feedbackMessage.set(`成功删除 ${ids.length} 条知识内容。`);
            this.selectedDocuments.set([]);
            this.loadDocuments();
            this.loadDataset(this.datasetId());
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || '批量删除请求失败。');
          }
        });
      }
    });
  }

  onSelectionChange(selected: KnowledgeFileItem[]): void {
    this.selectedDocuments.set(selected);
  }

  documentKey(item: KnowledgeFileItem): string {
    return item.documentId || item.id || '';
  }

  fileSizeLabel(size?: number): string {
    if (!size) {
      return '-';
    }
    if (size < 1024) {
      return `${size} B`;
    }
    if (size < 1024 * 1024) {
      return `${(size / 1024).toFixed(1)} KB`;
    }
    return `${(size / 1024 / 1024).toFixed(1)} MB`;
  }

  fileTypeLabel(item: KnowledgeFileItem): string {
    return item.fileType || 'text';
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

  private startAutoRefresh(): void {
    if (this.refreshTimer) {
      this.autoRefreshEnabled.set(true);
      return;
    }
    this.autoRefreshEnabled.set(true);
    this.refreshTimer = setInterval(() => {
      void this.store.load();
    }, 5000);
  }

  private stopAutoRefresh(): void {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer);
      this.refreshTimer = null;
    }
    this.autoRefreshEnabled.set(false);
  }

  private normalizeStatus(status?: number | string): string {
    return status == null ? '' : String(status).toUpperCase();
  }
}
