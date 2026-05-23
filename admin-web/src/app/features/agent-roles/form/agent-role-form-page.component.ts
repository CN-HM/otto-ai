import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize, firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { InputNumberModule } from 'primeng/inputnumber';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { SliderModule } from 'primeng/slider';
import { ToggleSwitchModule } from 'primeng/toggleswitch';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { ApiResponse } from '../../../core/models/api.models';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import {
  LANGUAGE_TO_CODE_MAP,
  StaticSelectOption,
  VOICE_LANGUAGE_OPTIONS
} from '../../../shared/constants/form-options.constants';
import { VoiceItem } from '../../voices/list/voice.models';
import { VoiceService } from '../../voices/list/voice.service';
import { KnowledgeBaseItem } from '../../datasets/list/shared/knowledge-base.models';
import { KnowledgeBaseService } from '../../datasets/list/shared/knowledge-base.service';
import { McpToolOption } from '../../mcp-tools/shared/mcp-tool.models';
import { McpToolService } from '../../mcp-tools/shared/mcp-tool.service';
import {
  AgentRoleBindingOptions,
  AgentRoleItem,
  AgentRoleKnowledgeBindingItem,
  AgentRolePayload,
  AgentRolePluginMappingItem
} from '../shared/agent-role.models';
import { AgentRoleService } from '../shared/agent-role.service';
import { CommonService } from '../../../core/http/common.service';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { ActionRulesComponent } from '../action-rules/action-rules.component';

interface SelectOption {
  label: string;
  value: string;
}
type BindingTypeKey = 'ASR' | 'LLM' | 'TTS' | 'VAD';
type BindingControlName = 'asrProfileId' | 'llmProfileId' | 'ttsProfileId' | 'vadProfileId';
interface KnowledgeBindingFormItem {
  datasetId: string;
  datasetName: string;
  sort: number;
  enabled: boolean;
}

const BINDING_CONTROL_BY_TYPE: Record<BindingTypeKey, BindingControlName> = {
  ASR: 'asrProfileId',
  LLM: 'llmProfileId',
  TTS: 'ttsProfileId',
  VAD: 'vadProfileId'
};

const DEFAULT_LANGUAGE_VALUE = VOICE_LANGUAGE_OPTIONS[0]?.value || '';

interface StepDef {
  key: string;
  label: string;
}

