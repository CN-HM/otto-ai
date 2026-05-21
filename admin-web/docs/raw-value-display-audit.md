# 原始值展示问题审计

> 统计时间：2026-03-15
> 说明：列举前端页面中直接展示原始 ID / 枚举数字 / 编码，而非可读标签的情况，按优先级分类。

---

## 🔴 高优先级（对用户造成直接困惑）

### 1. 音色列表页 `voices-page`
| 字段 | 当前展示 | 应展示 | 数据来源 |
|------|---------|--------|---------|
| `ttsModelId` | 原始 ID（如 `TTS_DoubaoTTS`） | 模型名称 | `ModelConfigService.getConfigsByType('TTS')` |

文件：`src/app/features/voices/list/voices-page.component.html` L59, L74

---

### 2. 模型配置列表页 `model-configs-page`
| 字段 | 当前展示 | 应展示 | 数据来源 |
|------|---------|--------|---------|
| `modelType` | 原始枚举（`LLM`、`TTS` 等） | 可读标签（大语言模型、语音合成等） | 本地静态映射 |
| `providerCode` | 原始编码（如 `DoubaoLLM`） | 供应器名称 | 已有 `linkedProviderName()` 可复用 |

文件：`src/app/features/models/configs/model-configs-page.component.html` L72-74, L90-91

---

### 3. 模型供应器列表页 `model-providers-page`
| 字段 | 当前展示 | 应展示 | 数据来源 |
|------|---------|--------|---------|
| `modelType` | 原始枚举标签（`p-tag` 已包裹但值为原始码） | 可读标签 | 本地静态映射 |
| `providerCode` | 原始编码 | — （可保留，系统管理员用） | — |

文件：`src/app/features/models/providers/model-providers-page.component.html` L52-53, L70

---

### 4. 字典数据页 `dict-data-page`
| 字段 | 当前展示 | 应展示 | 数据来源 |
|------|---------|--------|---------|
| `dictTypeId` | 原始 ID（展开行） | 字典类型名称（`dictName`） | 已有 `dictTypes()` signal 可查 |

文件：`src/app/features/system/dict-data/dict-data-page.component.html` L73

---

### 5. 系统参数页 `system-params-page`
| 字段 | 当前展示 | 应展示 | 数据来源 |
|------|---------|--------|---------|
| `valueType` | 原始字符串（如 `string`、`int`） | 可读标签（字符串、整数等） | 字典 `valueType` 或本地静态映射 |

文件：`src/app/features/system/params/system-params-page.component.html` L60

---

## 🟡 中优先级（影响阅读，但字段本身有一定可读性）

### 6. 智能体列表页 `agents-page` ✅ 已修复
- `llmModelId`、`ttsVoiceId`、展开行模型字段 → 已改为 `resolveModelName()`

### 7. 智能体详情页 `agent-detail-page` ✅ 已修复
- 所有模型 ID 字段 → 已改为 `resolveModelName()`

### 8. 模板列表页 `agent-templates-page` ✅ 已处理
- 接口已返回 `llmModelName`、`ttsModelName`，已用 `|| id` 降级

### 9. 字典类型页 `dict-types-page`
| 字段 | 当前展示 | 应展示 |
|------|---------|--------|
| `dictType` | 原始类型码（如 `langCode`） | — （属于系统管理内容，技术人员使用，可接受） |

文件：`src/app/features/system/dict-types/dict-types-page.component.html` L62

---

## 🟢 低优先级（技术管理页面，面向管理员，原始值可接受）

### 10. 模型配置表单页 `model-config-form-page`
- `isEnabled`、`isDefault` 已有下拉选项（启用/禁用），无问题

### 11. 设备详情页 `device-detail-page`
| 字段 | 当前展示 | 应展示 |
|------|---------|--------|
| `deviceType` | 原始型号字符串 | — （硬件型号本身即为可读值） |
| `autoUpdate` | 已有下拉（开启/关闭）| ✅ 已处理 |

### 12. 设备列表页 `devices-page`
| 字段 | 当前展示 | 应展示 |
|------|---------|--------|
| `otaUpgrade` | 已有 `otaLabel()` 转换 | ✅ 已处理 |
| `deviceType` | 原始型号字符串 | — （可接受） |

---

## 📋 待处理汇总

| # | 页面 | 字段 | 优先级 | 方案 |
|---|------|------|--------|------|
| 1 | `voices-page` | `ttsModelId` | 🔴 高 | 注入 `ModelConfigService`，建立 `idToName` Map |
| 2 | `model-configs-page` | `modelType` | 🔴 高 | 本地静态 `modelTypeLabel()` 方法 |
| 3 | `model-providers-page` | `modelType` | 🔴 高 | 同上 |
| 4 | `dict-data-page` | `dictTypeId` 展开行 | 🔴 高 | 用已有 `dictTypes()` signal 做 id→name 查找 |
| 5 | `system-params-page` | `valueType` | 🟡 中 | 本地静态 `valueTypeLabel()` 方法 |
| 6 | `dict-types-page` | `dictType` | 🟢 低 | 技术页面，暂不处理 |
| 7 | `model-providers-page` | `providerCode` | 🟢 低 | 技术页面，暂不处理 |

---

## 已完成项

- ✅ `agents-page`：`llmModelId`、`ttsVoiceId`、展开行模型字段
- ✅ `agent-detail-page`：全部模型 ID 字段 + `chatHistoryConf` 标签
- ✅ `agent-form-page`：`chatHistoryConf` 改为枚举下拉，`sort` 改为 number
- ✅ `agent-template-form-page`：同上
