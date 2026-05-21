# AI Admin — 移动端适配方案

> 文档版本：v1.1 | 2026-03-15 | **状态：已全部落地**

---

## 一、现状分析

### 1.1 基础设施

| 项目 | 状态 | 说明 |
|------|------|------|
| `viewport` meta | ✅ 已设置 | `width=device-width, initial-scale=1` |
| `box-sizing` | ✅ 全局 `border-box` | `styles.css` |
| CSS 变量体系 | ✅ 完善 | 颜色、间距均通过 CSS 变量管理 |
| PrimeNG 组件库 | ✅ 内置响应式 | `p-table` 支持 `responsiveLayout`，`p-card` 自适应 |

### 1.2 现有断点使用情况

| 断点 | 使用位置 | 覆盖内容 |
|------|----------|----------|
| `960px` | `admin-shell`、各列表页、详情页、表单页 | 侧边栏折叠为全宽、grid 降为单列、hero 纵向排列 |
| `1100px` | `form-detail-layout`、`list-detail-layout`、dashboard metrics/panels | 双栏 → 单列 |
| `1200px` | `search-filter-card` | 筛选表单网格 → 单列 |
| `768px` | dashboard | hero 缩小 padding、quick-actions 改为 2 列 |
| `720px` | `pagination-bar` | 分页栏纵向堆叠 |

### 1.3 已发现的移动端问题

#### P0 — 布局阻断（影响可用性）

1. **侧边栏始终显示**：≤960px 时 sidebar 变为全宽块级元素直接展示在页面顶部，占据大量屏幕空间，每次页面访问都必须滚过导航区才能看到内容。缺少汉堡菜单/抽屉式收起机制。
2. **数据表格横向溢出**：`p-table` 列数较多时（智能体、设备、OTA、知识库文档等），在 <768px 屏幕上水平溢出，部分列不可见且无法滚动到。
3. **表单双列网格未降级**：`agent-form`（`grid-template-columns: repeat(2, …)`）、`ota-form` 等在窄屏时仍保持双列，输入框宽度被严重压缩。

#### P1 — 体验粗糙

4. **page-hero 操作按钮溢出**：hero-actions 在窄屏下水平排列，按钮文字截断。
5. **header 操作栏拥挤**：shell-header-actions（用户名 tag + 修改密码 + 退出登录）在手机上换行效果差。
6. **表格行操作菜单触控不友好**：操作按钮偏小，缺少触控安全区。
7. **padding 偏大**：shell-content 的 `padding: 0 2rem 2rem` 在手机上浪费空间。

#### P2 — 细节优化

8. **auth 页面（登录/注册/找回密码）**：双栏 hero+card 布局在手机上已降级为单列，但 hero 区文字过长、padding 偏大。
9. **metric-card 字体过大**：`font-size: 1.8rem` 在小屏上显得突兀。
10. **标签管理 tag-chips 换行后间距不均**。

---

## 二、适配策略

### 2.1 设计原则

- **Mobile-friendly，非 Mobile-first**：本项目是后台管理系统，桌面端为主要使用场景。移动端确保可用即可，不追求完美。
- **渐进增强**：仅通过 CSS media query + 少量 TS 信号控制，不引入新依赖。
- **统一断点**：规范为 3 档，减少碎片化。

### 2.2 统一断点定义

```
/* 大屏（默认）：> 1100px — 完整双栏/多列 */
/* 中屏平板：  ≤ 1100px — 表单/详情 双栏→单列 */
/* 小屏手机：  ≤ 768px  — 侧边栏抽屉、表格滚动、全面单列 */
```

现有 `960px` 断点归并到 `768px`（真正手机尺寸）或 `1100px`（平板），避免在 768–960 之间出现不必要的中间态。

---

## 三、改造清单

### 3.1 全局 Shell（`admin-shell`）

| 改动 | 说明 |
|------|------|
| 侧边栏改为抽屉 | ≤768px 时 sidebar 默认隐藏，添加汉堡按钮在 header 左侧，点击展开/收起侧边栏（overlay 抽屉模式） |
| header 操作栏精简 | ≤768px 时隐藏按钮文字，仅保留图标；用户名 tag 缩短 |
| content padding 缩小 | ≤768px 时 `padding: 0 0.75rem 1rem` |

**TS 变更**：`admin-shell.component.ts` 添加 `sidebarOpen = signal(false)` + `toggleSidebar()` 方法。

**CSS 变更**：
```css
@media (max-width: 768px) {
  .shell-layout { grid-template-columns: 1fr; }
  .shell-sidebar {
    position: fixed; inset: 0; z-index: 1000;
    transform: translateX(-100%);
    transition: transform 0.3s ease;
    width: 280px;
  }
  .shell-sidebar.is-open { transform: translateX(0); }
  .shell-sidebar-overlay {
    position: fixed; inset: 0; z-index: 999;
    background: rgba(0,0,0,0.5);
  }
  .shell-content { padding: 0 0.75rem 1rem; }
  .shell-header { padding: 1rem 0.75rem 0.5rem; }
  .shell-hamburger { display: flex; }
}
```

