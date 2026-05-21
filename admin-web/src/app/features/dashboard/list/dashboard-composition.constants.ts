import { DashboardSectionKey } from './dashboard.models';

export type DashboardLayoutKey = 'baseline' | 'companion' | 'persona' | 'expo';
export type DashboardMetricKey = 'users-total' | 'devices-total' | 'ota-total' | 'agent-roles-total' | 'datasets-total';
export type DashboardPanelKey =
  | 'recent-devices'
  | 'recent-users'
  | 'recent-ota'
  | 'recent-agent-roles'
  | 'recent-datasets';

export interface DashboardLayoutOption {
  key: DashboardLayoutKey;
  label: string;
  description: string;
}

export const DASHBOARD_LAYOUT_KEYS: DashboardLayoutKey[] = ['baseline', 'companion', 'persona', 'expo'];

export function normalizeDashboardLayoutKey(value?: string | null): DashboardLayoutKey {
  return DASHBOARD_LAYOUT_KEYS.includes(value as DashboardLayoutKey) ? (value as DashboardLayoutKey) : 'baseline';
}

export const DASHBOARD_LAYOUT_OPTIONS: DashboardLayoutOption[] = [
  {
    key: 'baseline',
    label: '基线布局',
    description: '适合综合运营后台，突出指标、运行态与通用业务摘要。'
  },
  {
    key: 'companion',
    label: '陪伴布局',
    description: '优先展示用户、设备与高频运营动作，适合陪伴型角色。'
  },
  {
    key: 'persona',
    label: '人格布局',
    description: '优先突出智能体、知识库与模型配置等内容资产。'
  },
  {
    key: 'expo',
    label: '展会布局',
    description: '优先呈现运行态势、设备接入和现场快捷操作。'
  }
];

export const DASHBOARD_SECTION_KEYS: DashboardSectionKey[] = [
  'metrics',
  'runtimeOverview',
  'quickActions',
  'runtimeServices',
  'panels'
];

export const DASHBOARD_SECTION_LABELS: Record<DashboardSectionKey, string> = {
  metrics: '指标总览',
  runtimeOverview: '运行时概览',
  quickActions: '快捷入口',
  runtimeServices: '服务状态',
  panels: '摘要面板'
};

export const DASHBOARD_METRIC_KEYS: DashboardMetricKey[] = [
  'users-total',
  'devices-total',
  'ota-total',
  'agent-roles-total',
  'datasets-total'
];

export const DASHBOARD_METRIC_LABELS: Record<DashboardMetricKey, string> = {
  'users-total': '用户总数',
  'devices-total': '设备总数',
  'ota-total': 'OTA 任务数',
  'agent-roles-total': '智能体角色总数',
  'datasets-total': '知识库总数'
};

export const DASHBOARD_PANEL_KEYS: DashboardPanelKey[] = [
  'recent-devices',
  'recent-users',
  'recent-ota',
  'recent-agent-roles',
  'recent-datasets'
];

export const DASHBOARD_PANEL_LABELS: Record<DashboardPanelKey, string> = {
  'recent-devices': '最近设备',
  'recent-users': '最近用户',
  'recent-ota': '最近 OTA',
  'recent-agent-roles': '最近智能体角色',
  'recent-datasets': '最近知识库'
};

export const DASHBOARD_SECTION_LAYOUTS: Record<DashboardLayoutKey, DashboardSectionKey[]> = {
  baseline: ['runtimeOverview', 'metrics', 'quickActions'],
  companion: ['quickActions', 'metrics', 'panels', 'runtimeOverview', 'runtimeServices'],
  persona: ['metrics', 'quickActions', 'panels', 'runtimeOverview', 'runtimeServices'],
  expo: ['runtimeOverview', 'runtimeServices', 'metrics', 'quickActions', 'panels']
};

export const DASHBOARD_METRIC_PRIORITY: Record<DashboardLayoutKey, DashboardMetricKey[]> = {
  baseline: ['devices-total', 'users-total', 'agent-roles-total', 'datasets-total', 'ota-total'],
  companion: ['devices-total', 'users-total', 'agent-roles-total', 'datasets-total', 'ota-total'],
  persona: ['agent-roles-total', 'datasets-total', 'users-total', 'devices-total', 'ota-total'],
  expo: ['devices-total', 'ota-total', 'agent-roles-total', 'users-total', 'datasets-total']
};

export const DASHBOARD_PANEL_PRIORITY: Record<DashboardLayoutKey, DashboardPanelKey[]> = {
  baseline: ['recent-devices', 'recent-users', 'recent-ota', 'recent-agent-roles', 'recent-datasets'],
  companion: ['recent-users', 'recent-devices', 'recent-agent-roles', 'recent-datasets', 'recent-ota'],
  persona: ['recent-agent-roles', 'recent-datasets', 'recent-users', 'recent-devices', 'recent-ota'],
  expo: ['recent-devices', 'recent-ota', 'recent-agent-roles', 'recent-users', 'recent-datasets']
};
