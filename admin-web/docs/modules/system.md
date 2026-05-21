# 系统设置模块

## 模块范围

- 平台级固定配置管理
- 字典类型管理
- 字典数据管理

## 相关接口

- `/admin/params/settings`
- `/admin/dict/type/update`
- `/admin/dict/data/update`

## 页面规划

- 平台配置页
- 字典类型管理页
- 字典数据管理页

## 当前状态

- 已创建平台配置页 `src/app/features/system/params/list/system-params-page.component.*`
- 已创建 `SystemParamsService` 与固定配置接口模型
- 已切换为 `GET/PUT /admin/params/settings` 成组读写
- 当前系统设置以固定 schema 呈现，不再支持动态新增、删除或列表式维护
- 当前系统设置入口已切换为平台配置页
- 已创建字典类型列表页 `src/app/features/system/dict-types-page.component.*`
- 已创建字典类型新增编辑页 `src/app/features/system/dict-type-form-page.component.*`
- 已创建 `DictTypesService` 与接口模型
- 已接入字典类型分页、详情、创建、更新、删除接口骨架
- 当前字典类型筛选字段：`dictType` / `dictName` / `page` / `limit`
- 已创建字典数据列表页 `src/app/features/system/dict-data-page.component.*`
- 已创建字典数据新增编辑页 `src/app/features/system/dict-data-form-page.component.*`
- 已创建 `DictDataService` 与接口模型
- 已创建 `DictOptionsService`，用于按 `dictType` 拉取并映射通用下拉选项
- `DictOptionsService` 已补充 `loadOptionsIntoSignal`，用于业务表单复用字典选项加载逻辑
- 已创建 `dict-option-types.ts`，集中维护业务表单待接入的字典编码映射
- 已接入字典数据分页、详情、创建、更新、删除接口骨架
- 当前字典数据筛选字段：`dictTypeId` / `dictLabel` / `dictValue` / `page` / `limit`
- 已新增共享样式文件 `src/app/shared/form-page.shared.css`，并在平台配置 / 字典类型 / 字典数据表单布局中复用
- 已新增共享反馈消息组件 `src/app/shared/feedback-message.component.*`
- 已新增可开关的 HTTP 调试拦截器 `src/app/core/http/interceptors/http-debug.interceptor.ts`，支持通过环境配置或 `localStorage` 临时开启请求/响应日志

## 字典项复用策略

- 统一通过 `DictOptionsService` 读取字典选项，避免业务模块直接访问字典接口
- 统一通过 `dict-option-types.ts` 维护“业务字段 -> 字典编码”的映射，避免在页面组件内散落硬编码
- 表单字段采用“有字典编码则下拉、无字典编码则文本输入”的回退式结构，确保未完成联调前不阻塞业务表单可用性
- 当前已预留的复用字段包括：模型中心 `modelType`、音色表单 `languages`、智能体/模板表单 `language` / `langCode`
- 后续若新增业务字段需要字典化，优先补充 `dict-option-types.ts`，再在对应页面接入 `loadOptionsIntoSignal`

## 首批字典编码映射

- 音色表单 `languages` -> 字典编码 `languages`
- 智能体表单 `language` -> 字典编码 `language`
- 智能体表单 `langCode` -> 字典编码 `langCode`
- 智能体模板表单 `language` -> 字典编码 `language`
- 智能体模板表单 `langCode` -> 字典编码 `langCode`
- 当前映射已集中维护在 `src/app/features/system/dict-option-types.ts`
- 若后端最终约定存在大小写或命名差异，仅需修改该文件即可同步全局表单下拉来源

## 待补充

- 字典列表查询接口
- 平台配置分组与字段校验继续细化
- 后续可继续扩展 `modelType` 等字段的字典化接入范围
