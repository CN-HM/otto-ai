import { CommonModule } from '@angular/common';
import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../core/models/api.models';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { TtsProfileOption, VoiceItem } from './voice.models';
import { VoiceService } from './voice.service';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PaginationBarComponent } from '../../../shared/components/pagination-bar.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { I18nService } from '../../../core/i18n/i18n.service';

@Component({
  selector: 'app-voices-page',
  standalone: true,
  imports: [
    PageToolbarComponent,
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    CardModule,
    InputTextModule,
    TableModule,
    TagModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PaginationBarComponent,
    SearchFilterCardComponent,
    TranslatePipe
  ],
  templateUrl: './voices-page.component.html',
  styleUrl: './voices-page.component.css'
})
export class VoicesPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly voiceService = inject(VoiceService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);
  private readonly nameMap = signal(new Map<string, string>());
  private readonly store = new PageableListStore<VoiceItem>(async (page, limit) => {
    const { ttsProfileId, name } = this.queryForm.getRawValue();
    if (!ttsProfileId) {
      return { total: 0, list: [] };
    }
    const response = await firstValueFrom(
      this.voiceService.getVoicePage({
        ttsProfileId,
        name: name || undefined,
        page,
        limit
      })
    );
    if (response.code !== 0) throw new Error(response.msg || this.i18n.translate('voices.loadFailed'));
    return response.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly feedbackMessage = this.store.errorMessage;
  readonly voices = this.store.items;
  readonly total = this.store.total;
  readonly ttsProfileOptions = signal<{ label: string; value: string }[]>([]);
  expandedRows: Record<string, boolean> = {};

  readonly queryForm = this.formBuilder.nonNullable.group({
    ttsProfileId: [''],
    name: [''],
    page: [1],
    limit: [10]
  });

  readonly languageCount = computed(
    () =>
      new Set(
        this.voices()
          .map((item: VoiceItem) => item.languages || '')
          .filter(Boolean)
      ).size
  );
  readonly selectedProfileLabel = computed(() => this.resolveModelName(this.queryForm.controls.ttsProfileId.value));

  resolveModelName(id?: string): string {
    if (!id) return '-';
    return this.nameMap().get(id) || id;
  }

  newVoice(): void {
    const ttsProfileId = this.queryForm.controls.ttsProfileId.value;
    void this.router.navigate(['/voices/new'], {
      queryParams: {
        ttsProfileId: ttsProfileId || undefined
      }
    });
  }

  isPreviewUrl(value?: string): boolean {
    return !!value && /^https?:\/\//i.test(value);
  }

  resolveProviderLabel(item: VoiceItem): string {
    const providerCode = (item.providerCode || '').trim().toLowerCase();
    if (providerCode === 'doubao') {
      return this.i18n.translate('voices.providerDoubao');
    }
    if (providerCode === 'aliyun') {
      return this.i18n.translate('voices.providerAliyun');
    }

    return item.providerName || item.providerCode || this.i18n.translate('voices.providerUnknown');
  }

  ngOnInit(): void {
    const ttsProfileId = this.route.snapshot.queryParamMap.get('ttsProfileId') || '';
    if (ttsProfileId) {
      this.queryForm.patchValue({ ttsProfileId });
    }

    this.loadTtsProfileOptions();
  }

  private loadTtsProfileOptions(): void {
    this.voiceService.getTtsProfileOptions().subscribe({
      next: (res: ApiResponse<TtsProfileOption[]>) => {
        if (res.code !== 0) {
          this.ttsProfileOptions.set([]);
          this.nameMap.set(new Map());
          this.feedbackMessage.set(res.msg || this.i18n.translate('voices.ttsProfileLoadFailed'));
          return;
        }

        const modelMap = new Map<string, string>();
        const options = (res.data ?? [])
          .map(item => {
            if (item.value) {
              modelMap.set(item.value, item.label || item.value);
            }

            return { label: item.label || item.value, value: item.value };
          })
          .filter(item => !!item.value);

        this.nameMap.set(modelMap);
        this.ttsProfileOptions.set(options);

        const currentProfileId = this.queryForm.controls.ttsProfileId.value;
        const hasCurrentProfile = currentProfileId && options.some(item => item.value === currentProfileId);
        const fallbackProfileId = hasCurrentProfile ? currentProfileId : options.length > 0 ? options[0].value : '';

        if (fallbackProfileId && fallbackProfileId !== currentProfileId) {
          this.queryForm.patchValue({ ttsProfileId: fallbackProfileId });
        } else if (!hasCurrentProfile && currentProfileId) {
          this.queryForm.patchValue({ ttsProfileId: '' });
        }

        if (this.queryForm.controls.ttsProfileId.value) {
          this.loadVoices();
          return;
        }

        if (options.length === 0) {
          this.feedbackMessage.set(this.i18n.translate('voices.noTtsProfileAvailable'));
          return;
        }

        this.feedbackMessage.set(this.i18n.translate('voices.selectTtsProfileFirst'));
      },
      error: () => {
        this.ttsProfileOptions.set([]);
        this.nameMap.set(new Map());
        this.feedbackMessage.set(this.i18n.translate('voices.ttsProfileRequestFailed'));
      }
    });
  }

  loadVoices(): void {
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
    const currentProfileId = this.queryForm.getRawValue().ttsProfileId;
    this.queryForm.reset({ ttsProfileId: currentProfileId, name: '', page: 1, limit: 10 });
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

  editVoice(item: VoiceItem): void {
    if (!item.id) {
      this.feedbackMessage.set(this.i18n.translate('voices.missingIdEdit'));
      return;
    }

    void this.router.navigate(['/voices', item.id, 'edit'], {
      queryParams: {
        ttsProfileId: item.ttsProfileId || this.queryForm.getRawValue().ttsProfileId || undefined,
        name: item.name || undefined,
        ttsVoice: item.ttsVoice || undefined,
        languages: item.languages || undefined,
        sort: item.sort ?? undefined,
        voiceDemo: item.voiceDemo || undefined,
        remark: item.remark || undefined
      }
    });
  }

  deleteVoice(item: VoiceItem): void {
    if (!item.id) {
      this.feedbackMessage.set(this.i18n.translate('voices.missingIdDelete'));
      return;
    }

    const voiceLabel = item.name || item.ttsVoice || item.id;

    this.confirmDialog.confirmDanger({
      header: this.i18n.translate('voices.deleteHeader'),
      message: this.i18n.translate('voices.deleteConfirm', { name: voiceLabel }),
      accept: () => {
        this.feedbackMessage.set('');
        this.voiceService.deleteVoices([item.id!]).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || this.i18n.translate('voices.deleteFailed'));
              return;
            }

            this.feedbackMessage.set(this.i18n.translate('voices.deleteSuccess'));
            void this.store.load();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || this.i18n.translate('voices.deleteFailed'));
          }
        });
      }
    });
  }
}
