import { Injectable, inject } from '@angular/core';
import { Observable, map } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { McpToolItem, McpToolPayload, McpToolListQuery, McpToolListResponse, McpToolOption } from './mcp-tool.models';

@Injectable({
  providedIn: 'root'
})
export class McpToolService {
  private readonly api = inject(ApiClientService);
  private readonly basePath = '/admin/mcp-tools';

  /**
   * 分页查询 MCP 工具列表
   */
  getList(query: McpToolListQuery = {}): Observable<McpToolListResponse> {
    const queryParams: Record<string, string> = {};
    if (query.page) queryParams['page'] = String(query.page);
    if (query.limit) queryParams['limit'] = String(query.limit);
    if (query.keyword) queryParams['keyword'] = query.keyword;
    if (query.status) queryParams['status'] = query.status;
    if (query.category) queryParams['category'] = query.category;

    return this.api.get<McpToolListResponse>(this.basePath, queryParams).pipe(map(res => res.data));
  }

  /**
   * 获取 MCP 工具详情
   */
  getById(id: string): Observable<McpToolItem> {
    return this.api.get<McpToolItem>(`${this.basePath}/${id}`).pipe(map(res => res.data));
  }

  /**
   * 创建 MCP 工具
   */
  create(payload: McpToolPayload): Observable<McpToolItem> {
    return this.api.post<McpToolItem>(this.basePath, payload).pipe(map(res => res.data));
  }

  /**
   * 更新 MCP 工具
   */
  update(id: string, payload: McpToolPayload): Observable<McpToolItem> {
    return this.api.put<McpToolItem>(`${this.basePath}/${id}`, payload).pipe(map(res => res.data));
  }

  /**
   * 删除 MCP 工具
   */
  delete(id: string): Observable<boolean> {
    return this.api.delete<boolean>(`${this.basePath}/${id}`).pipe(map(res => res.data));
  }

  /**
   * 获取所有启用的 MCP 工具选项（用于下拉选择）
   */
  getOptions(): Observable<McpToolOption[]> {
    return this.api.get<McpToolOption[]>(`${this.basePath}/options`).pipe(map(res => res.data));
  }

  /**
   * 获取所有 MCP 工具类别
   */
  getCategories(): Observable<string[]> {
    return this.api.get<string[]>(`${this.basePath}/categories`).pipe(map(res => res.data));
  }
}
