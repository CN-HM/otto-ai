import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { InputNumberModule } from 'primeng/inputnumber';
import { ToggleSwitchModule } from 'primeng/toggleswitch';
import { ApiResponse } from '../../../../core/models/api.models';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { JsonEditorComponent } from '../../../../shared/components/json-editor.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../../shared/components/summary-metric-grid.component';
import { AdminSystemSettings } from '../shared/system-params.models';
import { SystemParamsService } from '../shared/system-params.service';
import { PageToolbarComponent } from '../../../../shared/components/page-toolbar.component';

@Component({
  selector: 'app-system-params-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    CardModule,
    InputTextModule,
    InputNumberModule,
    ToggleSwitchModule,
    TranslatePipe,
    FeedbackMessageComponent,
    JsonEditorComponent,
    SummaryMetricGridComponent
  ],
  templateUrl: './system-params-page.component.html',
  styleUrl: './system-params-page.component.css'
})
export class SystemParamsPageComponent implements OnInit {
  private static readonly serverWebSocketPath = '/v1/';

  private readonly formBuilder = inject(FormBuilder);
  private readonly paramsService = inject(SystemParamsService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');

  readonly form = this.formBuilder.group({
    server: this.formBuilder.nonNullable.group({
      listenIp: ['0.0.0.0', [Validators.required]],
      publicHost: ['', [Validators.required]],
      port: [8000, [Validators.required, Validators.min(1)]],
      httpPort: [8003, [Validators.required, Validators.min(1)]],
      visionPort: [8003, [Validators.required, Validators.min(1)]],
      secret: [''],
      allowUserRegister: [false],
      frontendUrl: ['']
    }),
    log: this.formBuilder.nonNullable.group({
      logFormat: [''],
      logFormatFile: [''],
      logLevel: ['INFO', [Validators.required]],
      logDir: [''],
      logFile: [''],
      dataDir: ['']
    }),
    runtime: this.formBuilder.group({
      deleteAudio: this.formBuilder.nonNullable.control(true),
      closeConnectionNoVoiceTime: this.formBuilder.nonNullable.control(120, {
        validators: [Validators.required, Validators.min(0)]
      }),
      ttsTimeout: this.formBuilder.nonNullable.control(10, { validators: [Validators.required, Validators.min(0)] }),
      enableWakeupWordsResponseCache: this.formBuilder.nonNullable.control(false),
      enableGreeting: this.formBuilder.nonNullable.control(true),
      enableStopTtsNotify: this.formBuilder.nonNullable.control(false),
      stopTtsNotifyVoice: this.formBuilder.nonNullable.control(''),
      exitCommands: this.formBuilder.nonNullable.control(''),
      iotProtocolConfig: this.formBuilder.nonNullable.control(''),
      wakeupWords: this.formBuilder.nonNullable.control(''),
      deviceMaxOutputSize: this.formBuilder.control<number | null>(null),
      voiceprintUrl: this.formBuilder.nonNullable.control(''),
      voiceprintSimilarityThreshold: this.formBuilder.control<number | null>(null)
    }),
    billing: this.formBuilder.nonNullable.group({
      defaultPlanCode: [''],
      resetTimezone: ['Asia/Taipei', [Validators.required]],
      lowBalanceRatio: [0.1, [Validators.required, Validators.min(0)]],
      exhaustionRemindCooldownHours: [12, [Validators.required, Validators.min(0)]]
    })
  });

  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.localize('配置分组'), value: 4 },
      { title: this.localize('固定字段'), value: 31 },
      { title: this.localize('布尔开关'), value: 5 }
    ];
  });

  ngOnInit(): void {
    this.loadSettings();
  }

  loadSettings(): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.paramsService
      .getSettings()
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<AdminSystemSettings>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || this.localize('系统设置获取失败。'));
            return;
          }

          this.form.reset(response.data);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('系统设置请求失败。'));
        }
      });
  }

  reload(): void {
    this.loadSettings();
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    if (!this.isOptionalJsonValid(raw.runtime.iotProtocolConfig)) {
      this.feedbackMessage.set(this.localize('IoT 协议配置 JSON 格式不正确，请检查。'));
      return;
    }

    const payload: AdminSystemSettings = {
      server: {
        listenIp: raw.server.listenIp.trim(),
        publicHost: raw.server.publicHost.trim(),
        port: Number(raw.server.port ?? 0),
        httpPort: Number(raw.server.httpPort ?? 0),
        visionPort: Number(raw.server.visionPort ?? 0),
        secret: raw.server.secret.trim(),
        allowUserRegister: !!raw.server.allowUserRegister,
        frontendUrl: raw.server.frontendUrl.trim()
      },
      log: {
        logFormat: raw.log.logFormat.trim(),
        logFormatFile: raw.log.logFormatFile.trim(),
        logLevel: raw.log.logLevel.trim(),
        logDir: raw.log.logDir.trim(),
        logFile: raw.log.logFile.trim(),
        dataDir: raw.log.dataDir.trim()
      },
      runtime: {
        deleteAudio: !!raw.runtime.deleteAudio,
        closeConnectionNoVoiceTime: Number(raw.runtime.closeConnectionNoVoiceTime ?? 0),
        ttsTimeout: Number(raw.runtime.ttsTimeout ?? 0),
        enableWakeupWordsResponseCache: !!raw.runtime.enableWakeupWordsResponseCache,
        enableGreeting: !!raw.runtime.enableGreeting,
        enableStopTtsNotify: !!raw.runtime.enableStopTtsNotify,
        stopTtsNotifyVoice: (raw.runtime.stopTtsNotifyVoice || '').trim(),
        exitCommands: (raw.runtime.exitCommands || '').trim(),
        iotProtocolConfig: (raw.runtime.iotProtocolConfig || '').trim(),
        wakeupWords: (raw.runtime.wakeupWords || '').trim(),
        deviceMaxOutputSize: this.normalizeNullableNumber(raw.runtime.deviceMaxOutputSize),
        voiceprintUrl: (raw.runtime.voiceprintUrl || '').trim(),
        voiceprintSimilarityThreshold: this.normalizeNullableNumber(raw.runtime.voiceprintSimilarityThreshold)
      },
      billing: {
        defaultPlanCode: raw.billing.defaultPlanCode.trim(),
        resetTimezone: raw.billing.resetTimezone.trim(),
        lowBalanceRatio: Number(raw.billing.lowBalanceRatio ?? 0),
        exhaustionRemindCooldownHours: Number(raw.billing.exhaustionRemindCooldownHours ?? 0)
      }
    };

    this.feedbackMessage.set('');
    this.submitting.set(true);

    this.paramsService
      .updateSettings(payload)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('系统设置保存失败。'));
            return;
          }

          this.feedbackMessage.set(this.localize('系统设置保存成功。'));
          this.loadSettings();
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('系统设置保存请求失败。'));
        }
      });
  }

  boolLabel(value: boolean): string {
    return value ? this.localize('开启') : this.localize('关闭');
  }

  serverWebSocketPreview(): string {
    const server = this.form.controls.server.getRawValue();
    return this.buildServerWebSocketPreview(server.publicHost, server.port);
  }

  private normalizeNullableNumber(value: number | null | undefined): number | null {
    if (value === null || value === undefined || Number.isNaN(Number(value))) {
      return null;
    }

    return Number(value);
  }

  private isOptionalJsonValid(value: string | null | undefined): boolean {
    const normalized = (value || '').trim();
    if (!normalized) {
      return true;
    }

    try {
      JSON.parse(normalized);
      return true;
    } catch {
      return false;
    }
  }

  private buildServerWebSocketPreview(publicHost: string | null | undefined, port: number | null | undefined): string {
    const normalizedHost = (publicHost || '').trim();
    const normalizedPort = Number(port ?? 0);
    if (!normalizedHost || !Number.isFinite(normalizedPort) || normalizedPort <= 0) {
      return '';
    }

    const protocol = typeof window !== 'undefined' && window.location.protocol === 'https:' ? 'wss' : 'ws';
    return `${protocol}://${normalizedHost}:${normalizedPort}${SystemParamsPageComponent.serverWebSocketPath}`;
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
