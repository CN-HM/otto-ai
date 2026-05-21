import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { firstValueFrom } from 'rxjs';
import { RouterLink, ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule, FormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { InputTextarea } from 'primeng/inputtextarea';
import { InputNumberModule } from 'primeng/inputnumber';
import { CardModule } from 'primeng/card';
import { ToggleSwitchModule } from 'primeng/toggleswitch';
import { McpToolService } from '../shared/mcp-tool.service';
import { McpToolItem, McpToolPayload } from '../shared/mcp-tool.models';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { JsonEditorComponent } from '../../../shared/components/json-editor.component';

@Component({
  selector: 'app-mcp-tool-form-page',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,
    FormsModule,
    ReactiveFormsModule,
    ButtonModule,
    InputTextModule,
    InputTextarea,
    InputNumberModule,
    CardModule,
    ToggleSwitchModule,
    FeedbackMessageComponent,
    JsonEditorComponent
  ],
  templateUrl: './mcp-tool-form-page.component.html',
  styleUrls: ['./mcp-tool-form-page.component.css']
})
export class McpToolFormPageComponent implements OnInit {
  readonly isEdit = signal(false);
  readonly loading = signal(false);
  readonly saving = signal(false);
  readonly feedbackMessage = signal<string>('');
  readonly categories = signal<string[]>([]);
  readonly toolId = signal<string>('');
  readonly currentTool = signal<McpToolItem | null>(null);

  form: FormGroup;

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private mcpToolService: McpToolService
  ) {
    this.form = this.fb.group({
      code: ['', [Validators.required, Validators.maxLength(50)]],
      name: ['', [Validators.required, Validators.maxLength(100)]],
      description: ['', Validators.maxLength(500)],
      category: ['', Validators.maxLength(50)],
      paramSchema: [''],
      status: ['active', Validators.required],
      sort: [0]
    });
  }

  ngOnInit(): void {
    this.loadCategories();

    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEdit.set(true);
      this.toolId.set(id);
      this.loadTool(id);
    }
  }

  private async loadCategories(): Promise<void> {
    try {
      const categories = await firstValueFrom(this.mcpToolService.getCategories());
      this.categories.set(categories);
    } catch {
      // 静默处理
    }
  }

  private async loadTool(id: string): Promise<void> {
    this.loading.set(true);
    try {
      const tool = await firstValueFrom(this.mcpToolService.getById(id));
      this.currentTool.set(tool);
      this.form.patchValue({
        code: tool.code,
        name: tool.name,
        description: tool.description || '',
        category: tool.category || '',
        paramSchema: tool.paramSchema || '',
        status: tool.status,
        sort: tool.sort
      });
      this.updateSystemFieldState(tool.isSystem);
    } catch (err: any) {
      this.feedbackMessage.set(err?.message || '加载工具详情失败');
    } finally {
      this.loading.set(false);
    }
  }

  async onSubmit(): Promise<void> {
    if (this.form.invalid) {
      this.feedbackMessage.set('请检查表单填写是否正确');
      return;
    }

    this.saving.set(true);
    this.feedbackMessage.set('');

    try {
      const raw = this.form.getRawValue();
      const paramSchema = raw.paramSchema?.trim();
      if (paramSchema) {
        try {
          JSON.parse(paramSchema);
        } catch {
          this.feedbackMessage.set('参数模板必须是合法 JSON');
          return;
        }
      }

      const payload: McpToolPayload = {
        code: raw.code?.trim(),
        name: raw.name?.trim(),
        description: raw.description?.trim() || undefined,
        category: raw.category?.trim() || undefined,
        paramSchema: paramSchema || undefined,
        status: raw.status,
        sort: raw.sort ?? 0
      };

      if (this.isEdit()) {
        await firstValueFrom(this.mcpToolService.update(this.toolId(), payload));
      } else {
        await firstValueFrom(this.mcpToolService.create(payload));
      }

      this.router.navigate(['/mcp-tools']);
    } catch (err: any) {
      this.feedbackMessage.set(err?.message || '保存失败');
    } finally {
      this.saving.set(false);
    }
  }

  isStatusActive(): boolean {
    return this.form.get('status')?.value !== 'inactive';
  }

  setStatusByToggle(active: boolean): void {
    this.form.get('status')?.setValue(active ? 'active' : 'inactive');
  }

  get pageTitle(): string {
    return this.isEdit() ? '编辑 MCP 工具' : '新增 MCP 工具';
  }

  isSystemTool(): boolean {
    return this.currentTool()?.isSystem ?? false;
  }

  private updateSystemFieldState(isSystem: boolean): void {
    const codeControl = this.form.get('code');
    const categoryControl = this.form.get('category');
    if (isSystem) {
      codeControl?.disable({ emitEvent: false });
      categoryControl?.disable({ emitEvent: false });
      return;
    }

    codeControl?.enable({ emitEvent: false });
    categoryControl?.enable({ emitEvent: false });
  }
}
