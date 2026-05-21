# 智能体模块

## 模块范围

- 智能体管理
- 智能体模板管理
- 智能体声纹管理
- 记忆配置

## 相关接口

- `/agent/{id}`
- `/agent/template`
- `/agent/voice-print`
- `/agent/saveMemory/{macAddress}`

## 页面规划

- 智能体列表
- 智能体详情
- 智能体编辑
- 模板管理
- 声纹管理

## 待补充

- 已创建智能体列表页 `src/app/features/agents/agents-page.component.*`
- 已创建智能体详情页 `src/app/features/agents/agent-detail-page.component.*`
- 已创建智能体编辑页 `src/app/features/agents/agent-form-page.component.*`
- 已创建模板列表页 `src/app/features/agents/agent-templates-page.component.*`
- 已创建模板新增编辑页 `src/app/features/agents/agent-template-form-page.component.*`
- 已创建声纹列表页 `src/app/features/agents/agent-voice-prints-page.component.*`
- 已创建 `AgentService` 与接口模型
- 已创建 `AgentTemplateService` 与模板接口模型
- 已创建 `AgentVoicePrintService` 与声纹接口模型
- 已接入管理员智能体分页列表、详情、更新、删除与按设备保存记忆接口骨架
- 已接入模板分页列表、详情、创建、更新与删除接口骨架
- 已接入按智能体查询声纹列表、新增、更新与删除接口骨架
- 当前列表筛选字段：本地关键词（名称、编码、语种、模型 ID）
- 已规划详情页 Tab 结构：基础信息 / 提示词与记忆 / 扩展配置
- 已在智能体编辑页实现插件映射、上下文源结构化编辑
- 已在智能体详情页扩展配置 Tab 中展示插件映射与上下文源明细
- 已在声纹页实现查询、新增、编辑、删除一体化操作
- 已为智能体编辑页与模板表单接入 `language` / `langCode` 字典下拉，当前映射字典编码分别为 `language` / `langCode`
- 智能体编辑页与模板表单已复用 `DictOptionsService.loadOptionsIntoSignal` 收敛字典选项加载逻辑
- 模板表单已复用共享样式骨架 `src/app/shared/form-page.shared.css`
