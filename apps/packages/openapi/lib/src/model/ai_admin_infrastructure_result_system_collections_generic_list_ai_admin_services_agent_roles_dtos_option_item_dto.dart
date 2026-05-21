//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_option_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_agent_roles_dtos_option_item_dto.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto, AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoBuilder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoSerializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto, _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?;
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
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDtoBuilder();
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

