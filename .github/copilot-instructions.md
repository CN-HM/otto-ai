# Project Guidelines — Otto AI Platform

## 项目概述

Otto AI Platform 是一个 Otto AI 设备管理后台，包含以下子项目：

| 目录 | 技术栈 | 说明 |
|------|--------|------|
| `admin-api/` | .NET 10 + ABP vNext 10.1 + PostgreSQL + Redis | 后端 API |
| `admin-web/` | Angular 18 + PrimeNG | 前端管理界面 |
| `mqtt-gateway/` | .NET 10 + ABP + MQTTnet | MQTT 设备网关 |
| `docs/` | Markdown | 设计文档 |

## Code Style

### C# (admin-api / mqtt-gateway)

- 路由前缀统一为 `/`（由 ABP 模块配置），Controller 路由写相对路径如 `[Route("/agent")]`
- Controller 继承 `AiAdminBaseController`，直接注入 `AiAdminDbContext`，不强制使用 Repository 模式
- API 统一返回 `Result<T>`：`{ code: 0, msg: "success", data: ... }`，分页使用 `PageData<T>`
- JSON 序列化使用 snake_case（`SnakeCaseNamingPolicy`）
- 实体 ID 使用 `long`，由 `GenerateId()` 生成（毫秒时间戳 * 1000 + 随机数）
- 数据隔离：普通用户只能操作自己的数据（通过 `CurrentUserId` 过滤），超管不受限
- 认证: JWT Bearer + `[Authorize]`，服务间认证使用 `[ServiceAuth]`
- 权限控制: `[RequirePermission("xxx")]` 属性

### TypeScript (admin-web)

- Angular 18 standalone components，不使用 NgModule
- UI 框架: PrimeNG
- API 层在 `src/app/api/` 下，由 `scripts/api-codegen.mjs` 从 Swagger 生成
- 路由结构: `src/app/features/<模块>/` 按业务模块组织
- 公共组件/指令/管道在 `src/app/shared/`
- 核心服务（认证、拦截器）在 `src/app/core/`

## Architecture

```
admin-web (Angular) → admin-api (.NET) → PostgreSQL / Redis
                      ↑
mqtt-gateway ─────────┘ (服务间通过 ServiceAuth Secret 认证)
                      ↓
              Python server (WebSocket)
```

## Build & Run

```bash
# admin-api
cd admin-api && dotnet run          # 开发: http://localhost:8002
cd admin-api && dotnet build        # 编译

# admin-web
cd admin-web && npm install
cd admin-web && npx ng serve        # 开发: http://localhost:4300

# mqtt-gateway
cd mqtt-gateway && dotnet run       # 开发: MQTT :1883, UDP :8884

# 全栈部署
docker compose up --build           # 生产部署
```

## Conventions

- 配置管理: 不使用环境变量注入密钥，通过 `appsettings.{Environment}.json` 分环境管理。`appsettings.Production.json` 已 gitignore，部署时挂载
- TODO/CHANGELOG: TODO.md 只保留未完成事项，已完成的挪到 CHANGELOG.md
- Commit: 遵循 Conventional Commits，subject 和 body 均使用中文。格式为 `<type>(<scope>): <中文标题>`，body 用中文列出变更要点。scope 为子项目名
- EF Core 迁移: `dotnet ef migrations add <Name> --project admin-api`，启动时自动 `MigrateAsync()`
- 语言: 代码和注释用中英文混合（注释以中文为主，代码标识符英文），用户面向的文案用中文
