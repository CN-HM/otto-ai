---
description: "Use when editing docker-compose.yml, Dockerfile, or deployment configuration files. Covers config-as-file pattern and production deployment."
applyTo: ["**/docker-compose.yml", "**/Dockerfile"]
---

# 部署配置规范

## 配置管理

- 不使用环境变量注入密钥
- 通过 `appsettings.{Environment}.json` 分环境管理配置
- `appsettings.Production.json` 已 gitignore，部署时通过 Docker volume 挂载
- Docker Compose 中用 `volumes` 挂载配置文件（`:ro` 只读）

## Docker

- 基础镜像: `mcr.microsoft.com/dotnet/sdk:10.0`（构建）+ `mcr.microsoft.com/dotnet/aspnet:10.0`（运行）
- 多阶段构建：build → runtime
- 生产环境设置 `ASPNETCORE_ENVIRONMENT=Production`
