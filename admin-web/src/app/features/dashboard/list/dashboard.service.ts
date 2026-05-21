import { Injectable, inject } from '@angular/core';
import { Observable, forkJoin, map } from 'rxjs';
import { AdminUserService } from '../../system/users/list/admin-user.service';
import { DeviceService } from '../../devices/list/device.service';
import {
  DashboardRuntimeConversationTrace,
  DashboardRuntimeOverview,
  DashboardRuntimeReadiness,
  DashboardSnapshot
} from './dashboard.models';
import { AdminUserItem } from '../../system/users/list/admin-user.models';
import { DeviceListItem, OtaItem } from '../../devices/list/device.models';
import { ApiResponse } from '../../../core/models/api.models';
import { AgentRoleItem } from '../../agent-roles/shared/agent-role.models';
import { AgentRoleService } from '../../agent-roles/shared/agent-role.service';
import { KnowledgeBaseService } from '../../datasets/list/shared/knowledge-base.service';
import { KnowledgeBaseItem } from '../../datasets/list/shared/knowledge-base.models';
import { ApiClientService } from '../../../core/http/api-client.service';
import { I18nService } from '../../../core/i18n/i18n.service';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  private readonly apiClient = inject(ApiClientService);
  private readonly adminUserService = inject(AdminUserService);
  private readonly deviceService = inject(DeviceService);
  private readonly agentRoleService = inject(AgentRoleService);
  private readonly knowledgeBaseService = inject(KnowledgeBaseService);
  private readonly i18n = inject(I18nService);

  private readonly emptyConversationTrace: DashboardRuntimeConversationTrace = {
    totalStageCount: 0,
    successfulStageCount: 0,
    failedStageCount: 0,
    fallbackStageCount: 0,
    stageAggregates: [],
    recentTurns: []
  };

  private readonly emptyReadiness: DashboardRuntimeReadiness = {
    ready: false,
    severity: 'secondary',
    passedCheckCount: 0,
    warningCheckCount: 0,
    failedCheckCount: 0,
    checks: []
  };

  getRuntimeStatus(): Observable<DashboardRuntimeOverview> {
    return this.apiClient
      .get<DashboardRuntimeOverview>('/admin/server/runtime-status')
      .pipe(map((response: ApiResponse<DashboardRuntimeOverview>) => this.normalizeRuntime(response.data)));
  }

  getSnapshot(): Observable<DashboardSnapshot> {
    return forkJoin({
      users: this.adminUserService.getUserPage({ page: 1, limit: 5 }),
      devices: this.deviceService.getDevicePage({ page: 1, limit: 5 }),
      ota: this.deviceService.getOtaPage({ page: 1, limit: 5 }),
      agentRoles: this.agentRoleService.getPage({ page: 1, limit: 5 }),
      datasets: this.knowledgeBaseService.getPage({ page: 1, page_size: 5 }),
      runtime: this.getRuntimeStatus()
    }).pipe(
      map(
        (result: {
          users: ApiResponse<{ total: number; list: AdminUserItem[] }>;
          devices: ApiResponse<{ total: number; list: DeviceListItem[] }>;
          ota: ApiResponse<{ total: number; list: OtaItem[] }>;
          agentRoles: ApiResponse<{ total: number; list: AgentRoleItem[] }>;
          datasets: ApiResponse<{ total: number; list: KnowledgeBaseItem[] }>;
          runtime: DashboardRuntimeOverview;
        }) =>
          this.toSnapshot(result.users, result.devices, result.ota, result.agentRoles, result.datasets, result.runtime)
      )
    );
  }

  private toSnapshot(
    usersResponse: ApiResponse<{ total: number; list: AdminUserItem[] }>,
    devicesResponse: ApiResponse<{ total: number; list: DeviceListItem[] }>,
    otaResponse: ApiResponse<{ total: number; list: OtaItem[] }>,
    agentRolesResponse: ApiResponse<{ total: number; list: AgentRoleItem[] }>,
    datasetsResponse: ApiResponse<{ total: number; list: KnowledgeBaseItem[] }>,
    runtime: DashboardRuntimeOverview
  ): DashboardSnapshot {
    const users = usersResponse.data?.list ?? [];
    const devices = devicesResponse.data?.list ?? [];
    const otaList = otaResponse.data?.list ?? [];
    const agentRoles = agentRolesResponse.data?.list ?? [];
    const datasets = datasetsResponse.data?.list ?? [];

    const userTotal = usersResponse.data?.total ?? 0;
    const deviceTotal = devicesResponse.data?.total ?? 0;
    const otaTotal = otaResponse.data?.total ?? 0;
    const agentRoleTotal = agentRolesResponse.data?.total ?? 0;
    const datasetTotal = datasetsResponse.data?.total ?? 0;
    const boundDevices = devices.filter((item: DeviceListItem) => !!item.bindUserName).length;
    const activeUsers = users.filter((item: AdminUserItem) => item.status === 1).length;
    const enabledDatasets = datasets.filter((item: KnowledgeBaseItem) => item.status === 1).length;

    return {
      metrics: [
        {
          key: 'users-total',
          title: this.t('dashboard.snapshot.metrics.usersTotal.title'),
          value: String(userTotal),
          description: this.t('dashboard.snapshot.metrics.usersTotal.description', { count: String(activeUsers) }),
          severity: 'info'
        },
        {
          key: 'devices-total',
          title: this.t('dashboard.snapshot.metrics.devicesTotal.title'),
          value: String(deviceTotal),
          description: this.t('dashboard.snapshot.metrics.devicesTotal.description', { count: String(boundDevices) }),
          severity: 'success',
          roleTabKey: 'devices'
        },
        {
          key: 'ota-total',
          title: this.t('dashboard.snapshot.metrics.otaTotal.title'),
          value: String(otaTotal),
          description: this.t('dashboard.snapshot.metrics.otaTotal.description'),
          severity: 'contrast',
          roleTabKey: 'devices'
        },
        {
          key: 'agent-roles-total',
          title: this.t('dashboard.snapshot.metrics.agentRolesTotal.title'),
          value: String(agentRoleTotal),
          description: this.t('dashboard.snapshot.metrics.agentRolesTotal.description', {
            count: String(agentRoles.length)
          }),
          severity: 'warn'
        },
        {
          key: 'datasets-total',
          title: this.t('dashboard.snapshot.metrics.datasetsTotal.title'),
          value: String(datasetTotal),
          description: this.t('dashboard.snapshot.metrics.datasetsTotal.description', {
            count: String(enabledDatasets)
          }),
          severity: 'info'
        }
      ],
      panels: [
        {
          key: 'recent-devices',
          title: this.t('dashboard.snapshot.panels.recentDevices.title'),
          description: devices.length
            ? devices
                .map((item: DeviceListItem) => `${item.macAddress || item.id} / ${item.appVersion || '-'}`)
                .join('；')
            : this.t('dashboard.snapshot.panels.recentDevices.empty'),
          roleTabKey: 'devices'
        },
        {
          key: 'recent-users',
          title: this.t('dashboard.snapshot.panels.recentUsers.title'),
          description: users.length
            ? users
                .map((item: AdminUserItem) =>
                  this.t('dashboard.snapshot.panels.recentUsers.item', {
                    user: item.mobile || item.userid || '-',
                    deviceCount: String(item.deviceCount || 0)
                  })
                )
                .join('；')
            : this.t('dashboard.snapshot.panels.recentUsers.empty')
        },
        {
          key: 'recent-ota',
          title: this.t('dashboard.snapshot.panels.recentOta.title'),
          description: otaList.length
            ? otaList.map((item: OtaItem) => `${item.firmwareName || item.id} / ${item.version || '-'}`).join('；')
            : this.t('dashboard.snapshot.panels.recentOta.empty'),
          roleTabKey: 'devices'
        },
        {
          key: 'recent-agent-roles',
          title: this.t('dashboard.snapshot.panels.recentAgentRoles.title'),
          description: agentRoles.length
            ? agentRoles
                .map(
                  (item: AgentRoleItem) =>
                    `${item.displayName || item.name || item.code || item.id} / ${item.language || item.langCode || '-'}`
                )
                .join('；')
            : this.t('dashboard.snapshot.panels.recentAgentRoles.empty')
        },
        {
          key: 'recent-datasets',
          title: this.t('dashboard.snapshot.panels.recentDatasets.title'),
          description: datasets.length
            ? datasets
                .map((item: KnowledgeBaseItem) =>
                  this.t('dashboard.snapshot.panels.recentDatasets.item', {
                    name: item.name || item.datasetId || item.id || '-',
                    documentCount: String(item.documentCount || 0)
                  })
                )
                .join('；')
            : this.t('dashboard.snapshot.panels.recentDatasets.empty')
        }
      ],
      runtime
    };
  }

  private t(key: string, params?: Record<string, string>): string {
    return this.i18n.translate(key, params);
  }

  private normalizeRuntime(runtimeData?: DashboardRuntimeOverview | null): DashboardRuntimeOverview {
    return runtimeData
      ? {
          ...this.createEmptyRuntimeOverview(),
          ...runtimeData,
          services: runtimeData.services ?? [],
          conversationTrace: {
            ...this.emptyConversationTrace,
            ...runtimeData.conversationTrace,
            stageAggregates: runtimeData.conversationTrace?.stageAggregates ?? [],
            recentTurns: runtimeData.conversationTrace?.recentTurns ?? []
          },
          readiness: {
            ...this.emptyReadiness,
            ...runtimeData.readiness,
            checks: runtimeData.readiness?.checks ?? []
          }
        }
      : this.createEmptyRuntimeOverview();
  }

  private createEmptyRuntimeOverview(): DashboardRuntimeOverview {
    return {
      nodeId: '-',
      runtimeEnabled: false,
      nodeStartedAtUtc: '',
      onlineDeviceCount: 0,
      activeConversationCount: 0,
      aliveConversationCount: 0,
      udpSessionCount: 0,
      localSpeechIdleTimeoutMs: 0,
      services: [],
      conversationTrace: this.emptyConversationTrace,
      readiness: this.emptyReadiness
    };
  }
}
