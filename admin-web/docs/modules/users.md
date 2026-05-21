# 用户与管理员模块

## 模块范围

- 用户管理
- 管理员管理
- 用户状态变更
- 重置密码
- 删除用户

## 相关接口

- `/admin/users`
- `/admin/users/{id}`
- `/admin/users/changeStatus/{status}`

## 页面规划

- 用户列表页
- 用户详情抽屉
- 状态批量变更
- 重置密码

## 待补充

- 已创建用户列表页 `src/app/features/users/users-page.component.*`
- 已创建 `AdminUserService` 与接口模型
- 已接入用户分页查询、重置密码、状态切换、删除用户接口
- 当前列表筛选字段：手机号
- 状态枚举字典来源
