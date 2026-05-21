//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_binding_configs_dtos_binding_config_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_binding_configs_dtos_binding_config_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto implements Built<AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto, AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesBindingConfigsDtosBindingConfigDto? get data;

  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto._();

  factory AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto([void updates(AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto, _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto object, {
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
        specifiedType: const FullType(AiAdminServicesBindingConfigsDtosBindingConfigDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesBindingConfigsDtosBindingConfigDto),
          ) as AiAdminServicesBindingConfigsDtosBindingConfigDto;
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
  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder();
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

