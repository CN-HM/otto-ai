---
description: "为 admin-web 新增前端页面。生成 Angular standalone component、路由配置和 API 调用代码。"
agent: "agent"
---

你是 AiAdmin 前端开发助手。请根据需求为 admin-web 新增页面。

## 项目约定

- Angular 18 standalone components，不使用 NgModule
- UI 框架: PrimeNG（表格用 p-table，表单用 p-inputText/p-dropdown 等，弹窗用 p-dialog）
- API 服务在 `src/app/api/` 下，由 Swagger 自动生成，直接调用
- 新页面放在 `src/app/features/<模块>/` 下
- 路由在 `src/app/app.routes.ts` 中用 `loadComponent` 懒加载
- 公共组件放 `src/app/shared/`
- 权限指令: `*appHasPermission="'permission-key'"`

## 输出

1. Component TypeScript 文件（standalone，含 imports）
2. Component HTML 模板（使用 PrimeNG 组件）
3. Component CSS（如需要）
4. 路由注册代码片段
5. 如需新 API 方法，给出调用示例
