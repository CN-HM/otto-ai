---
description: "Use when editing Angular TypeScript, HTML, or CSS files in admin-web. Covers standalone components, PrimeNG usage, and routing patterns."
applyTo: "admin-web/src/**/*.{ts,html,css}"
---

# admin-web Angular 编码规范

## Component

- Angular 18 standalone components，不使用 NgModule
- UI 框架: PrimeNG，优先使用 PrimeNG 组件
- 按业务模块组织: `src/app/features/<模块>/`
- 公共代码: `src/app/shared/`（组件、指令、管道）
- 核心服务: `src/app/core/`（认证、HTTP 拦截器）

## API

- API 层在 `src/app/api/` 下，由 `scripts/api-codegen.mjs` 从 Swagger 生成
- 不要手动修改 `src/app/api/` 下的文件，运行 `npm run api:generate` 重新生成

## 路由

- `src/app/app.routes.ts` 中用 `loadComponent` 懒加载
- 权限指令: `*appHasPermission="'permission-key'"`
