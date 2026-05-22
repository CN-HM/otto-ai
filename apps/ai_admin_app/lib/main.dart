import 'package:flutter/material.dart';
import 'package:flutter_app_core/flutter_app_core.dart';

const _apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://192.168.50.165:8002',
);

const _baselineAppConfig = AiAppConfig(
  appId: 'ai_admin_app',
  apiBaseUrl: _apiBaseUrl,
  logFilePrefix: 'ai-admin-app',
  tokenStorageKey: 'ai_admin_app.auth_token',
  branding: AppBranding(
    appTitle: 'otto ai',
    heroTitle: 'otto ai',
    heroSubtitle: 'otto ai 移动端',
    loginDescription: '请输入账号信息完成身份验证',
    registerDescription: '填写用户名、密码并用短信验证码完成注册',
  ),
  lightSeedColor: Color(0xFF4F46E5),
  darkSeedColor: Color(0xFF818CF8),
);

Future<void> main() {
  return bootstrapAiApp(_baselineAppConfig);
}
