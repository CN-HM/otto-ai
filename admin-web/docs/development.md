# 开发规范

## 适用范围

本规范用于统一 AI 管理端的前端开发约定，优先覆盖以下内容：

- 接口错误码处理
- 请求日志与调试
- 代码与目录组织
- 表单校验策略

## 1. 接口错误码处理规范

### 1.1 响应结构约定

当前项目默认后端响应结构为：

```ts
interface ApiResponse<T> {
  code: number;
  msg: string;
  data: T;
}
```

约定如下：

- `code === 0` 视为业务成功
- `code !== 0` 视为业务失败
- 页面层优先展示接口返回的 `msg`
- 若接口未返回可用 `msg`，再回退到页面本地默认文案

### 1.2 统一工具

核心层已提供：

- `src/app/core/http/api-error.utils.ts`
  - `isApiSuccess(response)`
  - `resolveApiMessage(response, fallback)`
  - `resolveHttpErrorMessage(error, fallback)`

推荐写法：

```ts
if (!isApiSuccess(response)) {
  this.feedbackMessage.set(resolveApiMessage(response, '保存失败。'));
  return;
}
```

HTTP 异常推荐写法：

```ts
error: (error: unknown) => {
  this.feedbackMessage.set(resolveHttpErrorMessage(error, '请求失败，请稍后重试。'));
}
```

### 1.3 分层约定

- 拦截器层
  - 负责认证失效跳转
  - 负责兜底 HTTP 错误消息结构
  - 不在拦截器里直接写业务成功/失败提示

- Service 层
  - 负责接口调用与参数组织
  - 不耦合页面提示文案

- Page / Component 层
  - 负责业务成功提示
  - 负责业务失败 fallback 文案
  - 负责将错误信息写入页面状态

### 1.4 文案约定

建议按以下格式统一：

- 列表查询失败：`XXX 列表获取失败。`
- 详情查询失败：`XXX 详情获取失败。`
- 保存失败：`XXX 保存失败。`
- 删除失败：`XXX 删除失败。`
- 请求异常：`XXX 请求失败。`

## 2. 请求日志与调试规范

### 2.1 调试入口

项目已提供：

- `src/app/core/http/interceptors/http-debug.interceptor.ts`

启用方式：

- 将 `src/environments/environment.ts` 中的 `enableHttpDebug` 设为 `true`
- 或在浏览器控制台执行：`localStorage.setItem('ai.ai.http.debug', 'true')`

关闭方式：

- 执行：`localStorage.removeItem('ai.ai.http.debug')`

### 2.2 日志范围

调试日志默认输出：

- 请求方法与 URL
- 请求头
- 请求体
- 响应状态码
- 响应头
- 响应体
- 请求耗时

### 2.3 使用约束

- 默认保持关闭，避免污染控制台
- 仅在开发联调、接口排查时临时开启
- 不在业务页面中散落 `console.log`
- 敏感信息排查完成后及时关闭调试

## 3. 代码与目录规范

### 3.1 目录分层

当前目录职责约定如下：

- `src/app/core`
  - 放全局基础能力
  - 如配置、HTTP 封装、拦截器、核心模型、通用错误处理

- `src/app/shared`
  - 放跨业务复用组件与共享 UI 骨架
  - 如上传组件、分页组件、反馈消息组件、模板组件

- `src/app/features`
  - 按业务域拆分页面、服务、模型
  - 每个业务模块内部优先保持 `page / service / models` 就近组织

- `docs/modules`
  - 放模块设计、接口对接、风险点与阶段状态

### 3.2 代码组织原则

- 优先复用 `shared` 组件，不重复造 UI 结构
- 优先将通用逻辑沉淀到 `core` 或 `shared`
- 页面组件只保留当前页面真正关心的状态与交互
- Service 只做接口调用与数据组织，不直接控制 UI
- 新增通用能力时，先考虑是否属于 `core` 或 `shared`

### 3.3 命名约定

- 页面组件：`xxx-page.component.ts`
- 表单页组件：`xxx-form-page.component.ts`
- 服务：`xxx.service.ts`
- 模型：`xxx.models.ts`
- 共享组件：放在 `src/app/shared`
- 拦截器：放在 `src/app/core/http/interceptors`

