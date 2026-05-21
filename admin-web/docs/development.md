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
