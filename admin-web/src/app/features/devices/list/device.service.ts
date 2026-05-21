import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import {
  DeviceDetailSnapshot,
  DeviceManualAddPayload,
  DevicePageData,
  DevicePageQuery,
  DeviceUpdatePayload,
  OtaFormPayload,
  OtaItem,
  OtaPageData,
  OtaUploadResult
} from './device.models';

@Injectable({
  providedIn: 'root'
})
export class DeviceService {
  private readonly api = inject(ApiClientService);

  getDevicePage(query: DevicePageQuery): Observable<ApiResponse<DevicePageData>> {
    return this.api.get<DevicePageData>('/admin/device/all', query);
  }

  getDevice(id: string): Observable<ApiResponse<DeviceDetailSnapshot>> {
    return this.api.get<DeviceDetailSnapshot>(`/device/${id}`);
  }

  deleteDevice(id: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/device/${id}`);
  }

  manualAdd(payload: DeviceManualAddPayload): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>('/device/manual-add', payload);
  }

  updateDevice(id: string, payload: DeviceUpdatePayload): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/device/update/${id}`, payload);
  }

  getOtaPage(query: DevicePageQuery): Observable<ApiResponse<OtaPageData>> {
    return this.api.get<OtaPageData>('/otaMag', query);
  }

  getOtaDetail(id: string): Observable<ApiResponse<OtaItem>> {
    return this.api.get<OtaItem>(`/otaMag/${id}`);
  }

  getOtaDownloadUrl(id: string): Observable<ApiResponse<string>> {
    return this.api.get<string>(`/otaMag/getDownloadUrl/${id}`);
  }

  createOta(payload: OtaFormPayload): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>('/otaMag', payload);
  }

  updateOta(id: string, payload: OtaFormPayload): Observable<ApiResponse<unknown>> {
    return this.api.put<unknown>(`/otaMag/${id}`, payload);
  }

  deleteOta(id: string): Observable<ApiResponse<unknown>> {
    return this.api.delete<unknown>(`/otaMag/batch/${id}`);
  }

  uploadFirmware(formData: FormData): Observable<ApiResponse<string | OtaUploadResult>> {
    return this.api.postForm<string | OtaUploadResult>('/otaMag/upload', formData);
  }

  uploadAssetsBin(formData: FormData): Observable<ApiResponse<unknown>> {
    return this.api.postForm<unknown>('/otaMag/uploadAssetsBin', formData);
  }

  getDeviceTools(deviceId: string): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>(`/device/tools/list/${deviceId}`);
  }

  callDeviceTool(deviceId: string, payload?: Record<string, unknown>): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>(`/device/tools/call/${deviceId}`, payload);
  }
}
