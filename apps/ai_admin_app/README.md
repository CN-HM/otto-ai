# Otto AI App

当前 AI Flutter 业务 App 壳工程。

## 定位

- 当前仓库内默认可运行的 Flutter App
- 通过 `lib/main.dart` 注入 `AiAppConfig`
- 业务能力主要复用 `../packages/flutter_app_core`

## 设计原则

- 尽量保持薄壳
- 通用能力下沉到 `../packages/flutter_app_core`
- 当前 App 只保留品牌配置、入口和平台工程

## 运行方式

```bash
cd apps/ai_admin_app
flutter run
```

## 关键依赖

- `flutter_app_core`
  - 提供应用壳、页面、控制器、服务与共享业务逻辑

## 当前入口

- `lib/main.dart`
  - 调用 `bootstrapAiApp(...)`
  - 注入当前 App 的 branding、`apiBaseUrl`、日志前缀与 token 存储 key
