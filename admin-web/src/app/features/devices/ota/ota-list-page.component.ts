import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { TableModule } from 'primeng/table';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import { OtaItem } from '../list/device.models';
import { DeviceService } from '../list/device.service';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';

@Component({
  selector: 'app-ota-list-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    PaginationBarComponent,
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    InputTextModule,
    FeedbackMessageComponent,
    TableModule,
    TranslatePipe
  ],
  templateUrl: './ota-list-page.component.html',
  styleUrl: './ota-list-page.component.css'
})
export class OtaListPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly deviceService = inject(DeviceService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly otaList = signal<OtaItem[]>([]);
  readonly total = signal(0);
  expandedRows: Record<string, boolean> = {};

  readonly queryForm = this.formBuilder.nonNullable.group({
    page: [1],
    limit: [10]
  });

  ngOnInit(): void {
    this.loadOtaList();
  }

  loadOtaList(): void {
    const { page, limit } = this.queryForm.getRawValue();
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.deviceService
      .getOtaPage({ page, limit })
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<{ total: number; list: OtaItem[] }>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('OTA 列表获取失败。'));
            return;
          }

          this.total.set(response.data?.total ?? 0);
          this.otaList.set(response.data?.list ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('OTA 列表请求失败。'));
        }
      });
  }

  getDownloadUrl(item: OtaItem): void {
    this.feedbackMessage.set('');
    this.deviceService.getOtaDownloadUrl(item.id).subscribe({
      next: (response: ApiResponse<string>) => {
        this.feedbackMessage.set(response.code === 0 ? this.localize(`下载链接：${response.data || '-'}`) : response.msg || this.localize('获取下载链接失败。'));
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('获取下载链接请求失败。'));
      }
    });
  }

  changePage(page: number): void {
    this.queryForm.patchValue({ page });
    this.loadOtaList();
  }

  changeLimit(limit: number): void {
    this.queryForm.patchValue({ page: 1, limit });
    this.loadOtaList();
  }

  deleteOta(item: OtaItem): void {
    const otaLabel = item.firmwareName || item.version || item.id;

    this.confirmDialog.confirmDanger({
      header: this.localize('删除 OTA'),
      message: this.localize(`确认删除 OTA“${otaLabel}”吗？该操作不可撤销。`),
      accept: () => {
        this.feedbackMessage.set('');
        this.loading.set(true);

        this.deviceService
          .deleteOta(item.id)
          .pipe(finalize(() => this.loading.set(false)))
          .subscribe({
            next: (response: ApiResponse<unknown>) => {
              if (response.code !== 0) {
                this.feedbackMessage.set(response.msg || this.localize('OTA 删除失败。'));
                return;
              }

              this.feedbackMessage.set(this.localize('OTA 删除成功。'));
              this.loadOtaList();
            },
            error: (error: { error?: { msg?: string }; message?: string }) => {
              this.feedbackMessage.set(error.error?.msg || error.message || this.localize('OTA 删除请求失败。'));
            }
          });
      }
    });
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
