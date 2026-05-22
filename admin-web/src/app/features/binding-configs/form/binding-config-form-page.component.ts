import { CommonModule } from '@angular/common';
import { Component, DestroyRef, OnInit, computed, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize, firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { InputNumberModule } from 'primeng/inputnumber';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { SliderModule } from 'primeng/slider';
import { ToggleSwitchModule } from 'primeng/toggleswitch';
import { ApiResponse } from '../../../core/models/api.models';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { JsonEditorComponent } from '../../../shared/components/json-editor.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import {
  BindingConfigItem,
  BindingConfigKind,
  BindingConfigKindMeta,
  BindingConfigOption,
  BindingConfigPayload,
  PipelineStageKind,
  ProviderScope,
  parsePipelineStage,
  resolveProviderScope
} from '../shared/binding-config.models';
import { BindingConfigService } from '../shared/binding-config.service';
import { CommonService } from '../../../core/http/common.service';

type PipelineStageEnabled = Record<PipelineStageKind, boolean>;

function createDefaultPipelineStageEnabled(): PipelineStageEnabled {
  return { asr: true, vad: true, llm: true, tts: true };
}

@Component({
  selector: 'app-binding-config-form-page',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    ButtonModule,
    InputNumberModule,
    InputTextModule,
    SelectModule,
    SliderModule,
    ToggleSwitchModule,
    FeedbackMessageComponent,
    JsonEditorComponent,
    PageToolbarComponent
  ],
  template: `<section class="binding-config-form-page">
    <div class="page-hero">
      <div>
        <h1>{{ isEdit() ? '编辑' : '新增' }}{{ pageTitle() }}</h1>
        <p>{{ pageDescription() }}</p>
      </div>
    </div>

    <app-page-toolbar [title]="pageTitle()" [description]="pageDescription()">
      <button
        pButton
        type="button"
        label="返回列表"
        icon="pi pi-arrow-left"
        severity="secondary"
        size="small"
        (click)="cancel()"
      ></button>
    </app-page-toolbar>

    <app-feedback-message [text]="feedbackMessage()" [severity]="feedbackSeverity()"></app-feedback-message>

    <form class="form-shell" [formGroup]="form" (ngSubmit)="submit()">
      <div class="field-grid">
        @if (meta()?.supportsCode) {
          <div class="field-group">
            <label for="code">编码</label>
            <div class="code-input-row">
              <input id="code" pInputText formControlName="code" />
              <button pButton type="button" icon="pi pi-refresh" severity="secondary" [text]="true"
                title="重新生成编码" (click)="regenerateCode()"></button>
            </div>
          </div>
        }
        <div class="field-group">
          <label for="name">名称</label>
          <input id="name" pInputText formControlName="name" />
        </div>
        <div class="field-group">
          <label for="statusToggle">状态</label>
          <div class="toggle-status-row">
            <p-toggleswitch
              inputId="statusToggle"
              [ngModel]="isStatusActive()"
              [ngModelOptions]="{ standalone: true }"
              (ngModelChange)="setStatusByToggle(!!$event)"
            ></p-toggleswitch>
            <span class="field-hint">{{ isStatusActive() ? '启用' : '停用' }}</span>
          </div>
        </div>
        <div class="field-group">
          <label for="sort">排序</label>
          <p-inputNumber id="sort" formControlName="sort"></p-inputNumber>
        </div>

        @if (isIntegrationKind()) {
          <div class="field-group field-group-full">
            <strong>模型提供商（Integration）</strong>
            <span>ASR / LLM / TTS / Embedding Profile 需要绑定 IntegrationId；VAD Profile 只配置本地检测提供方。</span>
          </div>
        }

        @if (meta()?.supportsProviderType) {
          <div class="field-group">
            <label for="providerType">Provider Type</label>
            <p-select
              id="providerType"
              [options]="providerTypeOptions"
              formControlName="providerType"
              optionLabel="label"
              optionValue="value"
            ></p-select>
            <span class="field-hint">平台体系强类型：火山方舟 / 豆包语音 / DashScope。</span>
          </div>
        }

        @if (meta()?.supportsProviderScopes) {
          <div class="field-group field-group-full provider-scope-panel">
            <label>应用范围</label>
            <span class="field-hint">Profile 只能绑定已开启对应应用范围的模型提供商</span>
            <div class="provider-scope-grid">
              <label class="toggle-item"
                ><span>ASR</span><p-toggleswitch formControlName="supportsAsr"></p-toggleswitch
              ></label>
              <label class="toggle-item"
                ><span>TTS</span><p-toggleswitch formControlName="supportsTts"></p-toggleswitch
              ></label>
              <label class="toggle-item"
                ><span>LLM</span><p-toggleswitch formControlName="supportsLlm"></p-toggleswitch
              ></label>
              <label class="toggle-item"
                ><span>Emb</span><p-toggleswitch formControlName="supportsMem"></p-toggleswitch
              ></label>
            </div>
          </div>
        }

        @if (meta()?.supportsIntegrationId) {
          <div class="field-group">
            <label for="integrationId">模型提供商（Integration）</label>
            <p-select
              id="integrationId"
              [options]="integrationOptions()"
              formControlName="integrationId"
              optionLabel="label"
              optionValue="value"
              [showClear]="true"
            ></p-select>
            <span class="field-hint"
              >云平台鉴权统一维护在模型提供商中（API Key / AppId / AccessToken）；Profile 页面只做绑定。</span
            >
          </div>
        }

        @if (meta()?.supportsInvocationMode) {
          <div class="field-group">
            <label for="invocationMode">调用模式</label>
            <p-select
              id="invocationMode"
              [options]="invocationModeOptions"
              formControlName="invocationMode"
              optionLabel="label"
              optionValue="value"
              [showClear]="true"
            ></p-select>
          </div>
        }

        @if (meta()?.supportsPrimaryEndpoint) {
          <div class="field-group field-group-full">
            <label for="primaryEndpoint">主连接地址</label>
            <input id="primaryEndpoint" pInputText formControlName="primaryEndpoint" />
          </div>
        }

        @if (meta()?.supportsPrimaryModel) {
          <div class="field-group">
            <label for="primaryModel">{{ primaryModelLabel() }}</label>
            <input id="primaryModel" pInputText formControlName="primaryModel" />
          </div>
        }

        @if (meta()?.supportsTemperature) {
          <div class="field-group">
            <label for="temperature">随机性 (Temperature)</label>
            <p-inputNumber
              id="temperature"
              formControlName="temperature"
              [min]="0"
              [max]="2"
              [step]="0.1"
              [minFractionDigits]="1"
              [maxFractionDigits]="2"
            ></p-inputNumber>
            <p class="field-hint">数值越低回答越确定，越高越富创造性。建议 0.5~1.0。</p>
          </div>
        }

        @if (meta()?.supportsMaxTokens) {
          <div class="field-group">
            <label for="maxTokens">最大输出字数 (Max Tokens)</label>
            <p-inputNumber id="maxTokens" formControlName="maxTokens" [min]="1" [useGrouping]="false"></p-inputNumber>
            <p class="field-hint">限制模型一次最多生成的 Token 数量，留空则使用模型默认值。</p>
          </div>
        }

        @if (meta()?.supportsTopP) {
          <div class="field-group">
            <label for="topP">核采样阈值 (Top P)</label>
            <p-inputNumber
              id="topP"
              formControlName="topP"
              [min]="0"
              [max]="1"
              [step]="0.1"
              [minFractionDigits]="1"
              [maxFractionDigits]="2"
            ></p-inputNumber>
            <p class="field-hint">从概率最高的前若干 Token 中采样，值越小结果越稳定。建议 0.9~1.0。</p>
          </div>
        }

        @if (meta()?.supportsEncoding) {
          <div class="field-group">
            <label for="encoding">音频编码 (Encoding)</label>
            <input id="encoding" pInputText formControlName="encoding" />
          </div>
        }

        @if (meta()?.supportsSampleRate) {
          <div class="field-group">
            <label for="sampleRate">采样率 (Sample Rate)</label>
            <p-inputNumber id="sampleRate" formControlName="sampleRate" [min]="1" [useGrouping]="false"></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsSpeechRate) {
          <div class="field-group">
            <label for="speechRate">语速 (Speech Rate)</label>
            <p-inputNumber id="speechRate" formControlName="speechRate" [useGrouping]="false"></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsLoudnessRate) {
          <div class="field-group">
            <label for="loudnessRate">音量 (Loudness Rate)</label>
            <p-slider id="loudnessRate" formControlName="loudnessRate" [min]="-50" [max]="100"></p-slider>
            <p class="field-hint">当前值: {{ form.controls.loudnessRate.value }}，范围 -50~100（0 为默认值）。</p>
          </div>
        }

        @if (meta()?.supportsResourceId) {
          <div class="field-group">
            <label for="resourceId">资源 ID (Resource Id)</label>
            <input id="resourceId" pInputText formControlName="resourceId" />
          </div>
        }

        @if (meta()?.supportsAudioFormat) {
          <div class="field-group">
            <label for="audioFormat">音频格式 (Audio Format)</label>
            <input id="audioFormat" pInputText formControlName="audioFormat" />
          </div>
        }

        @if (meta()?.supportsCodec) {
          <div class="field-group">
            <label for="codec">编解码器 (Codec)</label>
            <input id="codec" pInputText formControlName="codec" />
          </div>
        }

        @if (meta()?.supportsBits) {
          <div class="field-group">
            <label for="bits">位深 (Bits)</label>
            <p-inputNumber id="bits" formControlName="bits" [min]="1" [useGrouping]="false"></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsChannels) {
          <div class="field-group">
            <label for="channels">声道数 (Channels)</label>
            <p-inputNumber id="channels" formControlName="channels" [min]="1" [useGrouping]="false"></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsChunkDurationMs) {
          <div class="field-group">
            <label for="chunkDurationMs">分片时长 (Chunk Duration Ms)</label>
            <p-inputNumber
              id="chunkDurationMs"
              formControlName="chunkDurationMs"
              [min]="1"
              [useGrouping]="false"
            ></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsChunkSizeBytes) {
          <div class="field-group">
            <label for="chunkSizeBytes">分片大小 (Chunk Size Bytes)</label>
            <p-inputNumber
              id="chunkSizeBytes"
              formControlName="chunkSizeBytes"
              [min]="1"
              [useGrouping]="false"
            ></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsLanguage) {
          <div class="field-group">
            <label for="language">语言 (Language)</label>
            <input id="language" pInputText formControlName="language" />
          </div>
        }

        @if (meta()?.supportsContext) {
          <div class="field-group">
            <label for="context">上下文 (Context)</label>
            <textarea id="context" pInputTextarea formControlName="context" rows="3"></textarea>
          </div>
        }

        @if (meta()?.supportsEnableNonstream) {
          <div class="field-group toggle-field">
            <label for="enableNonstream">启用非流式 (Enable Nonstream)</label>
            <p-toggleSwitch id="enableNonstream" formControlName="enableNonstream"></p-toggleSwitch>
          </div>
        }

        @if (meta()?.supportsDimension) {
          <div class="field-group">
            <label for="dimension">向量维度</label>
            <p-inputNumber id="dimension" formControlName="dimension" [min]="1" [useGrouping]="false"></p-inputNumber>
          </div>
        }

        @if (meta()?.supportsApiKey) {
          <div class="field-group">
            <label for="apiKey">{{ isIntegrationKind() ? 'API Key / AccessKey' : 'Api Key' }}</label>
            <input id="apiKey" pInputText formControlName="apiKey" />
          </div>
        }

        @if (meta()?.supportsSecretKey) {
          <div class="field-group">
            <label for="secretKey">Secret Key</label>
            <input id="secretKey" pInputText formControlName="secretKey" />
          </div>
        }

        @if (meta()?.supportsAppId) {
          <div class="field-group">
            <label for="appId">{{ isIntegrationKind() ? 'App ID（可选）' : 'App ID' }}</label>
            <input id="appId" pInputText formControlName="appId" />
          </div>
        }

        @if (meta()?.supportsAccessToken) {
          <div class="field-group">
            <label for="accessToken">{{ isIntegrationKind() ? 'Access Token（可选）' : 'Access Token' }}</label>
            <input id="accessToken" pInputText formControlName="accessToken" />
          </div>
        }

        @if (meta()?.supportsOrganization) {
          <div class="field-group">
            <label for="organization">{{ isIntegrationKind() ? 'Organization（可选）' : 'Organization' }}</label>
            <input id="organization" pInputText formControlName="organization" />
          </div>
        }

        @if (meta()?.supportsCatalogAccessKey) {
          <div class="field-group">
            <label for="catalogAccessKey">Catalog Access Key</label>
            <input id="catalogAccessKey" pInputText formControlName="catalogAccessKey" />
          </div>
        }

        @if (meta()?.supportsCatalogSecretKey) {
          <div class="field-group">
            <label for="catalogSecretKey">Catalog Secret Key</label>
            <input id="catalogSecretKey" pInputText formControlName="catalogSecretKey" />
          </div>
        }

        @if (meta()?.supportsCatalogAppId) {
          <div class="field-group">
            <label for="catalogAppId">Catalog App ID</label>
            <input id="catalogAppId" pInputText formControlName="catalogAppId" />
          </div>
        }

        <div class="field-group field-group-full">
          <label for="description">描述</label>
          <textarea id="description" class="native-textarea" rows="3" formControlName="description"></textarea>
        </div>

        @if (meta()?.supportsConfigJson) {
          <div class="field-group field-group-full">
            <label for="configJson">扩展配置 JSON</label>
            <app-json-editor formControlName="configJson" [minHeight]="240"></app-json-editor>
          </div>
        }

        @if (meta()?.supportsIsEnabled) {
          <div class="field-group">
            <label class="toggle-item"
              ><span>启用</span><p-toggleswitch formControlName="isEnabled"></p-toggleswitch
            ></label>
          </div>
        }

        @if (showDefaultToggle()) {
          <div class="field-group">
            <label class="toggle-item"
              ><span>默认</span><p-toggleswitch formControlName="isDefault"></p-toggleswitch
            ></label>
          </div>
        }
      </div>

      @if (showPipelineStagePanel()) {
        <section class="pipeline-helper-panel">
          <div class="pipeline-helper-header">
            <strong>Pipeline 节点启用开关</strong>
            <span>节点开关控制运行时是否启用该阶段。</span>
          </div>
          <div class="pipeline-flow">
            @for (entry of pipelineStageEntries(); track entry.kind; let isLast = $last; let index = $index) {
              <article class="pipeline-step-card">
                <div class="pipeline-step-header">
                  <span class="pipeline-step-index">{{ index + 1 }}</span>
                  <strong>{{ entry.label }}</strong>
                </div>
                <div class="pipeline-node-toggle">
                  <span>{{ isPipelineStageEnabled(entry.kind) ? '节点启用' : '节点停用' }}</span>
                  <p-toggleswitch
                    [ngModel]="isPipelineStageEnabled(entry.kind)"
                    [ngModelOptions]="{ standalone: true }"
                    (ngModelChange)="togglePipelineStage(entry.kind, !!$event)"
                  ></p-toggleswitch>
                </div>
              </article>

              @if (!isLast) {
                <span class="pipeline-flow-arrow pi pi-arrow-right" aria-hidden="true"></span>
              }
            }
          </div>
        </section>
      }

      <div class="form-actions">
        <button pButton type="submit" label="保存" icon="pi pi-save" [loading]="submitting()"></button>
        <button pButton type="button" label="取消" severity="secondary" [text]="true" (click)="cancel()"></button>
      </div>
    </form>
  </section>`,
  styleUrls: ['./binding-config-form-page.component.css']
})
export class BindingConfigFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly destroyRef = inject(DestroyRef);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly bindingConfigService = inject(BindingConfigService);
  private readonly commonService = inject(CommonService);

  readonly submitting = signal(false);
  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly feedbackSeverity = signal<'success' | 'info' | 'warn' | 'error' | 'secondary' | 'contrast'>('info');
  readonly isEdit = signal(false);
  readonly integrationOptions = signal<BindingConfigOption[]>([]);
  readonly pipelineStageEnabled = signal<PipelineStageEnabled>(createDefaultPipelineStageEnabled());
  readonly meta = signal<BindingConfigKindMeta | null>(null);
  readonly kind = signal<BindingConfigKind>('pipeline');
  readonly itemId = signal('');

  readonly invocationModeOptions = [
    { label: '流式', value: 'streaming' },
    { label: '非流式', value: 'non-streaming' }
  ];

  readonly providerTypeOptions = [
    { label: '火山方舟', value: 'ark' },
    { label: '豆包语音', value: 'doubao_speech' },
    { label: '阿里 DashScope', value: 'dashscope' }
  ];

  readonly pageTitle = computed(() => this.meta()?.label || '绑定配置');
  readonly pageDescription = computed(() => this.meta()?.description || '编辑角色绑定配置。');
  readonly isIntegrationKind = computed(() => this.kind() === 'integration');
  readonly isPipelineKind = computed(() => this.kind() === 'pipeline');
  readonly isVadKind = computed(() => this.kind() === 'vad');
  readonly primaryModelLabel = computed(() => (this.kind() === 'embedding' ? '向量模型' : '模型'));
  readonly showDefaultToggle = computed(() => this.isEdit());
  readonly showPipelineStagePanel = computed(() => this.kind() === 'pipeline');

  readonly pipelineStageEntries = computed(() => [
    { kind: 'vad' as const, label: 'VAD 节点' },
    { kind: 'asr' as const, label: 'ASR 节点' },
    { kind: 'llm' as const, label: 'LLM 节点' },
    { kind: 'tts' as const, label: 'TTS 节点' }
  ]);

  readonly form = this.formBuilder.nonNullable.group({
    code: [''],
    name: ['', [Validators.required]],
    description: [''],
    status: ['active'],
    providerCode: [''],
    providerType: ['ark'],
    integrationId: [''],
    isEnabled: [true],
    isDefault: [false],
    supportsAsr: [false],
    supportsTts: [false],
    supportsLlm: [false],
    supportsMem: [false],
    isSystem: [false],
    invocationMode: ['streaming'],
    sort: [0],
    primaryEndpoint: [''],
    primaryModel: [''],
    dimension: [null as number | null],
    encoding: [''],
    sampleRate: [null as number | null],
    speechRate: [null as number | null],
    loudnessRate: [null as number | null],
    resourceId: [''],
    audioFormat: [''],
    codec: [''],
    bits: [null as number | null],
    channels: [null as number | null],
    chunkDurationMs: [null as number | null],
    chunkSizeBytes: [null as number | null],
    language: [''],
    context: [''],
    enableNonstream: [null as boolean | null],
    temperature: [null as number | null],
    maxTokens: [null as number | null],
    topP: [null as number | null],
    apiKey: [''],
    secretKey: [''],
    appId: [''],
    accessToken: [''],
    organization: [''],
    catalogAccessKey: [''],
    catalogSecretKey: [''],
    catalogAppId: [''],
    graphJson: ['{}'],
    configJson: ['{}']
  });

  ngOnInit(): void {
    this.route.paramMap.pipe(takeUntilDestroyed(this.destroyRef)).subscribe(params => {
      const kind = (params.get('kind') || 'pipeline') as BindingConfigKind;
      const id = params.get('id') || '';
      this.kind.set(kind);
      this.itemId.set(id);
      this.isEdit.set(!!id);
      this.resetFormState();
      this.loadKinds();
    });
  }

  loadKinds(): void {
    this.bindingConfigService.getKinds().subscribe({
      next: (response: ApiResponse<BindingConfigKindMeta[]>) => {
        if (response.code !== 0 || !response.data) {
          this.feedbackMessage.set(response.msg || '配置类型获取失败。');
          this.feedbackSeverity.set('error');
          return;
        }

        const meta = response.data.find(item => item.kind === this.kind()) || null;
        this.meta.set(meta);
        if (!meta) {
          this.feedbackMessage.set('不支持的配置类型。');
          this.feedbackSeverity.set('error');
          return;
        }

        if (meta.supportsGraphJson) {
          this.form.controls.graphJson.setValue(this.form.controls.graphJson.value || '{}', { emitEvent: false });
        }
        if (meta.supportsConfigJson) {
          this.form.controls.configJson.setValue(this.form.controls.configJson.value || '{}', { emitEvent: false });
        }
        if (!this.isEdit() && this.kind() === 'embedding') {
          this.form.patchValue(
            {
              primaryEndpoint:
                this.form.controls.primaryEndpoint.value ||
                'https://ark.cn-beijing.volces.com/api/v3/embeddings/multimodal',
              primaryModel: this.form.controls.primaryModel.value || 'doubao-embedding-vision-251215',
              dimension: this.form.controls.dimension.value || 1024
            },
            { emitEvent: false }
          );
        }

        if (!this.isEdit() && meta.supportsCode) {
          this.generateCode();
        }

        if (this.showPipelineStagePanel()) {
          this.syncPipelineStagesFromGraphJson(this.form.controls.graphJson.value || '{}');
        } else {
          this.pipelineStageEnabled.set(createDefaultPipelineStageEnabled());
        }

        if (!meta.supportsIntegrationId) {
          this.integrationOptions.set([]);
          this.form.controls.integrationId.setValue('', { emitEvent: false });
          this.form.controls.integrationId.clearValidators();
          this.form.controls.integrationId.updateValueAndValidity({ emitEvent: false });
        } else {
          this.form.controls.integrationId.setValidators([Validators.required]);
          this.form.controls.integrationId.updateValueAndValidity({ emitEvent: false });
        }

        if (this.isEdit()) {
          if (meta.supportsIntegrationId) {
            this.loadIntegrationOptions();
          }
          this.loadDetail();
        } else if (meta.supportsIntegrationId) {
          this.loadIntegrationOptions();
        }
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || '配置类型请求失败。');
        this.feedbackSeverity.set('error');
      }
    });
  }

  isPipelineStageEnabled(kind: PipelineStageKind): boolean {
    return this.pipelineStageEnabled()[kind];
  }

  togglePipelineStage(kind: PipelineStageKind, enabled: boolean): void {
    if (!this.showPipelineStagePanel()) {
      return;
    }

    this.pipelineStageEnabled.update(current => ({
      ...current,
      [kind]: enabled
    }));
  }

  loadDetail(): void {
    this.loading.set(true);
    this.bindingConfigService
      .getDetail(this.kind(), this.itemId())
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<BindingConfigItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || '配置详情获取失败。');
            this.feedbackSeverity.set('error');
            return;
          }

          const item = response.data;
          this.form.patchValue({
            code: item.code || '',
            name: item.name || '',
            description: item.description || '',
            status: item.status || 'active',
            providerCode: item.providerCode || '',
            providerType: item.providerType || item.providerCode || 'ark',
            integrationId: item.integrationId || '',
            isEnabled: item.isEnabled ?? true,
            isDefault: item.isDefault ?? false,
            supportsAsr: item.supportsAsr ?? false,
            supportsTts: item.supportsTts ?? false,
            supportsLlm: item.supportsLlm ?? false,
            supportsMem: item.supportsMem ?? false,
            isSystem: item.isSystem ?? false,
            invocationMode: item.invocationMode || 'streaming',
            sort: item.sort ?? 0,
            primaryEndpoint: item.primaryEndpoint || '',
            primaryModel: item.primaryModel || '',
            dimension: item.dimension ?? null,
            temperature: item.temperature ?? null,
            maxTokens: item.maxTokens ?? null,
            topP: item.topP ?? null,
            encoding: item.encoding || '',
            sampleRate: item.sampleRate ?? null,
            speechRate: item.speechRate ?? null,
            loudnessRate: item.loudnessRate ?? null,
            resourceId: item.resourceId || '',
            audioFormat: item.audioFormat || '',
            codec: item.codec || '',
            bits: item.bits ?? null,
            channels: item.channels ?? null,
            chunkDurationMs: item.chunkDurationMs ?? null,
            chunkSizeBytes: item.chunkSizeBytes ?? null,
            language: item.language || '',
            context: item.context || '',
            enableNonstream: item.enableNonstream ?? null,
            apiKey: item.apiKey || '',
            secretKey: item.secretKey || '',
            appId: item.appId || '',
            accessToken: item.accessToken || '',
            organization: item.organization || '',
            catalogAccessKey: item.catalogAccessKey || '',
            catalogSecretKey: item.catalogSecretKey || '',
            catalogAppId: item.catalogAppId || '',
            graphJson: item.graphJson || '{}',
            configJson: item.configJson || '{}'
          });

          if (this.showPipelineStagePanel()) {
            this.syncPipelineStagesFromGraphJson(item.graphJson || '{}');
          }
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || '配置详情请求失败。');
          this.feedbackSeverity.set('error');
        }
      });
  }

  loadIntegrationOptions(providerCode?: string | null): void {
    if (!this.meta()?.supportsIntegrationId) {
      this.integrationOptions.set([]);
      return;
    }

    this.bindingConfigService.getIntegrationOptions(providerCode, this.integrationScope()).subscribe({
      next: (response: ApiResponse<BindingConfigOption[]>) => {
        if (response.code !== 0 || !response.data) {
          this.integrationOptions.set([]);
          return;
        }

        this.integrationOptions.set(response.data);
      },
      error: () => {
        this.integrationOptions.set([]);
      }
    });
  }

  private readonly codePrefixByKind: Record<string, string> = {
    integration: 'int',
    pipeline: 'pipe'
  };

  private async generateCode(): Promise<void> {
    const prefix = this.codePrefixByKind[this.kind()] || this.kind();
    try {
      const res = await firstValueFrom(this.commonService.generateCode(prefix));
      if (res.code === 0 && res.data?.code) {
        this.form.controls.code.setValue(res.data.code, { emitEvent: false });
      }
    } catch {
      // leave code empty if generation fails
    }
  }

  async regenerateCode(): Promise<void> {
    await this.generateCode();
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const graphJsonPayload = this.meta()?.supportsGraphJson ? this.buildGraphJsonPayload(raw.graphJson) : undefined;
    if (graphJsonPayload === false) {
      return;
    }

    const payload: BindingConfigPayload = {
      code: this.meta()?.supportsCode ? this.normalize(raw.code) : undefined,
      name: raw.name.trim(),
      description: this.normalize(raw.description),
      status: raw.status,
      providerCode: undefined,
      providerType: this.meta()?.supportsProviderType ? this.normalize(raw.providerType) : undefined,
      integrationId: this.meta()?.supportsIntegrationId ? this.normalize(raw.integrationId) : undefined,
      isEnabled: raw.isEnabled,
      isDefault: this.isEdit() ? raw.isDefault : false,
      supportsAsr: this.meta()?.supportsProviderScopes ? raw.supportsAsr : undefined,
      supportsTts: this.meta()?.supportsProviderScopes ? raw.supportsTts : undefined,
      supportsLlm: this.meta()?.supportsProviderScopes ? raw.supportsLlm : undefined,
      supportsMem: this.meta()?.supportsProviderScopes ? raw.supportsMem : undefined,
      isSystem: raw.isSystem,
      invocationMode: this.normalize(raw.invocationMode),
      sort: raw.sort ?? 0,
      primaryEndpoint: this.normalize(raw.primaryEndpoint),
      primaryModel: this.meta()?.supportsPrimaryModel ? this.normalize(raw.primaryModel) : undefined,
      dimension: this.meta()?.supportsDimension ? raw.dimension : undefined,
      apiKey: this.meta()?.supportsApiKey ? this.normalize(raw.apiKey) : undefined,
      secretKey: this.meta()?.supportsSecretKey ? this.normalize(raw.secretKey) : undefined,
      appId: this.meta()?.supportsAppId ? this.normalize(raw.appId) : undefined,
      accessToken: this.meta()?.supportsAccessToken ? this.normalize(raw.accessToken) : undefined,
      organization: this.meta()?.supportsOrganization ? this.normalize(raw.organization) : undefined,
      catalogAccessKey: this.meta()?.supportsCatalogAccessKey ? this.normalize(raw.catalogAccessKey) : undefined,
      catalogSecretKey: this.meta()?.supportsCatalogSecretKey ? this.normalize(raw.catalogSecretKey) : undefined,
      catalogAppId: this.meta()?.supportsCatalogAppId ? this.normalize(raw.catalogAppId) : undefined,
      graphJson: this.meta()?.supportsGraphJson ? graphJsonPayload || '{}' : undefined,
      configJson: this.meta()?.supportsConfigJson ? this.normalize(raw.configJson) || '{}' : undefined,
      temperature: this.meta()?.supportsTemperature ? raw.temperature : undefined,
      maxTokens: this.meta()?.supportsMaxTokens ? raw.maxTokens : undefined,
      topP: this.meta()?.supportsTopP ? raw.topP : undefined,
      encoding: this.meta()?.supportsEncoding ? this.normalize(raw.encoding) : undefined,
      sampleRate: this.meta()?.supportsSampleRate ? raw.sampleRate : undefined,
      speechRate: this.meta()?.supportsSpeechRate ? raw.speechRate : undefined,
      loudnessRate: this.meta()?.supportsLoudnessRate ? raw.loudnessRate : undefined,
      resourceId: this.meta()?.supportsResourceId ? this.normalize(raw.resourceId) : undefined,
      audioFormat: this.meta()?.supportsAudioFormat ? this.normalize(raw.audioFormat) : undefined,
      codec: this.meta()?.supportsCodec ? this.normalize(raw.codec) : undefined,
      bits: this.meta()?.supportsBits ? raw.bits : undefined,
      channels: this.meta()?.supportsChannels ? raw.channels : undefined,
      chunkDurationMs: this.meta()?.supportsChunkDurationMs ? raw.chunkDurationMs : undefined,
      chunkSizeBytes: this.meta()?.supportsChunkSizeBytes ? raw.chunkSizeBytes : undefined,
      language: this.meta()?.supportsLanguage ? this.normalize(raw.language) : undefined,
      context: this.meta()?.supportsContext ? this.normalize(raw.context) : undefined,
      enableNonstream: this.meta()?.supportsEnableNonstream ? raw.enableNonstream : undefined
    };

    this.feedbackMessage.set('');
    this.feedbackSeverity.set('info');
    this.submitting.set(true);

    const request$ = this.isEdit()
      ? this.bindingConfigService.update(this.kind(), this.itemId(), payload)
      : this.bindingConfigService.create(this.kind(), payload);

    request$.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (response: ApiResponse<BindingConfigItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || '配置保存失败。');
          this.feedbackSeverity.set('error');
          return;
        }

        void this.router.navigate(['/binding-configs', this.kind()]);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || '配置保存请求失败。');
        this.feedbackSeverity.set('error');
      }
    });
  }

  cancel(): void {
    void this.router.navigate(['/binding-configs', this.kind()]);
  }

  isStatusActive(): boolean {
    return this.form.controls.status.value !== 'inactive';
  }

  setStatusByToggle(active: boolean): void {
    const status = active ? 'active' : 'inactive';
    this.form.controls.status.setValue(status, { emitEvent: false });
    if (this.meta()?.supportsIsEnabled) {
      this.form.controls.isEnabled.setValue(active, { emitEvent: false });
    }
  }

  private integrationScope(): ProviderScope | null {
    return resolveProviderScope(this.kind());
  }

  private syncPipelineStagesFromGraphJson(graphJson: string): void {
    const enabled = createDefaultPipelineStageEnabled();
    const normalized = this.normalize(graphJson) || '{}';

    try {
      const parsed = JSON.parse(normalized) as unknown;
      if (!parsed || typeof parsed !== 'object' || Array.isArray(parsed)) {
        this.pipelineStageEnabled.set(enabled);
        return;
      }

      const parsedObject = parsed as Record<string, unknown>;
      const enabledStages = parsedObject['enabledStages'];
      if (Array.isArray(enabledStages)) {
        const enabledSet = new Set(
          enabledStages.map(parsePipelineStage).filter((item): item is PipelineStageKind => !!item)
        );
        (Object.keys(enabled) as PipelineStageKind[]).forEach(kind => {
          enabled[kind] = enabledSet.has(kind);
        });
      }
    } catch {
      this.pipelineStageEnabled.set(enabled);
      return;
    }

    this.pipelineStageEnabled.set(enabled);
  }

  private buildGraphJsonPayload(rawGraphJson: string): string | false {
    const normalized = this.normalize(rawGraphJson) || '{}';
    if (!this.showPipelineStagePanel()) {
      return normalized;
    }

    try {
      const parsed = JSON.parse(normalized) as unknown;
      if (!parsed || typeof parsed !== 'object' || Array.isArray(parsed)) {
        this.feedbackMessage.set('Graph JSON 必须是 JSON 对象。');
        this.feedbackSeverity.set('error');
        return false;
      }

      const jsonObject = parsed as Record<string, unknown>;
      const enabled = this.pipelineStageEnabled();
      delete jsonObject['profileBindings'];
      jsonObject['enabledStages'] = (Object.keys(enabled) as PipelineStageKind[]).filter(kind => enabled[kind]);

      return JSON.stringify(jsonObject);
    } catch (error) {
      this.feedbackMessage.set(error instanceof Error ? `Graph JSON 不合法：${error.message}` : 'Graph JSON 不合法。');
      this.feedbackSeverity.set('error');
      return false;
    }
  }

  private resetFormState(): void {
    this.feedbackMessage.set('');
    this.feedbackSeverity.set('info');
    this.loading.set(false);
    this.submitting.set(false);
    this.meta.set(null);
    this.integrationOptions.set([]);
    this.pipelineStageEnabled.set(createDefaultPipelineStageEnabled());
    this.form.reset(
      {
        code: '',
        name: '',
        description: '',
        status: 'active',
        providerCode: '',
        providerType: 'ark',
        integrationId: '',
        isEnabled: true,
        isDefault: false,
        supportsAsr: false,
        supportsTts: false,
        supportsLlm: false,
        supportsMem: false,
        isSystem: false,
        invocationMode: 'streaming',
        sort: 0,
        primaryEndpoint: '',
        primaryModel: '',
        dimension: null,
        temperature: null,
        maxTokens: null,
        topP: null,
        encoding: '',
        sampleRate: null,
        speechRate: null,
        loudnessRate: null,
        resourceId: '',
        audioFormat: '',
        codec: '',
        bits: null,
        channels: null,
        chunkDurationMs: null,
        chunkSizeBytes: null,
        language: '',
        context: '',
        enableNonstream: null,
        apiKey: '',
        secretKey: '',
        appId: '',
        accessToken: '',
        organization: '',
        catalogAccessKey: '',
        catalogSecretKey: '',
        catalogAppId: '',
        graphJson: '{}',
        configJson: '{}'
      },
      { emitEvent: false }
    );
  }

  private normalize(value?: string | null): string | null {
    return value && value.trim() ? value.trim() : null;
  }
}
