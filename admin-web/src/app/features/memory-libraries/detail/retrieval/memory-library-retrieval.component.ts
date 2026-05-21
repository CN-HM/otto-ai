import { CommonModule } from '@angular/common';
import { Component, Input, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../../core/models/api.models';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { EmptyStateComponent } from '../../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import {
  MEMORY_RECORD_TYPE,
  MEMORY_RECORD_TYPE_LABELS,
  MEMORY_RECORD_TYPE_OPTIONS,
  MemoryRecordType,
  MemorySearchPayload,
  MemorySearchResult
} from '../../shared/memory-library.models';
import { MemoryLibraryService } from '../../shared/memory-library.service';

@Component({
  selector: 'app-memory-library-retrieval',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    CardModule,
    InputTextModule,
    SelectModule,
    TagModule,
    TranslatePipe,
    EmptyStateComponent,
    FeedbackMessageComponent
  ],
  templateUrl: './memory-library-retrieval.component.html',
  styleUrl: './memory-library-retrieval.component.css'
})
export class MemoryLibraryRetrievalComponent {
  @Input({ required: true }) libraryId!: string;

  private readonly formBuilder = inject(FormBuilder);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly results = signal<MemorySearchResult | null>(null);
  readonly hasSearched = signal(false);
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

  readonly form = this.formBuilder.nonNullable.group({
    query: ['', [Validators.required]],
    recordType: [''],
    maxResults: [5, [Validators.min(1), Validators.max(100)]],
    minScore: [0.3]
  });

  submitSearch(): void {
    if (this.form.invalid || this.loading()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const payload: MemorySearchPayload = {
      query: raw.query,
      recordType: this.parseRecordType(raw.recordType),
      maxResults: Math.min(Math.max(raw.maxResults || 5, 1), 100),
      minScore: raw.minScore
    };

    this.feedbackMessage.set('');
    this.loading.set(true);
    this.hasSearched.set(true);

    this.memoryLibraryService
      .retrievalTest(this.libraryId, payload)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<MemorySearchResult>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || this.localize('检索测试失败。'));
            this.results.set(null);
            return;
          }

          this.results.set(response.data);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('检索测试请求失败。'));
          this.results.set(null);
        }
      });
  }

  truncateContent(content?: string, maxLength = 200): string {
    if (!content) return '-';
    return content.length > maxLength ? content.substring(0, maxLength) + '...' : content;
  }

  scoreSeverity(score: number) {
    if (score >= 0.85) return 'success';
    if (score >= 0.7) return 'info';
    if (score >= 0.5) return 'warn';
    return 'danger';
  }

  importanceSeverity(importance?: number) {
    if (importance == null) return 'secondary';
    if (importance >= 4) return 'danger';
    if (importance >= 3) return 'warn';
    if (importance >= 2) return 'info';
    return 'secondary';
  }

  isPinnedSeverity(pinned?: number) {
    return (pinned ?? 0) === 1 ? 'success' : 'secondary';
  }

  isPinnedLabel(pinned?: number): string {
    return (pinned ?? 0) === 1 ? this.localize('已置顶') : this.localize('未置顶');
  }

  recordTypeLabel(value?: string): string {
    const recordType = this.parseRecordType(value);
    return recordType ? this.localize(MEMORY_RECORD_TYPE_LABELS[recordType]) : value || this.localize('未知类型');
  }

  resultHeader(total: number): string {
    return this.localize(`检索结果（${total} 条）`);
  }

  scoreLabel(score: number): string {
    return this.localize(`匹配度：${score}`);
  }

  importanceLabel(importance?: number | null): string {
    return this.localize(`重要性：${importance ?? '-'}`);
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
