import { CommonModule, DatePipe } from '@angular/common';
import { Component, DestroyRef, OnInit, computed, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { FormBuilder, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { finalize, switchMap } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { TableModule } from 'primeng/table';
import { ToggleSwitchModule } from 'primeng/toggleswitch';
import { ApiResponse } from '../../../core/models/api.models';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { HasPermissionDirective } from '../../../shared/directives/has-permission.directive';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import {
  BindingConfigItem,
  BindingConfigKind,
  BindingConfigKindMeta,
  BindingConfigPageData,
  BindingConfigPayload
} from '../shared/binding-config.models';
import { BindingConfigService } from '../shared/binding-config.service';

@Component({
  selector: 'app-binding-configs-page',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    InputTextModule,
    SelectModule,
    TableModule,
    ToggleSwitchModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PaginationBarComponent,
    PageToolbarComponent,
    SearchFilterCardComponent,
    HasPermissionDirective
  ],
  template: `<section class="binding-configs-page">
    <div class="page-hero">
      <div>
        <h1>{{ pageTitle() }}</h1>
        <p>{{ pageDescription() }}</p>
      </div>
    </div>

    <app-page-toolbar [title]="pageTitle()" [description]="pageDescription()">
      <a
        *appHasPermission="'agent-role:create'"
        pButton
        [routerLink]="['/binding-configs', currentKind(), 'new']"
        label="新增配置"
        icon="pi pi-plus"
        size="small"
      ></a>
    </app-page-toolbar>

    <app-feedback-message [text]="feedbackMessage()" [severity]="feedbackSeverity()"></app-feedback-message>

    @if (showFilterOptions()) {
      <app-search-filter-card
        [formGroup]="queryForm"
        [loading]="loading()"
        [columns]="3"
        (submitted)="loadPage()"
        (resetTriggered)="reset()"
      >
        <div filterField class="filter-field">
          <label for="kind">配置类型</label>
          <p-select
            id="kind"
            [options]="kindOptions()"
            formControlName="kind"
            optionLabel="label"
            optionValue="value"
            (onChange)="switchKind()"
          ></p-select>
        </div>
        <div filterField class="filter-field">
          <label for="keyword">关键词</label>
          <input id="keyword" pInputText formControlName="keyword" placeholder="按编码、名称、描述搜索" />
        </div>
        <div filterField class="filter-field">
          <label for="status">状态</label>
          <p-select
            id="status"
            [options]="statusOptions"
            formControlName="status"
            optionLabel="label"
            optionValue="value"
            [showClear]="true"
          ></p-select>
        </div>
      </app-search-filter-card>
    }

    <p-card>
      <p-table [value]="items()" [loading]="loading()" dataKey="id" responsiveLayout="scroll">
        <ng-template pTemplate="header">
          <tr>
            <th>配置</th>
            <th>运行信息</th>
            <th>状态</th>
            <th>更新时间</th>
            <th>操作</th>
          </tr>
        </ng-template>
        <ng-template pTemplate="body" let-item>
          <tr>
            <td>
              <div class="primary-cell">
                <div class="title-row">
                  <strong>{{ item.name || '-' }}</strong>
                  @if (item.isSystem) {
                    <span class="soft-badge">系统</span>
                  }
                </div>
                @if (item.description) {
                  <span class="muted">{{ item.description }}</span>
                }

                @if (item.code) {
                  <div class="meta-line">
                    <span>编码：{{ item.code }}</span>
                  </div>
                }
                @if (item.providerCode) {
                  <div class="meta-line">
                    <span>提供方：{{ item.providerCode }}</span>
                  </div>
                }
              </div>
            </td>
            <td>
              <div class="detail-chip-list">
                @for (detail of configDetails(item); track detail.label) {
                  <span class="detail-chip">
                    <span>{{ detail.label }}</span>
                    <strong>{{ detail.value }}</strong>
                  </span>
                } @empty {
                  <span class="muted">暂无关键配置</span>
                }
              </div>
            </td>
            <td>
              <div class="status-cell">
                <div class="switch-cell primary-switch">
                  <p-toggleswitch
                    [ngModel]="isItemEnabled(item)"
                    [ngModelOptions]="{ standalone: true }"
                    [disabled]="!item.id || isToggleBusy(item, 'enabled')"
                    (ngModelChange)="toggleEnabled(item, !!$event)"
                  ></p-toggleswitch>
                  <span>{{ isItemEnabled(item) ? '启用' : '停用' }}</span>
                </div>
                @if (item.isDefault) {
                  <span class="default-badge">默认</span>
                } @else {
                  <button
                    pButton
                    type="button"
                    label="设为默认"
                    size="small"
                    severity="secondary"
                    [text]="true"
                    [disabled]="!item.id || isToggleBusy(item, 'default')"
                    (click)="toggleDefault(item, true)"
                  ></button>
                }
              </div>
            </td>
            <td>{{ item.updatedAt ? (item.updatedAt | date: 'yyyy-MM-dd HH:mm') : '-' }}</td>
            <td>
              <div class="row-actions">
                @if (currentKind() === 'tts' && item.id) {
                  <a
                    pButton
                    [routerLink]="['/voices']"
                    [queryParams]="{ ttsProfileId: item.id }"
                    label="查看音色"
                    size="small"
                    severity="info"
                    [text]="true"
                  ></a>
                }
                <a
                  *appHasPermission="'agent-role:update'"
                  pButton
                  [routerLink]="['/binding-configs', currentKind(), item.id, 'edit']"
                  label="编辑"
                  size="small"
                  severity="contrast"
                ></a>
                <button
                  *appHasPermission="'agent-role:delete'"
                  pButton
                  type="button"
                  label="删除"
                  size="small"
                  severity="danger"
                  [text]="true"
                  (click)="deleteItem(item)"
                ></button>
              </div>
            </td>
          </tr>
        </ng-template>
        <ng-template pTemplate="emptymessage">
          <tr>
            <td colspan="5"><app-empty-state text="暂无配置数据。"></app-empty-state></td>
          </tr>
        </ng-template>
      </p-table>
      <app-pagination-bar
        [total]="total()"
        [page]="queryForm.getRawValue().page"
        [limit]="queryForm.getRawValue().limit"
        [loading]="loading()"
        (pageChange)="onPageChange($event)"
        (limitChange)="onLimitChange($event)"
      ></app-pagination-bar>
    </p-card>
  </section>`,
  styleUrls: ['./binding-configs-page.component.css']
})
export class BindingConfigsPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly destroyRef = inject(DestroyRef);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly bindingConfigService = inject(BindingConfigService);
  private readonly confirmDialog = inject(ConfirmDialogService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly feedbackSeverity = signal<'success' | 'info' | 'warn' | 'error' | 'secondary' | 'contrast'>('info');
  readonly items = signal<BindingConfigItem[]>([]);
  readonly total = signal(0);
  readonly kinds = signal<BindingConfigKindMeta[]>([]);
  readonly currentKind = signal<BindingConfigKind>('pipeline');
  readonly currentMeta = signal<BindingConfigKindMeta | null>(null);
  readonly toggleBusyKeys = signal<Set<string>>(new Set());

  readonly queryForm = this.formBuilder.nonNullable.group({
    kind: ['pipeline' as BindingConfigKind],
    keyword: [''],
    status: [''],
    page: [1],
    limit: [10]
  });

  readonly statusOptions = [
    { label: '启用', value: 'active' },
    { label: '停用', value: 'inactive' }
  ];

  readonly kindOptions = computed(() => this.kinds().map(item => ({ label: item.label, value: item.kind })));
  readonly showFilterOptions = computed(() => this.currentKind() !== 'pipeline');
  readonly pageTitle = computed(() => this.currentMeta()?.label || '绑定配置中心');
  readonly pageDescription = computed(
    () => this.currentMeta()?.description || '统一管理角色绑定使用的 Pipeline 与 Profile。'
  );

  ngOnInit(): void {
    this.route.paramMap.pipe(takeUntilDestroyed(this.destroyRef)).subscribe(() => {
      if (this.kinds().length === 0) {
        return;
      }

      this.syncRouteKind();
    });

    this.loadKinds();
  }

  loadKinds(): void {
    this.bindingConfigService.getKinds().subscribe({
      next: (response: ApiResponse<BindingConfigKindMeta[]>) => {
        if (response.code !== 0 || !response.data) {
          this.feedbackMessage.set(response.msg || '配置类型获取失败。');
          this.feedbackSeverity.set('error');
          return;
        }

        this.kinds.set(response.data);
        this.syncRouteKind();
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || '配置类型请求失败。');
        this.feedbackSeverity.set('error');
      }
    });
  }

  loadPage(): void {
    this.feedbackMessage.set('');
    this.feedbackSeverity.set('info');
    this.loading.set(true);

    const { kind, keyword, status, page, limit } = this.queryForm.getRawValue();
    const isPipelineKind = kind === 'pipeline';
    this.currentMeta.set(this.kinds().find(item => item.kind === kind) || null);

    this.bindingConfigService
      .getPage(kind, {
        keyword: isPipelineKind ? undefined : keyword || undefined,
        status: isPipelineKind ? undefined : status || undefined,
        page,
        limit
      })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<BindingConfigPageData>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || '配置列表获取失败。');
            this.feedbackSeverity.set('error');
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.items.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '配置列表请求失败。');
          this.feedbackSeverity.set('error');
        }
      });
  }

  switchKind(): void {
    const kind = this.queryForm.controls.kind.value as BindingConfigKind;
    this.currentKind.set(kind);
    this.queryForm.patchValue({ page: 1 }, { emitEvent: false });
    void this.router.navigate(['/binding-configs', kind]);
  }

  private syncRouteKind(): void {
    const routeKind = (this.route.snapshot.paramMap.get('kind') || 'pipeline') as BindingConfigKind;
    const resolvedKind = this.kinds().some(item => item.kind === routeKind) ? routeKind : 'pipeline';
    const currentKind = this.currentKind();
    this.queryForm.patchValue(
      {
        kind: resolvedKind,
        page: currentKind === resolvedKind ? this.queryForm.controls.page.value : 1
      },
      { emitEvent: false }
    );
    this.currentKind.set(resolvedKind);
    this.currentMeta.set(this.kinds().find(item => item.kind === resolvedKind) || null);
    this.loadPage();
  }

  reset(): void {
    this.queryForm.patchValue({ keyword: '', status: '', page: 1, limit: 10 }, { emitEvent: false });
    this.loadPage();
  }

  onPageChange(page: number): void {
    this.queryForm.patchValue({ page }, { emitEvent: false });
    this.loadPage();
  }

  onLimitChange(limit: number): void {
    this.queryForm.patchValue({ limit, page: 1 }, { emitEvent: false });
    this.loadPage();
  }

  deleteItem(item: BindingConfigItem): void {
    if (!item.id) {
      this.feedbackMessage.set('当前配置缺少 ID，无法删除。');
      this.feedbackSeverity.set('warn');
      return;
    }

    const label = item.name || item.code || item.id;
    this.confirmDialog.confirmDanger({
      header: '删除绑定配置',
      message: `确认删除“${label}”吗？该操作不可撤销。`,
      accept: () => {
        this.bindingConfigService.delete(this.currentKind(), item.id!).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || '删除失败。');
              this.feedbackSeverity.set('error');
              return;
            }

            this.feedbackMessage.set('删除成功。');
            this.feedbackSeverity.set('success');
            this.loadPage();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || '删除请求失败。');
            this.feedbackSeverity.set('error');
          }
        });
      }
    });
  }

  isItemEnabled(item: BindingConfigItem): boolean {
    return item.isEnabled ?? item.status !== 'inactive';
  }

  isToggleBusy(item: BindingConfigItem, field: 'enabled' | 'default'): boolean {
    if (!item.id) {
      return true;
    }

    return this.toggleBusyKeys().has(this.buildToggleKey(this.currentKind(), item.id, field));
  }

  toggleEnabled(item: BindingConfigItem, enabled: boolean): void {
    const normalized = !!enabled;
    if (normalized === this.isItemEnabled(item)) {
      return;
    }

    this.quickUpdateItem(
      item,
      {
        status: normalized ? 'active' : 'inactive',
        isEnabled: normalized
      },
      'enabled',
      '启用状态已更新。'
    );
  }

  toggleDefault(item: BindingConfigItem, isDefault: boolean): void {
    const normalized = !!isDefault;
    if (normalized === !!item.isDefault) {
      return;
    }

    this.quickUpdateItem(
      item,
      {
        isDefault: normalized
      },
      'default',
      '默认状态已更新。'
    );
  }

  summarize(item: BindingConfigItem): string {
    const values = [item.primaryEndpoint, item.primaryModel, item.invocationMode].filter(Boolean);
    if (item.graphJson) {
      values.unshift('graph');
    }
    return values.length > 0 ? values.join(' / ') : '-';
  }

  configDetails(item: BindingConfigItem): { label: string; value: string }[] {
    const details: { label: string; value: string }[] = [];
    if (item.primaryModel) {
      details.push({ label: this.currentKind() === 'embedding' ? '向量模型' : '模型', value: item.primaryModel });
    }
    if (item.primaryEndpoint) {
      details.push({ label: '端点', value: item.primaryEndpoint });
    }
    if (item.invocationMode) {
      details.push({ label: '调用', value: this.invocationModeLabel(item.invocationMode) });
    }
    if (typeof item.dimension === 'number') {
      details.push({ label: '维度', value: String(item.dimension) });
    }
    if (item.integrationId) {
      details.push({ label: '集成', value: item.integrationId });
    }
    if (item.graphJson) {
      details.push({ label: 'Pipeline', value: '已配置' });
    }
    return details;
  }

  invocationModeLabel(mode: string): string {
    if (mode === 'streaming') {
      return '流式';
    }
    if (mode === 'non-streaming') {
      return '非流式';
    }
    return mode;
  }

  private quickUpdateItem(
    item: BindingConfigItem,
    patch: Partial<BindingConfigItem>,
    field: 'enabled' | 'default',
    successMessage: string
  ): void {
    if (!item.id) {
      this.feedbackMessage.set('当前配置缺少 ID，无法快捷更新。');
      this.feedbackSeverity.set('warn');
      return;
    }

    const kind = this.currentKind();
    const busyKey = this.buildToggleKey(kind, item.id, field);
    if (this.toggleBusyKeys().has(busyKey)) {
      return;
    }

    this.setToggleBusy(busyKey, true);

    this.bindingConfigService
      .getDetail(kind, item.id)
      .pipe(
        switchMap((response: ApiResponse<BindingConfigItem>) => {
          if (response.code !== 0 || !response.data) {
            throw new Error(response.msg || '配置详情获取失败，无法快捷更新。');
          }

          const payload = this.buildUpdatePayload(response.data, patch);
          if (!payload.name) {
            throw new Error('配置缺少名称，无法快捷更新。');
          }

          return this.bindingConfigService.update(kind, item.id!, payload);
        }),
        finalize(() => this.setToggleBusy(busyKey, false))
      )
      .subscribe({
        next: (response: ApiResponse<BindingConfigItem>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || '快捷更新失败。');
            this.feedbackSeverity.set('error');
            return;
          }

          this.applyLocalPatch(kind, item.id!, patch);
          this.feedbackMessage.set(successMessage);
          this.feedbackSeverity.set('success');
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '快捷更新请求失败。');
          this.feedbackSeverity.set('error');
        }
      });
  }

  private applyLocalPatch(kind: BindingConfigKind, id: string, patch: Partial<BindingConfigItem>): void {
    this.items.update(rows =>
      rows.map(row => {
        if (!row.id) {
          return row;
        }

        const rowKind = this.currentKind();
        if (row.id === id && rowKind === kind) {
          return {
            ...row,
            ...patch
          };
        }

        if (patch.isDefault === true && rowKind === kind) {
          return {
            ...row,
            isDefault: false
          };
        }

        return row;
      })
    );
  }

  private buildUpdatePayload(source: BindingConfigItem, patch: Partial<BindingConfigItem>): BindingConfigPayload {
    const merged: BindingConfigItem = {
      ...source,
      ...patch
    };

    return {
      code: this.normalizeOptional(merged.code),
      name: this.normalizeOptional(merged.name),
      description: this.normalizeOptional(merged.description),
      status: this.normalizeOptional(merged.status) || 'active',
      providerCode: this.normalizeOptional(merged.providerCode),
      integrationId: this.normalizeOptional(merged.integrationId),
      isEnabled: merged.isEnabled ?? merged.status !== 'inactive',
      isDefault: merged.isDefault ?? false,
      isSystem: merged.isSystem ?? false,
      invocationMode: this.normalizeOptional(merged.invocationMode),
      sort: merged.sort ?? 0,
      primaryEndpoint: this.normalizeOptional(merged.primaryEndpoint),
      primaryModel: this.normalizeOptional(merged.primaryModel),
      dimension: merged.dimension ?? null,
      temperature: merged.temperature ?? null,
      maxTokens: merged.maxTokens ?? null,
      topP: merged.topP ?? null,
      encoding: this.normalizeOptional(merged.encoding),
      sampleRate: merged.sampleRate ?? null,
      speechRate: merged.speechRate ?? null,
      loudnessRate: merged.loudnessRate ?? null,
      resourceId: this.normalizeOptional(merged.resourceId),
      audioFormat: this.normalizeOptional(merged.audioFormat),
      codec: this.normalizeOptional(merged.codec),
      bits: merged.bits ?? null,
      channels: merged.channels ?? null,
      chunkDurationMs: merged.chunkDurationMs ?? null,
      chunkSizeBytes: merged.chunkSizeBytes ?? null,
      language: this.normalizeOptional(merged.language),
      context: this.normalizeOptional(merged.context),
      enableNonstream: merged.enableNonstream ?? null,
      apiKey: this.normalizeOptional(merged.apiKey),
      secretKey: this.normalizeOptional(merged.secretKey),
      appId: this.normalizeOptional(merged.appId),
      accessToken: this.normalizeOptional(merged.accessToken),
      organization: this.normalizeOptional(merged.organization),
      catalogAccessKey: this.normalizeOptional(merged.catalogAccessKey),
      catalogSecretKey: this.normalizeOptional(merged.catalogSecretKey),
      catalogAppId: this.normalizeOptional(merged.catalogAppId),
      graphJson: this.normalizeOptional(merged.graphJson),
      configJson: this.normalizeOptional(merged.configJson)
    };
  }

  private buildToggleKey(kind: BindingConfigKind, id: string, field: 'enabled' | 'default'): string {
    return `${kind}:${id}:${field}`;
  }

  private setToggleBusy(key: string, busy: boolean): void {
    this.toggleBusyKeys.update(current => {
      const next = new Set(current);
      if (busy) {
        next.add(key);
      } else {
        next.delete(key);
      }

      return next;
    });
  }

  private normalizeOptional(value?: string | null): string | null {
    if (!value) {
      return null;
    }

    const normalized = value.trim();
    return normalized ? normalized : null;
  }
}
