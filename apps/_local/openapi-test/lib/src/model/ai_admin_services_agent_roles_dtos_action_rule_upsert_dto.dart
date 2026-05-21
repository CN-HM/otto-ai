//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_action_rule_upsert_dto.g.dart';

/// AiAdminServicesAgentRolesDtosActionRuleUpsertDto
///
/// Properties:
/// * [actionType] 
/// * [name] 
/// * [instruction] 
/// * [isEnabled] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosActionRuleUpsertDto implements Built<AiAdminServicesAgentRolesDtosActionRuleUpsertDto, AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder> {
  @BuiltValueField(wireName: r'actionType')
  String? get actionType;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'instruction')
  String? get instruction;

  @BuiltValueField(wireName: r'isEnabled')
  int? get isEnabled;

  AiAdminServicesAgentRolesDtosActionRuleUpsertDto._();

  factory AiAdminServicesAgentRolesDtosActionRuleUpsertDto([void updates(AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosActionRuleUpsertDto> get serializer => _$AiAdminServicesAgentRolesDtosActionRuleUpsertDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosActionRuleUpsertDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosActionRuleUpsertDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosActionRuleUpsertDto, _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosActionRuleUpsertDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosActionRuleUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.actionType != null) {
      yield r'actionType';
      yield serializers.serialize(
        object.actionType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.instruction != null) {
      yield r'instruction';
      yield serializers.serialize(
        object.instruction,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isEnabled != null) {
      yield r'isEnabled';
      yield serializers.serialize(
        object.isEnabled,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosActionRuleUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'actionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actionType = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'instruction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.instruction = valueDes;
          break;
        case r'isEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.isEnabled = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosActionRuleUpsertDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder();
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

