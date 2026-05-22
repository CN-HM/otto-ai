import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { TextareaModule } from 'primeng/textarea';
import { ApiResponse } from '../../../core/models/api.models';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { I18nService } from '../../../core/i18n/i18n.service';
import { HasPermissionDirective } from '../../../shared/directives/has-permission.directive';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { AgentRoleItem, AgentRoleReleaseItem } from '../shared/agent-role.models';
import { AgentRoleService } from '../shared/agent-role.service';

@Component({
  selector: 'app-agent-roles-page',
  styleUrls: ['./agent-roles-page.component.css'],
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
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
    PaginationBarComponent,
    PageToolbarComponent,
    SearchFilterCardComponent,
    TranslatePipe,
    HasPermissionDirective
  ],
  template: `<section class="agent-roles-page">
    <div class="page-hero">
      <div>
        <h1>{{ 'agentRoles.title' | translate }}</h1>
        <p>{{ 'agentRoles.listDescription' | translate }}</p>
      </div>
    </div>

    <app-page-toolbar>
      <a
        *appHasPermission="'agent-role:create'"
        pButton
        routerLink="/agent-roles/new"
        label="{{ 'agentRoles.new' | translate }}"
        severity="primary"
        icon="pi pi-plus"
        size="small"
      ></a>
    </app-page-toolbar>

    <app-search-filter-card
      [formGroup]="queryForm"
      [loading]="loading()"
      [columns]="4"
      (submitted)="search()"
      (resetTriggered)="reset()"
    >
      <div filterField class="filter-field">
        <label for="keyword">{{ 'agentRoles.keywords' | translate }}</label>
        <input id="keyword" type="text" pInputText formControlName="keyword" placeholder="{{ 'agentRoles.searchPlaceholder' | translate }}" />
      </div>
      <div filterField class="filter-field">
        <label for="status">{{ 'agentRoles.status' | translate }}</label>
        <p-select
          id="status"
          [options]="statusOptions()"
          formControlName="status"
          optionLabel="label"
          optionValue="value"
          placeholder="{{ 'agentRoles.allStatus' | translate }}"
        ></p-select>
      </div>
    </app-search-filter-card>

    <app-feedback-message [text]="feedbackMessage()"></app-feedback-message>

    <p-card header="{{ 'agentRoles.listTitle' | translate }}">
      <p-table [value]="roles()" [loading]="loading()" dataKey="id" responsiveLayout="scroll">
        <ng-template pTemplate="header">
          <tr>
            <th>{{ 'agentRoles.role' | translate }}</th>
            <th>{{ 'agentRoles.runtimeConfig' | translate }}</th>
            <th>{{ 'agentRoles.statusPublish' | translate }}</th>
            <th>{{ 'agentRoles.updatedAt' | translate }}</th>
            <th>{{ 'agentRoles.operation' | translate }}</th>
          </tr>
        </ng-template>
        <ng-template pTemplate="body" let-item>
          <tr>
            <td>
              <div>
                <div class="name-cell">
                  <strong>{{ item.displayName || item.name || '-' }}</strong>
                  @if (item.isSystem) {
                    <p-tag value="{{ 'agentRoles.systemBuiltIn' | translate }}" severity="info"></p-tag>
                  }
                </div>
                @if (item.description) {
                  <small>{{ item.description }}</small>
                }
                <small>{{ 'agentRoles.name' | translate }}：{{ item.name || '-' }} ｜ {{ 'agentRoles.code' | translate }}：{{ item.code || '-' }}</small>
              </div>
            </td>
            <td>
              <div class="runtime-config-list">
                @for (detail of roleConfigDetails(item); track detail.label) {
                  <div class="runtime-config-item">
                    <span>{{ detail.label }}</span>
                    <strong>{{ detail.value }}</strong>
                  </div>
                } @empty {
                  <small>{{ 'agentRoles.noRuntimeConfig' | translate }}</small>
                }
              </div>
            </td>
            <td>
              <div>
                <div><p-tag [value]="statusLabel(item.status)" [severity]="statusSeverity(item.status)"></p-tag></div>
                <small
                  >{{ 'agentRoles.version' | translate }}：{{ item.currentVersion || ('agentRoles.unpublished' | translate) }}
                  <a href="javascript:void(0)" (click)="openReleaseHistory(item)" class="release-history-link">{{ 'agentRoles.history' | translate }}</a>
                </small>
                @if (item.publishedAt) {
                  <small>{{ 'agentRoles.publishedAt' | translate }}：{{ item.publishedAt | date: 'yyyy-MM-dd HH:mm' }}</small>
                }
              </div>
            </td>
            <td>{{ item.updatedAt ? (item.updatedAt | date: 'yyyy-MM-dd HH:mm') : '-' }}</td>
            <td>
              <div class="row-actions">
                <a
                  *appHasPermission="'agent-role:update'"
                  pButton
                  [routerLink]="['/agent-roles', item.id, 'edit']"
                  label="{{ 'common.edit' | translate }}"
                  size="small"
                  severity="contrast"
                ></a>
                <a
                  *appHasPermission="'agent-role:list'"
                  pButton
                  [routerLink]="['/agent-roles', item.id, 'runtime-test']"
                  label="{{ 'agentRoles.test' | translate }}"
                  size="small"
                  severity="secondary"
                ></a>
                <button
                  *appHasPermission="'agent-role:publish'"
                  pButton
                  type="button"
                  label="{{ 'agentRoles.publish' | translate }}"
                  size="small"
                  severity="success"
                  (click)="openPublishDialog(item)"
                ></button>
                <button
                  *appHasPermission="'agent-role:delete'"
                  pButton
                  type="button"
                  label="{{ 'common.delete' | translate }}"
                  size="small"
                  severity="danger"
                  [text]="true"
                  (click)="deleteRole(item)"
                  [disabled]="item.isSystem"
                ></button>
              </div>
            </td>
          </tr>
        </ng-template>
        <ng-template pTemplate="emptymessage">
          <tr>
            <td colspan="5"><app-empty-state text="{{ 'agentRoles.noData' | translate }}"></app-empty-state></td>
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
    <p-dialog
      [(visible)]="publishDialogVisible"
      header="{{ 'agentRoles.publishTitle' | translate }}"
      [modal]="true"
      appendTo="body"
      [style]="{ width: '480px' }"
      (onHide)="closePublishDialog()"
    >
      <form [formGroup]="publishForm" (ngSubmit)="doPublish()">
        <div class="field-group publish-field">
          <label for="pv">{{ 'agentRoles.versionNumber' | translate }}</label
          ><input id="pv" pInputText formControlName="version" placeholder="{{ 'agentRoles.autoGenerate' | translate }}" />
        </div>
        <div class="field-group publish-field">
          <label for="pr">{{ 'agentRoles.remark' | translate }}</label
          ><textarea id="pr" pTextarea formControlName="remark" rows="3" placeholder="{{ 'agentRoles.remarkPlaceholder' | translate }}"></textarea>
        </div>
        <div class="form-actions" style="justify-content:flex-end">
          <button pButton type="button" label="{{ 'common.cancel' | translate }}" severity="secondary" (click)="closePublishDialog()"></button
          ><button pButton type="submit" label="{{ 'agentRoles.publish' | translate }}" severity="success" [disabled]="publishing()"></button>
        </div>
      </form>
    </p-dialog>
    <p-dialog
      [(visible)]="releaseHistoryVisible"
      header="{{ 'agentRoles.releaseHistory' | translate }}"
      [modal]="true"
      appendTo="body"
      [style]="{ width: '640px' }"
      (onHide)="releaseHistoryVisible = false"
    >
      <p-table [value]="releases()" [loading]="loadingReleases()"
        ><ng-template pTemplate="header"
          ><tr>
            <th>{{ 'agentRoles.version' | translate }}</th>
            <th>{{ 'agentRoles.status' | translate }}</th>
            <th>{{ 'agentRoles.remark' | translate }}</th>
            <th>{{ 'agentRoles.publishedAt' | translate }}</th>
            <th>{{ 'agentRoles.operation' | translate }}</th>
          </tr></ng-template
        ><ng-template pTemplate="body" let-r
          ><tr>
            <td>
              <strong>{{ r.version }}</strong>
            </td>
            <td>
              <p-tag
                [value]="r.status === 'published' ? ('agentRoles.current' | translate) : ('agentRoles.historical' | translate)"
                [severity]="r.status === 'published' ? 'success' : 'secondary'"
              ></p-tag>
            </td>
            <td>{{ r.remark || '-' }}</td>
            <td>{{ r.publishedAt | date: 'yyyy-MM-dd HH:mm' }}</td>
            <td>
              <button
                *ngIf="r.status !== 'published' && r.id"
                pButton
                type="button"
                label="{{ 'agentRoles.activate' | translate }}"
                size="small"
                severity="info"
                (click)="activateRelease(r.id!)"
              ></button>
            </td></tr></ng-template
        ><ng-template pTemplate="emptymessage"
          ><tr>
            <td colspan="5"><app-empty-state text="{{ 'agentRoles.noReleaseData' | translate }}"></app-empty-state></td></tr></ng-template
      ></p-table>
    </p-dialog>
  </section>`
})
export class AgentRolesPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly agentRoleService = inject(AgentRoleService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<AgentRoleItem>(async (page, limit) => {
    const { keyword, status } = this.queryForm.getRawValue();
    const response = await firstValueFrom(
      this.agentRoleService.getPage({
        keyword: keyword || undefined,
        status: status || undefined,
        page,
        limit
      })
    );
    if (response.code !== 0) throw new Error(response.msg || this.i18n.translate('agentRoles.loadFailed'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly roles = this.store.items;
  readonly total = this.store.total;

  readonly statusOptions = computed(() => {
    this.i18n.localeVersion();
    return [
      { label: this.i18n.translate('agentRoles.allStatus'), value: null },
      { label: this.i18n.translate('agentRoles.active'), value: 'active' },
      { label: this.i18n.translate('agentRoles.inactive'), value: 'inactive' }
    ];
  });

  readonly queryForm = this.formBuilder.nonNullable.group({
    keyword: [''],
    status: [null as string | null],
    page: [1],
    limit: [10]
  });

  ngOnInit(): void {
    this.loadRoles();
  }

  loadRoles(): void {
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
    this.queryForm.reset({ keyword: '', status: null, page: 1, limit: 10 });
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

  deleteRole(item: AgentRoleItem): void {
    const label = item.displayName || item.name || item.code || item.id || this.i18n.translate('agentRoles.unnamedRole');
    this.confirmDialog.confirmDanger({
      header: this.i18n.translate('agentRoles.deleteTitle'),
      message: this.i18n.translate('agentRoles.deleteConfirm', { name: label }),
      accept: () => {
        if (!item.id) {
          this.feedbackMessage.set(this.i18n.translate('agentRoles.missingId'));
          return;
        }

        this.agentRoleService.delete(item.id).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || this.i18n.translate('agentRoles.deleteFailed'));
              return;
            }

            void this.store.load();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || this.i18n.translate('agentRoles.deleteRequestFailed'));
          }
        });
      }
    });
  }

  roleConfigDetails(item: AgentRoleItem): { label: string; value: string }[] {
    const details: { label: string; value: string }[] = [];
    if (item.pipelineTemplateId) {
      details.push({ label: 'Pipeline', value: item.pipelineTemplateId });
    }
    if (item.asrProfileId) {
      details.push({ label: 'ASR', value: item.asrProfileId });
    }
    if (item.vadProfileId) {
      details.push({ label: 'VAD', value: item.vadProfileId });
    }
    if (item.llmProfileId) {
      details.push({ label: 'LLM', value: item.llmProfileId });
    }
    if (item.ttsProfileId) {
      details.push({ label: 'TTS', value: item.ttsProfileId });
    }
    if (item.ttsVoiceId) {
      details.push({ label: this.i18n.translate('agentRoles.voice'), value: item.ttsVoiceId });
    }
    if (item.memoryEnabled) {
      details.push({ label: this.i18n.translate('agentRoles.memory'), value: item.memoryEntityScope || this.i18n.translate('agentRoles.enabled') });
    }
    if (item.knowledgeBindings?.length) {
      details.push({ label: this.i18n.translate('agentRoles.knowledgeBase'), value: `${item.knowledgeBindings.length} ${this.i18n.translate('agentRoles.countSuffix')}` });
    }
    return details;
  }

  statusLabel(status?: string | null): string {
    return status === 'active' ? this.i18n.translate('agentRoles.active') : this.i18n.translate('agentRoles.inactive');
  }

  statusSeverity(status?: string | null): 'success' | 'danger' {
    return status === 'active' ? 'success' : 'danger';
  }

  publishDialogVisible = false;
  publishing = signal(false);
  publishTarget: AgentRoleItem | null = null;
  publishForm = this.formBuilder.nonNullable.group({
    version: [''],
    remark: ['']
  });

  releaseHistoryVisible = false;
  releases = signal<AgentRoleReleaseItem[]>([]);
  loadingReleases = signal(false);
  releaseTargetId: string | null = null;

  openPublishDialog(item: AgentRoleItem): void {
    this.publishTarget = item;
    this.publishForm.reset({ version: '', remark: '' });
    this.publishDialogVisible = true;
  }

  closePublishDialog(): void {
    this.publishDialogVisible = false;
    this.publishTarget = null;
  }

  doPublish(): void {
    if (!this.publishTarget?.id) return;
    this.publishing.set(true);
    const payload = this.publishForm.getRawValue();
    this.agentRoleService
      .publish(this.publishTarget.id, {
        version: payload.version || undefined,
        remark: payload.remark || undefined
      })
      .subscribe({
        next: response => {
          this.publishing.set(false);
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.i18n.translate('agentRoles.publishFailed'));
            return;
          }
          this.publishDialogVisible = false;
          this.publishTarget = null;
          void this.store.load();
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.publishing.set(false);
          this.feedbackMessage.set(error.error?.msg || error.message || this.i18n.translate('agentRoles.publishRequestFailed'));
        }
      });
  }

  openReleaseHistory(item: AgentRoleItem): void {
    if (!item.id) return;
    this.releaseTargetId = item.id;
    this.releaseHistoryVisible = true;
    this.loadReleases(item.id);
  }

  loadReleases(roleId: string): void {
    this.loadingReleases.set(true);
    this.agentRoleService.getReleases(roleId).subscribe({
      next: response => {
        this.loadingReleases.set(false);
        if (response.code === 0 && response.data) {
          this.releases.set(response.data);
        }
      },
      error: () => {
        this.loadingReleases.set(false);
      }
    });
  }

  activateRelease(releaseId: string): void {
    if (!this.releaseTargetId) return;
    this.agentRoleService.activateRelease(this.releaseTargetId, releaseId).subscribe({
      next: response => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.i18n.translate('agentRoles.activateFailed'));
          return;
        }
        this.releaseHistoryVisible = false;
        void this.store.load();
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.i18n.translate('agentRoles.activateRequestFailed'));
      }
    });
  }
}
