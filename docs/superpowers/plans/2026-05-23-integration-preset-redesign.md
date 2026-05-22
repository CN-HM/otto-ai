# Integration Preset Redesign Plan

> 状态: 设计阶段 | 日期: 2026-05-23

## Context

binding-configs `/integration/new` 页面目前始终空白初始化，用户需手动为三大云平台（火山方舟、豆包语音、阿里百炼）填写所有字段。已有的种子数据被注释且过时。本次改造增加"预设平台 / 自定义配置"模式选择，同时将 **接口自动生成** 和 **多语言** 纳入项目规范。

---

## 设计概览

```
┌─────────────────────────────────────────────────┐
│  /binding-configs/integration/new               │
│                                                 │
│  ┌── 配置模式：○ 预设平台  ○ 自定义配置 ──────┐  │
│  │  选择预设平台：▼ [火山方舟]                │  │
│  └────────────────────────────────────────────┘  │
│                                                 │
│  ┌── 表单 (form-shell) ────────────────────────┐ │
│  │  编码: [auto]  名称: [火山方舟]  ← 预填     │ │
│  │  Provider Type: [火山方舟] [disabled]       │ │
│  │  应用范围: [ASR ✓] [TTS ✓] [LLM ✓] [Emb ✓] │ │
│  │  主连接地址: [https://ark.cn-beijing...]    │ │
│  │  模型: [doubao-seed-1-6-251015]             │ │
│  │  API Key: [_______________] ← 用户填写密钥   │ │
│  │  ...                                        │ │
│  └──────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

模式选择器仅在**新建页面**显示，编辑页面不显示。

---

## 1. 预设数据源：种子数据即预设

### 方案演进

| 版本 | 方案 | 问题 |
|---|---|---|
| v1 | Service 硬编码 | 不可维护，改预设需重编译 |
| v2 | JSON 配置文件 | 与种子数据重复定义，两个数据源需保持同步 |
| **v3** | **种子数据即预设，API 查 DB** | 单一数据源，无需额外配置文件 |

**核心思路**: 种子数据创建 3 条内置集成记录 → `GET /integration-presets` 直接查询这些记录并映射为 preset DTO 返回。增删预设只需修改种子数据文件，无需改其他代码。

### 1.1 种子数据重写

**文件**: `admin-api/Data/AiAdminDataSeeder.cs`
- 取消注释: `await SeedProviderIntegrations();`

**文件**: `admin-api/Data/AiAdminDataSeeder.ProviderIntegrations.cs`
- 完全重写，3 条内置集成记录：

| 固定 ID | Code | Name | ProviderType | Scopes | Sort | IsDefault |
|---|---|---|---|---|---|---|
| `INTEGRATION_ArkDefault` | `ArkDefault` | 火山方舟 | ark | ASR+LLM+TTS+Emb | 1 | true |
| `INTEGRATION_DoubaoSpeechDefault` | `DoubaoSpeechDefault` | 豆包语音 | doubao_speech | ASR+TTS | 2 | false |
| `INTEGRATION_DashScopeDefault` | `DashScopeDefault` | 阿里百炼 | dashscope | LLM+TTS+Emb | 3 | false |

- 所有密钥字段（apiKey, secretKey, appId, accessToken）留空
- 使用 `PreserveCurrentValue()` 保留用户已填写的密钥（重启不覆盖）
- 清理配置中已移除的旧 ID（保留 `BuiltInProviderIntegrationIds` 机制）

> **无需新增 DB 列**。Integration 的 preset 字段全部来自 `AiProviderIntegration` 现有列：`Name`、`ProviderType`、`SupportsAsr/Tts/Llm/Mem`。`PrimaryEndpoint` / `PrimaryModel` 是 Profile 级别字段，不在 integration 表单中展示。

### 1.2 新增 DTO: `IntegrationPresetDto`

**文件**: `admin-api/Services/BindingConfigs/Dtos/IntegrationPresetDto.cs`

```csharp
public class IntegrationPresetDto
{
    public string PresetKey { get; set; } = string.Empty;   // 来自 ProviderType
    public string Name { get; set; } = string.Empty;        // 来自 DB name
    public string Description { get; set; } = string.Empty; // 来自 DB description
    public string ProviderType { get; set; } = string.Empty;
    public bool SupportsAsr { get; set; }
    public bool SupportsTts { get; set; }
    public bool SupportsLlm { get; set; }
    public bool SupportsMem { get; set; }
    public List<string> AuthFields { get; set; } = [];      // 业务规则，由 providerType 决定
}
```

### 1.3 新增端点: `GET /admin/binding-configs/integration-presets`

**文件**: `admin-api/Controllers/BindingConfigController.cs`

- 权限: `agent-role:list`
- 调用 `BindingConfigService.GetIntegrationPresetsAsync()`

### 1.4 Service 方法

**文件**: `admin-api/Services/BindingConfigs/BindingConfigService.cs`

```csharp
public async Task<List<IntegrationPresetDto>> GetIntegrationPresetsAsync(CancellationToken cancellationToken)
{
    // 查询内置集成记录（通过固定 ID 或 IsDefault 标记识别）
    var builtInIds = new[] {
        "INTEGRATION_ArkDefault",
        "INTEGRATION_DoubaoSpeechDefault",
        "INTEGRATION_DashScopeDefault"
    };

    var integrations = await _db.AiProviderIntegrations
        .AsNoTracking()
        .Where(x => builtInIds.Contains(x.Id) && x.Status == "active")
        .OrderBy(x => x.Sort)
        .ToListAsync(cancellationToken);

    return integrations.Select(MapToPresetDto).ToList();
}

