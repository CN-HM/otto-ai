//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_admin_dtos_admin_system_runtime_settings_dto.dart';
import 'package:openapi/src/model/ai_admin_services_admin_dtos_admin_system_server_settings_dto.dart';
import 'package:openapi/src/model/ai_admin_services_admin_dtos_admin_system_log_settings_dto.dart';
import 'package:openapi/src/model/ai_admin_services_admin_dtos_admin_system_billing_settings_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_admin_system_settings_dto.g.dart';

/// AiAdminServicesAdminDtosAdminSystemSettingsDto
///
/// Properties:
/// * [server] 
/// * [log] 
/// * [runtime] 
/// * [billing] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAdminSystemSettingsDto implements Built<AiAdminServicesAdminDtosAdminSystemSettingsDto, AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'server')
  AiAdminServicesAdminDtosAdminSystemServerSettingsDto? get server;

  @BuiltValueField(wireName: r'log')
  AiAdminServicesAdminDtosAdminSystemLogSettingsDto? get log;

  @BuiltValueField(wireName: r'runtime')
  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto? get runtime;

  @BuiltValueField(wireName: r'billing')
  AiAdminServicesAdminDtosAdminSystemBillingSettingsDto? get billing;

  AiAdminServicesAdminDtosAdminSystemSettingsDto._();

  factory AiAdminServicesAdminDtosAdminSystemSettingsDto([void updates(AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder b)]) = _$AiAdminServicesAdminDtosAdminSystemSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAdminSystemSettingsDto> get serializer => _$AiAdminServicesAdminDtosAdminSystemSettingsDtoSerializer();
}

class _$AiAdminServicesAdminDtosAdminSystemSettingsDtoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAdminSystemSettingsDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAdminSystemSettingsDto, _$AiAdminServicesAdminDtosAdminSystemSettingsDto];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAdminSystemSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.server != null) {
      yield r'server';
      yield serializers.serialize(
        object.server,
        specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemServerSettingsDto),
      );
    }
    if (object.log != null) {
      yield r'log';
      yield serializers.serialize(
        object.log,
        specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemLogSettingsDto),
      );
    }
    if (object.runtime != null) {
      yield r'runtime';
      yield serializers.serialize(
        object.runtime,
        specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto),
      );
    }
    if (object.billing != null) {
      yield r'billing';
      yield serializers.serialize(
        object.billing,
        specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemBillingSettingsDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'server':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemServerSettingsDto),
          ) as AiAdminServicesAdminDtosAdminSystemServerSettingsDto;
          result.server.replace(valueDes);
          break;
        case r'log':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemLogSettingsDto),
          ) as AiAdminServicesAdminDtosAdminSystemLogSettingsDto;
          result.log.replace(valueDes);
          break;
        case r'runtime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto),
          ) as AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto;
          result.runtime.replace(valueDes);
          break;
        case r'billing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemBillingSettingsDto),
          ) as AiAdminServicesAdminDtosAdminSystemBillingSettingsDto;
          result.billing.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAdminSystemSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

