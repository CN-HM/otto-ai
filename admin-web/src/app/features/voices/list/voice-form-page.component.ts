import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import {
  StaticSelectOption,
  VOICE_LANGUAGE_OPTIONS,
  mergeSelectOptions
} from '../../../shared/constants/form-options.constants';
import { TtsProfileOption, VoicePayload } from './voice.models';
import { VoiceService } from './voice.service';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { I18nService } from '../../../core/i18n/i18n.service';

@Component({
  selector: 'app-voice-form-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    CardModule,
    InputTextModule,
    FeedbackMessageComponent,
    TranslatePipe
  ],
  templateUrl: './voice-form-page.component.html',
  styleUrl: './voice-form-page.component.css'
})
export class VoiceFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly voiceService = inject(VoiceService);
  private readonly i18n = inject(I18nService);

  readonly voiceId = signal('');
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');
  readonly selectedLanguage = signal('');
  readonly languageOptions = computed<StaticSelectOption[]>(() => {
    this.i18n.localeVersion();
    return this.localizeStaticOptions(mergeSelectOptions(VOICE_LANGUAGE_OPTIONS, this.selectedLanguage()));
  });
  readonly ttsProfileOptions = signal<TtsProfileOption[]>([]);
  readonly hasLanguageOptions = computed(() => this.languageOptions().length > 0);

  readonly form = this.formBuilder.nonNullable.group({
    ttsProfileId: ['', [Validators.required]],
    name: ['', [Validators.required]],
    ttsVoice: ['', [Validators.required]],
    languages: ['', [Validators.required]],
    sort: [0],
    voiceDemo: [''],
    remark: ['']
  });

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id') || '';
    this.voiceId.set(id);
    this.loadTtsProfileOptions();

    const queryParams = this.route.snapshot.queryParamMap;
    this.form.patchValue({
      ttsProfileId: queryParams.get('ttsProfileId') || '',
      name: queryParams.get('name') || '',
      ttsVoice: queryParams.get('ttsVoice') || '',
      languages: queryParams.get('languages') || '',
      sort: Number(queryParams.get('sort') || 0),
      voiceDemo: queryParams.get('voiceDemo') || '',
      remark: queryParams.get('remark') || ''
    });
    this.refreshLanguageOptions(this.form.controls.languages.value);
    this.form.controls.languages.valueChanges.subscribe(language => {
      this.refreshLanguageOptions(language || '');
    });

    if (id) {
      this.loadDetail(id);
    }
  }

  private refreshLanguageOptions(language = this.form.controls.languages.value): void {
    this.selectedLanguage.set(language || '');
  }

  private loadTtsProfileOptions(): void {
    this.voiceService.getTtsProfileOptions().subscribe({
      next: (response: ApiResponse<TtsProfileOption[]>) => {
        if (response.code !== 0) {
          this.ttsProfileOptions.set([]);
          return;
        }

        const options = (response.data ?? [])
          .map(item => ({
            ...item,
            label: item.label || item.profileName || item.value
          }))
          .filter(item => !!item.value);
        this.ttsProfileOptions.set(options);

        const currentProfileId = this.form.controls.ttsProfileId.value;
        if (currentProfileId && options.some(item => item.value === currentProfileId)) {
          return;
        }

        const fallbackProfileId = options.length > 0 ? options[0].value : '';

        if (fallbackProfileId) {
          this.form.controls.ttsProfileId.setValue(fallbackProfileId, { emitEvent: false });
        } else if (currentProfileId) {
          this.form.controls.ttsProfileId.setValue('', { emitEvent: false });
        }
      },
      error: () => {
        this.ttsProfileOptions.set([]);
      }
    });
  }

  selectedCloudPlatformLabel(): string {
    const option = this.findSelectedProfileOption();
    if (!option) {
      return this.form.controls.ttsProfileId.value
        ? this.i18n.translate('voices.unmatchedProvider')
        : this.i18n.translate('voices.selectTtsProfile');
    }

    const providerName = (option.providerName || '').trim() || this.resolveProviderNameFromLabel(option.label || '');
    const providerCode = (option.providerCode || '').trim();
    if (!providerName) {
      return this.i18n.translate('voices.unmatchedProvider');
    }

    return providerCode ? `${providerName} (${providerCode})` : providerName;
  }

  selectedIntegrationId(): string {
    return this.findSelectedProfileOption()?.integrationId || '-';
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const payload: VoicePayload = {
      ttsProfileId: raw.ttsProfileId,
      name: raw.name,
      ttsVoice: raw.ttsVoice,
      languages: raw.languages,
      sort: Number(raw.sort || 0),
      voiceDemo: raw.voiceDemo || undefined,
      remark: raw.remark || undefined
    };

    this.feedbackMessage.set('');
    this.submitting.set(true);

    const request$ = this.voiceId()
      ? this.voiceService.updateVoice(this.voiceId(), payload)
      : this.voiceService.createVoice(payload);

    request$.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (response: ApiResponse<unknown>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.i18n.translate('voices.saveFailed'));
          return;
        }

        void this.router.navigate(['/voices'], {
          queryParams: {
            ttsProfileId: raw.ttsProfileId || undefined
          }
        });
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.i18n.translate('voices.saveRequestFailed'));
      }
    });
  }

  private loadDetail(id: string): void {
    this.voiceService.getVoiceDetail(id).subscribe({
      next: (response: ApiResponse<VoicePayload>) => {
        if (response.code !== 0 || !response.data) {
          this.feedbackMessage.set(response.msg || this.i18n.translate('voices.detailLoadFailed'));
          return;
        }

        const item = response.data;
        this.form.patchValue({
          ttsProfileId: item.ttsProfileId || '',
          name: item.name || '',
          ttsVoice: item.ttsVoice || '',
          languages: item.languages || '',
          sort: Number(item.sort ?? 0),
          voiceDemo: item.voiceDemo || '',
          remark: item.remark || ''
        });
        this.refreshLanguageOptions(item.languages);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.i18n.translate('voices.detailRequestFailed'));
      }
    });
  }

  backToList(): void {
    void this.router.navigate(['/voices'], {
      queryParams: {
        ttsProfileId: this.form.getRawValue().ttsProfileId || undefined
      }
    });
  }

  private findSelectedProfileOption(): TtsProfileOption | null {
    const profileId = this.form.controls.ttsProfileId.value;
    if (!profileId) {
      return null;
    }

    return this.ttsProfileOptions().find(item => item.value === profileId) || null;
  }

  private resolveProviderNameFromLabel(label: string): string {
    const parts = label
      .split('/')
      .map(item => item.trim())
      .filter(item => !!item);
    return parts.length > 0 ? parts[parts.length - 1] : '';
  }

  private localizeStaticOptions(options: readonly StaticSelectOption[]): StaticSelectOption[] {
    return options.map(option => ({
      ...option,
      label: this.i18n.translateUiText(option.label)
    }));
  }
}