private static IntegrationPresetDto MapToPresetDto(AiProviderIntegration integration)
{
    var providerType = ProviderTypeConverter.ToStorageValue(integration.ProviderType);
    return new IntegrationPresetDto
    {
        PresetKey = providerType,
        Name = integration.Name,
        Description = integration.Description ?? "",
        ProviderType = providerType,
        SupportsAsr = integration.SupportsAsr,
        SupportsTts = integration.SupportsTts,
        SupportsLlm = integration.SupportsLlm,
        SupportsMem = integration.SupportsMem,
        AuthFields = ResolveAuthFields(providerType)
    };
}

// AuthFields 仍由 providerType 决定（字段映射逻辑，非数据）
private static List<string> ResolveAuthFields(string providerType) => providerType switch
{
    "ark" => ["apiKey"],
    "doubao_speech" => ["appId", "accessToken", "secretKey"],
    "dashscope" => ["apiKey"],
    _ => []
};
```

- 预设的**数据**（名称、描述、端点、模型、作用域）从 DB 种子记录读取
- `AuthFields` 属于**业务规则**（哪种平台用哪些鉴权字段），保留在 Service 层映射逻辑中，属于 providerType → fields 的固定映射

---

## 2. 前端设计

### 2.1 代码生成流程（新增规范）

**规范**: 前端 API 接口层代码**必须由自动化工具生成**，禁止手动编辑 HTTP 请求方法。

**执行流程**:
1. 后端新增/修改 Controller 端点
2. 启动 `admin-api`，确保 Swagger 可访问
3. 运行 `npm run api:generate`（调用 Kiota，产出到 `src/app/api/kiota/`）
4. 前端页面组件通过**自动生成的 Kiota client**调用接口，不手写 HTTP 调用

**受影响的文件**:
- `admin-web/src/app/features/binding-configs/shared/binding-config.service.ts`
  - 当前使用 `ApiClientService` 手写 HTTP → 需改为注入 Kiota 生成的 `BindingConfigApiClient` 或在其基础上包装
  - 新增的 `getIntegrationPresets()` 方法来自 Kiota 生成的代码，不在 service 中手写 HTTP URL

**此规范将写入**: `admin-web/docs/development.md` 第 6 节

### 2.2 多语言设计（新增规范）

**当前 i18n 基础设施**:
- `admin-web/src/assets/locales/zh-Hans.json` / `zh-TW.json`
- `I18nService` + `translate` pipe + `domI18n` directive
- `scripts/i18n-sync-ui-text.mjs` — 自动扫描 `.ts`/`.html` 中的中文文本并同步到 `uiText` 映射

**预设多语言设计**:
- 预设的显示名称（如"火山方舟"）通过 presetKey 构造 i18n key: `preset.{presetKey}.name`、`preset.{presetKey}.description`
- 在 `zh-Hans.json` 中新增 `"preset"` 命名空间:
  ```json
  "preset": {
    "ark": { "name": "火山方舟", "description": "火山引擎豆包大模型平台..." },
    "doubao_speech": { "name": "豆包语音", "description": "火山引擎豆包语音平台..." },
    "dashscope": { "name": "阿里百炼", "description": "阿里云 DashScope 百炼平台..." }
  }
  ```
- `zh-TW.json` 中提供对应的繁体翻译
- 模板中的 `configModeOptions` 标签（"预设平台"、"自定义配置"）使用 `translate` pipe: `{{ 'preset.mode.preset' | translate }}`

**种子数据多语言考量**:
- 数据库种子数据保存默认语言（zh-Hans）的名称
- 前端列表/详情展示时，对于内置集成（可通过 `Code` 前缀或特殊标记识别），优先使用 i18n key 渲染名称
- 用户自定义集成的名称直接显示数据库值

**此规范将写入**: `admin-web/docs/development.md` 第 7 节

### 2.3 新增模型

**文件**: `admin-web/src/app/features/binding-configs/shared/binding-config.models.ts`

```typescript
export interface IntegrationPreset {
  presetKey: string;
  name: string;
  description: string;
  providerType: string;
  supportsAsr: boolean;
  supportsTts: boolean;
  supportsLlm: boolean;
  supportsMem: boolean;
  authFields: string[];
}
```

### 2.4 表单页面改造

**文件**: `admin-web/src/app/features/binding-configs/form/binding-config-form-page.component.ts`

**新增 Signals**:
```typescript
readonly presets = signal<IntegrationPreset[]>([]);
readonly configMode = signal<'preset' | 'custom'>('preset');
readonly selectedPresetKey = signal<string>('');
readonly selectedPreset = computed(() => ...);
```

**新增 Methods**:
- `loadPresets()` — 调用 Kiota 自动生成的 API client 获取预设列表
- `applyPreset()` — 将选中预设的字段 patch 到 form
- `isProviderTypeLocked()` — 预设模式下锁定 ProviderType 下拉

**UI 交互逻辑**:

| 状态 | 行为 |
|---|---|
| `configMode === 'preset'` | 显示平台选择下拉 → 选择后自动填充表单 → ProviderType 锁定 |
| `configMode === 'custom'` | 隐藏平台选择 → 所有字段空白可编辑 → ProviderType 可切换 |
| `isEdit() === true` | 整个预设区域不渲染 |

**模板新增区域**（在 `<form class="form-shell">` 之前）:
```html
@if (meta()?.supportsProviderType && !isEdit()) {
  <div class="config-mode-bar">
    <span>{{ 'preset.mode.label' | translate }}</span>
    <p-select [options]="configModeOptions" [(ngModel)]="configMode" ... />
  </div>

  @if (configMode() === 'preset') {
    <div class="preset-selector">
      <p-select [options]="presetOptions()" [(ngModel)]="selectedPresetKey"
                (ngModelChange)="applyPreset()" placeholder="选择预设平台..." />
    </div>
  }
}
```

**ProviderType p-select 修改**:
- 添加 `[disabled]="isProviderTypeLocked()"` 属性
- 新建页面：预设模式下锁定，自定义模式可切换
- 编辑页面：始终可切换（预设区域不显示）

### 2.5 CSS

**文件**: `admin-web/src/app/features/binding-configs/form/binding-config-form-page.component.css`

新增样式:
```css
.config-mode-bar { /* flex row, surface-ground bg, border-radius, gap */ }
.preset-selector { /* margin-top */ }
```

---

## 3. 数据库

**无 schema 变更**。现有的 `ai_provider_integration` 表已包含所有需要的字段。

种子数据通过 `IDataSeedContributor` 在应用启动时执行 upsert。

---

## 4. 测试设计

### 4.1 新增测试文件

**文件**: `admin-api/test/AiAdmin.Application.Tests/Services/BindingConfigs/IntegrationPresetTests.cs`

继承 `AiAdminIntegratedTest`，使用 xUnit + Shouldly + NSubstitute + SQLite 内存数据库。

| 测试用例 | 类型 | 验证内容 |
|---|---|---|
| `Should_Return_Three_Presets` | Service 单测 | 预设数量=3，包含 ark/doubao_speech/dashscope 三个 key |
| `Should_Return_Correct_Auth_Fields_Per_Preset` | Service 单测 | ark→apiKey, doubao_speech→appId+accessToken+secretKey, dashscope→apiKey |
| `Should_Have_NonEmpty_Names_And_Endpoints` | Service 单测 | 所有预设名称和端点非空 |
| `Should_Seed_Three_Default_Integrations` | 集成测试 | 种子数据创建 3 条记录，ProviderType 正确，密钥为空 |
| `Should_Preserve_User_Credentials_On_Reseed` | 集成测试 | 用户填写 apiKey 后重启 → apiKey 不丢失 |
| `Should_Return_Presets_From_Api` | 集成测试 | GET endpoint 返回 200 + 3 条数据 |

### 4.2 前端测试

当前没有前端测试基础设施（无 Jest/Karma 配置）。本阶段不对前端测试做要求，依靠手动验证。

---

## 5. 新增/修改文件清单

| 文件 | 操作 | 说明 |
|---|---|---|
| `admin-api/Services/BindingConfigs/Dtos/IntegrationPresetDto.cs` | **新增** | API 返回 DTO |
| `admin-api/Services/BindingConfigs/BindingConfigService.cs` | **修改** | 查询内置种子记录，映射为 preset DTO |
| `admin-api/Controllers/BindingConfigController.cs` | **修改** | 新增 `GET /integration-presets` 端点 |
| `admin-api/Data/AiAdminDataSeeder.cs` | **修改** | 取消注释 `SeedProviderIntegrations()` |
| `admin-api/Data/AiAdminDataSeeder.ProviderIntegrations.cs` | **重写** | 3 条内置集成种子数据 |
| (无) | — | 无需新增 DB 列，无需 Migration |
| `admin-api/test/.../IntegrationPresetTests.cs` | **新增** | 6 个测试用例 |
| `admin-web/src/app/features/.../binding-config.models.ts` | **修改** | 新增 `IntegrationPreset` + 字段 |
| `admin-web/src/app/api/kiota/` | **自动生成** | 运行 `npm run api:generate` 产出 |
| `admin-web/src/app/features/.../binding-config-form-page.component.ts` | **修改** | 预设选择器 UI |
| `admin-web/src/app/features/.../binding-config-form-page.component.css` | **修改** | 新增样式 |
| `admin-web/src/assets/locales/zh-Hans.json` | **修改** | 新增 `preset` 命名空间 |
| `admin-web/src/assets/locales/zh-TW.json` | **修改** | 新增 `preset` 繁体翻译 |
| `admin-web/docs/development.md` | **修改** | 新增第 6 节（接口自动生成规范）+ 第 7 节（多语言规范） |

## 6. 实施步骤

| # | 步骤 | 产出 |
|---|---|---|
| 1 | 创建 `IntegrationPresetDto.cs` | DTO |
| 2 | 重写 `SeedProviderIntegrations()`（3 个平台） + 取消注释 | 种子数据 |
| 3 | 在 `BindingConfigService` 中实现 `GetIntegrationPresetsAsync()` | Service 方法（查 DB→映射） |
| 4 | 在 `BindingConfigController` 中添加 `GET /integration-presets` 端点 | API 端点 |
| 5 | 启动 admin-api，运行 `npm run api:generate` | Kiota 自动生成前端 client |
| 6 | 在 `binding-config.models.ts` 中添加 `IntegrationPreset` | 前端模型 |
| 7 | 改造 `binding-config-form-page.component.ts` | 预设选择器 UI |
| 8 | 添加 CSS 样式 | 视觉完善 |
| 9 | 更新 `zh-Hans.json` / `zh-TW.json` 预设命名空间 | i18n 翻译 |
| 10 | 编写 `IntegrationPresetTests.cs` | 6 个测试用例 |
| 11 | 更新 `development.md` 添加第 6、7 节 | 项目规范文档 |
| 12 | `dotnet test` + 前端手动验证 | 验证通过 |

---

## 7. 验证清单

- [ ] 种子数据在全新数据库上创建 3 条集成记录，Name / ProviderType / Scopes 正确
- [ ] `GET /admin/binding-configs/integration-presets` 从 DB 返回 3 个预设
- [ ] 前端 `/binding-configs/integration/new` 显示预设选择器
- [ ] 选择预设 → 名称/端点/模型/作用域从 DB 数据自动填充 → ProviderType 锁定
- [ ] 切换到"自定义配置" → 表单清空 → ProviderType 可编辑
- [ ] 编辑已有记录 → 预设选择器不显示
- [ ] 修改种子数据（如改名称）→ 重启后 API 返回最新值 → 用户已填密钥不丢失
- [ ] `npm run api:generate` 正常生成包含新字段的 Kiota client
- [ ] 切换语言到 zh-TW → 预设名称显示繁体中文
- [ ] `dotnet test` 全部通过
