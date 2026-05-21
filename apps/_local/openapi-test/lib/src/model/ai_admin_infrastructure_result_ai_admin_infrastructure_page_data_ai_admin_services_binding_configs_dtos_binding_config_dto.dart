//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_infrastructure_page_data_ai_admin_services_binding_configs_dtos_binding_config_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_binding_configs_dtos_binding_config_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto implements Built<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto, AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto? get data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto._();

  factory AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto([void updates(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto> get serializer => _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto, _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto object, {
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
        specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder result,
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
            specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto),
          ) as AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto;
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
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder();
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

