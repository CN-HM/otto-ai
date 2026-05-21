import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import {
  AdminMarkOrderPaidPayload,
  BillingOrderPageData,
  BillingOrderQuery,
  BillingSubscriptionPageData,
  BillingSubscriptionQuery,
  BillingUsagePageData,
  BillingUsageQuery
} from './billing-admin.models';

@Injectable({
  providedIn: 'root'
})
export class BillingAdminService {
  private readonly api = inject(ApiClientService);

  getSubscriptionPage(query: BillingSubscriptionQuery): Observable<ApiResponse<BillingSubscriptionPageData>> {
    return this.api.get<BillingSubscriptionPageData>('/admin/billing/subscriptions', query);
  }

  getUsagePage(query: BillingUsageQuery): Observable<ApiResponse<BillingUsagePageData>> {
    return this.api.get<BillingUsagePageData>('/admin/billing/usage', query);
  }

  getOrderPage(query: BillingOrderQuery): Observable<ApiResponse<BillingOrderPageData>> {
    return this.api.get<BillingOrderPageData>('/admin/billing/orders', query);
  }

  markOrderPaid(id: string, payload: AdminMarkOrderPaidPayload): Observable<ApiResponse<unknown>> {
    return this.api.post<unknown>(`/admin/billing/orders/${id}/mark-paid`, payload);
  }
}
