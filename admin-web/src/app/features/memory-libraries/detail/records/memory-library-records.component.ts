import { CommonModule, DatePipe } from '@angular/common';
import { Component, Input, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { TooltipModule } from 'primeng/tooltip';
import { ApiResponse } from '../../../../core/models/api.models';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { EmptyStateComponent } from '../../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { PaginationBarComponent } from '../../../../shared/components/pagination-bar.component';
import { SearchFilterCardComponent } from '../../../../shared/components/search-filter-card.component';
import { ConfirmDialogService } from '../../../../shared/services/confirm-dialog.service';
import {
  MEMORY_RECORD_TYPE,
  MEMORY_RECORD_TYPE_LABELS,
  MEMORY_RECORD_TYPE_OPTIONS,
  MemoryRecordItem,
  MemoryRecordPageData,
  MemoryRecordPayload,
  MemoryRecordType
} from '../../shared/memory-library.models';
import { MemoryLibraryService } from '../../shared/memory-library.service';

@Component({
  selector: 'app-memory-library-records',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    DatePipe,
    ButtonModule,
    CardModule,
    DialogModule,
    InputTextModule,
    SelectModule,
    TableModule,
    TagModule,
    TooltipModule,
    TranslatePipe,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PaginationBarComponent,
    SearchFilterCardComponent
  ],
  templateUrl: './memory-library-records.component.html',
  styleUrl: './memory-library-records.component.css'
})
export class MemoryLibraryRecordsComponent implements OnInit {
  @Input({ required: true }) libraryId!: string;

  private readonly formBuilder = inject(FormBuilder);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly records = signal<MemoryRecordItem[]>([]);
  readonly total = signal(0);
  readonly page = signal(1);
  readonly pageSize = signal(10);
  readonly recordTypeOptions = computed(() => {
    this.i18n.localeVersion();
    return [
      { label: this.localize('全部类型'), value: '' },
      ...MEMORY_RECORD_TYPE_OPTIONS.map(option => ({
        ...option,
        label: this.localize(option.label)
      }))
    ];
  });
  readonly recordTypeFormOptions = computed(() => {
    this.i18n.localeVersion();
    return MEMORY_RECORD_TYPE_OPTIONS.map(option => ({
      ...option,
      label: this.localize(option.label)
    }));
  });

  readonly dialogVisible = signal(false);
  readonly editingRecordId = signal('');
  readonly dialogSubmitting = signal(false);

