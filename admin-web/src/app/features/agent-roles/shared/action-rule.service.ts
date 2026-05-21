import { Injectable, inject } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import { ActionRuleItem, ActionRulePayload } from './action-rule.models';

@Injectable({
  providedIn: 'root'
})
export class ActionRuleService {
  private readonly http = inject(ApiClientService);

  getRules(agentRoleId: string): Observable<ApiResponse<ActionRuleItem[]>> {
    return this.http.get<ActionRuleItem[]>(`/admin/agent-roles/${agentRoleId}/action-rules`);
  }

  createRule(agentRoleId: string, payload: ActionRulePayload): Observable<ApiResponse<ActionRuleItem>> {
    return this.http.post<ActionRuleItem>(`/admin/agent-roles/${agentRoleId}/action-rules`, payload);
  }

  updateRule(agentRoleId: string, ruleId: string, payload: ActionRulePayload): Observable<ApiResponse<ActionRuleItem>> {
    return this.http.put<ActionRuleItem>(`/admin/agent-roles/${agentRoleId}/action-rules/${ruleId}`, payload);
  }

  deleteRule(agentRoleId: string, ruleId: string): Observable<ApiResponse<unknown>> {
    return this.http.delete<unknown>(`/admin/agent-roles/${agentRoleId}/action-rules/${ruleId}`);
  }
}
