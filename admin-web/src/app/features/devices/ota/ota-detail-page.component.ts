import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { DeviceService } from '../list/device.service';
import { OtaItem } from '../list/device.models';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-ota-detail-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    DatePipe,
    RouterLink,
    ButtonModule,
    CardModule,
    FeedbackMessageComponent,
    TranslatePipe
  ],
  templateUrl: './ota-detail-page.component.html',
  styleUrl: './ota-detail-page.component.css'
})
export class OtaDetailPageComponent implements OnInit {
  private readonly route = inject(ActivatedRoute);
  private readonly deviceService = inject(DeviceService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly ota = signal<OtaItem | null>(null);

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.loadDetail(id);
    }
  }

  loadDetail(id: string): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.deviceService
      .getOtaDetail(id)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<OtaItem>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('OTA 详情获取失败。'));
            return;
          }

          this.ota.set(response.data ?? null);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('OTA 详情请求失败。'));
        }
      });
  }

  getDownloadUrl(): void {
    const id = this.ota()?.id;
    if (!id) {
      return;
    }

    this.feedbackMessage.set('');
    this.deviceService.getOtaDownloadUrl(id).subscribe({
      next: (response: ApiResponse<string>) => {
        this.feedbackMessage.set(response.code === 0 ? this.localize(`下载链接：${response.data || '-'}`) : response.msg || this.localize('获取下载链接失败。'));
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('获取下载链接请求失败。'));
      }
    });
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
