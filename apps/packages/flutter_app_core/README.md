# flutter_app_core

`flutter_app_core` 是 `apps/` 工作区里的公共 Flutter 层。

## 提供内容

- 应用启动与 Provider 注入
- 通用主题与应用壳
- Auth / Device / Agent / Settings 基础 Feature
- 通用 models / services / widgets
- Billing 最小闭环能力

## 如何复用

1. 新建一个 Flutter App 壳工程
2. 在 `pubspec.yaml` 里依赖 `flutter_app_core`
3. 在 `main.dart` 中调用 `bootstrapAiApp`
4. 通过 `AiAppConfig` 配置品牌信息、API 基址、token key、日志前缀和主题种子色
