//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:openapi/src/serializers.dart';
import 'package:openapi/src/auth/api_key_auth.dart';
import 'package:openapi/src/auth/basic_auth.dart';
import 'package:openapi/src/auth/bearer_auth.dart';
import 'package:openapi/src/auth/oauth.dart';
import 'package:openapi/src/api/abp_api_definition_api.dart';
import 'package:openapi/src/api/abp_application_configuration_api.dart';
import 'package:openapi/src/api/abp_application_localization_api.dart';
import 'package:openapi/src/api/action_rule_api.dart';
import 'package:openapi/src/api/admin_billing_api.dart';
import 'package:openapi/src/api/admin_user_api.dart';
import 'package:openapi/src/api/agent_role_api.dart';
import 'package:openapi/src/api/agent_role_runtime_test_api.dart';
import 'package:openapi/src/api/audit_log_api.dart';
import 'package:openapi/src/api/auth_api.dart';
import 'package:openapi/src/api/billing_api.dart';
import 'package:openapi/src/api/binding_config_api.dart';
import 'package:openapi/src/api/config_api.dart';
import 'package:openapi/src/api/conversation_orchestration_api.dart';
import 'package:openapi/src/api/dataset_api.dart';
import 'package:openapi/src/api/device_api.dart';
import 'package:openapi/src/api/mcp_tool_api.dart';
import 'package:openapi/src/api/memory_library_api.dart';
import 'package:openapi/src/api/ota_api.dart';
import 'package:openapi/src/api/role_api.dart';
import 'package:openapi/src/api/runtime_signal_api.dart';
import 'package:openapi/src/api/server_api.dart';
import 'package:openapi/src/api/system_settings_api.dart';
import 'package:openapi/src/api/todo_api.dart';
import 'package:openapi/src/api/tts_voice_api.dart';
import 'package:openapi/src/api/webhook_api.dart';

class Openapi {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  Openapi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the OAuth token associated with the given [name].
  ///
  /// If no [OAuthInterceptor] is registered or no token exists for the given
  /// [name], this method has no effect.
  void removeOAuthToken(String name) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens.remove(name);
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the bearer authentication token associated with the given [name].
  ///
  /// If no [BearerAuthInterceptor] is registered or no token exists for the
  /// given [name], this method has no effect.
  void removeBearerAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens.remove(name);
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  /// Removes the basic authentication credentials associated with the given [name].
  ///
  /// If no [BasicAuthInterceptor] is registered or no credentials exist for the
  /// given [name], this method has no effect.
  void removeBasicAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo.remove(name);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Removes the API key associated with the given [name].
  ///
  /// If no [ApiKeyAuthInterceptor] is registered or no API key exists for the
  /// given [name], this method has no effect.
  void removeApiKey(String name) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys.remove(name);
    }
  }

  /// Get AbpApiDefinitionApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AbpApiDefinitionApi getAbpApiDefinitionApi() {
    return AbpApiDefinitionApi(dio, serializers);
  }

  /// Get AbpApplicationConfigurationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AbpApplicationConfigurationApi getAbpApplicationConfigurationApi() {
    return AbpApplicationConfigurationApi(dio, serializers);
  }

  /// Get AbpApplicationLocalizationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AbpApplicationLocalizationApi getAbpApplicationLocalizationApi() {
    return AbpApplicationLocalizationApi(dio, serializers);
  }

  /// Get ActionRuleApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ActionRuleApi getActionRuleApi() {
    return ActionRuleApi(dio, serializers);
  }

  /// Get AdminBillingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdminBillingApi getAdminBillingApi() {
    return AdminBillingApi(dio, serializers);
  }

  /// Get AdminUserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdminUserApi getAdminUserApi() {
    return AdminUserApi(dio, serializers);
  }

  /// Get AgentRoleApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AgentRoleApi getAgentRoleApi() {
    return AgentRoleApi(dio, serializers);
  }

  /// Get AgentRoleRuntimeTestApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AgentRoleRuntimeTestApi getAgentRoleRuntimeTestApi() {
    return AgentRoleRuntimeTestApi(dio, serializers);
  }

  /// Get AuditLogApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuditLogApi getAuditLogApi() {
    return AuditLogApi(dio, serializers);
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get BillingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BillingApi getBillingApi() {
    return BillingApi(dio, serializers);
  }

  /// Get BindingConfigApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BindingConfigApi getBindingConfigApi() {
    return BindingConfigApi(dio, serializers);
  }

  /// Get ConfigApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ConfigApi getConfigApi() {
    return ConfigApi(dio, serializers);
  }

  /// Get ConversationOrchestrationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ConversationOrchestrationApi getConversationOrchestrationApi() {
    return ConversationOrchestrationApi(dio, serializers);
  }

  /// Get DatasetApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DatasetApi getDatasetApi() {
    return DatasetApi(dio, serializers);
  }

  /// Get DeviceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DeviceApi getDeviceApi() {
    return DeviceApi(dio, serializers);
  }

  /// Get McpToolApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  McpToolApi getMcpToolApi() {
    return McpToolApi(dio, serializers);
  }

  /// Get MemoryLibraryApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MemoryLibraryApi getMemoryLibraryApi() {
    return MemoryLibraryApi(dio, serializers);
  }

  /// Get OtaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  OtaApi getOtaApi() {
    return OtaApi(dio, serializers);
  }

  /// Get RoleApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RoleApi getRoleApi() {
    return RoleApi(dio, serializers);
  }

  /// Get RuntimeSignalApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RuntimeSignalApi getRuntimeSignalApi() {
    return RuntimeSignalApi(dio, serializers);
  }

  /// Get ServerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ServerApi getServerApi() {
    return ServerApi(dio, serializers);
  }

  /// Get SystemSettingsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SystemSettingsApi getSystemSettingsApi() {
    return SystemSettingsApi(dio, serializers);
  }

  /// Get TodoApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TodoApi getTodoApi() {
    return TodoApi(dio, serializers);
  }

  /// Get TtsVoiceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TtsVoiceApi getTtsVoiceApi() {
    return TtsVoiceApi(dio, serializers);
  }

  /// Get WebhookApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  WebhookApi getWebhookApi() {
    return WebhookApi(dio, serializers);
  }
}
