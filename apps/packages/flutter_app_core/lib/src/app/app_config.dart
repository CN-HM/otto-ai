import 'package:flutter/material.dart';

@immutable
class AppBranding {
  const AppBranding({
    required this.appTitle,
    required this.heroTitle,
    required this.heroSubtitle,
    this.loginDescription = '请输入账号信息完成身份验证',
    this.registerDescription = '填写用户名、密码并用短信验证码完成注册',
  });

  final String appTitle;
  final String heroTitle;
  final String heroSubtitle;
  final String loginDescription;
  final String registerDescription;
}

@immutable
class AiAppConfig {
  const AiAppConfig({
    required this.appId,
    required this.apiBaseUrl,
    required this.branding,
    this.logFilePrefix,
    this.tokenStorageKey,
    this.lightTheme,
    this.darkTheme,
    this.lightSeedColor = const Color(0xFF4F46E5),
    this.darkSeedColor = const Color(0xFF818CF8),
  });

  final String appId;
  final String apiBaseUrl;
  final AppBranding branding;
  final String? logFilePrefix;
  final String? tokenStorageKey;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final Color lightSeedColor;
  final Color darkSeedColor;

  String get resolvedLogFilePrefix =>
      (logFilePrefix == null || logFilePrefix!.trim().isEmpty) ? appId : logFilePrefix!.trim();

  String get resolvedTokenStorageKey =>
      (tokenStorageKey == null || tokenStorageKey!.trim().isEmpty)
          ? '${appId}_auth_token'
          : tokenStorageKey!.trim();
}