  readonly queryForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    recordType: [''],
    includeExpired: [0],
    page: [1],
    limit: [10]
  });

  readonly form = this.formBuilder.nonNullable.group({
    entityId: ['', [Validators.required]],
    sessionId: [''],
    recordType: ['node', [Validators.required]],
    title: [''],
    content: ['', [Validators.required]],
    summary: [''],
    importance: [3],
    isPinned: [false],
    expiresAt: ['']
  });

  ngOnInit(): void {
    if (this.libraryId) {
      this.loadRecords();
    }
  }

  loadRecords(): void {
    const { keyword, recordType, includeExpired, page, limit } = this.queryForm.getRawValue();
    this.feedbackMessage.set('');
    this.loading.set(true);
    this.page.set(page);
    this.pageSize.set(limit);

    this.memoryLibraryService
      .getRecords(this.libraryId, {
        keyword: keyword || undefined,
        recordType: this.parseRecordType(recordType),
        includeExpired: includeExpired || undefined,
        page,
        limit
      })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<MemoryRecordPageData>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('记录列表获取失败。'));
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.records.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('记录列表请求失败。'));
        }
      });
  }

  changePage(newPage: number): void {
    this.queryForm.patchValue({ page: newPage });
    this.loadRecords();
  }

  changeLimit(newLimit: number): void {
    this.queryForm.patchValue({ limit: newLimit, page: 1 });
    this.loadRecords();
  }

  search(): void {
    this.queryForm.patchValue({ page: 1 });
    this.loadRecords();
  }

  reset(): void {
    this.queryForm.reset({ keyword: '', recordType: '', includeExpired: 0, page: 1, limit: 10 });
    this.loadRecords();
  }

  openEditDialog(record: MemoryRecordItem): void {
    this.editingRecordId.set(record.id);
    this.form.patchValue({
      entityId: record.entityId || '',
      sessionId: record.sessionId || '',
      recordType: record.recordType || 'node',
      title: record.title || '',
      content: record.content || '',
      summary: record.summary || '',
      importance: record.importance ?? 3,
      isPinned: (record.isPinned ?? 0) === 1,
      expiresAt: record.expiresAt || ''
    });
    this.dialogVisible.set(true);
  }

  closeDialog(): void {
    this.dialogVisible.set(false);
    this.editingRecordId.set('');
  }

  submitRecord(): void {
    if (this.form.invalid || this.dialogSubmitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const payload: MemoryRecordPayload = {
      entityId: raw.entityId,
      sessionId: raw.sessionId || undefined,
      recordType: raw.recordType,
      title: raw.title || undefined,
      content: raw.content,
      summary: raw.summary || undefined,
      importance: raw.importance,
      isPinned: raw.isPinned ? 1 : 0,
      expiresAt: raw.expiresAt || undefined
    };

    this.dialogSubmitting.set(true);

    const request$ = this.editingRecordId()
      ? this.memoryLibraryService.updateRecord(this.libraryId, this.editingRecordId(), payload)
      : this.memoryLibraryService.createRecord(this.libraryId, payload);

    request$.pipe(finalize(() => this.dialogSubmitting.set(false))).subscribe({
      next: (response: ApiResponse<MemoryRecordItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('记录保存失败。'));
          return;
        }

        this.closeDialog();
        this.loadRecords();
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('记录保存请求失败。'));
      }
    });
  }

  deleteRecord(record: MemoryRecordItem): void {
    this.confirmDialog.confirmDanger({
      header: this.localize('删除记忆记录'),
      message: this.localize(`确认删除记录“${record.title || record.entityId}”吗？该操作不可撤销。`),
      accept: () => {
        this.memoryLibraryService.deleteRecord(this.libraryId, record.id).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || this.localize('删除记录失败。'));
              return;
            }
            this.loadRecords();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || this.localize('删除记录请求失败。'));
          }
        });
      }
    });
  }

  togglePin(record: MemoryRecordItem): void {
    const newIsPinned = (record.isPinned ?? 0) === 1 ? 0 : 1;
    const payload: MemoryRecordPayload = {
      entityId: record.entityId,
      sessionId: record.sessionId || undefined,
      recordType: record.recordType,
      title: record.title || undefined,
      content: record.content,
      summary: record.summary || undefined,
      importance: record.importance,
      isPinned: newIsPinned,
      expiresAt: record.expiresAt || undefined
    };

    this.memoryLibraryService.updateRecord(this.libraryId, record.id, payload).subscribe({
      next: (response: ApiResponse<MemoryRecordItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('更新置顶状态失败。'));
          return;
        }
        this.loadRecords();
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('更新置顶状态请求失败。'));
      }
    });
  }

  truncateContent(content?: string, maxLength = 80): string {
    if (!content) return '-';
    return content.length > maxLength ? content.substring(0, maxLength) + '...' : content;
  }

  importanceSeverity(importance?: number) {
    if (importance == null) return 'secondary';
    if (importance >= 4) return 'danger';
    if (importance >= 3) return 'warn';
    if (importance >= 2) return 'info';
    return 'secondary';
  }

  importanceLabel(importance?: number): string {
    if (importance == null) return '-';
    return `${importance}`;
  }

  pinnedLabel(pinned?: number): string {
    return (pinned ?? 0) === 1 ? this.localize('已置顶') : this.localize('未置顶');
  }

  pinnedSeverity(pinned?: number) {
    return (pinned ?? 0) === 1 ? 'success' : 'secondary';
  }

  recordTypeLabel(value?: string): string {
    const recordType = this.parseRecordType(value);
    return recordType ? this.localize(MEMORY_RECORD_TYPE_LABELS[recordType]) : value || '-';
  }

  private parseRecordType(value?: string): MemoryRecordType | undefined {
    return Object.values(MEMORY_RECORD_TYPE).includes(value as MemoryRecordType)
      ? (value as MemoryRecordType)
      : undefined;
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