## 4. 表单校验规范

### 4.1 基本原则

- 能在前端确定的必填、长度、格式约束，优先前置校验
- 无法确认的业务规则，不在前端做强假设
- 在联调未完成前，优先保证“可输入 + 可提交 + 有清晰提示”

### 4.2 推荐策略

- 必填字段使用 `Validators.required`
- 数值字段在提交时统一做 `Number(...)` 收敛
- 页面提交前统一执行：`form.markAllAsTouched()`
- 若校验失败，直接 return，不发请求
- 字典项未完成联调时，采用“有字典则下拉，无字典则文本输入”的回退策略

### 4.3 提示约定

- 页面级错误优先放在统一反馈区
- 字段级错误在后续需要时再逐步细化
- 当前阶段优先统一页面级提示，不急于一次性铺满所有字段级错误文案

### 4.4 后续演进

后续如果业务规则稳定，可继续补充：

- 统一校验错误文案映射
- 统一字段级错误展示组件
- 统一表单提交态与禁用态策略

## 5. 执行顺序建议

新增页面或改造页面时，建议按以下顺序处理：

1. 先确定接口模型与请求参数
2. 再确定表单结构与基础校验
3. 统一接入共享错误处理工具
4. 若联调排查需要，再临时开启 HTTP 调试日志
5. 完成后同步更新 `docs/modules/*.md`、`README.md`、`TODO.md`、`CHANGELOG.md`

## 6. 接口自动生成规范

### 6.1 基本原则

前端 API 接口层代码 **必须由自动化工具生成**，禁止手动编写 HTTP 请求方法（禁止在 Service 中手写 URL 路径和请求方法）。

### 6.2 工具链

- 后端基于 ABP vNext，Swagger / OpenAPI 规范自动可用
- 前端使用 **Kiota** 作为 API client 生成工具
- 生成命令：`npm run api:generate`
- 生成代码产出目录：`src/app/api/kiota/`

### 6.3 标准流程

1. 后端新增 / 修改 Controller 端点
2. 启动 `admin-api`，确保 Swagger 端点可访问
3. 运行 `npm run api:generate`（Kiota 从 OpenAPI spec 生成 TypeScript client）
4. 前端 Service 层通过 Kiota 生成的 client 调用接口，不手写 HTTP URL

### 6.4 反例

```ts
// 禁止：手写 HTTP URL 和请求方法
this.api.get<Foo[]>('/admin/foo');
this.api.post<Foo>('/admin/foo', payload);
```

### 6.5 正例

```ts
// 正确：通过 Kiota 生成的 client 调用
// Service 中注入 Kiota client，调用生成的强类型方法
this.kiotaClient.foo.list();
this.kiotaClient.foo.create({ body: payload });
```

### 6.6 例外

- 若 Kiota 暂不支持某个复杂请求模式（如文件上传 + 表单混合），需在代码中标注 `// EXCEPTION: Kiota limitation` 并记录到对应的模块设计文档
- `IntegrationPreset` 等纯查询端点，如 Kiota 暂未覆盖，允许存在临时 HTTP 调用，但必须在对应 Service 方法上标注 `// TODO: migrate to Kiota client`

## 7. 多语言规范

### 7.1 基础设施

- locale 文件：`src/assets/locales/zh-Hans.json` / `zh-TW.json`
- 翻译服务：`I18nService`（`src/app/core/i18n/`）
- 模板 pipe：`translate`（`| translate`）
- 指令式翻译：`domI18n` directive
- 自动同步脚本：`scripts/i18n-sync-ui-text.mjs`（扫描 `.ts`/`.html` 中的中文文本并同步到 `uiText` 映射）

### 7.2 命名空间约定

- 业务模块相关文案：按模块创建命名空间（如 `preset`、`agentRole`、`billing`）
- 通用 UI 文案：放在 `common` 或 `shared` 命名空间
- 自动同步的 UI 文本：放在 `uiText` 命名空间

### 7.3 新增翻译的标准流程