@Component({
  selector: 'app-agent-role-form-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    ButtonModule,
    InputNumberModule,
    InputTextModule,
    SelectModule,
    SliderModule,
    ToggleSwitchModule,
    TranslatePipe,
    FeedbackMessageComponent,
    ActionRulesComponent
  ],
  templateUrl: './agent-role-form-page.component.html',
  styleUrls: ['./agent-role-form-page.component.css']
})
export class AgentRoleFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly agentRoleService = inject(AgentRoleService);
  private readonly voiceService = inject(VoiceService);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);
  private readonly mcpToolService = inject(McpToolService);
  private readonly commonService = inject(CommonService);
  private readonly i18n = inject(I18nService);

  readonly roleId = signal('');
  readonly loading = signal(false);
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');
  readonly isEdit = signal(false);
  readonly asrProfileOptions = signal<SelectOption[]>([]);
  readonly llmProfileOptions = signal<SelectOption[]>([]);
  readonly ttsProfileOptions = signal<SelectOption[]>([]);
  readonly vadProfileOptions = signal<SelectOption[]>([]);
  readonly voiceOptions = signal<SelectOption[]>([]);
  readonly iconOptions = signal<SelectOption[]>([]);
  readonly themeTokenOptions = signal<SelectOption[]>([]);
  readonly knowledgeBaseOptions = signal<KnowledgeBaseItem[]>([]);
  readonly knowledgeBindings = signal<KnowledgeBindingFormItem[]>([]);
  readonly coverImageFileName = signal<string>('');
  readonly coverImagePreview = signal<string | null>(null);
  readonly languageOptions = computed<StaticSelectOption[]>(() => {
    this.i18n.localeVersion();
    return this.localizeStaticOptions(VOICE_LANGUAGE_OPTIONS);
  });
  readonly mcpToolOptions = signal<McpToolOption[]>([]);
  readonly currentStep = signal(0);

  readonly memoryDecisionOptions = computed(() => {
    this.i18n.localeVersion();
    return [
      { label: this.i18n.translate('agentRoles.form.memoryDecisionOptions.inheritDefault'), value: null },
      { label: this.i18n.translate('agentRoles.form.memoryDecisionOptions.enabled'), value: true },
      { label: this.i18n.translate('agentRoles.form.memoryDecisionOptions.disabled'), value: false }
    ];
  });

  readonly memoryScopeOptions = computed(() => {
    this.i18n.localeVersion();
    return [
      { label: this.i18n.translate('agentRoles.form.memoryScopeOptions.device'), value: 'device' },
      { label: this.i18n.translate('agentRoles.form.memoryScopeOptions.user'), value: 'user' }
    ];
  });

  readonly steps = computed<StepDef[]>(() => {
    this.i18n.localeVersion();
    return [
      { key: 'basic', label: this.i18n.translate('agentRoles.form.steps.basic') },
      { key: 'models', label: this.i18n.translate('agentRoles.form.steps.models') },
      { key: 'voice', label: this.i18n.translate('agentRoles.form.steps.voice') },
      { key: 'prompt', label: this.i18n.translate('agentRoles.form.steps.prompt') },
      { key: 'knowledge', label: this.i18n.translate('agentRoles.form.steps.knowledge') },
      { key: 'memory', label: this.i18n.translate('agentRoles.form.steps.memory') },
      { key: 'mcp', label: this.i18n.translate('agentRoles.form.steps.mcp') },
      { key: 'actions', label: this.i18n.translate('agentRoles.form.steps.actions') }
    ];
  });

  readonly visibleSteps = computed<StepDef[]>(() => {
    const steps = this.steps();
    return this.isEdit() ? steps : steps.filter(step => step.key !== 'actions');
  });

  readonly form = this.formBuilder.nonNullable.group({
    code: ['', [Validators.required, Validators.maxLength(64)]],
    name: ['', [Validators.required, Validators.maxLength(100)]],
    displayName: [''],
    description: [''],
    status: ['active'],
    icon: [''],
    coverImage: [''],
    themeToken: [''],
    asrProfileId: [''],
    vadProfileId: [''],
    llmProfileId: [''],
    ttsProfileId: [''],
    ttsVoiceId: [''],
    ttsLanguage: [DEFAULT_LANGUAGE_VALUE],
    ttsVolume: [0 as number | null],
    ttsRate: [0 as number | null],
    ttsPitch: [0 as number | null],
    chatHistoryConf: [10 as number | null],
    systemPrompt: [''],
    knowledgeNoHitFallbackText: [''],
    memoryEnabled: [false],
    memoryModelId: [''],
    memoryEntityScope: ['device'],
    memoryTopK: [5 as number | null],
    memoryMinScore: [0.3 as number | null],
    memoryIntentRecall: [null as boolean | null],
    memoryQueryRewrite: [null as boolean | null],
    memoryRerank: [null as boolean | null],
    langCode: ['zh'],
    language: [DEFAULT_LANGUAGE_VALUE],
    selectedMcpTools: [[] as string[]],
    sort: [0]
  });

  ngOnInit(): void {
    this.loadBindingOptions();
    this.loadIconOptions();
    this.loadThemeOptions();
    this.loadKnowledgeBases();
    this.loadMcpToolOptions();
    this.syncLanguageFields(this.form.controls.ttsLanguage.value);

    this.form.controls.ttsProfileId.valueChanges.subscribe(ttsProfileId => {
      this.loadVoiceOptions(ttsProfileId || '');
    });
    this.form.controls.ttsLanguage.valueChanges.subscribe(language => {
      this.syncLanguageFields(language || DEFAULT_LANGUAGE_VALUE);
    });
    this.form.controls.memoryEnabled.valueChanges.subscribe(enabled => {
      if (!enabled) this.resetMemoryFields();
    });

    const roleId = this.route.snapshot.paramMap.get('id') || '';
    if (roleId) {
      this.roleId.set(roleId);
      this.isEdit.set(true);
      this.loadDetail(roleId);
    } else {
      this.applyPromptTemplate();
      this.generateCode();
    }
  }

  private async generateCode(): Promise<void> {
    try {
      const res = await firstValueFrom(this.commonService.generateCode('agent'));
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

  goToStep(index: number): void {
    if (index >= 0 && index < this.visibleSteps().length) {
      this.currentStep.set(index);
    }
  }

  nextStep(): void {
    if (this.currentStep() < this.visibleSteps().length - 1) {
      this.currentStep.update(v => v + 1);
    }
  }

  prevStep(): void {
    if (this.currentStep() > 0) {
      this.currentStep.update(v => v - 1);
    }
  }

  isLastStep(): boolean {
    return this.currentStep() === this.visibleSteps().length - 1;
  }

  loadDetail(roleId: string): void {
    this.feedbackMessage.set('');
    this.loading.set(true);
    this.agentRoleService
      .getDetail(roleId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<AgentRoleItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.form.detailLoadFailed'));
            return;
          }
          const item = response.data;
          if (item.coverImage && item.coverImage.startsWith('data:')) {
            this.coverImagePreview.set(item.coverImage);
            this.coverImageFileName.set(this.i18n.translate('agentRoles.form.uploadedImage'));
          }
          this.form.patchValue({
            code: item.code || '',
            name: item.name || '',
            displayName: item.displayName || '',
            description: item.description || '',
            status: item.status || 'active',
            icon: item.icon || '',
            coverImage: item.coverImage || '',
            themeToken: item.themeToken || '',
            asrProfileId: item.asrProfileId || '',
            vadProfileId: item.vadProfileId || '',
            llmProfileId: item.llmProfileId || '',
            ttsProfileId: item.ttsProfileId || '',
            ttsVoiceId: item.ttsVoiceId || '',
            ttsLanguage: item.ttsLanguage || item.language || DEFAULT_LANGUAGE_VALUE,
            ttsVolume: item.ttsVolume ?? null,
            ttsRate: item.ttsRate ?? null,
            ttsPitch: item.ttsPitch ?? null,
            chatHistoryConf: item.chatHistoryConf ?? null,
            systemPrompt: item.systemPrompt || '',
            knowledgeNoHitFallbackText: item.knowledgeNoHitFallbackText || '',
            memoryEnabled: item.memoryEnabled ?? false,
            memoryModelId: item.memoryModelId || '',
            memoryEntityScope: item.memoryEntityScope || 'device',
            memoryTopK: item.memoryTopK ?? null,
            memoryMinScore: item.memoryMinScore ?? null,
            memoryIntentRecall: item.memoryIntentRecall ?? null,
            memoryQueryRewrite: item.memoryQueryRewrite ?? null,
            memoryRerank: item.memoryRerank ?? null,
            langCode: item.langCode || this.resolveLanguageCode(item.ttsLanguage || item.language || DEFAULT_LANGUAGE_VALUE),
            language: item.language || item.ttsLanguage || DEFAULT_LANGUAGE_VALUE,
            selectedMcpTools: this.resolveSelectedMcpTools(item.pluginMappings),
            sort: item.sort ?? 0
          });
          this.knowledgeBindings.set(this.normalizeKnowledgeBindings(item.knowledgeBindings));
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(this.resolveMessage(error.error?.msg || error.message, 'agentRoles.form.detailRequestFailed'));
        }
      });
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }
    const raw = this.form.getRawValue();
    const pluginMappings = this.buildPluginMappings(raw.selectedMcpTools);
    const knowledgeBindings = this.buildKnowledgeBindings();
    if (knowledgeBindings.length > 0 && !this.normalizeOptional(raw.knowledgeNoHitFallbackText)) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.form.knowledgeFallbackRequired'));
      return;
    }
    if (raw.memoryEnabled && !this.normalizeOptional(raw.memoryModelId)) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.form.memoryModelRequired'));
      return;
    }
    if (this.normalizeOptional(raw.ttsProfileId) && !this.normalizeOptional(raw.ttsVoiceId)) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.form.ttsVoiceRequired'));
      return;
    }
    if (!this.normalizeOptional(raw.ttsProfileId) && this.normalizeOptional(raw.ttsVoiceId)) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.form.ttsProfileRequired'));
      return;
    }
    const payload: AgentRolePayload = {
      code: raw.code.trim(),
      name: raw.name.trim(),
      displayName: this.normalizeOptional(raw.displayName),
      description: this.normalizeOptional(raw.description),
      status: raw.status || 'active',
      icon: this.normalizeOptional(raw.icon),
      coverImage: this.normalizeOptional(raw.coverImage),
      themeToken: this.normalizeOptional(raw.themeToken),
      asrProfileId: this.normalizeOptional(raw.asrProfileId),
      vadProfileId: this.normalizeOptional(raw.vadProfileId),
      llmProfileId: this.normalizeOptional(raw.llmProfileId),
      ttsProfileId: this.normalizeOptional(raw.ttsProfileId),
      ttsVoiceId: this.normalizeOptional(raw.ttsVoiceId),
      ttsLanguage: this.normalizeOptional(raw.ttsLanguage),
      ttsVolume: raw.ttsVolume ?? undefined,
      ttsRate: raw.ttsRate ?? undefined,
      ttsPitch: raw.ttsPitch ?? undefined,
      chatHistoryConf: raw.chatHistoryConf ?? undefined,
      systemPrompt: this.normalizeOptional(raw.systemPrompt),
      knowledgeNoHitFallbackText: this.normalizeOptional(raw.knowledgeNoHitFallbackText),
      memoryEnabled: raw.memoryEnabled,
      memoryModelId: raw.memoryEnabled ? this.normalizeOptional(raw.memoryModelId) : undefined,
      memoryEntityScope: this.normalizeOptional(raw.memoryEntityScope),
      memoryTopK: raw.memoryTopK ?? undefined,
      memoryMinScore: raw.memoryMinScore ?? undefined,
      memoryIntentRecall: raw.memoryIntentRecall ?? undefined,
      memoryQueryRewrite: raw.memoryQueryRewrite ?? undefined,
      memoryRerank: raw.memoryRerank ?? undefined,
      langCode: this.normalizeOptional(raw.langCode),
      language: this.normalizeOptional(raw.language),
      pluginMappings,
      knowledgeBindings,
      contextProviders: [],
      sort: raw.sort ?? 0
    };
    this.feedbackMessage.set('');
    this.submitting.set(true);
    const request$ = this.roleId()
      ? this.agentRoleService.update(this.roleId(), payload)
      : this.agentRoleService.create(payload);
    request$.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (response: ApiResponse<AgentRoleItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.form.saveFailed'));
          return;
        }
        void this.router.navigate(['/agent-roles']);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(this.resolveMessage(error.error?.msg || error.message, 'agentRoles.form.saveRequestFailed'));
      }
    });
  }

  cancel(): void {
    void this.router.navigate(['/agent-roles']);
  }
  isStatusActive(): boolean {
    return this.form.controls.status.value !== 'inactive';
  }
  setStatusByToggle(active: boolean): void {
    this.form.controls.status.setValue(active ? 'active' : 'inactive', { emitEvent: false });
  }

  loadIconOptions(): void {
    this.agentRoleService.getIconOptions().subscribe({
      next: (response: ApiResponse<{ label: string; value: string; description?: string }[]>) => {
        if (response.code === 0 && response.data) {
          this.iconOptions.set(response.data.map(item => ({ label: item.label, value: item.value })));
        }
      }
    });
  }

  loadThemeOptions(): void {
    this.agentRoleService.getThemeOptions().subscribe({
      next: (response: ApiResponse<{ label: string; value: string; description?: string }[]>) => {
        if (response.code === 0 && response.data) {
          this.themeTokenOptions.set(response.data.map(item => ({ label: item.label, value: item.value })));
        }
      }
    });
  }

  triggerCoverImageUpload(): void {
    const fileInput = document.getElementById('coverImageFile') as HTMLInputElement;
    fileInput?.click();
  }

  onCoverImageSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0];
    if (!file) return;
    if (file.size > 500 * 1024) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.form.coverImageTooLarge'));
      return;
    }
    this.coverImageFileName.set(file.name);
    const reader = new FileReader();
    reader.onload = e => {
      const base64 = e.target?.result as string;
      this.coverImagePreview.set(base64);
      this.form.controls.coverImage.setValue(base64);
    };
    reader.readAsDataURL(file);
  }

  applyPromptTemplate(): void {
    this.form.controls.systemPrompt.setValue(this.i18n.translate('agentRoles.form.defaultSystemPrompt'));
  }

  private loadBindingOptions(): void {
    this.agentRoleService.getBindingOptions().subscribe({
      next: (response: ApiResponse<AgentRoleBindingOptions>) => {
        if (response.code !== 0 || !response.data) {
          this.setBindingOptions('ASR', []);
          this.setBindingOptions('LLM', []);
          this.setBindingOptions('TTS', []);
          this.setBindingOptions('VAD', []);
          return;
        }
        this.setBindingOptions('ASR', this.mapOptionItems(response.data.asrProfiles));
        this.setBindingOptions('LLM', this.mapOptionItems(response.data.llmProfiles));
        this.setBindingOptions('TTS', this.mapOptionItems(response.data.ttsProfiles));
        this.setBindingOptions('VAD', this.mapOptionItems(response.data.vadProfiles));
        this.applyDefaultBindingSelection('ASR', this.mapOptionItems(response.data.asrProfiles));
        this.applyDefaultBindingSelection('LLM', this.mapOptionItems(response.data.llmProfiles));
        this.applyDefaultBindingSelection('TTS', this.mapOptionItems(response.data.ttsProfiles));
        this.applyDefaultBindingSelection('VAD', this.mapOptionItems(response.data.vadProfiles));
      },
      error: () => {
        this.setBindingOptions('ASR', []);
        this.setBindingOptions('LLM', []);
        this.setBindingOptions('TTS', []);
        this.setBindingOptions('VAD', []);
      }
    });
  }

  private setBindingOptions(bindingType: BindingTypeKey, options: SelectOption[]): void {
    switch (bindingType) {
      case 'ASR':
        this.asrProfileOptions.set(options);
        break;
      case 'LLM':
        this.llmProfileOptions.set(options);
        break;
      case 'TTS':
        this.ttsProfileOptions.set(options);
        break;
      case 'VAD':
        this.vadProfileOptions.set(options);
        break;
    }
  }

  private applyDefaultBindingSelection(bindingType: BindingTypeKey, options: SelectOption[]): void {
    if (this.isEdit()) return;
    const control = this.form.controls[BINDING_CONTROL_BY_TYPE[bindingType]];
    const currentValue = control.value;
    if (currentValue && options.some(item => item.value === currentValue)) return;
    const fallbackValue = options.length > 0 ? options[0].value : '';
    if (fallbackValue) {
      control.setValue(fallbackValue);
    } else if (currentValue) {
      control.setValue('');
    }
  }

  private mapOptionItems(items: { label: string; value: string; description?: string | null }[]): SelectOption[] {
    return (items ?? [])
      .map(item => ({ label: item.label, value: item.value }))
      .filter((item): item is SelectOption => !!item.value);
  }

  private loadVoiceOptions(ttsProfileId: string): void {
    if (!ttsProfileId) {
      this.voiceOptions.set([]);
      this.form.controls.ttsVoiceId.setValue('');
      return;
    }
    this.voiceService.getVoicePage({ ttsProfileId, page: 1, limit: 200 }).subscribe({
      next: (response: ApiResponse<{ total: number; list: VoiceItem[] }>) => {
        if (response.code !== 0) {
          this.voiceOptions.set([]);
          return;
        }
        const options = (response.data?.list ?? [])
          .map(item => ({ label: this.buildVoiceOptionLabel(item), value: item.id || '' }))
          .filter((item): item is SelectOption => !!item.value);
        this.voiceOptions.set(options);
        const currentVoiceId = this.form.controls.ttsVoiceId.value;
        if (currentVoiceId && options.some(item => item.value === currentVoiceId)) return;
        if (!this.isEdit() && options.length === 1) {
          this.form.controls.ttsVoiceId.setValue(options[0].value);
        } else if (currentVoiceId) {
          this.form.controls.ttsVoiceId.setValue('');
        }
      },
      error: () => {
        this.voiceOptions.set([]);
      }
    });
  }

  private buildVoiceOptionLabel(item: VoiceItem): string {
    const name = item.name || item.ttsVoice || item.id || this.i18n.translate('agentRoles.form.unnamedVoice');
    return item.languages ? `${name}（${item.languages}）` : name;
  }

  private loadKnowledgeBases(): void {
    this.knowledgeBaseService.getPage({ page: 1, page_size: 200 }).subscribe({
      next: (response: ApiResponse<{ total: number; list: KnowledgeBaseItem[] }>) => {
        if (response.code === 0) {
          this.knowledgeBaseOptions.set(response.data?.list ?? []);
          this.knowledgeBindings.set(this.normalizeKnowledgeBindings(this.knowledgeBindings()));
        }
      },
      error: () => {
        this.knowledgeBaseOptions.set([]);
      }
    });
  }

  isKnowledgeBaseSelected(dataset: KnowledgeBaseItem): boolean {
    const datasetId = this.resolveDatasetId(dataset);
    return !!datasetId && this.knowledgeBindings().some(item => item.datasetId === datasetId);
  }

  toggleKnowledgeBase(dataset: KnowledgeBaseItem, event: Event): void {
    const checked = (event.target as HTMLInputElement).checked;
    const datasetId = this.resolveDatasetId(dataset);
    if (!datasetId) return;
    if (!checked) {
      this.removeKnowledgeBinding(datasetId);
      return;
    }
    if (this.knowledgeBindings().some(item => item.datasetId === datasetId)) return;
    this.knowledgeBindings.set(
      this.normalizeKnowledgeBindings([
        ...this.knowledgeBindings(),
        {
          datasetId,
          datasetName: this.resolveDatasetName(dataset),
          sort: this.knowledgeBindings().length,
          enabled: true
        }
      ])
    );
  }

  moveKnowledgeBinding(datasetId: string, offset: -1 | 1): void {
    const bindings = [...this.knowledgeBindings()].sort((a, b) => a.sort - b.sort);
    const index = bindings.findIndex(item => item.datasetId === datasetId);
    const targetIndex = index + offset;
    if (index < 0 || targetIndex < 0 || targetIndex >= bindings.length) return;
    [bindings[index], bindings[targetIndex]] = [bindings[targetIndex], bindings[index]];
    this.knowledgeBindings.set(this.normalizeKnowledgeBindings(bindings));
  }

  removeKnowledgeBinding(datasetId: string): void {
    this.knowledgeBindings.set(
      this.normalizeKnowledgeBindings(this.knowledgeBindings().filter(item => item.datasetId !== datasetId))
    );
  }

  private normalizeKnowledgeBindings(
    bindings?: AgentRoleKnowledgeBindingItem[] | KnowledgeBindingFormItem[] | null
  ): KnowledgeBindingFormItem[] {
    const datasets = this.knowledgeBaseOptions();
    return (bindings ?? [])
      .map((item, index) => {
        const datasetId = item.datasetId || '';
        const dataset = datasets.find(option => this.resolveDatasetId(option) === datasetId);
        return {
          datasetId,
          datasetName: item.datasetName || (dataset ? this.resolveDatasetName(dataset) : datasetId),
          sort: item.sort ?? index,
          enabled: item.enabled ?? true
        };
      })
      .filter(item => !!item.datasetId)
      .sort((a, b) => a.sort - b.sort)
      .map((item, index) => ({ ...item, sort: index }));
  }

  private buildKnowledgeBindings(): AgentRoleKnowledgeBindingItem[] {
    return this.knowledgeBindings()
      .sort((a, b) => a.sort - b.sort)
      .map((item, index) => ({ datasetId: item.datasetId, sort: index, enabled: true }));
  }

  private resolveDatasetId(dataset: KnowledgeBaseItem): string {
    return dataset.datasetId || dataset.id || '';
  }
  private resolveDatasetName(dataset: KnowledgeBaseItem): string {
    return dataset.name || dataset.datasetId || dataset.id || this.i18n.translate('agentRoles.form.unnamedDataset');
  }

  private syncLanguageFields(language: string): void {
    const normalizedLanguage = language || DEFAULT_LANGUAGE_VALUE;
    this.form.patchValue(
      {
        ttsLanguage: normalizedLanguage,
        language: normalizedLanguage,
        langCode: this.resolveLanguageCode(normalizedLanguage)
      },
      { emitEvent: false }
    );
  }

  private resolveLanguageCode(language: string): string {
    if (LANGUAGE_TO_CODE_MAP[language]) return LANGUAGE_TO_CODE_MAP[language];
    const simplifiedMap: Record<string, string> = {
      普通话: 'zh',
      台湾: 'zh-TW',
      粤语: 'zh',
      辽宁: 'zh',
      陕西: 'zh',
      中文: 'zh',
      英语: 'en',
      日语: 'ja',
      韩语: 'ko',
      法语: 'fr',
      德语: 'de'
    };
    return simplifiedMap[language] || 'zh';
  }

  isMcpToolSelected(value: string): boolean {
    return this.form.controls.selectedMcpTools.value.includes(value);
  }

  toggleMcpTool(value: string, event: Event): void {
    const checked = (event.target as HTMLInputElement).checked;
    const current = this.form.controls.selectedMcpTools.value;
    this.form.controls.selectedMcpTools.setValue(
      checked ? Array.from(new Set([...current, value])) : current.filter(item => item !== value)
    );
  }

  private loadMcpToolOptions(): void {
    firstValueFrom(this.mcpToolService.getOptions())
      .then((options: McpToolOption[]) => {
        this.mcpToolOptions.set(options);
      })
      .catch(() => {});
  }

  private resolveSelectedMcpTools(value?: AgentRolePluginMappingItem[] | null): string[] {
    return Array.from(new Set((value ?? []).map(item => item.pluginId || '')));
  }

  private buildPluginMappings(selectedTools: string[]): AgentRolePluginMappingItem[] {
    const options = this.mcpToolOptions();
    return selectedTools
      .filter(pluginId => options.some(tool => tool.code === pluginId))
      .map(pluginId => ({ pluginId, providerCode: 'mcp', paramInfo: '{}' }));
  }

  private normalizeOptional(value: string): string | undefined {
    const normalized = value.trim();
    return normalized ? normalized : undefined;
  }

  private localizeStaticOptions(options: readonly StaticSelectOption[]): StaticSelectOption[] {
    return options.map(option => ({
      ...option,
      label: this.i18n.translateUiText(option.label)
    }));
  }

  private resolveMessage(message: string | undefined, fallbackKey: string): string {
    return message ? this.i18n.translateUiText(message) : this.i18n.translate(fallbackKey);
  }

  private resetMemoryFields(): void {
    this.form.patchValue(
      {
        memoryEntityScope: 'device',
        memoryModelId: '',
        memoryTopK: null,
        memoryMinScore: null,
        memoryIntentRecall: null,
        memoryQueryRewrite: null,
        memoryRerank: null
      },
      { emitEvent: false }
    );
  }
}
