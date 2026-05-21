//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_action_rule_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_agent_roles_dtos_action_rule_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto implements Built<AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto, AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesAgentRolesDtosActionRuleDto? get data;

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto._();

  factory AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto([void updates(AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto, _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto object, {
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
        specifiedType: const FullType(AiAdminServicesAgentRolesDtosActionRuleDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesAgentRolesDtosActionRuleDto),
          ) as AiAdminServicesAgentRolesDtosActionRuleDto;
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
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder();
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

