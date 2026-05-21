import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { TextareaModule } from 'primeng/textarea';
import { EmptyStateComponent } from '../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../shared/components/feedback-message.component';
import { SearchFilterCardComponent } from '../../shared/components/search-filter-card.component';
import { PaginationBarComponent } from '../../shared/components/pagination-bar.component';
import { SummaryMetricGridComponent, SummaryMetricItem } from '../../shared/components/summary-metric-grid.component';
import { TranslatePipe } from '../../core/i18n/translate.pipe';
import { I18nService } from '../../core/i18n/i18n.service';
import { ConfirmDialogService } from '../../shared/services/confirm-dialog.service';
import { PageableListStore } from '../../shared/stores/pageable-list.store';
import {
  RUNTIME_SIGNAL_STATUS,
  RuntimeSignalItem,
  RuntimeSignalStatus
} from '../memory-libraries/shared/memory-library.models';
import { MemoryLibraryService } from '../memory-libraries/shared/memory-library.service';
import { AgentRoleService } from '../agent-roles/shared/agent-role.service';

@Component({
  selector: 'app-todos-page',
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
    TextareaModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    SearchFilterCardComponent,
    PaginationBarComponent,
    SummaryMetricGridComponent,
    TranslatePipe
  ],
  templateUrl: './todos-page.component.html',
  styleUrl: './todos-page.component.css'
})
export class TodosPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly agentRoleService = inject(AgentRoleService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<RuntimeSignalItem>(async (page, limit) => {
    const raw = this.queryForm.getRawValue();
    const response = await firstValueFrom(
      this.memoryLibraryService.getRuntimeSignals({
        page,
        limit,
        signalType: 'todo',
        status: this.parseStatus(raw.status),
        keyword: raw.keyword || undefined
      })
    );
    if (response.code !== 0) throw new Error(response.msg || this.i18n.translate('todos.loadFailed'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly todos = this.store.items;
  readonly total = this.store.total;
  readonly pendingCount = computed(
    () =>
      this.todos().filter(
        item => item.status === RUNTIME_SIGNAL_STATUS.pending || item.status === RUNTIME_SIGNAL_STATUS.scheduled
      ).length
  );
  readonly completedCount = computed(
    () => this.todos().filter(item => item.status === RUNTIME_SIGNAL_STATUS.completed).length
  );
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.i18n.translate('todos.totalCount'), value: this.total() },
      { title: this.i18n.translate('todos.pendingCount'), value: this.pendingCount() },
      { title: this.i18n.translate('todos.completedCount'), value: this.completedCount() }
    ];
  });

  readonly queryForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    status: [''],
    page: [1],
    limit: [10]
  });

  ngOnInit(): void {
    this.loadTodos();
  }

  loadTodos(): void {
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
    this.queryForm.reset({ keyword: '', status: '', page: 1, limit: 10 });
    this.store.page = 1;
    this.store.limit = 10;
    void this.store.load();
  }

  changePage(page: number): void {
    this.queryForm.patchValue({ page });
    this.store.setPage(page);
  }

  changeLimit(limit: number): void {
    this.queryForm.patchValue({ limit, page: 1 });
    this.store.setLimit(limit);
  }

  updateStatus(item: RuntimeSignalItem, status: RuntimeSignalStatus): void {
    this.memoryLibraryService.updateRuntimeSignalStatus(item.id, { status }).subscribe({
      next: response => {
        if (response.code !== 0) {
          this.store.errorMessage.set(response.msg || this.i18n.translate('todos.updateFailed'));
          return;
        }
        void this.store.load();
      },
      error: error => this.store.errorMessage.set(error?.error?.msg || error?.message || this.i18n.translate('todos.updateRequestFailed'))
    });
  }

  readonly createDialogVisible = signal(false);
  readonly creating = signal(false);
  readonly agentRoleOptions = signal<{ label: string; value: string }[]>([]);

  readonly createForm = this.formBuilder.nonNullable.group({
    title: ['', Validators.required],
    content: [''],
    scheduledAt: [''],
    userId: [null as number | null],
    deviceId: [''],
    agentRoleId: ['']
  });

  openCreateDialog(): void {
    this.createForm.reset({ title: '', content: '', scheduledAt: '', userId: null, deviceId: '', agentRoleId: '' });
    this.createDialogVisible.set(true);
    this.loadAgentRoleOptions();
  }

  private loadAgentRoleOptions(): void {
    this.agentRoleService.getAllActive().subscribe({
      next: response => {
        if (response.code === 0 && response.data) {
          this.agentRoleOptions.set(
            response.data.map(r => ({ label: r.displayName || r.name || r.id!, value: r.id! }))
          );
        }
      }
    });
  }

  submitCreate(): void {
    if (this.createForm.invalid) return;
    this.creating.set(true);
    const raw = this.createForm.getRawValue();
    this.memoryLibraryService
      .createTodo({
        title: raw.title,
        content: raw.content,
        scheduledAt: raw.scheduledAt || undefined,
        userId: raw.userId ?? undefined,
        deviceId: raw.deviceId || undefined,
        agentRoleId: raw.agentRoleId || undefined
      })
      .subscribe({
        next: response => {
          this.creating.set(false);
          if (response.code !== 0) {
            this.store.errorMessage.set(response.msg || this.i18n.translate('todos.createFailed'));
            return;
          }
          this.createDialogVisible.set(false);
          void this.store.load();
        },
        error: error => {
          this.creating.set(false);
          this.store.errorMessage.set(error?.error?.msg || error?.message || this.i18n.translate('todos.createRequestFailed'));
        }
      });
  }

  executeTodo(item: RuntimeSignalItem): void {
    this.confirmDialog.confirmDanger({
      header: this.i18n.translate('todos.executeHeader'),
      message: this.i18n.translate('todos.executeConfirm', { name: item.signalCode || item.id }),
      accept: () => {
        this.memoryLibraryService.executeTodo(item.id).subscribe({
          next: response => {
            if (response.code !== 0) {
              this.store.errorMessage.set(response.msg || this.i18n.translate('todos.executeFailed'));
              return;
            }
            void this.store.load();
          },
          error: error => this.store.errorMessage.set(error?.error?.msg || error?.message || this.i18n.translate('todos.executeRequestFailed'))
        });
      }
    });
  }

  deleteTodo(item: RuntimeSignalItem): void {
    this.confirmDialog.confirmDanger({
      header: this.i18n.translate('todos.deleteHeader'),
      message: this.i18n.translate('todos.deleteConfirm', { name: item.signalCode || item.id }),
      accept: () => {
        this.memoryLibraryService.deleteRuntimeSignalTodo(item.id).subscribe({
          next: response => {
            if (response.code !== 0) {
              this.store.errorMessage.set(response.msg || this.i18n.translate('todos.deleteFailed'));
              return;
            }
            void this.store.load();
          },
          error: error => this.store.errorMessage.set(error?.error?.msg || error?.message || this.i18n.translate('todos.deleteRequestFailed'))
        });
      }
    });
  }

  statusLabel(value?: RuntimeSignalStatus): string {
    switch (value) {
      case RUNTIME_SIGNAL_STATUS.pending:
        return this.i18n.translate('todos.pending');
      case RUNTIME_SIGNAL_STATUS.scheduled:
        return this.i18n.translate('todos.scheduled');
      case RUNTIME_SIGNAL_STATUS.processing:
        return this.i18n.translate('todos.processing');
      case RUNTIME_SIGNAL_STATUS.completed:
        return this.i18n.translate('todos.completed');
      case RUNTIME_SIGNAL_STATUS.ignored:
        return this.i18n.translate('todos.ignored');
      case RUNTIME_SIGNAL_STATUS.failed:
        return this.i18n.translate('todos.failed');
      default:
        return '-';
    }
  }

  statusSeverity(value?: RuntimeSignalStatus): 'success' | 'info' | 'warn' | 'danger' | 'secondary' {
    if (value === RUNTIME_SIGNAL_STATUS.completed) return 'success';
    if (value === RUNTIME_SIGNAL_STATUS.pending || value === RUNTIME_SIGNAL_STATUS.scheduled) return 'warn';
    if (value === RUNTIME_SIGNAL_STATUS.failed) return 'danger';
    if (value === RUNTIME_SIGNAL_STATUS.processing) return 'info';
    return 'secondary';
  }

  private parseStatus(value?: string): RuntimeSignalStatus | undefined {
    return isRecordValue(RUNTIME_SIGNAL_STATUS, value) ? value : undefined;
  }
}

function isRecordValue<T extends string>(record: Record<string, T>, value?: string): value is T {
  return Object.values(record).includes(value as T);
}
