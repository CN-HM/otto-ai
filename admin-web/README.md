# otto ai Web

`admin-web` 是当前仓库中的 Angular 18 管理端，负责 otto ai 设备、智能体、模型、知识库、音色、计费和系统配置等后台运营能力。

## 当前定位

当前前端已经从“早期骨架”演进为真实业务管理台，覆盖：

- 登录、注册、找回密码
- 用户管理、角色管理、审计日志
- 设备管理、OTA 管理、设备工具面板
- 智能体、模板、声纹与插件/上下文源配置
- 模型供应器、模型配置、VLLM 等模型管理
- 知识库、文档、切片与检索测试
- 音色、音色资源、声音克隆
- Token 套餐、订单、订阅与账单后台能力
- 系统参数、字典及其他系统级配置

## 技术栈

- Angular 18
- TypeScript 5.5
- PrimeNG 18
- Manifest 驱动的 baseline 管理台结构
- `ApiClientService` 直连接口 + Kiota 生成产物做 schema 同步与逐步接入

## 当前架构

### 管理台装配方式

- `src/app/current-admin.manifest.ts`
  - 选择当前启用的管理台变体
- `src/app/baseline/baseline-admin.manifest.ts`
  - 组合 baseline branding 与 feature manifests
- `src/app/baseline/features/*.feature.ts`
  - 定义导航、路由和模块级元数据
- `src/app/app.routes.ts`
  - 通过 `buildAdminAppRoutes(currentAdminManifest)` 构建最终路由

### 页面与业务代码

- 页面实现位于 `src/app/features/**`
- 跨模块基础能力位于 `src/app/core/**`
- 通用组件与共享样式位于 `src/app/shared/**`
- Kiota 生成代码位于 `src/app/api/kiota/**`

### OpenAPI / Kiota 策略

- 当前标准入口是 `npm run api:generate`
- 生成脚本位于 `scripts/api-generate.mjs`
- 最新 OpenAPI 快照保存在 `src/api-json/ai-api-latest.json`
- 旧快照会归档到 `src/api-json/archive/`
- 当前业务页面仍以 `ApiClientService` 为主，Kiota 产物主要用于跟踪最新 API 结构并逐步接入

## 当前目录结构

```text
admin-web/
├─ src/
│  ├─ api-json/                   # OpenAPI 快照与归档
│  ├─ app/
│  │  ├─ api/kiota/              # Kiota 生成客户端
│  │  ├─ baseline/               # baseline manifest 与 feature manifests
│  │  ├─ core/                   # auth/http/guards/layout/microfrontends
│  │  ├─ features/               # 业务页面实现
│  │  ├─ shared/                 # 通用 UI 与共享样式
│  │  ├─ current-admin.manifest.ts
│  │  ├─ app.config.ts
│  │  └─ app.routes.ts
│  └─ environments/              # 开发 / 生产环境配置
├─ scripts/api-generate.mjs      # Kiota/OpenAPI 生成脚本
├─ docs/                         # 前端内部规范与模块文档
├─ Dockerfile
├─ docker-compose.yml
└─ README.md
```

## 环境配置

环境文件位于：

- `src/environments/environment.ts`
- `src/environments/environment.development.ts`
- `src/environments/environment.production.ts`

当前默认配置：

- 开发环境：`http://localhost:8002/`
- 生产环境：`/`
- HTTP 调试默认在 `environment.ts` 中开启，在 `environment.development.ts` / `environment.production.ts` 中关闭

## OpenAPI 与 Kiota 生成

在 `admin-web/` 目录执行：

```bash
npm run api:generate
```

默认会从以下地址下载 Swagger：

```text
http://localhost:8002/swagger/v1/swagger.json
```

生成结果：

- 最新快照：`src/api-json/ai-api-latest.json`
- 历史归档：`src/api-json/archive/`
- Kiota 输出：`src/app/api/kiota/`

## 环境要求

- Node.js 20+
- npm 9+

## 本地开发

在项目根目录执行：

```bash
npm install
```

启动开发服务器：

```bash
npm start
```

默认访问地址：

```text
http:/localhost:4300
```

常用验证：

```bash
npx tsc -p tsconfig.app.json --noEmit
```

## 构建与部署

### 构建生产版本

```bash
npm run build
```

构建产物默认输出到：

```text
dist/otto-ai-web/browser
```

### Docker 镜像构建

```bash
docker build -t otto-ai-web:latest .
```

### Nginx 反向代理

- 静态资源由 Nginx 托管
- `/` 会被反向代理到 `http:/admin-api:8080/`
- 因此**推荐**通过仓库根目录 `docker-compose.yml` 统一启动前后端

如果单独使用 `admin-web/docker-compose.yml`，请自行确保容器内可以解析到名为 `admin-api` 的上游服务。

更完整的部署说明见：`docs/modules/deployment.md`

## 文档入口

- `CHANGELOG.md`
  - 前端阶段性变更记录
- `TODO.md`
  - 当前前端侧待办
- `docs/development.md`
  - 开发规范
- `docs/directory-convention.md`
  - 目录结构与 manifest 组织规范
- `docs/api-conventions.md`
  - API 路径和命名约定
- `docs/kiota-api-codegen.md`
  - Kiota/OpenAPI 生成流程
- `docs/modules/*.md`
  - 业务模块说明

## 开发提示

首次拉起项目时，如果 IDE 出现 Angular 依赖或 schema 找不到的提示，先执行：

```bash
npm install
```

安装完成后，相关提示通常会消失。

当前 IDE 中看到的 Angular / PrimeNG 类型报错，以及 `angular.json` schema 警告，主要是因为还没有安装依赖。

如需临时开启 HTTP 请求调试日志，可使用以下任一方式：

- 将 `src/environments/environment.ts` 中的 `enableHttpDebug` 改为 `true`
- 或在浏览器控制台执行：`localStorage.setItem('ai.ai.http.debug', 'true')`

关闭调试日志可执行：`localStorage.removeItem('ai.ai.http.debug')`

当前项目已包含：

- 登录页路由：`/login`
- 后台主路由守卫：`authGuard`
- 基础请求封装：`ApiClientService`
- 认证拦截器、HTTP 调试拦截器、错误处理拦截器、API Base URL 拦截器

## 维护约定

- 调整管理台装配方式：同步更新 `baseline/*.manifest.ts`、`docs/directory-convention.md` 和本文件
- 调整 OpenAPI / Kiota 生成流程：同步更新 `scripts/api-generate.mjs` 与 `docs/kiota-api-codegen.md`
- 调整部署链路：同步更新 `Dockerfile`、`docs/modules/deployment.md` 和本文件
- 调整设备接入相关页面：同步确认与根目录 `docs/esp32-blufi-device-credential-flow.md` 一致
