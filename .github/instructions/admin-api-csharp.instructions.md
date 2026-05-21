---
description: "Use when editing C# controller, entity, service, or infrastructure code in admin-api. Covers API conventions, data isolation, and response format."
applyTo: "admin-api/**/*.cs"
---

# admin-api C# 编码规范

## Controller

- 继承 `OttoAdminBaseController`，注入 `OttoAdminDbContext`
- 路由: `[Route("/resource")]`，全局前缀 `/` 由 ABP 配置
- 返回 `Result<T>.Ok(data)` 或 `Result.Error(msg)`
- 分页返回 `Result<PageData<T>>.Ok(new PageData<T> { Total = ..., List = ... })`
- 认证: `[Authorize]`，公开接口用 `[AllowAnonymous]`
- 权限: 管理员接口加 `[RequirePermission("模块:操作")]`
- 服务间: `[ServiceAuth]`

## 数据隔离

- 普通用户查询必须加 `.Where(x => x.UserId == CurrentUserId)`
- 超管 (`IsSuperAdmin`) 不受限
- 删除/修改操作必须验证所有权

## 实体

- ID 使用 `long`，由 `GenerateId()` 生成
- JSON 序列化使用 snake_case
