# API 命名与版本约定

## 后端 API 路径规范

前端所有 API 路径由后端（AI-esp32-server）定义，前端 Service 层直接镜像后端路径，不做额外转换。

### 路径前缀分类

| 前缀 | 用途 | 示例 |
|------|------|------|
| `/user/*` | 用户认证与公共配置 | `/user/login`, `/user/pub-config`, `/user/captcha` |
| `/admin/*` | 管理员操作（需管理员权限） | `/admin/users`, `/admin/params`, `/admin/dict/*` |
| `/agent/*` | 智能体、模板、声纹 | `/agent/{id}`, `/agent/template`, `/agent/voice-print` |
| `/device/*` | 设备管理 | `/device/provisioning/issue`, `/device/unbind`, `/device/manual-add` |
| `/models/*` | 模型供应器与模型配置 | `/models/provider`, `/models/list` |
| `/datasets/*` | 知识库 | `/datasets`, `/datasets/{id}/retrieval-test` |
| `/otaMag/*` | OTA 固件管理 | `/otaMag`, `/otaMag/upload` |
| `/ttsVoice/*` | 音色管理 | `/ttsVoice`, `/ttsVoice/{id}`, `/ttsVoice/delete` |
| `/voiceClone/*` | 声音克隆 | `/voiceClone/upload`, `/voiceClone/cloneAudio` |
| `/voiceResource` | 音色资源 | `/voiceResource` |

### 命名风格

后端路径混合使用 camelCase（`/ttsVoice`、`/voiceClone`）和 kebab-case（`/manual-add`、`/voice-print`），前端保持一致不做转换。

## 前端 API 调用约定

### Base URL

通过环境配置 `environment.apiBaseUrl` 统一设定，由 `apiBaseUrlInterceptor` 自动拼接：

```
相对路径请求：  /user/login
实际发出请求：  {apiBaseUrl}/user/login
绝对路径请求：  https://xxx  → 不拼接，直接使用
```

### Service 层路径规范

- 每个功能模块有独立的 `*.service.ts`，通过 `ApiClientService` 发起请求
- 路径以 `/` 开头，与后端 API 文档保持一致
- 动态参数使用模板字符串：`` `/agent/${id}` ``

### 无版本前缀

后端 API 不使用版本前缀（如 `/v1/`、`/v3/`），前端同样不拼接版本号。

## OpenAPI 文档版本管理

OpenAPI 规范文件存放于 `src/api-json/` 目录，当前采用“最新快照 + 历史归档”策略：

```
src/api-json/-api-latest.json
src/api-json/archive/-api-<version>-<stamp>.json
```

- `api-latest.json` 始终表示当前最新 Swagger 快照
- 历史版本会在内容变化时自动归档到 `archive/`
- 当前生成脚本会直接读取 `api-latest.json` 并生成 Kiota 客户端

## 安全相关

- 登录密码通过 **SM2 非对称加密** 传输，SM2 公钥从 `/user/pub-config` 动态获取
- 加密格式：`sm2Encrypt(publicKey, captcha + password)`，密文以 `"04"` 前缀标识未压缩公钥点
- 认证 Token 通过 `authTokenInterceptor` 自动附加到请求头
