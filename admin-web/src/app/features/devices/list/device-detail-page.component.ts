import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { DeviceDetailSnapshot, DeviceUpdatePayload } from './device.models';
import { DeviceService } from './device.service';
import { AgentRoleItem, AgentRoleReleaseItem } from '../../agent-roles/shared/agent-role.models';
import { AgentRoleService } from '../../agent-roles/shared/agent-role.service';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';

interface SelectOption {
  value: string;
  label: string;
}

@Component({
  selector: 'app-device-detail-page',
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
    TableModule,
    TagModule,
    TranslatePipe
  ],
  templateUrl: './device-detail-page.component.html',
  styleUrl: './device-detail-page.component.css'
})
export class DeviceDetailPageComponent implements OnInit {
  private readonly route = inject(ActivatedRoute);
  private readonly formBuilder = inject(FormBuilder);
  private readonly deviceService = inject(DeviceService);
  private readonly agentRoleService = inject(AgentRoleService);
  private readonly i18n = inject(I18nService);

  readonly deviceId = signal('');
  readonly submitting = signal(false);
  readonly feedbackMessage = signal('');
  readonly snapshot = signal<DeviceDetailSnapshot | null>(null);
  readonly agentRoleOptions = signal<SelectOption[]>([]);
  readonly agentRoleReleaseOptions = signal<SelectOption[]>([]);
  readonly activeTab = signal<'basic' | 'update' | 'tools'>('basic');
  readonly tools = signal<Record<string, unknown>[]>([]);
  readonly toolsLoading = signal(false);
  readonly toolCalling = signal(false);
  readonly toolCallResult = signal('');

  readonly form = this.formBuilder.nonNullable.group({
    alias: ['', [Validators.maxLength(64)]],
    autoUpdate: [0, [Validators.required]],
    agentRoleId: [''],
    agentRoleReleaseId: ['']
  });

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id') || '';
    const queryMap = this.route.snapshot.queryParamMap;

    this.deviceId.set(id);
    this.snapshot.set({
      id,
      macAddress: queryMap.get('macAddress') || '',
      bindUserName: queryMap.get('bindUserName') || '',
      deviceType: queryMap.get('deviceType') || '',
      appVersion: queryMap.get('appVersion') || '',
      recentChatTime: queryMap.get('recentChatTime') || '',
      otaUpgrade: Number(queryMap.get('otaUpgrade') || 0)
    });

    this.form.patchValue({
      alias: queryMap.get('alias') || '',
      autoUpdate: Number(queryMap.get('otaUpgrade') || 0) === 1 ? 1 : 0
    });

