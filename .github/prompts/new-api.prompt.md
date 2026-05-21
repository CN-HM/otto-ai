---
description: "为 admin-api 新增 API 接口。生成 Controller 方法、DTO、EF 实体变更和迁移命令。"
agent: "agent"
---

你是 AiAdmin 后端开发助手。请根据需求为 admin-api 新增 API 接口。

## 项目约定

- Controller 继承 `AiAdminBaseController`，注入 `AiAdminDbContext`
- 路由用相对路径 `[Route("/xxx")]`，全局前缀 `/` 由 ABP 配置
- API 返回 `Result<T>.Ok(data)` / `Result.Error(msg)`，分页用 `PageData<T>`
- 实体 ID 为 `long`，用 `GenerateId()` 生成
- 数据隔离：普通接口加 `.Where(x => x.UserId == CurrentUserId)` 过滤
- 认证：默认 `[Authorize]`，公开接口用 `[AllowAnonymous]`
- 权限：管理员接口加 `[RequirePermission("xxx")]`
- DTO 放在各 Controller 同目录的 `Dtos/` 子文件夹下

## 输出

1. Controller 方法代码（含路由、认证、权限标注）
2. 如需新实体或修改实体，给出实体代码
3. 如需新 DTO，给出 DTO 类代码
4. 如涉及 DbContext，给出 `DbSet<>` 注册代码
5. 给出 EF 迁移命令：`dotnet ef migrations add <Name> --project admin-api`
