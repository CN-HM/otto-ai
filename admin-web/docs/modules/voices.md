# 音色中心模块

## 模块范围

- 音色管理
- 音色资源管理
- 声音克隆

## 相关接口

- `/ttsVoice`
- `/ttsVoice/{id}`
- `/ttsVoice/delete`
- `/voiceResource`
- `/voiceClone/upload`
- `/voiceClone/updateName`
- `/voiceClone/cloneAudio`
- `/voiceClone/audio/{id}`

## 页面规划

- 音色列表
- 音色编辑
- 音色资源列表
- 声音克隆上传页
- 试听与下载

## 风险点

- 已创建音色列表页 `src/app/features/voices/voices-page.component.*`
- 已创建音色新增编辑页 `src/app/features/voices/voice-form-page.component.*`
- 已创建音色资源列表页 `src/app/features/voices/voice-resources-page.component.*`
- 已创建声音克隆工作台页 `src/app/features/voices/voice-clone-page.component.*`
- 已创建 `VoiceService` 与接口模型
- 已接入音色分页查询、创建、更新、删除、音色资源分页与声音克隆基础操作接口骨架
- 已在音色资源列表页补充音频下载 ID 获取与 `play/{uuid}` 试听骨架
- 已将声音克隆上传统一切换为显式 `FormData` helper，并增加 `voiceFile=<文件名>` query 兼容
- 已在声音克隆上传的 `FormData` body part 中显式附带文件名，贴近常见后端 multipart 解析要求
- 已为声音克隆上传补充 `fileName` / `originalFilename` 文本字段冗余，并扩展上传结果对 `audioId` / `audioUrl` / `downloadUrl` 等别名的兼容解析
- 已补声音克隆上传返回值兼容，支持字符串、对象与嵌套对象结果显示
- 当前列表筛选字段：`ttsModelId` / `name` / `page` / `limit`
- 已为音色表单 `languages` 字段接入字典下拉，当前映射字典编码为 `languages`
- 音色表单已复用 `DictOptionsService.loadOptionsIntoSignal` 收敛字典选项加载逻辑
- 音色表单已复用共享样式骨架 `src/app/shared/form-page.shared.css`
- 上传接口请求格式需要联调确认
- 音频下载与试听能力需要明确鉴权方式
