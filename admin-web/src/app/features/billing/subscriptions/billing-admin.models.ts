export type BillingSubscriptionStatus = 'active' | 'expired' | 'paused';

export type BillingChargeStatus = 'charged' | 'partial' | 'exhausted';

export type BillingOrderStatus = 'created' | 'pending' | 'paid' | 'activated' | 'cancelled' | 'failed';

export const BILLING_SUBSCRIPTION_STATUS = {
  active: 'active',
  expired: 'expired',
  paused: 'paused'
} as const satisfies Record<string, BillingSubscriptionStatus>;

export const BILLING_CHARGE_STATUS = {
  charged: 'charged',
  partial: 'partial',
  exhausted: 'exhausted'
} as const satisfies Record<string, BillingChargeStatus>;

export const BILLING_ORDER_STATUS = {
  created: 'created',
  pending: 'pending',
  paid: 'paid',
  activated: 'activated',
  cancelled: 'cancelled',
  failed: 'failed'
} as const satisfies Record<string, BillingOrderStatus>;

export interface BillingSubscriptionItem {
  userId: number;
  username: string;
  mobile?: string;
  planCode?: string;
  planName?: string;
  subscriptionStatus?: BillingSubscriptionStatus;
  periodKey?: string;
  totalTokens: number;
  consumedTokens: number;
  remainingTokens: number;
  periodEndAt?: string;
  isLowBalance: boolean;
  isExhausted: boolean;
}

export interface BillingUsageItem {
  id: string;
  userId: number;
  username?: string;
  mobile?: string;
  agentId?: string;
  deviceId?: string;
  sessionId?: string;
  serviceType: string;
  providerCode?: string;
  unitType: string;
  rawUnits: number;
  normalizedTokens: number;
  chargeStatus?: BillingChargeStatus;
  happenedAt?: string;
}

export interface BillingOrderItem {
  id: string;
  orderNo: string;
  userId: number;
  username?: string;
  mobile?: string;
  planId: string;
  planCode?: string;
  planName?: string;
  orderType: string;
  providerCode: string;
  currencyCode: string;
  amount: number;
  grantedTokens: number;
  status: BillingOrderStatus;
  externalTradeNo?: string;
  paidAt?: string;
  activatedAt?: string;
  createDate?: string;
}

export interface BillingSubscriptionPageData {
  total: number;
  list: BillingSubscriptionItem[];
}

export interface BillingUsagePageData {
  total: number;
  list: BillingUsageItem[];
}

export interface BillingOrderPageData {
  total: number;
  list: BillingOrderItem[];
}

export interface BillingSubscriptionQuery {
  mobile?: string;
  page: number;
  limit: number;
}

export interface BillingUsageQuery {
  keyword?: string;
  serviceType?: string;
  page: number;
  limit: number;
}

export interface BillingOrderQuery {
  keyword?: string;
  status?: BillingOrderStatus;
  page: number;
  limit: number;
}

export interface AdminMarkOrderPaidPayload {
  transactionNo?: string;
  paidAt?: string;
  remark?: string;
}
