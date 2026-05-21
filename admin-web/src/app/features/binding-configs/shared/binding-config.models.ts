export type BindingConfigKind = 'integration' | 'pipeline' | 'asr' | 'vad' | 'llm' | 'tts' | 'embedding';
export type ProviderScope = 'asr' | 'tts' | 'llm' | 'mem';
export type PipelineStageKind = 'vad' | 'asr' | 'llm' | 'tts';

export const PROVIDER_SCOPE = {
  asr: 'asr',
  tts: 'tts',
  llm: 'llm',
  mem: 'mem'
} as const satisfies Record<string, ProviderScope>;

export const PIPELINE_STAGE = {
  vad: 'vad',
  asr: 'asr',
  llm: 'llm',
  tts: 'tts'
} as const satisfies Record<string, PipelineStageKind>;

export function resolveProviderScope(kind: BindingConfigKind): ProviderScope | null {
  switch (kind) {
    case 'asr':
      return PROVIDER_SCOPE.asr;
    case 'tts':
      return PROVIDER_SCOPE.tts;
    case 'llm':
      return PROVIDER_SCOPE.llm;
    case 'embedding':
      return PROVIDER_SCOPE.mem;
    default:
      return null;
  }
}

export function parsePipelineStage(value: unknown): PipelineStageKind | null {
  if (typeof value !== 'string') {
    return null;
  }

  switch (value.trim().toLowerCase()) {
    case 'vad':
    case 'cloud_vad':
      return PIPELINE_STAGE.vad;
    case 'asr':
    case 'cloud_asr':
      return PIPELINE_STAGE.asr;
    case 'llm':
    case 'cloud_llm':
      return PIPELINE_STAGE.llm;
    case 'tts':
    case 'cloud_tts':
      return PIPELINE_STAGE.tts;
    default:
      return null;
  }
}

export interface BindingConfigKindMeta {
  kind: BindingConfigKind;
  label: string;
  description: string;
  supportsCode: boolean;
  supportsIntegrationId: boolean;
  supportsProviderCode: boolean;
  supportsProviderType: boolean;
  supportsProviderScopes: boolean;
  supportsIsEnabled: boolean;
  supportsIsSystem: boolean;
  supportsInvocationMode: boolean;
  supportsPrimaryEndpoint: boolean;
  supportsPrimaryModel: boolean;
  supportsDimension: boolean;
  supportsApiKey: boolean;
  supportsSecretKey: boolean;
  supportsAppId: boolean;
  supportsAccessToken: boolean;
  supportsOrganization: boolean;
  supportsCatalogAccessKey: boolean;
  supportsCatalogSecretKey: boolean;
  supportsCatalogAppId: boolean;
  supportsGraphJson: boolean;
  supportsConfigJson: boolean;
  supportsTemperature: boolean;
  supportsMaxTokens: boolean;
  supportsTopP: boolean;
  supportsEncoding: boolean;
  supportsSampleRate: boolean;
  supportsSpeechRate: boolean;
  supportsLoudnessRate: boolean;
  supportsResourceId: boolean;
  supportsAudioFormat: boolean;
  supportsCodec: boolean;
  supportsBits: boolean;
  supportsChannels: boolean;
  supportsChunkDurationMs: boolean;
  supportsChunkSizeBytes: boolean;
  supportsLanguage: boolean;
  supportsContext: boolean;
  supportsEnableNonstream: boolean;
}

export interface BindingConfigOption {
  label: string;
  value: string;
  description?: string | null;
}

export interface BindingConfigItem {
  id?: string;
  code?: string | null;
  name?: string;
  description?: string | null;
  status?: string | null;
  providerCode?: string | null;
  providerType?: string | null;
  integrationId?: string | null;
  isEnabled?: boolean | null;
  isDefault?: boolean;
  supportsAsr?: boolean;
  supportsTts?: boolean;
  supportsLlm?: boolean;
  supportsMem?: boolean;
  isSystem?: boolean | null;
  invocationMode?: string | null;
  sort?: number;
  primaryEndpoint?: string | null;
  primaryModel?: string | null;
  dimension?: number | null;
  apiKey?: string | null;
  secretKey?: string | null;
  appId?: string | null;
  accessToken?: string | null;
  organization?: string | null;
  catalogAccessKey?: string | null;
  catalogSecretKey?: string | null;
  catalogAppId?: string | null;
  graphJson?: string | null;
  configJson?: string | null;
  temperature?: number | null;
  maxTokens?: number | null;
  topP?: number | null;
  encoding?: string | null;
  sampleRate?: number | null;
  speechRate?: number | null;
  loudnessRate?: number | null;
  resourceId?: string | null;
  audioFormat?: string | null;
  codec?: string | null;
  bits?: number | null;
  channels?: number | null;
  chunkDurationMs?: number | null;
  chunkSizeBytes?: number | null;
  language?: string | null;
  context?: string | null;
  enableNonstream?: boolean | null;
  createdAt?: string | null;
  updatedAt?: string | null;
}

export interface BindingConfigPageData {
  total: number;
  list: BindingConfigItem[];
}

export interface BindingConfigPageQuery {
  keyword?: string;
  status?: string;
  page: number;
  limit: number;
}

export interface BindingConfigPayload {
  code?: string | null;
  name?: string | null;
  description?: string | null;
  status?: string | null;
  providerCode?: string | null;
  providerType?: string | null;
  integrationId?: string | null;
  isEnabled?: boolean | null;
  isDefault?: boolean;
  supportsAsr?: boolean;
  supportsTts?: boolean;
  supportsLlm?: boolean;
  supportsMem?: boolean;
  isSystem?: boolean | null;
  invocationMode?: string | null;
  sort?: number | null;
  primaryEndpoint?: string | null;
  primaryModel?: string | null;
  dimension?: number | null;
  apiKey?: string | null;
  secretKey?: string | null;
  appId?: string | null;
  accessToken?: string | null;
  organization?: string | null;
  catalogAccessKey?: string | null;
  catalogSecretKey?: string | null;
  catalogAppId?: string | null;
  graphJson?: string | null;
  configJson?: string | null;
  temperature?: number | null;
  maxTokens?: number | null;
  topP?: number | null;
  encoding?: string | null;
  sampleRate?: number | null;
  speechRate?: number | null;
  loudnessRate?: number | null;
  resourceId?: string | null;
  audioFormat?: string | null;
  codec?: string | null;
  bits?: number | null;
  channels?: number | null;
  chunkDurationMs?: number | null;
  chunkSizeBytes?: number | null;
  language?: string | null;
  context?: string | null;
  enableNonstream?: boolean | null;
}
