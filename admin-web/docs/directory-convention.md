# 目录结构规范

本文档定义 `ai-admin` 前端项目的目录组织规范，所有新增模块必须遵守。

---

## 一、顶层结构

```
src/app/
  api/            # 生成客户端（当前为 Kiota）
  baseline/       # baseline manifest 与 feature manifests
  core/           # 全局单例：守卫、拦截器、HTTP 封装、布局壳、microfrontends 合约
  features/       # 业务页面实现（按领域划分）
  shared/         # 可复用 UI 组件、共享 CSS、通用服务
  current-admin.manifest.ts
  app.routes.ts   # 由 manifest 构建最终路由
  app.config.ts   # 应用级配置
  app.component.* # 根组件
```

### 职责边界

| 目录 | 放什么 | 不放什么 |
|------|--------|----------|
| `api/` | Kiota 生成客户端与 schema 对齐产物 | 手写业务逻辑 |
| `baseline/` | 管理台变体装配、导航定义、feature manifests | 具体业务页面实现 |
| `core/` | 守卫、拦截器、HTTP 客户端、全局模型、布局组件、microfrontends 合约 | 业务组件、页面 |
| `shared/` | 通用 UI 组件（空状态、分页条、上传面板…）、共享 CSS | 业务逻辑、API 服务 |
| `features/` | 按业务领域拆分的页面、服务、模型 | 跨领域通用组件 |

---

## 二、manifest 与 features 的关系

当前前端采用 **manifest 驱动装配**：

```
src/app/
  current-admin.manifest.ts        # 选择当前管理台变体
  baseline/
    baseline-admin.manifest.ts     # 组合 branding 与 features
    features/*.feature.ts          # 定义导航、受保护路由与页面元数据
  features/**                      # 真实页面组件、service、models
```

其中：

- `baseline/features/*.feature.ts`
  - 负责描述“有哪些导航项、挂哪些路由、懒加载哪个页面组件”
- `features/**`
  - 负责放页面实现和领域代码
- `app.routes.ts`
  - 只负责调用 `buildAdminAppRoutes(currentAdminManifest)`，不再手写整套路由表

---

## 三、features/ 领域划分

当前 `src/app/features/` 的一级目录主要包括：

```
features/
  agents/       # 智能体中心
  auth/         # 登录、注册、找回密码
  billing/      # 计费、订单、订阅
  dashboard/    # 工作台
  datasets/     # 知识库中心
  devices/      # 设备中心与 OTA
  errors/       # 错误页
  models/       # 模型中心
  system/       # 系统设置、用户、角色、审计日志
  voices/       # 音色中心
```

> 注意：导航层里的 `users` feature 当前实际落在 `features/system/users`、`features/system/roles`、`features/system/audit-logs` 中实现。

---

## 四、领域内子目录规范

当一个领域包含**多个子功能**（如智能体同时有列表、模板、声纹），必须按子功能拆分子目录。

### 4.1 标准子目录结构

每个子功能目录内部再按职责拆分为二级子目录：

```
features/<domain>/<sub-feature>/
  list/     # 列表页组件（*.component.{ts,html,css}）
  detail/   # 详情页组件（如有独立详情页）
  form/     # 新增/编辑表单页组件
  shared/   # 该子功能的 models + service（供 list/detail/form 共用）
```

> **例外**：子功能文件较少（≤ 6 个，且无需拆分列表/表单）时，可保持扁平，不强制拆二级。

### 4.2 当前各领域结构

```
agents/
  list/
    list/           # agents-page（列表）
    detail/         # agent-detail-page（详情）
    form/           # agent-form-page（新增/编辑）
    *.models.ts     # agent.models（扁平，直属 list/）
    *.service.ts    # agent.service（扁平，直属 list/）
  templates/        # 扁平（列表+表单文件较少）
  voice-prints/     # 扁平

devices/
  list/             # 扁平（设备列表、详情直属 list/）
  ota/              # 扁平

models/
  providers/
    list/           # model-providers-page
    form/           # model-provider-form-page
    shared/         # model-provider.models + model-provider.service
  configs/
    list/           # model-configs-page
    form/           # model-config-form-page
    shared/         # model-config.models + model-config.service
  shared/           # model-type-options.ts（跨 providers/configs 共享）

datasets/
  list/
    list/           # knowledge-bases-page
    detail/         # knowledge-base-detail-page
    form/           # knowledge-base-form-page
    shared/         # knowledge-base.models + knowledge-base.service
  documents/        # 扁平（复用 ../list/shared/knowledge-base.service）
  retrieval/        # 扁平（复用 ../list/shared/knowledge-base.service）

system/
  params/
    list/           # system-params-page（固定平台配置页）
    shared/         # system-params.models + system-params.service
  dict-types/
    list/           # dict-types-page
    form/           # dict-type-form-page
    shared/         # dict-types.models + dict-types.service
  dict-data/
    list/           # dict-data-page
    form/           # dict-data-form-page
    shared/         # dict-data.models + dict-data.service
  shared/           # dict-options.service + dict-option-types（跨子功能共享）

voices/
  list/             # 扁平（voices-page、voice-form-page、voice.models、voice.service）
  resources/        # 扁平
  clone/            # 扁平

auth/               # 扁平
billing/            # 扁平或轻量拆分
dashboard/          # 扁平
errors/             # 扁平
```

### 4.3 何时拆分二级子目录

- 子功能目录内文件 **超过 6 个**，或同时存在列表页 + 表单页 + 独立 models/service → 拆为 `list/` `form/` `shared/`
- 有独立详情页时额外加 `detail/`
- 文件 ≤ 6 个且功能单一 → 保持扁平，不强制拆分

---

