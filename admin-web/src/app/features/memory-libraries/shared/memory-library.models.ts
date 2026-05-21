export interface MemoryRetrievalConfig {
  topK: number;
  minScore: number;
  intentRecall: boolean;
  queryRewrite: boolean;
  rerank: boolean;
}

export interface MemoryWriteConfig {
  autoWrite: boolean;
  autoExtract: boolean;
  ttlDays: number;
  minImportance: number;
  importanceThreshold: number;
  deduplicate: boolean;
}

export interface MemoryLibraryListItem {
  id: string;
  code?: string;
  name: string;
  description?: string;
  agentId?: string;
  agentName?: string;
  status: number;
  isDefault: number;
  entityScope: string;
  memoryModelId?: string;
  retrievalConfig?: MemoryRetrievalConfig;
  writeConfig?: MemoryWriteConfig;
  recordCount?: number;
  ruleCount?: number;
  sort: number;
  createdAt?: string;
  updatedAt?: string;
}

export interface MemoryLibraryPageData {
  total: number;
  list: MemoryLibraryListItem[];
}

export interface MemoryLibraryPageQuery {
  page: number;
  limit: number;
  keyword?: string;
  agentId?: string;
  status?: number;
}

export interface MemoryLibraryPayload {
  id?: string;
  agentId?: string;
  code?: string;
  name: string;
  description?: string;
  status?: number;
  isDefault?: number;
  entityScope?: string;
  memoryModelId?: string;
  retrievalConfig?: MemoryRetrievalConfig;
  writeConfig?: MemoryWriteConfig;
  sort?: number;
}

export type MemoryRuleType = 'profile' | 'node' | 'risk' | 'health_followup' | 'todo' | 'reminder';

export interface MemoryRuleItem {
  id: string;
  libraryId: string;
  ruleType: MemoryRuleType;
  ruleName: string;
  instruction?: string;
  ttlDays?: number;
  isEnabled: number;
  createdAt?: string;
  updatedAt?: string;
}

export interface MemoryRulePayload {
  ruleType: MemoryRuleType;
  ruleName: string;
  instruction?: string;
  ttlDays?: number;
  isEnabled?: number;
}

export interface MemoryRecordItem {
  id: string;
  libraryId?: string;
  agentId?: string;
  deviceId?: string;
  userId?: number;
  entityId: string;
  sessionId?: string;
  ruleId?: string;
  recordType: string;
  title?: string;
  content: string;
  summary?: string;
  keywords?: Record<string, unknown>;
  payloadJson?: Record<string, unknown>;
  embeddingModelId?: string;
  embeddingDimension?: number;
  hasEmbedding?: boolean;
  embeddingPreview?: number[];
  importance?: number;
  isPinned?: number;
  status?: string;
  source?: string;
  sourceChatHistoryId?: string;
  expiresAt?: string;
  lastAccessedAt?: string;
  createdAt?: string;
  updatedAt?: string;
}

export interface MemoryRecordPageData {
  total: number;
  list: MemoryRecordItem[];
}

export interface MemoryRecordPageQuery {
  page: number;
  limit: number;
  keyword?: string;
  recordType?: MemoryRecordType;
  includeExpired?: number;
}

export type MemoryRecordType =
  | 'node'
  | 'profile'
  | 'preference'
  | 'fact'
  | 'event'
  | 'episodic'
  | 'goal'
  | 'relationship'
  | 'summary'
  | 'instruction'
  | 'setting';

export const MEMORY_RECORD_TYPE = {
  node: 'node',
  profile: 'profile',
  preference: 'preference',
  fact: 'fact',
  event: 'event',
  episodic: 'episodic',
  goal: 'goal',
  relationship: 'relationship',
  summary: 'summary',
  instruction: 'instruction',
  setting: 'setting'
} as const satisfies Record<string, MemoryRecordType>;

export const MEMORY_RECORD_TYPE_LABELS: Record<MemoryRecordType, string> = {
  node: '普通记忆',
  profile: '用户画像',
  preference: '偏好',
  fact: '事实',
  event: '事件',
  episodic: '经历',
  goal: '目标',
  relationship: '关系',
  summary: '摘要',
  instruction: '指令',
  setting: '设置'
};

export const MEMORY_RECORD_TYPE_OPTIONS = Object.values(MEMORY_RECORD_TYPE).map(value => ({
  label: MEMORY_RECORD_TYPE_LABELS[value],
  value
}));

export interface MemoryRecordPayload {
  agentId?: string;
  deviceId?: string;
  userId?: number;
  entityId: string;
  sessionId?: string;
  ruleId?: string;
  recordType: string;
  title?: string;
  content: string;
  summary?: string;
  keywords?: Record<string, unknown>;
  payloadJson?: Record<string, unknown>;
  importance?: number;
  isPinned?: number;
  source?: string;
  sourceChatHistoryId?: string;
  expiresAt?: string;
}

export interface MemorySearchPayload {
  query: string;
  entityId?: string;
  sessionId?: string;
  recordType?: MemoryRecordType;
  maxResults?: number;
  minScore?: number;
  minImportance?: number;
  includeExpired?: number;
}

export interface MemorySearchHit {
  id: string;
  entityId?: string;
  sessionId?: string;
  ruleId?: string;
  recordType?: string;
  title?: string;
  content?: string;
  summary?: string;
  embeddingModelId?: string;
  embeddingDimension?: number;
  hasEmbedding?: boolean;
  score: number;
  importance?: number;
  isPinned?: number;
}

export interface MemorySearchResult {
  libraryId?: string;
  entityId?: string;
  query?: string;
  minScore?: number;
  total: number;
  hits: MemorySearchHit[];
}

export interface RuntimeSignalItem {
  id: string;
  signalType: RuntimeSignalType;
  signalCode?: string;
  severity: RuntimeSignalSeverity;
  status: RuntimeSignalStatus;
  userId?: number;
  deviceId?: string;
  agentRoleId?: string;
  sessionId?: string;
  sourceRunId?: string;
  sourceText?: string;
  payloadJson?: string;
  scheduledAt?: string;
  processedAt?: string;
  dedupeKey?: string;
  retryCount: number;
  errorMessage?: string;
  createdAt: string;
  updatedAt?: string;
}

export interface RuntimeSignalPageData {
  total: number;
  list: RuntimeSignalItem[];
}

export interface RuntimeSignalPageQuery {
  page: number;
  limit: number;
  signalType?: RuntimeSignalType;
  status?: RuntimeSignalStatus;
  severity?: RuntimeSignalSeverity;
  keyword?: string;
}

export type RuntimeSignalType = 'risk' | 'health_followup' | 'todo' | 'reminder';

export type RuntimeSignalStatus = 'pending' | 'scheduled' | 'processing' | 'completed' | 'ignored' | 'failed';

export type RuntimeSignalSeverity = 'low' | 'medium' | 'high' | 'critical';

export const RUNTIME_SIGNAL_TYPE = {
  risk: 'risk',
  healthFollowup: 'health_followup',
  todo: 'todo',
  reminder: 'reminder'
} as const satisfies Record<string, RuntimeSignalType>;

export const RUNTIME_SIGNAL_STATUS = {
  pending: 'pending',
  scheduled: 'scheduled',
  processing: 'processing',
  completed: 'completed',
  ignored: 'ignored',
  failed: 'failed'
} as const satisfies Record<string, RuntimeSignalStatus>;

export const RUNTIME_SIGNAL_SEVERITY = {
  low: 'low',
  medium: 'medium',
  high: 'high',
  critical: 'critical'
} as const satisfies Record<string, RuntimeSignalSeverity>;
