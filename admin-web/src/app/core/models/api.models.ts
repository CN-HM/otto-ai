export interface ApiResponse<T> {
  code: number;
  msg: string;
  data: T;
  [key: string]: unknown;
}

export interface PageQuery {
  page?: number;
  pageSize?: number;
  current?: number;
  size?: number;
  [key: string]: string | number | boolean | null | undefined;
}

export interface PagedResult<T> {
  list?: T[];
  items?: T[];
  records?: T[];
  total?: number;
  page?: number;
  current?: number;
  pageSize?: number;
  size?: number;
  pages?: number;
  [key: string]: unknown;
}
