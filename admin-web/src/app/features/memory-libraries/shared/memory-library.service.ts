import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import {
  MemoryLibraryListItem as MemoryLibraryItem,
  MemoryLibraryPageData,
  MemoryLibraryPageQuery,
  MemoryLibraryPayload,
  MemoryRuleItem,
  MemoryRulePayload,
  MemoryRecordItem,
  MemoryRecordPageData,
  MemoryRecordPageQuery,
  MemoryRecordPayload,
  MemorySearchPayload,
  MemorySearchResult,
  RuntimeSignalPageData,
  RuntimeSignalPageQuery,
  RuntimeSignalItem
} from './memory-library.models';

@Injectable({
  providedIn: 'root'
})
export class MemoryLibraryService {
  private readonly http = inject(ApiClientService);

  // --- Memory Library APIs ---

  getPage(query: MemoryLibraryPageQuery): Observable<ApiResponse<MemoryLibraryPageData>> {
    return this.http.get<MemoryLibraryPageData>('/memory-libraries', query);
  }

  getDetail(id: string): Observable<ApiResponse<MemoryLibraryItem>> {
    return this.http.get<MemoryLibraryItem>(`/memory-libraries/${id}`);
  }

  create(payload: MemoryLibraryPayload): Observable<ApiResponse<MemoryLibraryItem>> {
    return this.http.post<MemoryLibraryItem>('/memory-libraries', payload);
  }

  update(id: string, payload: MemoryLibraryPayload): Observable<ApiResponse<MemoryLibraryItem>> {
    return this.http.put<MemoryLibraryItem>(`/memory-libraries/${id}`, payload);
  }

  delete(id: string): Observable<ApiResponse<unknown>> {
    return this.http.delete<unknown>(`/memory-libraries/${id}`);
  }

  // --- Rule APIs ---

  getRules(libraryId: string): Observable<ApiResponse<MemoryRuleItem[]>> {
    return this.http.get<MemoryRuleItem[]>(`/memory-libraries/${libraryId}/rules`);
  }

  createRule(libraryId: string, payload: MemoryRulePayload): Observable<ApiResponse<MemoryRuleItem>> {
    return this.http.post<MemoryRuleItem>(`/memory-libraries/${libraryId}/rules`, payload);
  }

  updateRule(libraryId: string, ruleId: string, payload: MemoryRulePayload): Observable<ApiResponse<MemoryRuleItem>> {
    return this.http.put<MemoryRuleItem>(`/memory-libraries/${libraryId}/rules/${ruleId}`, payload);
  }

  deleteRule(libraryId: string, ruleId: string): Observable<ApiResponse<unknown>> {
    return this.http.delete<unknown>(`/memory-libraries/${libraryId}/rules/${ruleId}`);
  }

  // --- Record APIs ---

  getRecords(libraryId: string, query: MemoryRecordPageQuery): Observable<ApiResponse<MemoryRecordPageData>> {
    return this.http.get<MemoryRecordPageData>(`/memory-libraries/${libraryId}/records`, query);
  }

  createRecord(libraryId: string, payload: MemoryRecordPayload): Observable<ApiResponse<MemoryRecordItem>> {
    return this.http.post<MemoryRecordItem>(`/memory-libraries/${libraryId}/records`, payload);
  }

  updateRecord(
    libraryId: string,
    recordId: string,
    payload: MemoryRecordPayload
  ): Observable<ApiResponse<MemoryRecordItem>> {
    return this.http.put<MemoryRecordItem>(`/memory-libraries/${libraryId}/records/${recordId}`, payload);
  }

  deleteRecord(libraryId: string, recordId: string): Observable<ApiResponse<unknown>> {
    return this.http.delete<unknown>(`/memory-libraries/${libraryId}/records/${recordId}`);
  }

  // --- Search / Retrieval APIs ---

  search(libraryId: string, payload: MemorySearchPayload): Observable<ApiResponse<MemorySearchResult>> {
    return this.http.post<MemorySearchResult>(`/memory-libraries/${libraryId}/records/search`, payload);
  }

  retrievalTest(libraryId: string, payload: MemorySearchPayload): Observable<ApiResponse<MemorySearchResult>> {
    return this.http.post<MemorySearchResult>(`/memory-libraries/${libraryId}/retrieval-test`, payload);
  }

  // --- Runtime Signal APIs ---

  getRuntimeSignals(query: RuntimeSignalPageQuery): Observable<ApiResponse<RuntimeSignalPageData>> {
    return this.http.get<RuntimeSignalPageData>('/admin/runtime-signals', query);
  }

  updateRuntimeSignalStatus(
    id: string,
    payload: { status: string; errorMessage?: string; scheduledAt?: string }
  ): Observable<ApiResponse<RuntimeSignalItem>> {
    return this.http.put<RuntimeSignalItem>(`/admin/runtime-signals/${id}/status`, payload);
  }

  deleteRuntimeSignalTodo(id: string): Observable<ApiResponse<unknown>> {
    return this.http.delete<unknown>(`/admin/runtime-signals/${id}`);
  }

  createTodo(payload: {
    title?: string;
    content?: string;
    scheduledAt?: string;
    userId?: number;
    deviceId?: string;
    agentRoleId?: string;
  }): Observable<ApiResponse<{ id: string }>> {
    return this.http.post<{ id: string }>('/admin/todos', payload);
  }

  executeTodo(id: string): Observable<ApiResponse<{ id: string; status: string }>> {
    return this.http.post<{ id: string; status: string }>(`/admin/todos/${id}/execute`);
  }
}
