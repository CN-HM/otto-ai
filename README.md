# otto ai

> otto ai 设备管理后台 —— 集设备配网、智能体编排、知识库、语音对话运行时于一体

[![.NET](https://img.shields.io/badge/.NET-10-512BD4?logo=dotnet)](https://dotnet.microsoft.com/)
[![Angular](https://img.shields.io/badge/Angular-18-DD0031?logo=angular)](https://angular.dev/)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-4169E1?logo=postgresql)](https://www.postgresql.org/)
[![Redis](https://img.shields.io/badge/Redis-7-DC382D?logo=redis)](https://redis.io/)

---

## 📦 项目组成

```text
otto-ai/
├── admin-api/          🟣 .NET 10 + ABP vNext 后端 API
├── admin-web/          🟠 Angular 18 管理后台前端
├── apps/               🔵 Flutter 移动端（Android / iOS / Web）
├── docs/               📚 架构设计 & 联调文档
└── docker-compose.yml  🐳 仓库级容器编排
```

| 子项目 | 技术栈 | 职责 |
| --- | --- | --- |
| `admin-api` | .NET 10 · ABP vNext · EF Core · PostgreSQL · Redis · MQTTnet | 管理 API · 设备凭证签发 · 对话运行时 · 计费 |
| `admin-web` | Angular 18 · PrimeNG · TypeScript | 运营管理界面 · 配置管理 · 数据看板 |
| `apps` | Flutter 3.x · Melos · BLUFI BLE | 移动端配网 · 智能体角色绑定 · 用户中心 |

---

## 🚀 快速开始

### 环境要求

| 工具 | 最低版本 | 说明 |
| --- | --- | --- |
| [.NET SDK](https://dotnet.microsoft.com/download) | 10.0 | 后端编译运行 |
| [Node.js](https://nodejs.org/) | 20 LTS | 前端编译运行 |
| [Docker](https://www.docker.com/) | 25+ | PostgreSQL + Redis 本地基础设施 |
| [Flutter](https://flutter.dev/) | 3.x | 移动端（可选） |
| [Melos](https://melos.invertase.dev/) | 6+ | Flutter 工作区管理（可选） |

---

### 1️⃣ 启动后端

```bash
# 进入后端目录
cd admin-api

# 启动 PostgreSQL + Redis（Docker）
docker compose up -d

# 复制开发配置模板
cp appsettings.json appsettings.Development.json
# ⚠️ 编辑 appsettings.Development.json，填入你的数据库连接串和密钥

# 启动 API
dotnet run
```

> ✅ 启动后自动执行数据库迁移和种子数据

**可访问地址：**

| 服务 | 地址 |
| --- | --- |
| 🟢 API | `http://localhost:8002/` |
| 📖 Swagger UI | `http://localhost:8002/swagger` |
| 📄 Swagger JSON | `http://localhost:8002/swagger/v1/swagger.json` |

**默认管理员账号：**

```text
用户名：admin
密码：  admin123
```

---

### 2️⃣ 启动管理端

```bash
cd admin-web
npm install
npm start                # 开发模式 → http://localhost:4300
```

开发环境默认代理到 `http://localhost:8002/`。

如需修改 API 地址，编辑 `src/environments/environment.development.ts`：

```ts
export const environment = {
  production: false,
  apiBaseUrl: 'http://localhost:8002/'  // 👈 改成你的后端地址
};
```

---

### 3️⃣ 启动移动端（可选）

```bash
cd apps
dart run melos bootstrap   # 安装工作区依赖
cd ai_admin_app
flutter run                 # 连接真机或模拟器启动
```

> 📱 移动端需要 BLE 权限才能使用设备配网功能。Android 需要开启蓝牙 + 定位。

开发联调地址在 `apps/ai_admin_app/lib/main.dart` 中通过编译常量配置：

```dart
const _apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://192.168.50.165:8002/',
);
```

---

## ⚙️ 配置说明

所有配置集中在 `admin-api/appsettings.json`，作为开源模板包含完整的配置项和占位符。

### 关键配置项

| 配置节 | 用途 | 注意事项 |
| --- | --- | --- |
| `ConnectionStrings:Default` | PostgreSQL 连接串 | 本地用 Docker 启动的 `localhost:5432` |
| `Redis:Configuration` | Redis 连接串 | 本地默认 `localhost:6379` |
| `Jwt:SecretKey` | JWT 签名密钥 | 🔐 **务必修改**，64 字符随机字符串 |
| `ServiceAuth:Secret` | 服务间认证密钥 | 🔐 **务必修改** |
| `StringEncryption:DefaultPassPhrase` | 数据加密口令 | 🔐 **务必修改**，16 字符随机字符串 |
| `IoTRuntime:Enabled` | IoT 运行时开关 | 不需要设备接入时可保持 `false` |
| `Sms:NetEase` | 短信验证码 | 注册功能依赖，不启用可留空 |
| `Turnstile` | Cloudflare 人机验证 | 默认关闭 |

> 🔒 **安全提示：** `appsettings.Development.json` 和 `appsettings.Production.json` 已加入 `.gitignore`，密钥不会提交到仓库。

---

## 🧭 项目架构

```text
┌──────────────┐     HTTP REST      ┌──────────────┐
│  admin-web   │ ──────────────────→ │  admin-api   │
│  Angular 18  │ ←── JSON 响应 ──── │  .NET 10     │
└──────────────┘                    │              │
                                    │  ┌────────┐  │
┌──────────────┐     HTTP REST      │  │PostgreSQL│  │
│  Flutter App │ ──────────────────→ │  └────────┘  │
│  (BLE 配网)  │ ←── JSON 响应 ──── │  ┌──────┐    │
└──────────────┘                    │  │Redis │    │
                                    │  └──────┘    │
         🎤 ESP32 设备               │  ┌──────────┐ │
    (BLUFI BLE 配网 → WiFi → API)   │  │IoT Runtime│ │
                                    │  │MQTT/UDP/WS│ │
                                    │  └──────────┘ │
                                    └──────────────┘
```

### 核心业务流程

```text
📱 App BLE 扫描 → 🔑 选择角色 → 📶 配置 WiFi → 📡 BLUFI 发送凭证🎤 → 设备连 WiFi → 🔐 Bootstrap 自证 → ✅ 绑定 → 💬 开始对话
```

---

## 📡 设备接入（ESP32-S3）

> 🎯 当前版本针对 **小智 ESP32-S3** 固件进行适配。

使用 **BLUFI BLE 配网 + 设备凭证** 方案：

```text
1. App 通过 BLE 发现设备
2. App 调用 POST /device/provisioning/issue 获取凭证
3. App 通过 BLUFI 协议发送 WiFi 信息 + 凭证到设备
4. 设备连接 WiFi 后调用 POST /device/bootstrap 激活
5. 设备使用签名头访问 API，参与对话运行时
```

📖 详细文档：[docs/esp32-blufi-device-credential-flow.md](docs/esp32-blufi-device-credential-flow.md)

---

## 🚧 待完善

以下为当前版本尚未完成或存在限制的较大项：

| 模块 | 问题 | 影响 |
| --- | --- | --- |
| 💰 支付 | ECPay 支付网关为 mock，订单需后台手动标记已支付 | 用户无法在 App 内完成真实支付 |
| 🔧 MCP 工具 | `tools/call` 未实现，设备端 MCP 工具无法从后台触发调用 | 管理端看不到设备 MCP 工具的实际执行 |
| 📉 套餐降级 | 不支持在当前周期内降级套餐 | 用户需等周期结束才能切换更低档套餐 |
| 🔄 提前续费 | 不支持同月提前续费 | 用户需等周期结束才能续 |
| 📄 文档解析 | 知识库文档分块与检索测试的异步处理链路待验证 | AI 对话中的知识检索可能未完全生效 |
| 📱 设备联调 | App 与 ESP32 硬件的 BLE 配网 + 对话全链路未充分测试 | 实际硬件环境可能存在兼容问题 |
| 🧪 测试覆盖 | Flutter 端 API 客户端测试均为空壳 | 移动端无自动化回归 |

---

## 🔧 代码生成

### TypeScript API 客户端（admin-web）

```bash
cd admin-web
npm run api:generate
```

1. 从 `http://localhost:8002/swagger/v1/swagger.json` 拉取 OpenAPI 定义
2. 生成 Kiota TypeScript 客户端到 `src/app/api/kiota/`

### Dart API 客户端（Flutter）

```powershell
cd apps
pwsh -ExecutionPolicy Bypass -File .\tool\generate_dart_dio_client.ps1
```

生成 Dart Dio 客户端到 `packages/openapi/`

---

## 🗄️ 数据库

### 迁移

```bash
cd admin-api

# 创建新迁移
dotnet ef migrations add <迁移名称>

# 更新数据库
dotnet ef database update

# 回滚到上一个迁移
dotnet ef database update <上一个迁移名称>
```

> 💡 应用启动时自动执行 `MigrateAsync()`，开发环境无需手动 migrate。

### 种子数据

启动时自动执行，包括：

- 👤 默认管理员账号
- 🎭 示例智能体角色与 Pipeline 模板
- 📋 默认模型配置（ASR / VAD / LLM / TTS / Embedding）
- 💰 计费套餐与用量转换规则
- 🔊 示例 TTS 语音资源

---

## 🧪 常用开发任务

### 后端

```bash
cd admin-api

dotnet watch run                    # 热重载开发
dotnet test                         # 运行测试
dotnet ef migrations add <name>     # 创建迁移
```

### 前端

```bash
cd admin-web

npm start                           # 启动开发服务器
npm run build                       # 生产构建
npm run api:generate                # 重新生成 API 客户端
npm run lint                        # 代码检查
```

### 移动端

```bash
cd apps

dart run melos bootstrap            # 安装依赖
cd ai_admin_app

flutter run                         # 运行
flutter build apk                   # Android 打包
flutter build ios                   # iOS 打包
```

---

## 🐳 Docker 部署

仓库根目录 `docker-compose.yml` 提供完整部署编排：

```bash
# 完整启动（API + Web + Redis）
docker compose up -d --build

# 仅基础设施
cd admin-api && docker compose up -d   # PostgreSQL + Redis
```

> ⚠️ 根目录编排**不包含 PostgreSQL**，生产部署需要自行提供数据库实例。

---

## 📚 文档导航

### 推荐阅读顺序（新接手）

1. 本文件 `README.md`
2. [docs/project-structure.md](docs/project-structure.md)
3. [admin-api/README.md](admin-api/README.md)
4. [admin-web/README.md](admin-web/README.md)
5. [apps/README.md](apps/README.md)

### 文档一览

| 文档 | 说明 |
| --- | --- |
| [🗂️ docs/project-structure.md](docs/project-structure.md) | 项目结构与改动指南 |
| [📡 docs/esp32-blufi-device-credential-flow.md](docs/esp32-blufi-device-credential-flow.md) | 设备凭证配网流程 |
| [🧠 docs/memory-library.md](docs/memory-library.md) | 记忆库架构与实现 |
| [📏 docs/windsurf-monolith-development-standard.md](docs/windsurf-monolith-development-standard.md) | 后端开发规范（含 EF Core / 目录约定） |
| [🖥️ docs/firewall-config.md](docs/firewall-config.md) | Windows 防火墙配置 |
| [🟣 admin-api/README.md](admin-api/README.md) | 后端详细说明 |
| [🟠 admin-web/README.md](admin-web/README.md) | 管理端详细说明 |
| [🔵 apps/README.md](apps/README.md) | Flutter 工作区说明 |

---

## 📝 开发约定

- **Commit**: Conventional Commits，标题和正文使用中文。格式 `<type>(<scope>): <中文标题>`
- **API 响应**: 统一 `{ code: 0, msg: "success", data: ... }`，分页 `{ total: N, list: [...] }`
- **配置管理**: 密钥不入库，通过 `appsettings.{Environment}.json` 分环境管理
- **EF Core**: Code First，启动自动迁移，ID 使用毫秒时间戳生成
- **认证**: JWT Bearer（用户）+ Service Secret（服务间）

## 📧 联系方式

<souphm@foxmail.com>
