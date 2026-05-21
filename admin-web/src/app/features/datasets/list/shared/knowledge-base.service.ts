import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../../core/http/api-client.service';
import { ApiResponse } from '../../../../core/models/api.models';
import {
  KnowledgeBaseItem,
  KnowledgeChunkQuery,
  KnowledgeBasePageData,
  KnowledgeBasePageQuery,
  KnowledgeBasePayload,
  KnowledgeTextImportPayload,
  KnowledgeFileItem,
  KnowledgeFilePageData,
  KnowledgeFilePageQuery
} from './knowledge-base.models';

@Injectable({
  providedIn: 'root'
})
export class KnowledgeBaseService {
  private readonly api = inject(ApiClientService);

  getPage(query: KnowledgeBasePageQuery): Observable<ApiResponse<KnowledgeBasePageData>> {
    return this.api.get<KnowledgeBasePageData>('/datasets', query);
  }

  getDetail(datasetId: string): Observable<ApiResponse<KnowledgeBaseItem>> {
    return this.api.get<KnowledgeBaseItem>(`/datasets/${datasetId}`);
  }

  create(payload: KnowledgeBasePayload): Observable<ApiResponse<KnowledgeBaseItem>> {
    return this.api.post<KnowledgeBaseItem>('/datasets', payload);
  }

  update(datasetId: string, payload: KnowledgeBasePayload): Observable<ApiResponse<KnowledgeBaseItem>> {
    return this.api.put<KnowledgeBaseItem>(`/datasets/${datasetId}`, payload);
  }

  delete(datasetId: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/datasets/${datasetId}`);
  }

  retrievalTest(datasetId: string, payload: Record<string, unknown>): Observable<ApiResponse<Record<string, unknown>>> {
    return this.api.post<Record<string, unknown>>(`/datasets/${datasetId}/retrieval-test`, payload);
  }

  getDocumentPage(datasetId: string, query: KnowledgeFilePageQuery): Observable<ApiResponse<KnowledgeFilePageData>> {
    return this.api.get<KnowledgeFilePageData>(`/datasets/${datasetId}/documents`, query);
  }

  getDocumentPageByStatus(
    datasetId: string,
    status: number,
    query: KnowledgeFilePageQuery
  ): Observable<ApiResponse<KnowledgeFilePageData>> {
    return this.api.get<KnowledgeFilePageData>(`/datasets/${datasetId}/documents/status/${status}`, query);
  }

  getDocumentChunks(
    datasetId: string,
    documentId: string,
    query: KnowledgeChunkQuery
  ): Observable<ApiResponse<Record<string, unknown>>> {
    return this.api.get<Record<string, unknown>>(`/datasets/${datasetId}/documents/${documentId}/chunks`, query);
  }

  parseDocuments(datasetId: string, payload: Record<string, string[]>): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>(`/datasets/${datasetId}/chunks`, payload);
  }

  deleteDocument(datasetId: string, documentId: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/datasets/${datasetId}/documents/${documentId}`);
  }

  batchDeleteDocuments(datasetId: string, ids: string[]): Observable<ApiResponse<unknown>> {
    return this.api.deleteWithBody<unknown>(`/datasets/${datasetId}/documents`, { ids });
  }

  uploadDocument(
    datasetId: string,
    formData: FormData,
    query?: Record<string, string>
  ): Observable<ApiResponse<KnowledgeFileItem>> {
    return this.api.postForm<KnowledgeFileItem>(`/datasets/${datasetId}/documents`, formData, query);
  }

  importText(datasetId: string, payload: KnowledgeTextImportPayload): Observable<ApiResponse<KnowledgeFileItem>> {
    return this.api.post<KnowledgeFileItem>(`/datasets/${datasetId}/documents/text`, payload);
  }
}
