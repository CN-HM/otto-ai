import { CommonModule } from '@angular/common';
import { Component, Input, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { ApiResponse } from '../../../core/models/api.models';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ConfirmDialogService } from '../../../shared/services/confirm-dialog.service';
import { ActionRuleItem, ActionRulePayload, ActionRuleType } from '../shared/action-rule.models';
import { ActionRuleService } from '../shared/action-rule.service';

@Component({
  selector: 'app-action-rules',
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
  templateUrl: './action-rules.component.html',
  styleUrl: './action-rules.component.css'
})
export class ActionRulesComponent implements OnInit {
  @Input({ required: true }) agentRoleId!: string;

  private readonly formBuilder = inject(FormBuilder);
  private readonly actionRuleService = inject(ActionRuleService);
  private readonly confirmDialog = inject(ConfirmDialogService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly feedbackMessage = signal('');
  readonly rules = signal<ActionRuleItem[]>([]);
  readonly dialogVisible = signal(false);
  readonly editingRuleId = signal('');
  readonly dialogSubmitting = signal(false);
  readonly actionTypes: ActionRuleType[] = ['todo', 'reminder', 'risk', 'health_followup'];

  readonly form = this.formBuilder.nonNullable.group({
    actionType: ['todo' as ActionRuleType, [Validators.required]],
    name: ['', [Validators.required, Validators.maxLength(100)]],
    instruction: [''],
    isEnabled: [true]
  });

  ngOnInit(): void {
    if (this.agentRoleId) {
      this.loadRules();
    }
  }

  loadRules(): void {
    this.feedbackMessage.set('');
    this.loading.set(true);

    this.actionRuleService
      .getRules(this.agentRoleId)
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (response: ApiResponse<ActionRuleItem[]>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.actionRules.listLoadFailed'));
            return;
          }
          this.rules.set(response.data ?? []);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(this.resolveMessage(error.error?.msg || error.message, 'agentRoles.actionRules.listRequestFailed'));
        }
      });
  }

  openCreateDialog(): void {
    this.editingRuleId.set('');
    this.form.reset({
      actionType: 'todo',
      name: this.defaultRuleName('todo'),
      instruction: this.defaultInstruction('todo'),
      isEnabled: true
    });
    this.dialogVisible.set(true);
  }

  openEditDialog(rule: ActionRuleItem): void {
    this.editingRuleId.set(rule.id);
    this.form.patchValue({
      actionType: rule.actionType,
      name: rule.name || '',
      instruction: rule.instruction || '',
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
    const payload: ActionRulePayload = {
      actionType: raw.actionType,
      name: raw.name,
      instruction: raw.instruction || undefined,
      isEnabled: raw.isEnabled ? 1 : 0
    };

    this.dialogSubmitting.set(true);

    const request$ = this.editingRuleId()
      ? this.actionRuleService.updateRule(this.agentRoleId, this.editingRuleId(), payload)
      : this.actionRuleService.createRule(this.agentRoleId, payload);

    request$.pipe(finalize(() => this.dialogSubmitting.set(false))).subscribe({
      next: (response: ApiResponse<ActionRuleItem>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.actionRules.saveFailed'));
          return;
        }
        this.closeDialog();
        this.loadRules();
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(this.resolveMessage(error.error?.msg || error.message, 'agentRoles.actionRules.saveRequestFailed'));
      }
    });
  }

  deleteRule(rule: ActionRuleItem): void {
    this.confirmDialog.confirmDanger({
      header: this.i18n.translate('agentRoles.actionRules.deleteTitle'),
      message: this.i18n.translate('agentRoles.actionRules.deleteConfirm', { name: rule.name }),
      accept: () => {
        this.actionRuleService.deleteRule(this.agentRoleId, rule.id).subscribe({
          next: (response: ApiResponse<unknown>) => {
            if (response.code !== 0) {
              this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.actionRules.deleteFailed'));
              return;
            }
            this.loadRules();
          },
          error: (error: { error?: { msg?: string }; message?: string }) => {
            this.feedbackMessage.set(this.resolveMessage(error.error?.msg || error.message, 'agentRoles.actionRules.deleteRequestFailed'));
          }
        });
      }
    });
  }

  actionTypeLabel(type?: ActionRuleType): string {
    return type ? this.i18n.translate(`agentRoles.actionRules.typeLabels.${type}`) : '-';
  }

  actionTypeDescription(type?: ActionRuleType): string {
    return type ? this.i18n.translate(`agentRoles.actionRules.typeDescriptions.${type}`) : '';
  }

  applyActionTypeDefaults(type: ActionRuleType): void {
    const raw = this.form.getRawValue();
    const defaultNames = this.defaultRuleNames();
    const previousDefaultNames = Object.values(defaultNames);
    if (!raw.name || previousDefaultNames.includes(raw.name)) {
      this.form.patchValue({ name: defaultNames[type] });
    }
    if (!raw.instruction || Object.values(this.defaultInstructions()).includes(raw.instruction)) {
      this.form.patchValue({ instruction: this.defaultInstruction(type) });
    }
  }

  enabledLabel(enabled?: number): string {
    return enabled === 1
      ? this.i18n.translate('agentRoles.actionRules.enabled')
      : this.i18n.translate('agentRoles.actionRules.disabled');
  }

  enabledSeverity(enabled?: number) {
    return enabled === 1 ? 'success' : 'danger';
  }

  private defaultInstruction(type: ActionRuleType): string {
    return this.defaultInstructions()[type];
  }

  private defaultInstructions(): Record<ActionRuleType, string> {
    return {
      todo: this.i18n.translate('agentRoles.actionRules.defaultInstructions.todo'),
      reminder: this.i18n.translate('agentRoles.actionRules.defaultInstructions.reminder'),
      risk: this.i18n.translate('agentRoles.actionRules.defaultInstructions.risk'),
      health_followup: this.i18n.translate('agentRoles.actionRules.defaultInstructions.health_followup')
    };
  }

  private defaultRuleNames(): Record<ActionRuleType, string> {
    return {
      todo: this.i18n.translate('agentRoles.actionRules.defaultNames.todo'),
      reminder: this.i18n.translate('agentRoles.actionRules.defaultNames.reminder'),
      risk: this.i18n.translate('agentRoles.actionRules.defaultNames.risk'),
      health_followup: this.i18n.translate('agentRoles.actionRules.defaultNames.health_followup')
    };
  }

  private defaultRuleName(type: ActionRuleType): string {
    return this.defaultRuleNames()[type];
  }

  private resolveMessage(message: string | undefined, fallbackKey: string): string {
    return message ? this.i18n.translateUiText(message) : this.i18n.translate(fallbackKey);
  }
}
