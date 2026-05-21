import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { UploadPanelComponent } from '../../../shared/components/upload-panel.component';
import { DeviceService } from '../list/device.service';
import { OtaFormPayload, OtaItem, OtaUploadResult } from '../list/device.models';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-ota-form-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    InputTextModule,
    FeedbackMessageComponent,
    UploadPanelComponent,
    TranslatePipe
  ],
  templateUrl: './ota-form-page.component.html',
  styleUrl: './ota-form-page.component.css'
})
export class OtaFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly deviceService = inject(DeviceService);
  private readonly i18n = inject(I18nService);

  readonly otaId = signal('');
  readonly submitting = signal(false);
  readonly uploading = signal(false);
  readonly feedbackMessage = signal('');
  readonly selectedFile = signal<File | null>(null);
  readonly selectedFileName = signal('');
  readonly selectedAssetsFile = signal<File | null>(null);
  readonly selectedAssetsFileName = signal('');
  readonly uploadingAssets = signal(false);

  readonly form = this.formBuilder.nonNullable.group({
    firmwareName: ['', [Validators.required]],
    type: [''],
    version: ['', [Validators.required]],
    size: [0],
    firmwarePath: [''],
    sort: [0],
    remark: ['']
  });

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id') || '';
    if (id) {
      this.otaId.set(id);
      this.loadDetail(id);
    }
  }

  loadDetail(id: string): void {
    this.submitting.set(true);
    this.deviceService
      .getOtaDetail(id)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<OtaItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || this.localize('OTA 详情获取失败。'));
            return;
          }

          this.form.patchValue({
            firmwareName: response.data.firmwareName || '',
            type: response.data.type || '',
            version: response.data.version || '',
            size: Number(response.data.size || 0),
            firmwarePath: response.data.firmwarePath || '',
            sort: Number(response.data.sort || 0),
            remark: response.data.remark || ''
          });
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('OTA 详情请求失败。'));
        }
      });
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const payload: OtaFormPayload = {
      firmwareName: raw.firmwareName,
      type: raw.type || undefined,
      version: raw.version,
      size: Number(raw.size || 0),
      firmwarePath: raw.firmwarePath || undefined,
      sort: Number(raw.sort || 0),
      remark: raw.remark || undefined
    };
    this.feedbackMessage.set('');
    this.submitting.set(true);

    const request$ = this.otaId()
      ? this.deviceService.updateOta(this.otaId(), payload)
      : this.deviceService.createOta(payload);

    request$.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (response: ApiResponse<unknown>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('OTA 保存失败。'));
          return;
        }

        this.feedbackMessage.set(this.otaId() ? this.localize('OTA 更新成功。') : this.localize('OTA 新增成功。'));
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('OTA 保存请求失败。'));
      }
    });
  }

  onFileSelected(file: File | null): void {
    this.selectedFile.set(file);
    this.selectedFileName.set(file?.name || '');
  }

  upload(): void {
    const file = this.selectedFile();
    if (!file) {
      this.feedbackMessage.set(this.localize('请先选择固件文件。'));
      return;
    }

    const formData = this.buildUploadFormData(file);

    this.feedbackMessage.set('');
    this.uploading.set(true);

    this.deviceService
      .uploadFirmware(formData)
      .pipe(finalize(() => this.uploading.set(false)))
      .subscribe({
        next: (response: ApiResponse<string | OtaUploadResult>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('固件上传失败。'));
            return;
          }

          const resultText = this.applyUploadResult(file, response.data);
          this.feedbackMessage.set(this.localize(`固件上传成功，已回填表单字段：${resultText || '已完成'}`));
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('固件上传请求失败。'));
        }
      });
  }

  private applyUploadResult(file: File, data: string | OtaUploadResult | undefined): string {
    let firmwarePath = '';
    let firmwareName = '';
    let firmwareSize = 0;
    let displayValue = '';

    if (typeof data === 'string') {
      firmwarePath = data;
      displayValue = data;
    } else if (data && typeof data === 'object') {
      const uploadData = this.unwrapUploadResult(data);
      firmwarePath = this.pickFirstString(uploadData, [
        'firmwarePath',
        'filePath',
        'url',
        'path',
        'fileUrl',
        'downloadUrl'
      ]);
      firmwareName = this.pickFirstString(uploadData, [
        'fileName',
        'firmwareName',
        'name',
        'originalFilename',
        'originalName'
      ]);
      firmwareSize = this.pickFirstNumber(uploadData, ['size', 'fileSize']);
      displayValue = firmwarePath || firmwareName || this.pickFirstString(uploadData, ['uuid']);
    }

    const currentValue = this.form.getRawValue();
    const inferredName = firmwareName || file.name.replace(/\.[^.]+$/, '') || file.name;

    this.form.patchValue({
      firmwareName: currentValue.firmwareName || inferredName,
      size: firmwareSize || file.size,
      firmwarePath: firmwarePath || currentValue.firmwarePath
    });

    return displayValue || file.name;
  }

  private buildUploadFormData(file: File): FormData {
    const formData = new FormData();
    formData.append('file', file);

    return formData;
  }

  private pickFirstString(data: Record<string, unknown>, keys: string[]): string {
    for (const key of keys) {
      const value = data[key];
      if (typeof value === 'string' && value.trim()) {
        return value;
      }
    }

    return '';
  }

  private pickFirstNumber(data: Record<string, unknown>, keys: string[]): number {
    for (const key of keys) {
      const value = data[key];
      if (typeof value === 'number' && Number.isFinite(value)) {
        return value;
      }
      if (typeof value === 'string' && value.trim()) {
        const parsed = Number(value);
        if (Number.isFinite(parsed)) {
          return parsed;
        }
      }
    }

    return 0;
  }

  private unwrapUploadResult(data: Record<string, unknown>): Record<string, unknown> {
    const nestedKeys = ['data', 'result', 'payload'];
    for (const key of nestedKeys) {
      const candidate = data[key];
      if (candidate && typeof candidate === 'object' && !Array.isArray(candidate)) {
        return candidate as Record<string, unknown>;
      }
    }

    return data;
  }

  onAssetsFileSelected(file: File | null): void {
    this.selectedAssetsFile.set(file);
    this.selectedAssetsFileName.set(file?.name || '');
  }

  uploadAssetsBin(): void {
    const file = this.selectedAssetsFile();
    if (!file) {
      this.feedbackMessage.set(this.localize('请先选择资源固件文件。'));
      return;
    }

    const formData = new FormData();
    formData.append('file', file);
    this.feedbackMessage.set('');
    this.uploadingAssets.set(true);

    this.deviceService
      .uploadAssetsBin(formData)
      .pipe(finalize(() => this.uploadingAssets.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('资源固件上传失败。'));
            return;
          }
          this.feedbackMessage.set(this.localize('资源固件上传成功。'));
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('资源固件上传请求失败。'));
        }
      });
  }

  remove(): void {
    if (!this.otaId()) {
      this.feedbackMessage.set(this.localize('新增页面暂不支持删除，请先保存。'));
      return;
    }

    this.feedbackMessage.set('');
    this.submitting.set(true);
    this.deviceService
      .deleteOta(this.otaId())
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('OTA 删除失败。'));
            return;
          }

          this.feedbackMessage.set(this.localize('OTA 删除成功。'));
          void this.router.navigate(['/devices/ota']);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('OTA 删除请求失败。'));
        }
      });
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