**HTML 变更**：添加汉堡按钮和遮罩层。

### 3.2 数据表格

| 改动 | 说明 |
|------|------|
| 启用 PrimeNG `responsiveLayout="scroll"` | 所有 `p-table` 统一添加，允许横向滚动 |
| ≤768px 隐藏次要列 | 使用 CSS `display: none` 隐藏优先级低的列（如创建时间、更新时间等），减少列数 |
| 触控友好化 | 操作按钮最小尺寸 44×44px |

### 3.3 表单页

| 改动 | 说明 |
|------|------|
| 双列 → 单列 | `agent-form`、`ota-form` 等在 ≤768px 时 `grid-template-columns: 1fr` |
| `form-grid` 双栏 → 单列 | `grid-template-columns: 1.2fr 0.8fr` 在 ≤768px 降为 `1fr` |
| textarea 行数适配 | 保持不变，移动端宽度足够后高度自然合理 |

### 3.4 page-hero

| 改动 | 说明 |
|------|------|
| ≤768px 缩小 padding | `padding: 1rem` |
| hero-actions 堆叠 | `flex-direction: column; width: 100%` |
| 隐藏长描述文案 | ≤768px `display: none` 或缩短 |

### 3.5 Auth 页面（登录/注册/找回密码）

| 改动 | 说明 |
|------|------|
| 已有 ≤960px 降级 | 改为 ≤768px 断点 |
| hero 区精简 | 隐藏段落描述，只保留标题 |
| card 宽度自适应 | `min-width: 0` 防溢出 |

### 3.6 Dashboard

| 改动 | 说明 |
|------|------|
| quick-actions | ≤768px 改为 `repeat(2, 1fr)` ✅ 已有 |
| metrics | ≤768px 改为 `repeat(2, 1fr)` 而非完全单列 |
| panels | 保持单列 |

### 3.7 共享组件

| 组件 | 改动 |
|------|------|
| `pagination-bar` | ≤720px 已纵向堆叠 ✅，无需改动 |
| `search-filter-card` | ≤768px 强制单列 ✅ 基本 OK |
| `form-detail-layout` / `list-detail-layout` | ≤1100px 已降级 ✅ |

---

## 四、文件影响范围

### 必须改动的文件

| 文件 | 改动类型 |
|------|----------|
| `admin-shell.component.html` | 添加汉堡按钮 + overlay 遮罩 |
| `admin-shell.component.ts` | 添加 `sidebarOpen` signal |
| `admin-shell.component.css` | 侧边栏抽屉 + 768px 全面适配 |
| `styles.css` | 全局表格/触控优化 |

### 批量改动的文件（CSS 追加 media query）

| 类别 | 文件数量 | 改动内容 |
|------|----------|----------|
| 列表页 CSS | ~12 | 统一 960px→768px，metrics 2 列 |
| 表单页 CSS | ~8 | 表单网格 768px 降为单列 |
| 详情页 CSS | ~6 | detail-list 768px 单列 |
| Auth 页 CSS | 4 | 断点 960px→768px |
| shared CSS | 3 | `form-page.shared.css` / `list-page.shared.css` hero 适配 |

**预计修改 ~35 个 CSS 文件，2 个 TS 文件，1 个 HTML 文件。**

---

## 五、实施顺序

| 阶段 | 内容 | 优先级 | 状态 |
|------|------|--------|------|
| **Phase 1** | Shell 侧边栏抽屉化（P0 核心阻断问题） | 🔴 | ✅ 已完成 |
| **Phase 2** | 全局断点归并 + shared CSS 基础适配 | 🔴 | ✅ 已完成 |
| **Phase 3** | 数据表格横向滚动 + 触控优化 | 🟡 | ✅ 已完成 |
| **Phase 4** | 表单页 / 详情页 / Auth 页逐一适配 | 🟡 | ✅ 已完成（合并入 Phase 2） |
| **Phase 5** | Dashboard / 细节打磨（触控安全区、字体微调） | 🟢 | ✅ 已完成 |

---

## 六、验证方式

1. Chrome DevTools 设备模拟：iPhone SE（375px）、iPhone 14（390px）、iPad Mini（768px）
2. 核验清单：
   - [ ] 侧边栏不阻挡内容，抽屉可收起
   - [ ] 数据表格可横向滚动，不溢出容器
   - [ ] 表单输入框宽度合理，不被截断
   - [ ] 所有按钮可触控（≥44px 热区）
   - [ ] Auth 页面在手机上完整可用
   - [ ] 分页栏正常堆叠
   - [ ] 无水平溢出导致的全页横向滚动

---

## 七、不纳入本次范围

- PWA / Service Worker
- 原生 App 壳（Capacitor / Cordova）
- 移动端专属交互（下拉刷新、手势导航）
- 深色/浅色模式切换（当前仅深色）
