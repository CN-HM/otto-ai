//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_agent_role_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_agent_roles_dtos_agent_role_dto.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto, AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<AiAdminServicesAgentRolesDtosAgentRoleDto>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoSerializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto, _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosAgentRoleDto>?;
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
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder();
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

