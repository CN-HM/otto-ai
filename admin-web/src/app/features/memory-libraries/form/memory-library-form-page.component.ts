import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { InputSwitchModule } from 'primeng/inputswitch';
import { SelectModule } from 'primeng/select';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { FormDetailLayoutComponent } from '../../../shared/components/form-detail-layout.component';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import {
  MemoryLibraryListItem as MemoryLibraryItem,
  MemoryLibraryPayload,
  MemoryRetrievalConfig,
  MemoryWriteConfig
} from '../shared/memory-library.models';
import { MemoryLibraryService } from '../shared/memory-library.service';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { BindingConfigItem } from '../../binding-configs/shared/binding-config.models';
import { BindingConfigService } from '../../binding-configs/shared/binding-config.service';

@Component({
  selector: 'app-memory-library-form-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    InputTextModule,
    InputSwitchModule,
    SelectModule,
    TranslatePipe,
    FeedbackMessageComponent,
    FormDetailLayoutComponent
  ],
  templateUrl: './memory-library-form-page.component.html',
  styleUrl: './memory-library-form-page.component.css'
})
export class MemoryLibraryFormPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly bindingConfigService = inject(BindingConfigService);
  private readonly i18n = inject(I18nService);

  readonly libraryId = signal('');
  readonly loading = signal(false);
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');
  readonly memoryModelOptions = signal<{ label: string; value: string }[]>([]);

  readonly form = this.formBuilder.nonNullable.group({
    code: ['', [Validators.required, Validators.maxLength(64)]],
    name: ['', [Validators.required, Validators.maxLength(100)]],
    description: [''],
    status: [true],
    isDefault: [false],
    entityScope: ['user'],
    agentId: [''],
    memoryModelId: [''],
    retrievalTopK: [5],
    retrievalMinScore: [0.35],
    retrievalIntentRecall: [true],
    retrievalQueryRewrite: [false],
    retrievalRerank: [false],
    writeAutoWrite: [true],
    writeAutoExtract: [true],
    writeTtlDays: [0],
    writeMinImportance: [1],
    writeImportanceThreshold: [3],
    writeDeduplicate: [true],
    sort: [0]
  });

  ngOnInit(): void {
    this.loadMemoryModelOptions();
    const libraryId = this.route.snapshot.paramMap.get('id') || '';
    if (libraryId) {
      this.libraryId.set(libraryId);
      this.loadDetail(libraryId);
    }
  }

  loadMemoryModelOptions(): void {
    this.bindingConfigService.getPage('llm', { page: 1, limit: 100, status: 'active' }).subscribe({
      next: (response: ApiResponse<{ total: number; list: BindingConfigItem[] }>) => {
        if (response.code !== 0) {
          return;
        }

        const options = (response.data?.list ?? [])
          .filter(item => item.id)
          .map(item => ({
            value: item.id!,
            label: `${item.name || item.code || item.id}${item.primaryModel ? `（${item.primaryModel}）` : ''}`
          }));
        this.memoryModelOptions.set(options);
      }
    });
  }

  loadDetail(libraryId: string): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.memoryLibraryService
      .getDetail(libraryId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<MemoryLibraryItem>) => {
          if (response.code !== 0 || !response.data) {
            this.feedbackMessage.set(response.msg || this.localize('记忆库详情获取失败。'));
            return;
          }

          const item = response.data;
          const retrievalConfig = this.normalizeRetrievalConfig(item.retrievalConfig);
          const writeConfig = this.normalizeWriteConfig(item.writeConfig);
          this.form.patchValue({
            code: item.code || '',
            name: item.name || '',
            description: item.description || '',
            status: (item.status ?? 1) === 1,
            isDefault: (item.isDefault ?? 0) === 1,
            entityScope: item.entityScope || 'user',
            agentId: item.agentId || '',
            memoryModelId: item.memoryModelId || '',
            retrievalTopK: retrievalConfig.topK,
            retrievalMinScore: retrievalConfig.minScore,
            retrievalIntentRecall: retrievalConfig.intentRecall,
            retrievalQueryRewrite: retrievalConfig.queryRewrite,
            retrievalRerank: retrievalConfig.rerank,
            writeAutoWrite: writeConfig.autoWrite,
            writeAutoExtract: writeConfig.autoExtract,
            writeTtlDays: writeConfig.ttlDays,
            writeMinImportance: writeConfig.minImportance,
            writeImportanceThreshold: writeConfig.importanceThreshold,
            writeDeduplicate: writeConfig.deduplicate,
            sort: item.sort ?? 0
          });

          if (this.libraryId()) {
            this.form.controls.code.disable();
          }
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('记忆库详情请求失败。'));
        }
      });
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const retrievalConfig: MemoryRetrievalConfig = {
      topK: raw.retrievalTopK,
      minScore: raw.retrievalMinScore,
      intentRecall: raw.retrievalIntentRecall,
      queryRewrite: raw.retrievalQueryRewrite,
      rerank: raw.retrievalRerank
    };
    const writeConfig: MemoryWriteConfig = {
      autoWrite: raw.writeAutoWrite,
      autoExtract: raw.writeAutoExtract,
      ttlDays: raw.writeTtlDays,
      minImportance: raw.writeMinImportance,
      importanceThreshold: raw.writeImportanceThreshold,
      deduplicate: raw.writeDeduplicate
    };

    const payload: MemoryLibraryPayload = {
      code: raw.code,
      name: raw.name,
      description: raw.description || undefined,
      status: raw.status ? 1 : 0,
      isDefault: raw.isDefault ? 1 : 0,
      entityScope: raw.entityScope || undefined,
      agentId: raw.agentId || undefined,
      memoryModelId: raw.memoryModelId || undefined,
      retrievalConfig,
      writeConfig,
      sort: raw.sort
    };

    this.feedbackMessage.set('');
    this.submitting.set(true);

    const request$ = this.libraryId()
      ? this.memoryLibraryService.update(this.libraryId(), payload)
      : this.memoryLibraryService.create(payload);

    request$.pipe(finalize(() => this.submitting.set(false))).subscribe({
      next: (response: ApiResponse<MemoryLibraryItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('记忆库保存失败。'));
          return;
        }

        void this.router.navigate(['/memory-libraries']);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('记忆库保存请求失败。'));
      }
    });
  }

  backToList(): void {
    void this.router.navigate(['/memory-libraries']);
  }

  applyRetrievalPreset(preset: string): void {
    switch (preset) {
      case 'balanced':
        this.patchRetrievalConfig({ topK: 5, minScore: 0.35, intentRecall: true, queryRewrite: false, rerank: false });
        break;
      case 'strict':
        this.patchRetrievalConfig({ topK: 3, minScore: 0.75, intentRecall: true, queryRewrite: true, rerank: true });
        break;
      case 'loose':
        this.patchRetrievalConfig({ topK: 10, minScore: 0.2, intentRecall: false, queryRewrite: false, rerank: false });
        break;
    }
  }

  applyWritePreset(preset: string): void {
    switch (preset) {
      case 'default':
        this.patchWriteConfig({
          autoWrite: true,
          autoExtract: true,
          ttlDays: 0,
          minImportance: 1,
          importanceThreshold: 3,
          deduplicate: true
        });
        break;
      case 'longterm':
        this.patchWriteConfig({
          autoWrite: true,
          autoExtract: true,
          ttlDays: 365,
          minImportance: 1,
          importanceThreshold: 2,
          deduplicate: true
        });
        break;
      case 'shortterm':
        this.patchWriteConfig({
          autoWrite: true,
          autoExtract: true,
          ttlDays: 7,
          minImportance: 2,
          importanceThreshold: 4,
          deduplicate: true
        });
        break;
    }
  }

  private normalizeRetrievalConfig(config?: Partial<MemoryRetrievalConfig>): MemoryRetrievalConfig {
    return {
      topK: config?.topK ?? 5,
      minScore: config?.minScore ?? 0.35,
      intentRecall: config?.intentRecall ?? true,
      queryRewrite: config?.queryRewrite ?? false,
      rerank: config?.rerank ?? false
    };
  }

  private normalizeWriteConfig(config?: Partial<MemoryWriteConfig>): MemoryWriteConfig {
    return {
      autoWrite: config?.autoWrite ?? true,
      autoExtract: config?.autoExtract ?? true,
      ttlDays: config?.ttlDays ?? 0,
      minImportance: config?.minImportance ?? 1,
      importanceThreshold: config?.importanceThreshold ?? 3,
      deduplicate: config?.deduplicate ?? true
    };
  }

  private patchRetrievalConfig(config: MemoryRetrievalConfig): void {
    this.form.patchValue({
      retrievalTopK: config.topK,
      retrievalMinScore: config.minScore,
      retrievalIntentRecall: config.intentRecall,
      retrievalQueryRewrite: config.queryRewrite,
      retrievalRerank: config.rerank
    });
  }

  private patchWriteConfig(config: MemoryWriteConfig): void {
    this.form.patchValue({
      writeAutoWrite: config.autoWrite,
      writeAutoExtract: config.autoExtract,
      writeTtlDays: config.ttlDays,
      writeMinImportance: config.minImportance,
      writeImportanceThreshold: config.importanceThreshold,
      writeDeduplicate: config.deduplicate
    });
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
