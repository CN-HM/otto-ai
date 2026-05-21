//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_action_rule_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_agent_roles_dtos_action_rule_dto.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto, AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<AiAdminServicesAgentRolesDtosActionRuleDto>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoSerializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto, _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosActionRuleDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosActionRuleDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosActionRuleDto>?;
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
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder();
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

