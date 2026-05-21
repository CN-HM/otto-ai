export interface KnowledgeBaseItem {
  id?: string;
  datasetId?: string;
  name?: string;
  description?: string;
  avatar?: string;
  permission?: string;
  chunkMethod?: string;
  parserConfig?: Record<string, unknown>;
  chunkCount?: number;
  tokenNum?: number;
  status?: number;
  creator?: number;
  createdAt?: string;
  updater?: number;
  updatedAt?: string;
  documentCount?: number;
}

export interface KnowledgeBasePageData {
  total: number;
  list: KnowledgeBaseItem[];
}

export interface KnowledgeBasePageQuery {
  name?: string;
  page?: number;
  page_size?: number;
}

export interface KnowledgeBasePayload {
  id?: string;
  datasetId?: string;
  name: string;
  description?: string;
  permission?: string;
  chunkMethod?: string;
  parserConfig?: Record<string, unknown>;
  status?: number;
}

export interface KnowledgeTextImportPayload {
  title?: string;
  content: string;
  source?: string;
  metadata?: Record<string, unknown>;
}

export interface KnowledgeFileItem {
  id?: string;
  documentId?: string;
  datasetId?: string;
  name?: string;
  fileType?: string;
  fileSize?: number;
  filePath?: string;
  progress?: number;
  metaFields?: Record<string, unknown>;
  chunkMethod?: string;
  parserConfig?: Record<string, unknown>;
  status?: number | string;
  run?: string;
  chunkCount?: number;
  tokenCount?: number;
  error?: string;
  creator?: number;
  createdAt?: string;
  updater?: number;
  updatedAt?: string;
  parseStatusCode?: number;
}

export interface KnowledgeFilePageData {
  total: number;
  list: KnowledgeFileItem[];
}

export interface KnowledgeFilePageQuery {
  name?: string;
  status?: number | string;
  page?: number;
  page_size?: number;
}

export interface KnowledgeChunkItem {
  id?: string;
  documentId?: string;
  content?: string;
  text?: string;
  chunkText?: string;
  metadata?: Record<string, unknown>;
  [key: string]: unknown;
}

export interface KnowledgeChunkQuery {
  keywords?: string;
  id?: string;
  page?: number;
  page_size?: number;
}
