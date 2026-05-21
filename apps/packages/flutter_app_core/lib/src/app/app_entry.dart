import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/agent_roles/agent_role_controller.dart';
import '../features/auth/auth_controller.dart';
import '../features/devices/device_controller.dart';
import '../features/settings/settings_controller.dart';
import '../shared/services/agent_role_api_service.dart';
import '../shared/services/api_client.dart';
import '../shared/services/app_logger.dart';
import '../shared/services/auth_api_service.dart';
import '../shared/services/billing_api_service.dart';
import '../shared/services/ble_service.dart';
import '../shared/services/device_api_service.dart';
import '../shared/services/session_storage.dart';
import 'app_config.dart';
import 'app_shell.dart';
import 'theme.dart';

Future<void> bootstrapAiApp(AiAppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  final logger = AppLogger(filePrefix: config.resolvedLogFilePrefix);
  await logger.initialize();

  final storage = SessionStorage(tokenKey: config.resolvedTokenStorageKey);
  final apiClient = ApiClient(
    logger: logger,
    baseUrl: config.apiBaseUrl,
  );

  final authApi = AuthApiService(client: apiClient);
  final billingApi = BillingApiService(client: apiClient);
  final deviceApi = DeviceApiService(client: apiClient);
  final agentRoleApi = AgentRoleApiService(client: apiClient);
  final bleService = BleService(logger: logger);

  runApp(
    MultiProvider(
      providers: [
        Provider<AiAppConfig>.value(value: config),
        Provider<AppLogger>.value(value: logger),
        Provider<SessionStorage>.value(value: storage),
        Provider<ApiClient>.value(value: apiClient),
        Provider<AuthApiService>.value(value: authApi),
        Provider<BillingApiService>.value(value: billingApi),
        Provider<DeviceApiService>.value(value: deviceApi),
        Provider<AgentRoleApiService>.value(value: agentRoleApi),
        Provider<BleService>.value(value: bleService),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(
            api: authApi,
            storage: storage,
            logger: logger,
          )..initialize(),
        ),
        ChangeNotifierProxyProvider2<AuthController, DeviceApiService, DeviceController>(
          create: (context) => DeviceController(
            authController: context.read<AuthController>(),
            api: context.read<DeviceApiService>(),
            bleService: context.read<BleService>(),
            logger: context.read<AppLogger>(),
          ),
          update: (context, auth, api, previous) =>
              previous ??
              DeviceController(
                authController: auth,
                api: api,
                bleService: context.read<BleService>(),
                logger: context.read<AppLogger>(),
              ),
        ),
        ChangeNotifierProxyProvider2<AuthController, AgentRoleApiService, AgentRoleController>(
          create: (context) => AgentRoleController(
            authController: context.read<AuthController>(),
            api: context.read<AgentRoleApiService>(),
            logger: context.read<AppLogger>(),
          ),
          update: (context, auth, api, previous) =>
              previous ??
              AgentRoleController(
                authController: auth,
                api: api,
                logger: context.read<AppLogger>(),
              ),
        ),
        ChangeNotifierProxyProvider<AuthController, SettingsController>(
          create: (context) => SettingsController(
            authController: context.read<AuthController>(),
            billingApi: context.read<BillingApiService>(),
            logger: context.read<AppLogger>(),
          ),
          update: (context, auth, previous) =>
              previous ??
              SettingsController(
                authController: auth,
                billingApi: context.read<BillingApiService>(),
                logger: context.read<AppLogger>(),
              ),
        ),
      ],
      child: AiBaseApp(config: config),
    ),
  );
}

class AiBaseApp extends StatelessWidget {
  const AiBaseApp({
    super.key,
    required this.config,
  });

  final AiAppConfig config;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: config.branding.appTitle,
      theme: config.lightTheme ?? buildLightTheme(seedColor: config.lightSeedColor),
      darkTheme: config.darkTheme ?? buildDarkTheme(seedColor: config.darkSeedColor),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const AppShell(),
    );
  }
}
