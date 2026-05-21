# 部署模块

## 部署策略

- 默认采用 Docker 部署
- 构建产物通过 Nginx 提供静态服务
- 后续可根据环境补充反向代理与环境变量注入方案

## 当前文件

- `Dockerfile`
- `.dockerignore`
- `.docker/nginx/default.conf`
- `docker-compose.yml`

## 当前实现说明

- `Dockerfile` 使用两阶段构建
  - 第一阶段基于 `node:20-alpine` 执行 `npm install` 与 `npm run build`
  - 第二阶段基于 `nginx:1.27-alpine` 托管前端静态资源
- 构建产物目录为 `dist/AI-admin-web/browser`
- `docker-compose.yml` 默认将宿主机 `8080` 端口映射到容器 `80` 端口
- `.docker/nginx/default.conf` 已包含前端路由回退配置：`try_files $uri $uri/ /index.html;`
- `.docker/nginx/default.conf` 会将 `//` 反向代理到 `http://admin-api:8080//`

## 前置条件

- 已安装 Node.js 20+
- 已安装 npm
- 若使用容器部署，已安装 Docker
- 若使用 `docker-compose.yml`，已安装 Docker Compose 或 `docker compose`

## 本地开发启动

在项目根目录执行：

```bash
npm install
npm start
```

默认访问地址：

```text
http://localhost:4300
```

## 本地构建验证

在项目根目录执行：

```bash
npm install
npm run build
```

构建完成后，产物输出到：

```text
dist/AI-admin-web/browser
```

## Docker 镜像构建

在项目根目录执行：

```bash
docker build -t AI-admin-web:latest .
```

构建成功后可通过以下命令运行：

```bash
docker run --rm -p 8080:80 AI-admin-web:latest
```

默认访问地址：

```text
http://localhost:8080
```

## Docker Compose 启动

在项目根目录执行：

```bash
docker compose up --build -d
```

如果本地环境仍使用旧版命令，也可执行：

```bash
docker-compose up --build -d
```

查看运行状态：

```bash
docker compose ps
```

停止服务：

```bash
docker compose down
```

默认访问地址：

```text
http://localhost:8080
```

## Nginx 路由说明

- 当前 Nginx 配置已支持 Angular 前端路由刷新不返回 404
- 当前配置会将 `//` 请求反向代理到 `admin-api:8080`
- 因而生产环境 `apiBaseUrl` 使用相对路径 `/`
- 如果单独启动 `admin-web/docker-compose.yml`，需要自行提供可解析的 `admin-api` 上游主机

## 当前限制

- 尚未提供多环境构建参数注入方案
- 尚未提供 CI/CD 自动部署流程

## 后续可扩展项

- 多环境部署说明
- API 反向代理策略
- CI/CD 流程说明
