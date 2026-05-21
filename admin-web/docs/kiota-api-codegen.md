# Admin Web Kiota API 生成流程

## 当前标准入口

- `npm run api:generate`

## 前置条件

- `admin-api` 已启动
- Swagger 地址可访问：`http://localhost:8002//swagger/v1/swagger.json`
- 本机已安装 `kiota`

## 生成产物

- `src/api-json/-api-latest.json`
- `src/api-json/archive/` 下的历史快照
- `src/app/api/kiota/` 下的 Kiota TypeScript client

## 生成流程

1. 从本地 `admin-api` 下载最新 OpenAPI JSON
2. 如 `api-latest.json` 发生变化，则归档上一份快照
3. 使用 Kiota 生成 `src/app/api/kiota/`，脚本会自动按顶层 path group 传入 `--include-path`，规避 Kiota TypeScript 在完整 spec 上的已知生成问题

## 说明

- `src/app/api/kiota/` 是当前 Kiota 标准产物目录
- `scripts/api-generate.mjs` 当前负责下载/归档 OpenAPI，并调用 Kiota 生成 TypeScript client
- 当前业务层不再依赖 `src/app/api/services/` 兼容层

## 常用命令

```bash
npm run api:generate
```
