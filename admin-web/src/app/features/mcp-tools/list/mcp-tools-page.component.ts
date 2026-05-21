import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { firstValueFrom } from 'rxjs';
import { RouterLink } from '@angular/router';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { SelectModule } from 'primeng/select';
import { HasPermissionDirective } from '../../../shared/directives/has-permission.directive';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { McpToolService } from '../shared/mcp-tool.service';
import { McpToolItem } from '../shared/mcp-tool.models';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';

@Component({
  selector: 'app-mcp-tools-page',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,
    ReactiveFormsModule,
    ButtonModule,
    InputTextModule,
    TableModule,
    TagModule,
    SelectModule,
    HasPermissionDirective,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PaginationBarComponent,
    SearchFilterCardComponent,
    PageToolbarComponent,
    TranslatePipe
  ],
  templateUrl: './mcp-tools-page.component.html',
  styleUrls: ['./mcp-tools-page.component.css']
})
export class McpToolsPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly mcpToolService = inject(McpToolService);
  private readonly store = new PageableListStore<McpToolItem>(async (page, limit) => {
    const { keyword, status, category } = this.queryForm.getRawValue();
    return firstValueFrom(
      this.mcpToolService.getList({
        page,
        limit,
        keyword: keyword || undefined,
        status: status || undefined,
        category: category || undefined
      })
    );
  });

  readonly loading = this.store.loading;
  readonly tools = this.store.items;
  readonly total = this.store.total;
  readonly feedbackMessage = this.store.errorMessage;
  readonly categories = signal<string[]>([]);

  readonly queryForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    status: [''],
    category: [''],
    page: [1],
    limit: [10]
  });

  readonly statusOptions = [
    { label: '全部状态', value: '' },
    { label: '启用', value: 'active' },
    { label: '停用', value: 'inactive' }
  ];

  readonly categoryOptions = computed(() => [
    { label: '全部分类', value: '' },
    ...this.categories().map(c => ({ label: c, value: c }))
  ]);

  ngOnInit(): void {
    void this.loadCategories();
    this.loadData();
  }

  private async loadCategories(): Promise<void> {
    try {
      const categories = await firstValueFrom(this.mcpToolService.getCategories());
      this.categories.set(categories);
    } catch {
      // 静默处理，非关键数据
    }
  }

  loadData(): void {
    const { page, limit } = this.queryForm.getRawValue();
    this.store.page = page;
    this.store.limit = limit;
    void this.store.load();
  }

  onSearch(): void {
    this.queryForm.patchValue({ page: 1 });
    this.store.search();
  }

  onReset(): void {
    this.queryForm.reset({ keyword: '', status: '', category: '', page: 1, limit: 10 });
    this.store.page = 1;
    this.store.limit = 10;
    void this.store.load();
  }

  onPageChange(page: number): void {
    this.queryForm.patchValue({ page });
    this.store.setPage(page);
  }

  onLimitChange(limit: number): void {
    this.queryForm.patchValue({ limit, page: 1 });
    this.store.setLimit(limit);
  }

  confirmDelete(tool: McpToolItem): void {
    if (tool.isSystem) {
      this.feedbackMessage.set('系统 MCP 工具不能删除，只能编辑配置。');
      return;
    }

    if (window.confirm(`确认删除\n\n确定要删除 MCP 工具 "${tool.name}" 吗？`)) {
      void this.deleteTool(tool.id);
    }
  }

  private async deleteTool(id: string): Promise<void> {
    this.feedbackMessage.set('');
    try {
      await firstValueFrom(this.mcpToolService.delete(id));
      await this.store.load();
    } catch (err: any) {
      this.feedbackMessage.set(err?.message || '删除失败');
    }
  }

  getStatusSeverity(status: string): 'success' | 'secondary' {
    return status === 'active' ? 'success' : 'secondary';
  }

  getStatusLabel(status: string): string {
    return status === 'active' ? '启用' : '停用';
  }
}