1. 确定文案所属命名空间
2. 在 `zh-Hans.json` 中添加简体中文 key-value
3. 在 `zh-TW.json` 中对应添加繁体中文 key-value
4. 模板中使用 `translate` pipe：`{{ 'namespace.key' | translate }}`
5. 组件 TS 代码中使用 `I18nService.translate('namespace.key')`

### 7.4 种子数据 / 数据库文案的多语言处理

- 数据库种子数据保存默认语言（zh-Hans）的值
- 前端展示时，对于内置数据（通过固定标识如 `Code` 前缀识别），优先使用 i18n key 渲染
- 用户自定义数据直接展示数据库存储值

### 7.5 命名空间示例

```json
{
  "preset": {
    "mode": {
      "label": "配置模式",
      "preset": "预设平台",
      "custom": "自定义配置"
    },
    "ark": {
      "name": "火山方舟",
      "description": "火山引擎豆包大模型平台..."
    }
  }
}
```

### 7.6 约束

- 新增 UI 文案必须在两个 locale 文件中同时添加
- `uiText` 命名空间由自动同步脚本维护，不应手动编辑其中的条目
- 翻译 key 使用 camelCase，层级使用 `.` 分隔
- 不在代码中硬编码中文字符串（除非在 `uiText` 自动同步范围内）

## 8. 全栈功能移除规范

### 8.1 核心原则

**移除功能时，必须从前端到后端到数据库逐层清理，不允许仅隐藏 UI 或仅注释代码。**

隐藏 UI 而不移除后端代码会导致：API 仍返回废弃字段、数据库保留无用列、后续维护者不知道哪些代码已死。

### 8.2 标准检查清单

当要移除一个功能时，按以下顺序逐层排查：

| 层级 | 检查点 |
| --- | --- |
| 数据库 | 删除无用表 / 列，创建 EF Core migration |
| 实体 | 删除实体类文件，移除实体属性 |
| DbContext | 移除 DbSet 属性、实体 Fluent 配置、索引 |
| 数据种子 | 移除种子数据方法和内置 ID 常量 |
| DTO | 移除输入/输出/选项 DTO 中的废弃字段 |
| Service | 移除 switch 分支、私有 CRUD 方法、映射方法、引用检查 |
| 常量/枚举 | 移除已废弃的常量值 |
| 运行时/编排 | 移除废弃字段的赋值和传递，简化回退逻辑 |
| 其他服务 | 搜索整个代码库，移除所有引用该字段的赋值 |
| 迁移文件 | 自动生成的 Designer.cs / Snapshot.cs 由新 migration 覆盖 |
| 前端表单 | 移除 HTML 表单控件、TS 信号/FormControl/绑定选项 |
| 前端列表 | 移除列表详情展示中的废弃字段 |
| 前端模型 | 移除本地 interface/models 中的废弃属性 |
| 生成模型 | 移除 src/app/api/openapi/model/ 下自动生成接口中的字段 |
| API Spec | 移除 api-json/ai-api-latest.json 中对应的 schema 属性 |
| i18n | 移除 zh-Hans.json 和 zh-TW.json 中的废弃翻译 key |

### 8.3 验证步骤

移除完成后必须执行：

```bash
# 后端编译验证
dotnet build admin-api/AiAdmin.csproj

# 前端类型检查
npx tsc --noEmit --project tsconfig.app.json

# 确认无残留引用
rg "废弃字段名" admin-api/ admin-web/src/ --type-add 'fe:*.{ts,html,json}' -t fe -t cs
```

### 8.4 反例

```ts
// 禁止：仅注释 HTML，后端代码原封不动
<!-- <p-select formControlName="pipelineTemplateId" ...></p-select> -->

// 禁止：仅从 DTO 移除，Service 仍引用 entity.PipelineTemplateId
```

### 8.5 正例

以移除 Pipeline Template（对话链路配置）为例，完整清理了：

- 后端 30+ 文件：实体删除、DTO 清理、Service 方法移除、常量移除、运行时简化、编排 DTO 清理、后台任务参数移除、内存服务参数移除、数据种子清理、迁移创建
- 前端 15 文件：表单 HTML/TS、列表 TS、本地模型、5 个生成模型、API JSON spec、2 个 i18n 文件
- 验证：后端 0 warning 0 error，前端 TS 编译通过