## 五、文件命名规范

| 类型 | 命名格式 | 示例 |
|------|----------|------|
| 页面组件 | `<name>-page.component.{ts,html,css}` | `agents-page.component.ts` |
| 表单页面 | `<name>-form-page.component.{ts,html,css}` | `agent-form-page.component.ts` |
| 详情页面 | `<name>-detail-page.component.{ts,html,css}` | `agent-detail-page.component.ts` |
| 数据模型 | `<name>.models.ts` | `agent.models.ts` |
| API 服务 | `<name>.service.ts` | `agent.service.ts` |
| 共享常量 | `<name>.ts`（描述性名称） | `model-type-options.ts` |

---

## 六、import 路径规范

### 6.1 相对路径层级

根据文件所在深度，`../` 的层数不同：

| 文件位置 | 到 `core/` / `shared/` | 示例 |
|---------|----------------------|------|
| `features/<domain>/<sub>/` | `../../../` | `agents/list/`, `voices/list/` 等扁平目录 |
| `features/<domain>/<sub>/<role>/` | `../../../../` | `system/params/list/`, `models/configs/shared/` 等二级目录 |

```typescript
// ✅ 从 features/agents/list/（扁平，3级）引用 core
import { ApiResponse } from '../../../core/models/api.models';

// ✅ 从 features/system/params/list/（二级，4级）引用 core
import { ApiResponse } from '../../../../core/models/api.models';

// ✅ 从 features/models/configs/shared/（二级，4级）引用 core
import { ApiClientService } from '../../../../core/http/api-client.service';
```

### 6.2 跨子功能引用

同一领域内跨子目录引用：

```typescript
// ✅ 从 devices/ota/（扁平）引用 devices/list/
import { DeviceService } from '../list/device.service';

// ✅ 从 system/dict-data/list/（二级）引用 system/dict-types/shared/
import { DictTypesService } from '../../dict-types/shared/dict-types.service';

// ✅ 从 models/configs/list/（二级）引用 models/configs/shared/
import { ModelConfigService } from '../shared/model-config.service';

// ✅ 从 datasets/documents/（扁平）引用 datasets/list/shared/
import { KnowledgeBaseService } from '../list/shared/knowledge-base.service';
```

### 6.3 跨领域引用

从一个领域引用另一个领域的 shared 代码：

```typescript
// ✅ 从 agents/list/（扁平）引用 models/configs/shared/
import { ModelConfigService } from '../../models/configs/shared/model-config.service';

// ✅ 从 agents/list/（扁平）引用 system/shared/
import { DictOptionsService } from '../../system/shared/dict-options.service';
```

### 6.4 CSS @import

根据文件深度调整 `@import` 层级：

```css
/* ✅ 扁平目录 features/<domain>/<sub>/ */
@import '../../../shared/list-page.shared.css';
@import '../../../shared/form-page.shared.css';

/* ✅ 二级目录 features/<domain>/<sub>/<role>/ */
@import '../../../../shared/list-page.shared.css';
@import '../../../../shared/form-page.shared.css';
```

---

## 七、新增模块 Checklist

1. **确定领域归属**：新页面属于哪个一级领域？
2. **确定子功能**：是否属于已有子目录？还是需要新建？
3. **创建文件**：按命名规范创建 `*.component.{ts,html,css}` + `*.models.ts` + `*.service.ts`
4. **注册路由**：优先在对应 `baseline/features/*.feature.ts` 中挂路由，而不是直接改 `app.routes.ts`
5. **引入共享 CSS**：列表页 CSS 开头加 `@import '../../../shared/list-page.shared.css';`，表单页加 `form-page.shared.css`
6. **编译验证**：`npx ng build --configuration development`

---

## 八、导航菜单设计规范

### 8.1 父级分组容器的两种模式

含 `children` 的父级导航项支持以下两种模式，根据业务需要选择其一：

| 模式 | `route` | 交互表现 | 适用场景 |
|------|---------|----------|----------|
| **可点击父级** | 必填，且与所有子级 `route` 不同 | 父级本身是一个可点击入口，点击后进入独立页面；同时下方展开子级列表 | 父级自身有独立页面内容，例如“对话链路配置”本身有模板列表页，同时展开 ASR/VAD/LLM/TTS Profile 子入口 |
| **纯分组标题** | 省略不写 | 父级仅显示 `label` + `icon`，不可点击，仅作为分类标题；下方展开子级列表 | 父级本身没有独立页面，仅用于聚合分类，例如“计费中心”仅作分组，子级为“订阅概览”“用量明细” |

### 8.2 核心约束

- **父级与所有子级的 `route` 必须互不相同**，禁止父级和任一子级共用相同路径。共用会导致 `routerLinkActive` 同时高亮父级和子级，造成视觉重复与交互歧义。
- **若父级采用“可点击父级”模式**，其父级 `route` 必须与每个子级保持不同，且父级页面内容不应与子级完全重复。
- **子级之间的 `route` 也必须互不相同**。

### 8.3 推荐示例

**示例 A：可点击父级（合并型）**
```typescript
{
  label: '对话链路配置',
  icon: 'pi pi-sliders-h',
  route: '/binding-configs/pipeline',  // 父级自身页面
  children: [
    { label: 'ASR Profile', route: '/binding-configs/asr', ... },
    { label: 'VAD Profile', route: '/binding-configs/vad', ... }
  ]
}
```

**示例 B：纯分组标题（分类型）**
```typescript
{
  label: '计费中心',
  icon: 'pi pi-wallet',
  // 无 route，不可点击
  children: [
    { label: '订阅概览', route: '/billing', ... },
    { label: '用量明细', route: '/billing/usage', ... }
  ]
}
```
