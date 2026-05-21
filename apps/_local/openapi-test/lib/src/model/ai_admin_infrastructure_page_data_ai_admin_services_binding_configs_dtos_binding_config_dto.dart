//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_binding_configs_dtos_binding_config_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_binding_configs_dtos_binding_config_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto, AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesBindingConfigsDtosBindingConfigDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto, _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.list != null) {
      yield r'list';
      yield serializers.serialize(
        object.list,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBindingConfigsDtosBindingConfigDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'list':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBindingConfigsDtosBindingConfigDto)]),
          ) as BuiltList<AiAdminServicesBindingConfigsDtosBindingConfigDto>?;
          if (valueDes == null) continue;
          result.list.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder();
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

