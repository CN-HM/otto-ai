import { PageQuery } from '../../../../core/models/api.models';

export interface AuditLogQuery extends PageQuery {
  keyword?: string;
  method?: string;
  result?: string;
  page?: number;
  limit?: number;
}

export interface AuditLogActionItem {
  serviceName?: string;
  methodName?: string;
  parameters?: string;
  executionTime?: string;
  executionDuration?: number;
}

export interface AuditPropertyChangeItem {
  propertyName?: string;
  originalValue?: string;
  newValue?: string;
}

export interface AuditEntityChangeItem {
  changeType?: string;
  entityTypeFullName?: string;
  entityId?: string;
  changeTime?: string;
  propertyChanges?: AuditPropertyChangeItem[];
}

export interface AuditLogItem {
  id: string;
  applicationName?: string;
  operatorId?: string;
  userName?: string;
  clientIpAddress?: string;
  browserInfo?: string;
  correlationId?: string;
  httpMethod?: string;
  httpStatusCode?: number;
  url?: string;
  executionTime?: string;
  executionDuration?: number;
  hasException?: boolean;
  exceptions?: string;
  comments?: string;
  actionCount?: number;
  entityChangeCount?: number;
  actions?: AuditLogActionItem[];
  entityChanges?: AuditEntityChangeItem[];
}

export interface AuditLogPageData {
  total: number;
  list: AuditLogItem[];
}
