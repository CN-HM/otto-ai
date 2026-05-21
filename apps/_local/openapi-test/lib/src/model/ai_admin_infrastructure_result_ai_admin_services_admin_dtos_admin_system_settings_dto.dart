//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_admin_dtos_admin_system_settings_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_admin_dtos_admin_system_settings_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto implements Built<AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto, AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesAdminDtosAdminSystemSettingsDto? get data;

  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto._();

  factory AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto([void updates(AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto, _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemSettingsDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAdminDtosAdminSystemSettingsDto),
          ) as AiAdminServicesAdminDtosAdminSystemSettingsDto;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder();
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

