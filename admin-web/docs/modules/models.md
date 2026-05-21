# 模型中心模块

## 模块范围

- 模型供应器管理
- 模型配置管理
- 模型启用/停用
- 默认模型设置

## 相关接口

- `/models/provider`
- `/models/provider/delete`
- `/models/{modelType}/{provideCode}`
- `/models/{modelType}/{provideCode}/{id}`
- `/models/enable/{id}/{status}`
- `/models/default/{id}`

## 页面规划

- 模型供应器列表
- 模型配置列表
- 新增/编辑表单
- 启停与默认配置

## 当前状态

- 已创建模型供应器列表页 `src/app/features/models/model-providers-page.component.*`
- 已创建模型供应器新增编辑页 `src/app/features/models/model-provider-form-page.component.*`
- 已创建模型配置列表页 `src/app/features/models/model-configs-page.component.*`
- 已创建模型配置新增编辑页 `src/app/features/models/model-config-form-page.component.*`
- 已创建 `ModelProviderService` 与接口模型
- 已创建 `ModelConfigService` 与接口模型
- 已接入模型供应器分页列表、创建、更新与删除接口骨架
- 已接入模型配置分页列表、详情、创建、更新、删除、启停切换与默认模型设置接口骨架
- 已支持从模型供应器跳转到模型配置列表与新增配置页
- 已为模型配置列表与编辑页补充 `providerCode` 缺失时的前端上下文兜底
- 当前筛选字段：模型类型 / 供应器编码 / 名称 / 分页参数
- 当前模型配置筛选字段：模型类型 / 供应器编码 / 模型名称 / 分页参数
- 已增加模型类型快捷筛选：LLM / TTS / ASR / VAD / Memory
- 已统一模型供应器表单、模型配置表单、模型配置筛选中的 `modelType` 为固定枚举选择
- 已统一模型供应器列表筛选中的 `modelType` 为固定枚举选择
- 已抽取共享常量 `src/app/features/models/model-type-options.ts` 统一维护模型类型选项
- 当前模型配置编辑页要求显式维护 `providerCode`，用于匹配后端路径参数 `provideCode`
- 已增加模型供应器到模型配置列表/新增页的联动入口，并支持按 `providerCode` 做前端上下文过滤
- 已在模型供应器表单、模型配置表单复用共享样式骨架 `src/app/shared/form-page.shared.css`
- 已在模型供应器表单、模型配置表单复用共享表单模板组件 `src/app/shared/form-detail-layout.component.*`
- 已在模型供应器列表页、模型配置列表页复用共享样式骨架 `src/app/shared/list-page.shared.css`
- 已在模型供应器列表页、模型配置列表页复用共享分页组件 `src/app/shared/pagination-bar.component.*`
- 已在模型供应器列表页、模型配置列表页复用共享搜索筛选组件 `src/app/shared/search-filter-card.component.*`
- 已在模型供应器列表页、模型配置列表页复用共享反馈消息组件 `src/app/shared/feedback-message.component.*`
- 已在模型供应器列表页、模型配置列表页复用共享空状态组件 `src/app/shared/empty-state.component.*`
- 已在模型供应器列表页、模型配置列表页复用共享双栏列表模板组件 `src/app/shared/list-detail-layout.component.*`

## 待补充

- 模型类型字典化来源
- 供应器字段结构
- 默认模型切换规则
