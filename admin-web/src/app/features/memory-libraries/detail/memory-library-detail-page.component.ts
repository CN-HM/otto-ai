import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { TagModule } from 'primeng/tag';
import { TabViewModule } from 'primeng/tabview';
import { ApiResponse } from '../../../core/models/api.models';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { MemoryLibraryListItem } from '../shared/memory-library.models';
import { MemoryLibraryService } from '../shared/memory-library.service';
import { MemoryLibraryRulesComponent } from './rules/memory-library-rules.component';
import { MemoryLibraryRecordsComponent } from './records/memory-library-records.component';
import { MemoryLibraryRetrievalComponent } from './retrieval/memory-library-retrieval.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-memory-library-detail-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    TagModule,
    TabViewModule,
    FeedbackMessageComponent,
    MemoryLibraryRulesComponent,
    MemoryLibraryRecordsComponent,
    MemoryLibraryRetrievalComponent
  ],
  templateUrl: './memory-library-detail-page.component.html',
  styleUrl: './memory-library-detail-page.component.css'
})
export class MemoryLibraryDetailPageComponent implements OnInit {
  private readonly route = inject(ActivatedRoute);
  private readonly memoryLibraryService = inject(MemoryLibraryService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly library = signal<MemoryLibraryListItem | null>(null);
  readonly libraryId = signal('');

  ngOnInit(): void {
    const libraryId = this.route.snapshot.paramMap.get('id') || '';
    this.libraryId.set(libraryId);
    if (libraryId) {
      this.loadDetail(libraryId);
    }
  }

  loadDetail(libraryId: string): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.memoryLibraryService
      .getDetail(libraryId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<MemoryLibraryListItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || '记忆库详情获取失败。');
            return;
          }

          this.library.set(response.data);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '记忆库详情请求失败。');
        }
      });
  }

  statusLabel(status?: number): string {
    return status === 1 ? '启用' : '停用';
  }

  statusSeverity(status?: number) {
    return status === 1 ? 'success' : 'danger';
  }

  scopeLabel(scope?: string): string {
    switch (scope) {
      case 'user':
        return '用户级';
      case 'device':
        return '设备级';
      case 'session':
        return '会话级';
      case 'global':
        return '全局';
      default:
        return scope || '-';
    }
  }

  scopeSeverity(scope?: string) {
    switch (scope) {
      case 'user':
        return 'info';
      case 'device':
        return 'success';
      case 'session':
        return 'warn';
      case 'global':
        return 'secondary';
      default:
        return 'secondary';
    }
  }

  defaultLabel(isDefault?: number): string {
    return isDefault === 1 ? '是' : '否';
  }

  defaultSeverity(isDefault?: number) {
    return isDefault === 1 ? 'success' : 'secondary';
  }
}
