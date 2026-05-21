/**
 * MCP 工具模型定义
 */

export interface McpToolItem {
  id: string;
  code: string;
  name: string;
  description?: string;
  category?: string;
  isSystem: boolean;
  paramSchema?: string;
  status: 'active' | 'inactive';
  sort: number;
  createdAt: string;
  updatedAt?: string;
}

export interface McpToolOption {
  id: string;
  code: string;
  name: string;
  description?: string;
  category?: string;
  isSystem: boolean;
}

export interface McpToolPayload {
  code: string;
  name: string;
  description?: string;
  category?: string;
  paramSchema?: string;
  status: 'active' | 'inactive';
  sort: number;
}

export interface McpToolListQuery {
  page?: number;
  limit?: number;
  keyword?: string;
  status?: string;
  category?: string;
}

export interface McpToolListResponse {
  total: number;
  list: McpToolItem[];
}
