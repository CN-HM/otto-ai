export interface AdminUserItem {
  userid: string;
  mobile: string;
  status: number;
  deviceCount?: string;
  createDate?: string;
}

export interface AdminUserPageData {
  total: number;
  list: AdminUserItem[];
}

export interface AdminUserQuery {
  mobile?: string;
  page: number;
  limit: number;
}