    this.loadAgentRoles();
    this.loadDeviceDetail();
  }

  loadDeviceDetail(): void {
    if (!this.deviceId()) {
      return;
    }

    this.deviceService.getDevice(this.deviceId()).subscribe({
      next: (response: ApiResponse<DeviceDetailSnapshot>) => {
        if (response.code !== 0 || !response.data) {
          this.feedbackMessage.set(response.msg || this.localize('获取设备详情失败。'));
          return;
        }

        const data = response.data;
        this.snapshot.update(current => ({
          id: current?.id || this.deviceId(),
          macAddress: data.macAddress || current?.macAddress || '',
          bindUserName: current?.bindUserName || '',
          deviceType: data.deviceType || data.board || current?.deviceType || '',
          appVersion: data.appVersion || current?.appVersion || '',
          recentChatTime: data.recentChatTime || data.lastConnectedAt || current?.recentChatTime || '',
          otaUpgrade: data.otaUpgrade ?? data.autoUpdate ?? current?.otaUpgrade ?? 0,
          alias: data.alias || '',
          autoUpdate: data.autoUpdate ?? 0,
          agentRoleId: data.agentRoleId || '',
          agentRoleName: data.agentRoleName || '',
          agentRoleReleaseId: data.agentRoleReleaseId || '',
          agentRoleVersion: data.agentRoleVersion || '',
          isOnline: data.isOnline ?? false
        }));

        this.form.patchValue(
          {
            alias: data.alias || '',
            autoUpdate: Number(data.autoUpdate ?? 0),
            agentRoleId: data.agentRoleId || '',
            agentRoleReleaseId: data.agentRoleReleaseId || ''
          },
          { emitEvent: false }
        );

        this.loadAgentRoleReleases(data.agentRoleId || '', data.agentRoleReleaseId || '');
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('获取设备详情请求失败。'));
      }
    });
  }

  loadAgentRoles(): void {
    this.agentRoleService.getAllActive().subscribe({
      next: (response: ApiResponse<AgentRoleItem[]>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('获取智能体角色列表失败。'));
          return;
        }

        const options = (response.data ?? [])
          .filter(item => !!item.id)
          .map(item => ({
            value: item.id || '',
            label: item.displayName || item.name || item.code || item.id || ''
          }));
        this.agentRoleOptions.set(options);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('获取智能体角色列表请求失败。'));
      }
    });
  }

  loadAgentRoleReleases(agentRoleId: string, selectedReleaseId = ''): void {
    const roleId = agentRoleId.trim();
    if (!roleId) {
      this.agentRoleReleaseOptions.set([]);
      this.form.patchValue({ agentRoleReleaseId: '' }, { emitEvent: false });
      return;
    }

    this.agentRoleService.getReleases(roleId).subscribe({
      next: (response: ApiResponse<AgentRoleReleaseItem[]>) => {
        if (response.code !== 0) {
          this.feedbackMessage.set(response.msg || this.localize('获取智能体角色发布版本失败。'));
          return;
        }

        const options = (response.data ?? [])
          .filter(item => !!item.id)
          .map(item => ({
            value: item.id || '',
            label: item.version || item.id || ''
          }));
        this.agentRoleReleaseOptions.set(options);
        const matched = selectedReleaseId && options.some(item => item.value === selectedReleaseId);
        this.form.patchValue({ agentRoleReleaseId: matched ? selectedReleaseId : '' }, { emitEvent: false });
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.feedbackMessage.set(error.error?.msg || error.message || this.localize('获取智能体角色发布版本请求失败。'));
      }
    });
  }

  onAgentRoleChange(): void {
    const agentRoleId = this.form.getRawValue().agentRoleId;
    this.form.patchValue({ agentRoleReleaseId: '' }, { emitEvent: false });
    this.loadAgentRoleReleases(agentRoleId);
  }

  loadTools(): void {
    if (!this.deviceId()) return;
    this.toolsLoading.set(true);
    this.toolCallResult.set('');
    this.deviceService
      .getDeviceTools(this.deviceId())
      .pipe(finalize(() => this.toolsLoading.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(response.msg || this.localize('获取设备工具列表失败。'));
            return;
          }
          const data = response.data;
          if (Array.isArray(data)) {
            this.tools.set(data as Record<string, unknown>[]);
          } else {
            this.tools.set([]);
          }
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('获取设备工具列表请求失败。'));
        }
      });
  }

  callTool(tool: Record<string, unknown>): void {
    if (!this.deviceId()) return;
    this.toolCalling.set(true);
    this.toolCallResult.set('');
    this.deviceService
      .callDeviceTool(this.deviceId(), tool)
      .pipe(finalize(() => this.toolCalling.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.toolCallResult.set(response.msg || this.localize('工具调用失败。'));
            return;
          }
          this.toolCallResult.set(JSON.stringify(response.data, null, 2) || this.localize('调用成功（无返回数据）'));
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.toolCallResult.set(error.error?.msg || error.message || this.localize('工具调用请求失败。'));
        }
      });
  }

  submit(): void {
    if (this.form.invalid || this.submitting() || !this.deviceId()) {
      this.form.markAllAsTouched();
      return;
    }

    const payload: DeviceUpdatePayload = {
      alias: this.form.getRawValue().alias,
      autoUpdate: Number(this.form.getRawValue().autoUpdate),
      agentRoleId: this.form.getRawValue().agentRoleId.trim(),
      agentRoleReleaseId: this.form.getRawValue().agentRoleReleaseId.trim()
    };

    this.feedbackMessage.set('');
    this.submitting.set(true);

    this.deviceService
      .updateDevice(this.deviceId(), payload)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          this.feedbackMessage.set(response.code === 0 ? this.localize('设备信息更新成功。') : response.msg || this.localize('设备信息更新失败。'));
          if (response.code === 0) {
            this.loadDeviceDetail();
          }
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.feedbackMessage.set(error.error?.msg || error.message || this.localize('设备更新请求失败。'));
        }
      });
  }

  private localize(text: string): string {
    return this.i18n.translateUiText(text);
  }
}
