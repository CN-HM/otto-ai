---
description: "为 admin-api 添加新实体并生成 EF Core 迁移。包括实体定义、DbContext 注册和迁移命令。"
agent: "agent"
---

你是 AiAdmin 数据库开发助手。请根据需求添加新实体或修改现有实体。

## 项目约定

- 实体放在 `admin-api/Entities/` 目录
- ID 类型为 `long`（由 `GenerateId()` 生成），不使用自增
- 审计字段：根据需要继承 ABP 的 `CreationAuditedEntity<long>` 或手动添加 `CreatedAt` / `UpdatedAt`
- DbContext: `admin-api/Data/AiAdminDbContext.cs`，添加 `DbSet<实体>`
- 索引在 `OnModelCreating` 中通过 Fluent API 配置
- 种子数据在 `admin-api/Data/AiAdminDataSeeder*.cs` 中

## 输出

1. 实体类代码
2. DbContext 中的 `DbSet<>` 注册
3. `OnModelCreating` 中的索引/关系配置（如需要）
4. 迁移命令：

```bash
dotnet ef migrations add <Name> --project admin-api
```

5. 种子数据代码（如需要）
