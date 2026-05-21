//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_agent_role_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_agent_roles_dtos_agent_role_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto, AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesAgentRolesDtosAgentRoleDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto, _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosAgentRoleDto>?;
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
  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder();
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

