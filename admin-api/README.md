# otto ai Platform — 管理后台 API

## 技术栈

- **.NET 10** + **ABP vNext 10.1** (精简单体)
- **PostgreSQL 18** + **Redis 7**
- **JWT Bearer** 认证 + **Service Secret** 服务间认证
- **EF Core** Code First
- **数据隔离** — 普通用户只能操作自己数据，超管不受限

## 当前职责

`admin-api` 当前不只是传统管理后台 API，还同时承担：

- 管理端 CRUD 与运营能力
- 设备凭证签发与设备 bootstrap
- 运行时配置下发（`/config/server-base`、`/config/agent-models`）
- 可选 IoT runtime：HTTP API、MQTT、UDP、设备 WebSocket 与 Python WS 上游协同

## 快速启动

### 1. 启动基础设施

```bash
cd admin-api
docker compose up -d
```

这将启动 PostgreSQL (5432) 和 Redis (6379)。

### 2. 运行 API

```bash
cd admin-api
dotnet run
```

开发模式下会自动执行数据库迁移和种子数据。

- API 地址：`http://localhost:8002/`
- Swagger UI：`http://localhost:8002/swagger`
- Swagger JSON：`http://localhost:8002/swagger/v1/swagger.json`

### 3. 前端联调

修改 `admin-web/src/environments/environment.ts`：

```ts
apiBaseUrl: 'http://localhost:8002/'
```

### 默认账号

- 用户名：`admin`
- 密码：`admin123`

## 运行时说明

- 开发环境默认监听 `http://*:8002`
- `Program.cs` 会在启动后输出外部接口摘要，包括：
  - HTTP API Base
  - Swagger / Swagger JSON
  - Runtime Status
  - Config Server Base / Agent Models
  - MQTT / UDP / Device WebSocket / Python WS Upstream
- `IoTRuntime` 默认在 `appsettings.json` 中关闭，可通过配置或容器环境变量启用

## 当前设备接入流

当前工程已经切到**设备凭证**方案：

- 签发配网凭证：`POST /device/provisioning/issue`
- 设备首次联网自证：`POST /device/bootstrap`
- 设备 HTTP 签名头认证：`DeviceCredentialAuth`
- MQTT 每设备密钥鉴权：由运行时组件校验

详细说明见：

- `../docs/esp32-blufi-device-credential-flow.md`
- `../docs/python-service-api-reference.md`

## 项目结构

```
admin-api/
├── Controllers/          # API 控制器
├── Data/                 # DbContext + 迁移 + 种子数据
├── Entities/             # EF Core 实体（对应数据库表）
├── Infrastructure/       # 统一响应、异常过滤器
├── Protocol/             # MQTT / UDP 协议处理与消息分发
├── Server/               # 运行时 HostedService、节点与端点
├── Migrations/           # EF Core 迁移文件
├── Services/             # 业务服务
│   ├── Admin/            # 用户管理
│   ├── Agents/           # 智能体
│   ├── Auth/             # 认证（JWT、SM2）
│   ├── Device/           # 设备
│   ├── Billing/          # 套餐 / 订单 / 用量
│   ├── Rbac/             # 角色与权限
│   ├── Knowledge/        # 知识库
│   ├── Models/           # 模型配置
│   ├── Runtime/          # 设备凭证 / 运行时协同
│   └── Voice/            # 语音资源
├── AiAdminModule.cs  # ABP 模块配置
├── Program.cs            # 入口
├── appsettings.json      # 配置
├── docker-compose.yml    # 本地 PostgreSQL + Redis
└── Dockerfile            # 镜像构建
```

## 本地基础设施

`admin-api/docker-compose.yml` 会提供：

- PostgreSQL：`5432`
- Redis：`6379`

注意：

- 应用最终连到哪个 PostgreSQL，取决于 `ConnectionStrings:Default`
- 如果你希望使用本地 Docker 启动的 PostgreSQL，请确认开发配置已经改为本地连接串

## API 响应格式

所有接口统一返回：

```json
{ "code": 0, "msg": "success", "data": { ... } }
```

分页接口 data 格式：

```json
{ "total": 100, "list": [ ... ] }
```
