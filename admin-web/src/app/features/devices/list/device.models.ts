export interface DeviceListItem {
  id: string;
  macAddress?: string;
  bindUserName?: string;
  deviceType?: string;
  appVersion?: string;
  otaUpgrade?: number;
  recentChatTime?: string;
}

export interface DeviceEntityItem {
  id?: string;
  userId?: number;
  macAddress?: string;
  lastConnectedAt?: string;
  autoUpdate?: number;
  board?: string;
  alias?: string;
  agentRoleId?: string;
  agentRoleReleaseId?: string;
  appVersion?: string;
  sort?: number;
  updateDate?: string;
  createDate?: string;
}

export interface DeviceDetailSnapshot {
  id: string;
  macAddress?: string;
  bindUserName?: string;
  deviceType?: string;
  board?: string;
  appVersion?: string;
  recentChatTime?: string;
  lastConnectedAt?: string;
  otaUpgrade?: number;
  alias?: string;
  autoUpdate?: number;
  agentRoleId?: string;
  agentRoleName?: string;
  agentRoleReleaseId?: string;
  agentRoleVersion?: string;
  isOnline?: boolean;
}

export interface DevicePageData {
  total: number;
  list: DeviceListItem[];
}

export interface DevicePageQuery {
  keywords?: string;
  page: number;
  limit: number;
}

export interface DeviceManualAddPayload {
  agentRoleId?: string;
  agentRoleReleaseId?: string;
  board?: string;
  appVersion?: string;
  macAddress?: string;
}

export interface DeviceUpdatePayload {
  autoUpdate: number;
  alias?: string;
  agentRoleId?: string;
  agentRoleReleaseId?: string;
}

export interface OtaItem {
  id: string;
  firmwareName?: string;
  type?: string;
  version?: string;
  size?: number;
  remark?: string;
  firmwarePath?: string;
  sort?: number;
  updateDate?: string;
  createDate?: string;
}

export interface OtaPageData {
  total: number;
  list: OtaItem[];
}

export interface OtaFormPayload {
  id?: string;
  firmwareName?: string;
  type?: string;
  version?: string;
  size?: number;
  remark?: string;
  firmwarePath?: string;
  sort?: number;
}

export interface OtaUploadResult {
  fileName?: string;
  filePath?: string;
  url?: string;
  uuid?: string;
  firmwareName?: string;
  firmwarePath?: string;
  originalFilename?: string;
  originalName?: string;
  fileUrl?: string;
  downloadUrl?: string;
  path?: string;
  size?: number;
  fileSize?: number;
  [key: string]: unknown;
}
