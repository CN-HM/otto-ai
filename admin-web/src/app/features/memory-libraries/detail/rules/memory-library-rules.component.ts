import { CommonModule } from '@angular/common';
import { Component, Input, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../../core/models/api.models';
import { I18nService } from '../../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../../core/i18n/translate.pipe';
import { EmptyStateComponent } from '../../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../../shared/components/feedback-message.component';
import { ConfirmDialogService } from '../../../../shared/services/confirm-dialog.service';
import { MemoryRuleItem, MemoryRulePayload, MemoryRuleType } from '../../shared/memory-library.models';
import { MemoryLibraryService } from '../../shared/memory-library.service';

@Component({
  selector: 'app-memory-library-rules',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    ButtonModule,
    CardModule,
    InputTextModule,
    TableModule,
    TagModule,
    TranslatePipe,
    EmptyStateComponent,
    FeedbackMessageComponent
  ],
  templateUrl: './memory-library-rules.component.html',
  styleUrl: './memory-library-rules.component.css'
})
export class MemoryLibraryRulesComponent implements OnInit {
  @Input({ required: true }) libraryId!: string;

  private readonly formBuilder = inject(FormBuilder);
  private readonly memoryLibraryService = inject(MemoryLibraryService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly rules = signal<MemoryRuleItem[]>([]);
  readonly dialogVisible = signal(false);
  readonly editingRuleId = signal('');
  readonly dialogSubmitting = signal(false);
  readonly ruleTypes: MemoryRuleType[] = ['profile', 'node'];

  readonly form = this.formBuilder.nonNullable.group({
    ruleType: ['profile', [Validators.required]],
    ruleName: ['', [Validators.required, Validators.maxLength(100)]],
    instruction: [''],
    ttlDays: [0],
    isEnabled: [true]
  });

  ngOnInit(): void {
    if (this.libraryId) {
      this.loadRules();
    }
  }

  loadRules(): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.memoryLibraryService
      .getRules(this.libraryId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<MemoryRuleItem[]>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('规则列表获取失败。'));
            return;
          }

          this.rules.set(response.data ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('规则列表请求失败。'));
        }
      });
  }

  openCreateDialog(): void {
    this.editingRuleId.set('');
    this.form.reset({
      ruleType: 'profile',
      ruleName: this.defaultRuleNames().profile ?? '',
      instruction: this.defaultInstruction('profile'),
      ttlDays: 0,
      isEnabled: true
    });
    this.dialogVisible.set(true);
  }

  openEditDialog(rule: MemoryRuleItem): void {
    this.editingRuleId.set(rule.id);
    this.form.patchValue({
      ruleType: this.normalizeUiRuleType(rule.ruleType),
      ruleName: rule.ruleName || '',
      instruction: rule.instruction || '',
      ttlDays: rule.ttlDays ?? 0,
      isEnabled: (rule.isEnabled ?? 1) === 1
    });
    this.dialogVisible.set(true);
  }

  closeDialog(): void {
    this.dialogVisible.set(false);
    this.editingRuleId.set('');
  }

  submitRule(): void {
    if (this.form.invalid || this.dialogSubmitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const raw = this.form.getRawValue();
    const normalizedRuleType = this.normalizeUiRuleType(raw.ruleType);
    const payload: MemoryRulePayload = {
      ruleType: normalizedRuleType,
      ruleName: raw.ruleName,
      instruction: raw.instruction || undefined,
      ttlDays: raw.ttlDays || undefined,
      isEnabled: raw.isEnabled ? 1 : 0
    };

    this.dialogSubmitting.set(true);

    const request$ = this.editingRuleId()
      ? this.memoryLibraryService.updateRule(this.libraryId, this.editingRuleId(), payload)
      : this.memoryLibraryService.createRule(this.libraryId, payload);

    request$.pipe(finalize(() => this.dialogSubmitting.set(false))).subscribe({
      next: (response: ApiResponse<MemoryRuleItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('规则保存失败。'));
          return;
        }

        this.closeDialog();
        this.loadRules();
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('规则保存请求失败。'));
      }
    });
  }

  deleteRule(rule: MemoryRuleItem): void {
    this.confirmDialog.confirmDanger({
      header: this.localize('删除规则'),
      message: this.localize(`确认删除规则“${rule.ruleName}”吗？该操作不可撤销。`),
      accept: () => {
        this.memoryLibraryService.deleteRule(this.libraryId, rule.id).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(response.msg || this.localize('删除规则失败。'));
              return;
            }
            this.loadRules();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(error.error?.msg || error.message || this.localize('删除规则请求失败。'));
          }
        });
      }
    });
  }

  ruleTypeLabel(type?: MemoryRuleType): string {
    return type ? this.localize(MEMORY_RULE_TYPE_LABELS[type] ?? '-') : '-';
  }

  ruleTypeDescription(type?: MemoryRuleType): string {
    return type
      ? this.localize(MEMORY_RULE_TYPE_DESCRIPTIONS[type] ?? MEMORY_RULE_TYPE_DESCRIPTIONS.node ?? '')
      : this.localize(MEMORY_RULE_TYPE_DESCRIPTIONS.node ?? '');
  }

  currentRuleTypeDescription(type?: string): string {
    return this.ruleTypeDescription(this.normalizeUiRuleType(type));
  }

  applyRuleTypeDefaults(type: MemoryRuleType): void {
    const raw = this.form.getRawValue();
    const defaultNames = this.defaultRuleNames();
    const previousDefaultNames = Object.values(defaultNames);
    if (!raw.ruleName || previousDefaultNames.includes(raw.ruleName)) {
      this.form.patchValue({ ruleName: defaultNames[type] });
    }
    if (!raw.instruction || Object.values(this.defaultInstructions()).includes(raw.instruction)) {
      this.form.patchValue({ instruction: this.defaultInstruction(type) });
    }
  }

  ttlLabel(ttlDays?: number): string {
    return ttlDays && ttlDays > 0 ? this.localize(`${ttlDays} 天`) : this.localize('永不过期');
  }

  enabledLabel(enabled?: number): string {
    return enabled === 1 ? this.localize('启用') : this.localize('停用');
  }

  enabledSeverity(enabled?: number) {
    return enabled === 1 ? 'success' : 'danger';
  }

  private normalizeUiRuleType(type?: string): MemoryRuleType {
    return this.ruleTypes.includes(type as MemoryRuleType) ? (type as MemoryRuleType) : 'node';
  }

  private defaultInstruction(type: MemoryRuleType): string {
    return this.defaultInstructions()[type] ?? '';
  }

  private defaultInstructions(): Partial<Record<MemoryRuleType, string>> {
    return {
      profile:
        this.localize('从对话中提取长期稳定的用户信息，例如昵称、偏好、习惯、常用设置。只记录确定的信息，不要记录临时情绪或猜测。'),
      node: this.localize('从对话中提取值得后续检索的事实信息，例如用户明确提到的事项、任务背景、重要结论。')
    };
  }

  private defaultRuleNames(): Partial<Record<MemoryRuleType, string>> {
    return {
      profile: this.localize('用户画像提取'),
      node: this.localize('事实记录')
    };
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}

const MEMORY_RULE_TYPE_LABELS: Partial<Record<MemoryRuleType, string>> = {
  profile: '用户画像',
  node: '事实'
};

const MEMORY_RULE_TYPE_DESCRIPTIONS: Partial<Record<MemoryRuleType, string>> = {
  profile: '适合昵称、偏好、习惯、长期设置等稳定信息。',
  node: '适合关键事实、一次性事件、阶段摘要等可检索内容。'
};
