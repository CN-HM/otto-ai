//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_memory_memory_rule_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_rule_upsert_dto.g.dart';

/// AiAdminServicesMemoryDtosMemoryRuleUpsertDto
///
/// Properties:
/// * [ruleType] 
/// * [ruleName] 
/// * [instruction] 
/// * [ttlDays] 
/// * [isEnabled] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemoryRuleUpsertDto implements Built<AiAdminServicesMemoryDtosMemoryRuleUpsertDto, AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder> {
  @BuiltValueField(wireName: r'ruleType')
  AiAdminServicesMemoryMemoryRuleType? get ruleType;
  // enum ruleTypeEnum {  profile,  node,  risk,  health_followup,  todo,  reminder,  };

  @BuiltValueField(wireName: r'ruleName')
  String? get ruleName;

  @BuiltValueField(wireName: r'instruction')
  String? get instruction;

  @BuiltValueField(wireName: r'ttlDays')
  int? get ttlDays;

  @BuiltValueField(wireName: r'isEnabled')
  int? get isEnabled;

  AiAdminServicesMemoryDtosMemoryRuleUpsertDto._();

  factory AiAdminServicesMemoryDtosMemoryRuleUpsertDto([void updates(AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemoryRuleUpsertDto> get serializer => _$AiAdminServicesMemoryDtosMemoryRuleUpsertDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemoryRuleUpsertDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemoryRuleUpsertDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemoryRuleUpsertDto, _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemoryRuleUpsertDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRuleUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ruleType != null) {
      yield r'ruleType';
      yield serializers.serialize(
        object.ruleType,
        specifiedType: const FullType(AiAdminServicesMemoryMemoryRuleType),
      );
    }
    if (object.ruleName != null) {
      yield r'ruleName';
      yield serializers.serialize(
        object.ruleName,
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
    if (object.ttlDays != null) {
      yield r'ttlDays';
      yield serializers.serialize(
        object.ttlDays,
        specifiedType: const FullType.nullable(int),
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
    AiAdminServicesMemoryDtosMemoryRuleUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ruleType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesMemoryMemoryRuleType),
          ) as AiAdminServicesMemoryMemoryRuleType;
          result.ruleType = valueDes;
          break;
        case r'ruleName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ruleName = valueDes;
          break;
        case r'instruction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.instruction = valueDes;
          break;
        case r'ttlDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.ttlDays = valueDes;
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
  AiAdminServicesMemoryDtosMemoryRuleUpsertDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder();
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

