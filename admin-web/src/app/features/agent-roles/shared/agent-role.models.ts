export interface AgentRolePluginMappingItem {
  pluginId?: string | null;
  paramInfo?: string | null;
  providerCode?: string | null;
}

export interface AgentRoleContextProviderItem {
  id?: string | null;
  url?: string | null;
  headers?: string | null;
}

export interface AgentRoleKnowledgeBindingItem {
  id?: number | null;
  datasetId?: string | null;
  datasetName?: string | null;
  sort?: number | null;
  enabled?: boolean | null;
  topK?: number | null;
  minScore?: number | null;
  rerankEnabled?: boolean | null;
  maxChunks?: number | null;
}

export interface AgentRoleItem {
  id?: string | null;
  code?: string | null;
  name?: string | null;
  displayName?: string | null;
  description?: string | null;
  status?: string | null;
  isSystem?: boolean;
  icon?: string | null;
  coverImage?: string | null;
  themeToken?: string | null;
  asrProfileId?: string | null;
  vadProfileId?: string | null;
  llmProfileId?: string | null;
  ttsProfileId?: string | null;
  ttsVoiceId?: string | null;
  ttsLanguage?: string | null;
  ttsVolume?: number | null;
  ttsRate?: number | null;
  ttsPitch?: number | null;
  chatHistoryConf?: number | null;
  systemPrompt?: string | null;
  knowledgeNoHitFallbackText?: string | null;
  memoryEnabled?: boolean;
  memoryModelId?: string | null;
  memoryEntityScope?: string | null;
  memoryTopK?: number | null;
  memoryMinScore?: number | null;
  memoryIntentRecall?: boolean | null;
  memoryQueryRewrite?: boolean | null;
  memoryRerank?: boolean | null;
  langCode?: string | null;
  language?: string | null;
  currentReleaseId?: string | null;
  currentVersion?: string | null;
  publishedAt?: string | null;
  sort?: number;
  creator?: number | null;
  createdAt?: string | null;
  updater?: number | null;
  updatedAt?: string | null;
  pluginMappings?: AgentRolePluginMappingItem[];
  contextProviders?: AgentRoleContextProviderItem[];
  knowledgeBindings?: AgentRoleKnowledgeBindingItem[];
}

export interface AgentRoleBindingOptions {
  asrProfiles: { label: string; value: string; description?: string | null }[];
  vadProfiles: { label: string; value: string; description?: string | null }[];
  llmProfiles: { label: string; value: string; description?: string | null }[];
  ttsProfiles: { label: string; value: string; description?: string | null }[];
}

export interface AgentRoleReleaseItem {
  id?: string | null;
  roleId?: string | null;
  version?: string | null;
  status?: string | null;
  snapshotJson?: string | null;
  remark?: string | null;
  publishedAt?: string | null;
  creator?: number | null;
  createdAt?: string | null;
  updater?: number | null;
  updatedAt?: string | null;
}

export interface AgentRolePageData {
  total: number;
  list: AgentRoleItem[];
}

export interface AgentRolePayload {
  code: string;
  name: string;
  displayName?: string;
  description?: string;
  status?: string;
  icon?: string;
  coverImage?: string;
  themeToken?: string;
  asrProfileId?: string;
  vadProfileId?: string;
  llmProfileId?: string;
  ttsProfileId?: string;
  ttsVoiceId?: string;
  ttsLanguage?: string;
  ttsVolume?: number;
  ttsRate?: number;
  ttsPitch?: number;
  chatHistoryConf?: number;
  systemPrompt?: string;
  knowledgeNoHitFallbackText?: string;
  memoryEnabled?: boolean;
  memoryModelId?: string;
  memoryEntityScope?: string;
  memoryTopK?: number;
  memoryMinScore?: number;
  memoryIntentRecall?: boolean;
  memoryQueryRewrite?: boolean;
  memoryRerank?: boolean;
  langCode?: string;
  language?: string;
  sort?: number;
  pluginMappings?: AgentRolePluginMappingItem[];
  contextProviders?: AgentRoleContextProviderItem[];
  knowledgeBindings?: AgentRoleKnowledgeBindingItem[];
}
