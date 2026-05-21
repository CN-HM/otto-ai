import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import { TtsProfileOption, VoiceItem, VoicePageData, VoicePageQuery, VoicePayload } from './voice.models';

@Injectable({
  providedIn: 'root'
})
export class VoiceService {
  private readonly api = inject(ApiClientService);

  getTtsProfileOptions(): Observable<ApiResponse<TtsProfileOption[]>> {
    return this.api.get<TtsProfileOption[]>('/ttsVoice/tts-profile-options');
  }

  getVoicePage(query: VoicePageQuery): Observable<ApiResponse<VoicePageData>> {
    return this.api.get<VoicePageData>('/ttsVoice', query);
  }

  getVoiceDetail(id: string): Observable<ApiResponse<VoiceItem>> {
    return this.api.get<VoiceItem>(`/ttsVoice/${id}`);
  }

  createVoice(payload: VoicePayload): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>('/ttsVoice', payload);
  }

  updateVoice(id: string, payload: VoicePayload): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/ttsVoice/${id}`, payload);
  }

  deleteVoices(ids: string[]): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>('/ttsVoice/delete', ids);
  }
}
