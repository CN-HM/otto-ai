//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_binding_configs_dtos_binding_config_kind_meta_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_binding_configs_dtos_binding_config_kind_meta_dto.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto, AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoSerializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto, _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto)]),
          ) as BuiltList<AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>?;
          if (valueDes == null) continue;
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
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder();
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

