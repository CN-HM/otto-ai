export interface MenuTreeItem {
  id: number;
  parentId: number | null;
  name: string;
  code: string;
  type: number; // 0=目录, 1=菜单, 2=按钮
  sort: number;
  children?: MenuTreeItem[];
}

export interface UserInfo {
  id: number;
  username: string;
  superAdmin: number;
  status: number;
  roles: string[];
  permissions: string[];
}

export interface RoleDto {
  id: number;
  name: string;
  code: string;
  remark?: string;
  status: number;
  sort: number;
  createDate?: string;
}

export interface RoleCreateDto {
  name: string;
  code: string;
  remark?: string;
  status: number;
  sort: number;
}

export interface RoleUpdateDto extends RoleCreateDto {}

export interface RoleMenuAssignDto {
  menuIds: number[];
}

export interface UserRoleAssignDto {
  roleIds: number[];
}
