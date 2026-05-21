export type DashboardSeverity = 'success' | 'info' | 'warn' | 'danger' | 'secondary' | 'contrast';

export type DashboardSectionKey = 'metrics' | 'runtimeOverview' | 'quickActions' | 'runtimeServices' | 'panels';

export interface DashboardRoleGate {
  roleTabKey?: string;
  roleCapabilityKey?: string;
}

export interface DashboardMetric {
  key: string;
  title: string;
  value: string;
  description: string;
  severity: DashboardSeverity;
  roleTabKey?: string;
  roleCapabilityKey?: string;
}

export interface QuickAction {
  label: string;
  description: string;
  route: string;
  icon: string;
}

export interface DashboardPanel {
  key: string;
  title: string;
  description: string;
  roleTabKey?: string;
  roleCapabilityKey?: string;
}

export interface DashboardRuntimeService {
  key: string;
  name: string;
  protocol: string;
  statusText: string;
  severity: DashboardSeverity;
  endpoint: string;
  description: string;
}

export interface DashboardRuntimeStageAggregate {
  stage: string;
  totalCount: number;
  successfulCount: number;
  failedCount: number;
  fallbackCount: number;
  lastSeenAtUtc?: string | null;
}

export interface DashboardRuntimeRecentTurn {
  recordedAtUtc: string;
  sessionId?: string | null;
  deviceId?: string | null;
  succeeded: boolean;
  stageCount: number;
  failedStageCount: number;
  fallbackStageCount: number;
  outcome?: string | null;
  failureReason?: string | null;
  errorCode?: string | null;
}

export interface DashboardRuntimeConversationTrace {
  totalStageCount: number;
  successfulStageCount: number;
  failedStageCount: number;
  fallbackStageCount: number;
  stageAggregates: DashboardRuntimeStageAggregate[];
  recentTurns: DashboardRuntimeRecentTurn[];
}

export interface DashboardRuntimeReadinessCheck {
  key: string;
  title: string;
  ready: boolean;
  blocking: boolean;
  severity: DashboardSeverity;
  summary: string;
  details: string[];
}

export interface DashboardRuntimeReadiness {
  ready: boolean;
  severity: DashboardSeverity;
  passedCheckCount: number;
  warningCheckCount: number;
  failedCheckCount: number;
  checks: DashboardRuntimeReadinessCheck[];
}

export interface DashboardRuntimeOverview {
  nodeId: string;
  runtimeEnabled: boolean;
  nodeStartedAtUtc: string;
  onlineDeviceCount: number;
  activeConversationCount: number;
  aliveConversationCount: number;
  udpSessionCount: number;
  localSpeechIdleTimeoutMs: number;
  services: DashboardRuntimeService[];
  conversationTrace: DashboardRuntimeConversationTrace;
  readiness: DashboardRuntimeReadiness;
}

export interface DashboardSnapshot {
  metrics: DashboardMetric[];
  panels: DashboardPanel[];
  runtime: DashboardRuntimeOverview;
}
