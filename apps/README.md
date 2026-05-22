# Flutter Apps Workspace

`apps/` 是当前仓库的 Flutter 工作区，而不是单个应用根目录。

工作区由 `melos` 管理，当前真实可运行的 Otto AI App 壳工程是 `ai_admin_app/`。

## 目录结构

- `ai_admin_app/`
  - 当前落地的 Otto AI Flutter App 壳工程
  - 只保留入口、品牌配置和平台目录
- `packages/flutter_app_core/`
  - 共享业务层与 UI 层
  - 包含应用壳、控制器、服务、共享模型、BLE 配网与设备页面等通用能力
- `packages/openapi/`
  - 由 OpenAPI Generator 生成的 Dart Dio 客户端
- `tool/`
  - Flutter/OpenAPI 相关脚本
- `melos.yaml`
  - 工作区包管理与常用脚本入口

## 当前开发约定

- 修改业务通用逻辑：优先在 `packages/flutter_app_core/` 中实现
- 修改当前 App 品牌或入口：在 `ai_admin_app/` 中实现
- 更新接口生成代码：通过 `tool/generate_dart_dio_client.ps1` 重建 `packages/openapi/`
- 不要把 `apps/pubspec.yaml` 当成可直接 `flutter run` 的应用根目录

## 快速开始

### 1. 安装工作区依赖

```bash
cd apps
dart run melos bootstrap
```

### 2. 运行当前 App

```bash
cd ai_admin_app
flutter run
```

### 3. 常用检查

```bash
cd apps
dart run melos run analyze:baseline
dart run melos run test:baseline
```

## OpenAPI 客户端重生成

在 `apps/` 目录执行：

```powershell
pwsh -ExecutionPolicy Bypass -File .\tool\generate_dart_dio_client.ps1
```

生成结果位于：

- `packages/openapi/`

## 关键路径

- 当前 App 壳：`apps/ai_admin_app`
- 共享层：`apps/packages/flutter_app_core`
- 生成客户端：`apps/packages/openapi`
- 工作区配置：`apps/melos.yaml`
